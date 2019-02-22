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
