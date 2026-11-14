# rime-jyut-soengping 粵拼雙拼

粵拼雙拼是 [Rime](https://rime.im/) 的粵語雙拼方案。方案 ID 是 `jyut6ping3_shuangpin`。

本方案不改字典。它用拼寫運算（speller algebra）把粵拼映射成「聲母鍵 + 韻母鍵」。每個音節固定按兩鍵。聲調可選。字典、詞頻和反查都沿用 [rime-cantonese](https://github.com/rime/rime-cantonese) 的 `jyut6ping3`。

狀態：v0.3，實驗版。作者自 2026-10-28 起日常使用。鍵位以後可能改。

## 鍵位

**聲母**：b p m f d t n l g k h w z c s j 照打。ng = **y**，gw = **u**，kw = **i**，零聲母 = **o**（唔 = ov，五 = ok）。

**韻母**（每鍵內按語料頻率排序）：

| 鍵 | 韻母 | 鍵 | 韻母 | 鍵 | 韻母 |
| --- | --- | --- | --- | --- | --- |
| q | iu on | a | ap it a | z | ou am |
| w | ei yu | s | ung | x | aa |
| e | e ak oe | d | ai ot | c | au |
| r | yun ut eu | f | at oi et | v | eoi m ui |
| t | uk eot yut | g | ang aang eng | b | in em |
| y | aam un oek | h | ong | n | ik aau |
| u | u eon aak | j | an aap | m | im aat ek |
| i | i ok | k | ing ng | | |
| o | o | l | oeng aai ep | | |
| p | aan ip | | | | |

**聲調**（可選）：v = 1，vv = 4，x = 2，xx = 5，q = 3，qq = 6。

**例**：你好 nwhz，粵語 jtjw，雙拼 slpk。

速查表：[`jyut6ping3_shuangpin.cheatsheet.svg`](jyut6ping3_shuangpin.cheatsheet.svg)。

### 鍵位規則

1. 拼寫與小鶴雙拼相同的韻母，用小鶴的鍵（ai d、an j、ei w、eng g、in b、ing k、ou z、iu q、ui v、un y）。
2. 讀音接近普通話的韻母，用小鶴對應韻母的鍵（ung≈ong s、ong≈ang h、ang/aang≈eng g、au≈ao c、aa≈ia x、oeng≈iang l、aau≈iao n、im≈ian m、ip≈ie p、yun≈üan r、yut≈üe t、eoi≈ü v）。
3. 長右短左：長元音 aai aam aan aap aat aak 在右手，短元音 am ap at ak 在左手。
4. 每鍵最多三個韻母。aai/ai、aan/an、aau/au 必須分鍵。其餘用語料加權的模擬退火排位。

要死記的只有 9 個：oi f、ik n、yu w、uk t、ok i、it a、on q、oek y、ek m。

**助記句**（韻母按 Q→P、A→L、Z→M 順序）：

- 潮起北川月，南湖詩歌晚。熱風西來，冷江雲影涼。草花流水天色染。
- 橋樹斜泉竹，觀春落波灣。別夢歸海，燈光聞清唱。早茶樓裏先食點。

## 其他功能

| 功能 | 用法 | 檔案 |
| --- | --- | --- |
| 拆字 | Shift+U 開頭。小鶴拆字和粵語兩分一起出（林 = Umama） | `loengfan_shuangpin.*`；小鶴拆字要另裝 |
| 以詞定字 | 桌面：`[` 上屏首字，`]` 上屏末字。手機：見 `examples/jyut6ping3_shuangpin.device.phone.yaml` | `lua/select_character.lua`、`lua/select_character_filter.lua` |
| 日期時間 | `rq` 日期，`uq` 時間 | `lua/date_time.lua` |
| 筆畫反查 | `x` 開頭，h s p n z = 一丨丿丶乙 | 依賴 rime-stroke |
| 語法模型 | 整句按上下文排候選 | `yue-mix.gram`（Release 附件）＋ `examples/jyut6ping3_shuangpin.custom.yaml` |
| 裝置專用設定 | 方案會讀可選的 `jyut6ping3_shuangpin.device.yaml` | 見 `examples/` |

a e r 三鍵不作音節起點，留給日後的旁路鍵。

## 依賴

| 依賴 | 用途 | 必要？ |
| --- | --- | --- |
| [rime-cantonese](https://github.com/rime/rime-cantonese) | `jyut6ping3` 字典、`symbols_cantonese` 標點 | 必要 |
| [rime-stroke](https://github.com/rime/rime-stroke) | 筆畫反查 | 必要（方案列為依賴） |
| [rime_radical_pinyin](https://github.com/mirtlecn/rime_radical_pinyin) | 小鶴拆字（`radical`、`radical_flypy`） | 必要（方案列為依賴） |
| librime-lua | 以詞定字、日期時間 | 必要 |
| librime-octagram | 語法模型 | 可選 |

## 安裝

| 平台 | 前端 | 文件 | 作者實測 |
| --- | --- | --- | --- |
| Linux | fcitx5-rime | [docs/install-linux.md](docs/install-linux.md) | 已測 |
| Linux | ibus-rime | [docs/install-linux.md](docs/install-linux.md) | 未測 |
| Windows | 小狼毫 Weasel | [docs/install-windows.md](docs/install-windows.md) | 未測 |
| macOS | 鼠鬚管 Squirrel | [docs/install-macos.md](docs/install-macos.md) | 未測 |
| Android | 小企鵝 fcitx5-android ＋ Rime 插件 | [docs/install-android.md](docs/install-android.md) | 已測 |
| Android | 同文 Trime | [docs/install-android.md](docs/install-android.md) | 未測 |
| iOS | 倉輸入法 Hamster | [docs/install-ios.md](docs/install-ios.md) | 未測 |
| 任何平台 | 東風破 plum | [docs/install-plum.md](docs/install-plum.md) | 未測 |

安裝後，在 `default.custom.yaml` 的 `schema_list` 加入 `jyut6ping3_shuangpin`。範例見 [`examples/default.custom.yaml`](examples/default.custom.yaml)。

## 語法模型 yue-mix.gram

本 repo 不含 `.gram`。`.gram` 放在 Release 附件。

- 內容：粵文維基（2026-10 dump）＋ HKCanCor 的詞 n-gram 計數。
- 要求：librime-octagram 插件。版本要求見 Release 說明。
- 授權：見 Release 說明。

## 授權

待定。各檔案的上游授權見 [NOTICE.md](NOTICE.md)。
