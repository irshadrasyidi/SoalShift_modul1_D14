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
let name++
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
> 14 14 14 2 5 /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/soal1.sh
   - 14 pertama: Menit 14
   - 14 kedua: Jam 14
   - 14 ketiga: Tanggal 14
   - 2: Bulan ke-2 (Februari)
   - 5: Hari ke-5 (Jumat)
   
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
