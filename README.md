# 京大コーパス UTF-8エンコーダ

1. `./make_kyotocorpus_utf8.sh`の13行目の`/mnt/cdrom`を、毎日新聞CD-ROMのマウントポイントに指定する.

2. 以下のコマンドを実行.

```
./make_kyotocorpus_utf8.sh
cd ./KyotoCorpus4.0
./auto_conv -d ./
```
