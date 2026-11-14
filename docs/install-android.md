# 安裝：Android

## 小企鵝輸入法（fcitx5-android）＋ Rime 插件

狀態：作者已實測。測試環境是 librime 1.13.1 的 Rime 插件。lua、octagram、OpenCC 都可用。

手機沒有系統字典。所以要一併放入 rime-cantonese 和其他依賴的檔案。

1. 在小企鵝啟用 Rime 一次。Rime 會建立用戶資料夾。
2. 在電腦準備一個資料夾 `rime/`，放入：
   - 本 repo 的 `*.schema.yaml`、`*.dict.yaml`、`*.cheatsheet.*`、`lua/`；
   - rime-cantonese 的方案和字典檔案；
   - rime-stroke、rime_radical_pinyin 的檔案；
   - `default.custom.yaml`（範例：`examples/default.custom.yaml`）。
3. 先備份手機上原有的資料夾：

   ```sh
   adb pull /sdcard/Android/data/org.fcitx.fcitx5.android/files/data/rime/ ./rime-backup/
   ```

4. 推入手機：

   ```sh
   adb push ./rime/. /sdcard/Android/data/org.fcitx.fcitx5.android/files/data/rime/
   ```

   同名的 `default.custom.yaml` 會被覆蓋。
5. 小企鵝 → 輸入法 → Rime → 重新部署。jyut6ping3 字典較大，要等幾分鐘。

rime-cantonese 的 `` ` `` 普拼反查要 `luna_pinyin`，倉頡反查要 `cangjie5`。缺少這些檔案不影響部署，只是這兩項反查不能用，日誌會報錯。

### 手機上的以詞定字

手機鍵盤的字母層沒有 `[ ]`。點候選會直接上屏，不能只移動高亮。所以手機改用選單模式：

1. 複製 `examples/jyut6ping3_shuangpin.device.phone.yaml` 到手機的用戶資料夾。
2. 改名為 `jyut6ping3_shuangpin.device.yaml`。
3. 重新部署。

用法：打字時按 `,`，候選欄變成每個詞的首字，點選上屏。再按一次 `,`，上屏高亮的字。`.` 同理，取末字。退格或 Esc 返回詞語候選。

代價：有候選時，`,` `.` 不再翻頁。翻頁要在候選欄滑動。

`jyut6ping3_shuangpin.device.yaml` 只屬於這部手機。從桌面更新方案時，不要覆蓋它。

## 同文輸入法（Trime）

狀態：作者未實測。

1. 安裝同文輸入法。
2. 用戶資料夾預設是 `/sdcard/rime/`。在同文的設定中可以查看和更改。
3. 按上面小企鵝第 2 步準備檔案，複製到同文的用戶資料夾。
4. 在同文中按「部署」。

待核實：目前版本的同文是否內建 lua 和 octagram 插件。
