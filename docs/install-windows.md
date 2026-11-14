# 安裝：Windows（小狼毫 Weasel）

狀態：作者未實測。

1. 安裝 [小狼毫](https://rime.im/download/)。
2. 安裝依賴：rime-cantonese、rime-stroke、rime_radical_pinyin。小狼毫自帶 plum 介面：在開始選單打開「小狼毫輸入法設定」，或用 [install-plum.md](install-plum.md) 的指令。
3. 打開用戶資料夾：右擊工作列的小狼毫圖示，選「用戶文件夾」。預設路徑是 `%APPDATA%\Rime`。
4. 把本 repo 的 `*.schema.yaml`、`*.dict.yaml`、`*.cheatsheet.*` 和整個 `lua\` 資料夾複製到用戶資料夾。
5. 在 `default.custom.yaml` 的 `schema_list` 加入 `jyut6ping3_shuangpin`（範例：`examples\default.custom.yaml`）。
6. 可選：放入 Release 的 `yue-mix.gram` 和 `examples\jyut6ping3_shuangpin.custom.yaml`。
7. 右擊小狼毫圖示，選「重新部署」。

待核實：目前版本的小狼毫是否內建 lua 和 octagram 插件。缺 lua 時，以詞定字和日期時間不能用。缺 octagram 時，語法模型不生效。
