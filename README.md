# 京大コーパス UTF-8エンコーダ
京都大学テキストコーパスVersion4.0をUTF-8形式で展開します。

## 動作確認済みの環境
- macOS High Sierra (推奨)
- Perl v5.18.2

## 注意
京都大学テキストコーパスVersion4.0本来の形に変換するには、本スクリプトの他に毎日新聞1995年版CD-ROMが必要です。

## インストール
`./make_kyotocorpus_utf8.sh`の第一引数に毎日新聞CD-ROMのマウントポイントに指定し、以下のコマンドを実行.

```
./make_kyotocorpus_utf8.sh <path_to_mai1995.txt>
cd ./KyotoCorpus4.0
./auto_conv -d ./
```
See also [京都大学テキストコーパス Version 4.0](http://nlp.ist.i.kyoto-u.ac.jp/index.php?%E4%BA%AC%E9%83%BD%E5%A4%A7%E5%AD%A6%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E3%82%B3%E3%83%BC%E3%83%91%E3%82%B9).
