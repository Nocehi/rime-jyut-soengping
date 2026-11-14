# 安裝：Linux（fcitx5-rime、ibus-rime）

## 1. 安裝依賴

1. 安裝 Rime 前端：fcitx5-rime 或 ibus-rime。
2. 安裝 rime-cantonese 和 rime-stroke。多數發行版有套件，例如 Arch 的 `rime-cantonese`。沒有套件時，用 plum（見 [install-plum.md](install-plum.md)）。
3. 安裝小鶴拆字 [rime_radical_pinyin](https://github.com/mirtlecn/rime_radical_pinyin)。把 `radical.schema.yaml` 和 `radical_flypy.dict.yaml` 放入用戶資料夾。
4. 確認 librime 有 lua 插件。Arch 的 librime 已內建。Debian／Ubuntu 要裝 `librime-plugin-lua`。
5. 可選：要用語法模型，確認 librime 有 octagram 插件。Debian／Ubuntu 要裝 `librime-plugin-octagram`。

## 2. 複製方案檔案

用戶資料夾：

| 前端 | 路徑 |
| --- | --- |
| fcitx5-rime | `~/.local/share/fcitx5/rime/` |
| ibus-rime | `~/.config/ibus/rime/` |

```sh
D=~/.local/share/fcitx5/rime   # ibus 改為 ~/.config/ibus/rime
cp *.schema.yaml *.dict.yaml *.cheatsheet.* "$D"/
mkdir -p "$D/lua" && cp lua/*.lua "$D/lua/"
```

## 3. 加入方案清單

在 `default.custom.yaml` 的 `schema_list` 加入 `jyut6ping3_shuangpin`。沒有這個檔案時，複製 `examples/default.custom.yaml`。已有這個檔案時，只加一行。

## 4. 可選：語法模型

1. 從 Release 下載 `yue-mix.gram`，放入用戶資料夾。
2. 複製 `examples/jyut6ping3_shuangpin.custom.yaml` 到用戶資料夾。

## 5. 重新部署

fcitx5：

```sh
busctl --user call org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1 ReloadAddonConfig s rime
```

`fcitx5-remote -r` 不會重新部署 Rime。

ibus：在 ibus-rime 選單按「部署」，或執行 `ibus-daemon -drx`。

第一次部署 jyut6ping3 字典要等一段時間。
