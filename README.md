# 京大コーパス UTF-8エンコーダ

1. `./make_kyotocorpus_utf8.sh`の17行目の`/mnt/cdrom`を、毎日新聞CD-ROMのマウントポイントに指定する.

2. 以下のコマンドを実行.

```
./make_kyotocorpus_utf8.sh
cd ./KyotoCorpus4.0
./auto_conv -d ./
```
See also [京都大学テキストコーパス Version 4.0](http://nlp.ist.i.kyoto-u.ac.jp/index.php?%E4%BA%AC%E9%83%BD%E5%A4%A7%E5%AD%A6%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E3%82%B3%E3%83%BC%E3%83%91%E3%82%B9)
