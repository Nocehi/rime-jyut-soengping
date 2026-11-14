# 安裝：iOS（倉輸入法 Hamster）

狀態：作者未實測。

1. 從 App Store 安裝倉輸入法。
2. 準備檔案：本 repo 的 `*.schema.yaml`、`*.dict.yaml`、`lua/`，加上 rime-cantonese、rime-stroke、rime_radical_pinyin 的檔案，和 `default.custom.yaml`。
3. 用倉輸入法的檔案管理或 Wi-Fi 上傳功能，把檔案放入它的 Rime 用戶資料夾。
4. 在倉輸入法中重新部署。

待核實：

- 倉輸入法目前的匯入方式和資料夾名稱。
- 是否內建 lua 和 octagram 插件。
- jyut6ping3 字典在 iOS 鍵盤擴充的記憶體限制下能否部署。
