#!/bin/bash

#Yedek almak için fonksiyon
backup_files() {
	local source_dir="$1"
	local backup_dir="$2"
	local current_time=$(date +"%Y%m%d%H")
	local backup_filename="${current_time}_backup.tar.gz"

	tar -czf "${backup_dir}/${backup_filename}" -C "${source_dir}" .
	echo "Yedekleme tamamlandı: ${backup_dir}/${backup_filename}"
}
#Saat başı yedeklemeyi kontrol eder
while true; do
	#Şuanki dakika bilgisini al
	current_minute=$(date +"%M")

	# Eğer saat başı ise yedekleme işlemini gerçekleştirir
	if [[ "$current_minute" == "00" ]]; then
	#Yedekleme işlemini yapar
	source_directory="/home/neptun/script" #scriptlerin olduğu dizin
	backup_directory="/home/neptun/yedek" #yedeklerin kayıt edileceği dizin
	backup_files "$source_directory" "#backup_directory"
	fi
done
