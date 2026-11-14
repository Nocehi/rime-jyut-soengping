-- 以詞定字（menu 模式）：將候選換成首字／尾字，去重，原詞放註解
local PROP = 'select_character_mode'
local LIMIT = 60

local function filter(input, env)
    local mode = env.engine.context:get_property(PROP)
    if mode ~= 'first' and mode ~= 'last' then
        for cand in input:iter() do yield(cand) end
        return
    end
    local seen, n = {}, 0
    for cand in input:iter() do
        local t = cand.text
        if utf8.len(t) and utf8.len(t) >= 1 then
            local ch
            if mode == 'first' then ch = t:sub(1, utf8.offset(t, 2) - 1)
            else ch = t:sub(utf8.offset(t, -1)) end
            if not seen[ch] then
                seen[ch] = true
                yield(ShadowCandidate(cand, cand.type, ch, utf8.len(t) > 1 and t or ''))
                n = n + 1
                if n >= LIMIT then break end
            end
        end
    end
end

return filter
