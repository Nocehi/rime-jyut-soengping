-- 以詞定字
-- 原腳本 https://github.com/BlindingDark/rime-lua-select-character
-- 2026-10-30：
--   * 按鍵由 key_binder/select_first_character、select_last_character 讀取，冇設定就用 [ ]
--   * select_character/mode: menu（手機用）：按一次鍵，候選欄變成每個詞嘅首字／尾字，點選上屏；
--     再按同一個鍵 = 上屏高亮嗰個；退格返回詞語。需要配合 lua_filter@*select_character_filter
--   * 冇設定 mode（筆電）：按鍵即刻上屏高亮候選嘅首字／尾字（原行為）

local PROP = 'select_character_mode'
local select = {}

function select.init(env)
    local config = env.engine.schema.config
    env.first_key = config:get_string('key_binder/select_first_character') or 'bracketleft'
    env.last_key = config:get_string('key_binder/select_last_character') or 'bracketright'
    env.menu_mode = (config:get_string('select_character/mode') == 'menu')
    local context = env.engine.context
    env.commit_conn = context.commit_notifier:connect(function(ctx)
        ctx:set_property(PROP, '')
    end)
end

function select.fini(env)
    if env.commit_conn then env.commit_conn:disconnect() end
end

local function pick(text, which)
    if utf8.len(text) <= 1 then return text end
    if which == 'first' then
        return text:sub(1, utf8.offset(text, 2) - 1)
    else
        return text:sub(utf8.offset(text, -1))
    end
end

function select.func(key, env)
    local engine = env.engine
    local context = engine.context
    if key:release() or key:ctrl() or key:alt() or key:super()
        or not (context:is_composing() or context:has_menu()) then
        return 2
    end
    local repr = key:repr()
    local which = (repr == env.first_key and 'first') or (repr == env.last_key and 'last') or nil
    -- 只在輸入以字母開頭時生效，不干擾 [ ] 的標點選單（「」等）
    if which and not context.input:match('^[a-zA-Z]') then which = nil end

    if env.menu_mode then
        local current = context:get_property(PROP)
        if which then
            if current == which then
                -- 第二下：上屏高亮（已經係單字）
                local cand = context:get_selected_candidate()
                local text = cand and cand.text or context.input
                engine:commit_text(text)
                context:clear()
                return 1
            end
            context:set_property(PROP, which)
            context:refresh_non_confirmed_composition()
            return 1
        end
        if current ~= nil and current ~= '' then
            context:set_property(PROP, '')
            if repr == 'BackSpace' or repr == 'Escape' then
                context:refresh_non_confirmed_composition()
                return 1
            end
        end
        return 2
    end

    if which then
        local cand = context:get_selected_candidate()
        if not cand or utf8.len(cand.text) < 2 then return 2 end
        engine:commit_text(pick(cand.text, which))
        context:clear()
        return 1
    end
    return 2
end

return select
