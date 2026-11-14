-- 日期時間：rq 輸出日期，uq 輸出時間。
-- 小鶴雙拼下 sj 是「三」等字的碼，故時間改用 uq（sh+iu，不成音節，不與詞庫衝突）。

local digits = { [0] = "〇", "一", "二", "三", "四", "五", "六", "七", "八", "九" }
local weekdays = { "日", "一", "二", "三", "四", "五", "六" }
local months = { "January", "February", "March", "April", "May", "June", "July",
  "August", "September", "October", "November", "December" }
local stems = "甲乙丙丁戊己庚辛壬癸"
local branches = "子丑寅卯辰巳午未申酉戌亥"

local function hanzi_digits(s)
  return (s:gsub("%d", function(d) return digits[tonumber(d)] end))
end

local function hanzi_number(n)
  if n < 10 then return digits[n] end
  local tens, ones = n // 10, n % 10
  local s = (tens == 1 and "" or digits[tens]) .. "十"
  if ones > 0 then s = s .. digits[ones] end
  return s
end

local function translator(input, seg, env)
  local function emit(text, comment)
    yield(Candidate("datetime", seg.start, seg._end, text, comment or ""))
  end
  if input == "rq" then
    local t = os.date("*t")
    local wd = weekdays[t.wday]
    local cjk = string.format("%d年%d月%d日", t.year, t.month, t.day)
    emit(os.date("%Y-%m-%d"))
    emit(cjk)
    emit(cjk .. "（星期" .. wd .. "）")
    emit(string.format("%d月%d日", t.month, t.day))
    emit(hanzi_digits(tostring(t.year)) .. "年" .. hanzi_number(t.month) .. "月" .. hanzi_number(t.day) .. "日")
    emit(os.date("%Y/%m/%d"))
    emit(os.date("%Y%m%d"))
    emit("星期" .. wd)
    emit("禮拜" .. wd)
    emit(string.format("%d %s %d", t.day, months[t.month], t.year))
    local cyc = (t.year - 4) % 60
    emit(stems:sub(cyc % 10 * 3 + 1, cyc % 10 * 3 + 3) .. branches:sub(cyc % 12 * 3 + 1, cyc % 12 * 3 + 3) .. "年", "干支")
  elseif input == "uq" then
    emit(os.date("%H:%M"))
    emit(os.date("%H:%M:%S"))
    emit(os.date("%Y-%m-%d %H:%M"))
  end
end

return translator
