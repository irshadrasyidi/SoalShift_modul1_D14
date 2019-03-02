# SoalShift_modul1_D14
Pengumpulan Jawaban Soal Shift Modul 1 Sisop

1. - Ekstrak nature.zip, lalu akan muncul file-file .jpg yang tidak bisa dibuka
   - Buat script bash berisi potongan kode berikut
```
#!/bin/bash
urutan=1
for file in /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/nature/*.jpg
do
 base64 -d $file | xxd -r > /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/decrypted/"gbr"$urutan".jpg"
let urutan++
done
```

   - Proses decode berada pada baris berikut menggunakan `base64` dan berada di dalam for loop karena file yang didecode ada banyak
> base64 -d $file
   - $file digunakan sebagai input file, karena kode ini ada di dalam for loop
   - File-file .jpg yang didecode berasal dari folder `/nature/`
   - Lalu hasilnya yang masih berupa file hexa diubah menjadi file binary dengan menggunakan `xxd`
> xxd -r > [file output]
   - Di awal, kita telah membuat suatu variabel int untuk membedakan file-file yang telah didecode
> urutan=1
   - Saat meng-output file, sisipkan variabel tadi di nama file, seperti ini
> "gbr"$urutan".jpg"
   - Hasil file output dimasukkan ke folder `/decrypted/`
   - Di bagian akhir, increment-kan variabel tadi, sehingga file berikutnya yang didecode memiliki nama yang berbeda
   - Lalu, tambahkan crontab supaya bisa bekerja pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat
> 14 14 14 2 * /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/soal1.sh
   - 14 pertama: Menit 14
   - 14 kedua: Jam 14
   - 14 ketiga: Tanggal 14
   - 2: Bulan ke-2 (Februari)
   - (bintang): Hari apapun
> 0 0 * 2 5 /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/soal1.sh
   - 0: Menit ke 0
   - 0: Jam ke 0
   - (bintang): tanggal berapa saja
   - 2: Bulan Februari
   - 5: Hari Jumat
   
2a. - Berikut adalah isi scriptnya
```
#!/bin/bash

awk -F ',' '{if($7='2012') arr[$1]+=$10} END { for(x in arr){print x} }' WA_Sales_Products_2012-14.csv | sort -n -r | head -1 > soal2a.txt
```
   - Pada bagian `awk -F ','` Data dipisahkan menggunaka `-F` untuk setiap ada tanda `,`
   - Pada bagian `{if($7='2012')`, Data yang diambil hanya data tahun 2012
   - Pada bagian `arr[$1]+=$10}`, menghubungkan setiap negara dengan masing-masing penjualannya (kolom ke-10)
   - Pada bagian `{ for(x in arr){print x} }`, dijalankan looping untuk menampilkan nama-nama negara
   - Lalu, hasilnya disort menggunakan `sort -n -r` secara numerikal (`-n`), lalu karena sort-nya dari kecil ke besar, sort-nya di-reverse menggunakan `-r`
   - Yang disort adalah penjualan masing-masing negara, namun yang ditampilkan hanya nama negaranya karena yang diprint adalah variabel `x`, bukan `arr[x]` (hasil penjualannya)
   - `head -1` untuk menampilkan hanya 1 baris teratas
   - `> soal2a.txt` ini untuk menyimpan hasilnya ke sebuah file bernama soal2a.txt

2b. - Berikut adalah isi scriptnya
```
#!/bin/bash

res=$(cat soal2a.txt)

awk -F "," '{if($1=$res && $7=="2012") arr[$4]+=$10} END {for(i in arr)print i}' WA_Sales_Products_2012-14.csv | sort -n -r | head -3 > soal2b.txt
```
  - Dengan menggunakan file output dari soal a, kita masukkan ke variabel `res`, untuk menjadi syarat pencarian
  - Tambahkan juga `$7=="2012"` untuk mengambil hasil United States yang tahun 2012 saja
  - `arr[$4]+=$10` Menggabungkan hasil penjualan dengan kolom product line (kolom ke-4)
  - `{for(i in arr)print i}` Loop untuk menampilkan product linenya saja
  - `sort -n -r` Sort secara numerical dan terbalik supaya jadi besar ke kecil
  - `head -3 > soal2b.txt` Hanya menampilkan 3 teratas dan menyimpannya dalam file output `soal2b.txt`

2c. - Berikut adalah isi scriptnya
```
#!/bin/bash

awk -F ',' '{if($7 == "2012" && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) arr[$6]+=$10} END { for(i in arr){print arr[i]","i} }' WA_Sales_Products_2012-14.csv | sort -n -r | awk -F ',' '{print $2}' | head -3
```
   - Hasil nomor a dan b adalah "United States" dan 3 Product Line ("Personal Accessories", "Camping Equipment", "Outdoor Protection"), dijadikan syarat/filter untuk mencari produk-produk jawaban 2c
   - `if($7 == "2012" && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection"))` If ini untuk menyeleksi hasil dari negara yang cocok dengan `United States`, product line yang cocok dengan `Personal Accessories` atau `Camping Equipment` atau `Outdoor Protection`, dan tahun yang cocok dengan `2012`
   - Lalu gabungkan kolom penjualan ($10) dengan kolom produk ($6) pada `arr[$6]+=$10`
   - `{ for(i in arr){print arr[i]","i} }` Untuk menampilkan quantity penjualannya `arr[i]` beserta produk-produk `i`
   - Seperti nomor sebelumnya hasil di-sort besar ke kecil `sort -n -r`
   - Lalu, karena yang ditampilkan hanya nama produknya saja (tanpa quantity) dan 3 teratas, maka digunakan awk lagi dengan delimiter ',' `awk -F ','` lalu diambil argumen ke 2, yaitu produknya `{print $2}`, lalu di-pipe dan tampilkan 3 teratas `head -3`
   
3. - Mirip soal nomor 1, dibuat 1 variabel bernilai 1 bernama `no` untuk nama pembedaan nama file
```
no=1
```
   - Untuk mengecek apakah nama file sudah ada atau belum, maka dibuat loop seperti ini
```
while test -e "pword$no.txt";
do
 ((no++))
done
```
   - Jika hasil ditemukan ada file dengan `$no` sama, maka variabel no di-increment
   - `/dev/urandom tr` Untuk membuat passwordnya
   - `A-Za-z0-9` Supaya password bisa terdiri dari A-Z, a-z, atau 0-9
   - `head -c 12` Supaya password yang dibuat hanya terdiri dari 12 karakter
   - `password=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 12)` hasilnya disimpan di variabel `password`
   - `echo "$password" > "$file"` Variabel tadi disimpan di $file, `file="pword$no.txt"` yang merupakan sebuah .txt file dengan sisipan `$no` untuk membedakan nama filenya

4. - Buat variabel string berisi alfabet, sebagai alat untuk membantu enkripsi, dan dibuat menjadi 2 set alfabet supaya huruf-huruf yang hasil enkripsinya melebihi 'z', akan kembali ke 'a'
```
kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
```
   - Karena basis enkripsi menggunakan jam, maka buat variabel kunci (x) yang mengambil waktu jam dari fungsi date milik linux `x=$(date +"%H")`
   - Input syslog disimpan di variabel 'input' `input="/var/log/syslog"`
   - Format jam adalah 24, jadi jam '9' akan tertampilkan '09'. Hal ini dapat diantisipasi dengan pengecek IF berikut
```
if [ ${x:0:1} == 0 ]
then
 x=${x:1:1}
fi
```
   - Jika 1 karakter index ke-0 dari variabel x adalah 0 `{x:0:1}`, maka x di-assign-kan karakter index ke-1 sejumlah 1 karakter `x=${x:1:1}`, dengan begini semisal '09', maka diambil bilangan ke duanya saja, jadi '9'
   - Lalu, buat variabel untuk menyimpan nama file yang akan dibuat `backupfile=$(date +"%H:%M %d-%m-%Y")`, perhatikan formatnya sesuai dengan soal, dan langsung diambil juga dengan fungsi date dari linux
   - Sama seperti kendala '0' pada jam, maka string `backupfile` juga dicek menggunakan IF berikut
```
if [ ${backupfile:0:1} == 0 ]
then
 backupfile=${backupfile:1}
fi
```
   - Lalu, ambil isi dari input, yang merupakan isi syslog `cat $input`
   - Menggunakan fungsi tr (truncate) untuk mengubah string
```
tr [${kecil:26}${besar:26}] [${kecil:$x:26}${besar:$x:26}]
```
   - `[${kecil:26}${besar:26}]`, bagian ini mengambil isi inputan yang karakternya termasuk dalam variabel kecil dan besar, yaitu semua alfabet kapital maupun tidak
   - `[${kecil:$x:26}${besar:$x:26}]`, bagian ini merupakan target perubahannya, digunakan `$x` karena itu adalah basis kunci dari proses enkripsinya
   - Untuk Dekripsi, mula-mula siapkan variabel alfabetnya kembali
```
kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
```
   - buat varibel yang mengambil nama file yang ingin didekrip `input="11:13 02-03-2019"`, karena basis kuncinya terdapat pada jam, maka bagian yang menunjukkan jam disimpan di suatu variabel `x=${input:0:2}`
   - Lanjutan dari kendala format jam 24, jika jam-nya dibawah jam 10 (misal jam 6), maka karakter yang terambil adalah '6:' bukan '6', maka dibuatkan IF untuk mengambil hanya angka '6'-nya saja
```
if [[ ${x:0:1} =~ [0-9] ]] && [ ${x:1:1} == ":" ]
then
 x=${x:0:1}
fi
```
   - `${x:0:1} =~ [0-9]`, mengecek karakter pertama adalah angka
   - `[ ${x:1:1} == ":" ]`, mengecek karakter kedua adalah ':'
   - `x=${x:0:1}`, x di-assign-kan 1 karakter pertama saja
   - Ambil inputan dengan awk berikut
```
awk '{print}' "/home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no4/$input"
```
   - Lalu, di-pipe dan masukkan ke proses truncate
```
tr "${kecil:$x:26}${besar:$x:26}" "${kecil:0:26}${besar:0:26}" > "/home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no4/decrypted/$input"
```
   - karena didekrip, maka posisi opsi tr-nya ditukar, dan basis-nya direset di opsi target `${kecil:0:26}${besar:0:26}`
   - Lalu simpan filenya `> "/home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no4/decrypted/$input"`
   - Lalu pasang crontab-nya
```
#no4
0 */1 * * * /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no4/soal4.sh
```
   - 0: menit ke-0
   - (bintang)/1: Untuk setiap 1 jam di jam berapapun
   - (3 bintang sisanya): tanggal, bulan, dan hari kapanpun
   
5. - Berikut awk-nya
```
awk '(/CRON/ || /cron/),!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/irshadrasyidi/modul1/no5.txt
```
   - Mengambil dari syslog, yang mengandung pattern CRON atau cron (karena case insensitive) `(/CRON/ || /cron/)`
   - Juga harus tidak mengandung pattern sudo `!/sudo/`
   - Yang diminta adalah yang Number of Field-nya (NF) kurang dari 13 `awk 'NF < 13'`
   - Lalu simpan di direktori yang diminta `>> /home/irshadrasyidi/modul1/no5.txt`
   - Pasang juga crontab-nya
```
#no5
2-30/6 * * * * /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no5/soal5.sh
```
   - 2-30/6: Pada menit 2 hingga menit 30, dijalankan setiap 6 menit
   - (4 bintang): Jam, Tanggal, Bulan, dan hari terserah
