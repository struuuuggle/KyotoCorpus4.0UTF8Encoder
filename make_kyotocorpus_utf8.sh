#/bin/sh

if [ $# -ne 0 ]; then
    echo "Too many argument"
    exit 1
fi

# 京大コーパスをダウンロードせずに、直接解凍
echo "Download KyotoCorpus ver4.0..."
wget -qO - "http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/corpus/KyotoCorpus4.0.tar.gz&name=KyotoCorpus4.0.tar.gz" | tar zxvf -

# KyotoCopus4.0へ移動
cd ./KyotoCorpus4.0

# 毎日新聞CD-ROMに入っているmai1995.txtを、mai95.txtにリネームしてKyotoCorpus4.0/にコピー
# /mnt/cdromは各自の環境に合わせてCD-ROMのマウントポジションを指定する
\cp /mnt/cdrom/mai1995.txt ./mai95.txt

# KyotoCopus4.0/以下のファイルをUTF-8に変換
nkf -Lu -w --overwrite $(find . -type f | grep -v doc)

# KyotoCorpusデフォルトのsrc/を、UTF-8対応src/で上書きする
\cp -rf ../src ./

exit 0
