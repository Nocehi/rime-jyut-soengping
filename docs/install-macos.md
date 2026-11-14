# 安裝：macOS（鼠鬚管 Squirrel）

狀態：作者未實測。

1. 安裝 [鼠鬚管](https://rime.im/download/)。用 Homebrew：`brew install --cask squirrel`。
2. 安裝依賴：rime-cantonese、rime-stroke、rime_radical_pinyin。可用 [install-plum.md](install-plum.md) 的指令，`rime_dir` 設為 `~/Library/Rime`。
3. 把本 repo 的檔案複製到 `~/Library/Rime/`：

   ```sh
   D=~/Library/Rime
   cp *.schema.yaml *.dict.yaml *.cheatsheet.* "$D"/
   mkdir -p "$D/lua" && cp lua/*.lua "$D/lua/"
   ```

4. 在 `default.custom.yaml` 的 `schema_list` 加入 `jyut6ping3_shuangpin`（範例：`examples/default.custom.yaml`）。
5. 可選：放入 Release 的 `yue-mix.gram` 和 `examples/jyut6ping3_shuangpin.custom.yaml`。
6. 在選單列的鼠鬚管圖示選「重新部署」。

待核實：目前版本的鼠鬚管是否內建 lua 和 octagram 插件。
