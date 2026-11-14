# 安裝：東風破（plum）

狀態：作者未實測。本 repo 還沒有公開，以下指令現在不能用。

[plum](https://github.com/rime/plum) 是 Rime 的配置管理工具。它可以一次安裝本方案和依賴。

## 指令

```sh
curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install | bash -s -- \
  cantonese stroke mirtlecn/rime_radical_pinyin Nocehi/rime-jyut-soengping
```

已有 plum 時：

```sh
bash rime-install cantonese stroke mirtlecn/rime_radical_pinyin Nocehi/rime-jyut-soengping
```

指定用戶資料夾，設定 `rime_dir`。例如 fcitx5：

```sh
rime_dir=~/.local/share/fcitx5/rime bash rime-install Nocehi/rime-jyut-soengping
```

## 安裝後

1. 在 `default.custom.yaml` 的 `schema_list` 加入 `jyut6ping3_shuangpin`。
2. 重新部署。

待核實：

- plum 是否複製 `lua/` 資料夾。若不複製，要手動複製。
- plum 的 `cantonese` 是否指向 rime/rime-cantonese。
- rime_radical_pinyin 經 plum 安裝後是否提供 `radical_flypy.dict.yaml`。
