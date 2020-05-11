# Normalisasi
Sama seperti sebuah software, database juga harus memiliki desain yang baik. Normalisasi adalah sebuah method yang bertujuan untuk merapikan desain database dengan mengelompokkan beberapa atribut yang membentuk entity (table) yang baru, non redundan, dan fleksibel.

# Jenis Jenis Key
Sebelum mengetahui lebih dalam, kita harus tahu terlebih dahulu jenis-jenis key

| Key | Penjelasan |
| --- | ---------- |
| Super Key | Sekelompok key baik satu maupun lebih yang mengidentifikasi baris dari sebuah tabel (bisa tidak unik) |
| Primary Key | Sebuah key yang digunakan untuk mengidentifikasi setiap baris dari sebuah tabel secara unik |
| Candidate Key | Sama seperti primary key, namun bisa lebih dari satu kolom, Primary Key sendiri adalah Candidate Key yang terpilih menjadi identitas sebuah row |
| Alternate Key | Candidate Key yang tidak terpilih menjadi sebuah Primary Key |
| Foreign Key | Sebuah key yang menciptakan sebuah relationship antar 2 tabel |
| Composite Key | Sebuah key yang merupakan sebuah primary key sekaligus sebagai foreign key juga, contoh: ID dalam HeaderTransaction dan Detail |

# Jenis Dependency
Dependency terbagi menjadi 3 macam yaitu:
| Dependency | Penjelasan |
| ---------- | ---------- |
| Functional Dependency | Suatu attribut yang memiliki ketergantungan pada atribut lainnya, contoh: nama barang memiliki ketergantungan dengan kode barang |
| Transitive Dependency | Atribut dalam sebuah tabel yang merupakan sebuah dependency dari dependency lainnya, contoh: di sebuah tabel transaksi, ada nomor faktur, kode pelanggan dan nama pelanggan. Hubungan antara nomor faktur dengan nama pelanggan adalah Transitive Dependency |
| Partial Dependency | Atribut yang bergantung kepada salah satu dari bagian composite key


# Tujuan Normalisasi
Normalisasi memiliki beberapa tujuan untuk:
- Mengurangi Redudansi Data
- Menghindari adanya anomali:
    Seperti namanya, anomali adalah keanehan dalam database. Anomali database terdiri dari 3 jenis yaitu:
    * Anomali Insert
        Situasi di mana kita menginsert data yang berulang-ulang (redundan)
    * Anomali Delete
        Situasi di mana ketika kita ingin menghapus suatu data, maka data lain juga kehapus.
    * Anomali Update
        Situasi di mana kita mau update sebuah record, tapi malah kita mengupdate semua record. Dan hal ini memungkinkan terjadinya inconsisten data

# Tahap Normalisasi
```
    Sebenarnya untuk melakukan normalisasi, kita harus tahu semua sistem, tapi supaya lebih simplenya, kita akan gunakan struk saja. Jadi ada beberapa attribut yang kita tambahkan.
    Contoh yang akan kita gunakan adalah contoh transaksi IndoMerat
```

![receipt]('images/receipt.png)

## UNF
Dalam tahap ini kita ambil attribut secara keseluruhan, jadi apa yang ada di dalam sistem tersebut, kita catat bulat-bulat.
Contoh:
![UNF]('images/UNF.png')

## 1NF
Dalam tahap ini, kita akan menghapus semua data-data yang kurang penting seperti calculation, auto-numbering. Serta kita juga memisahkan Transaction tersebut menjadi TransactionHeader dan TransactionDetail. Kita juga harus menentukan Primary Key dan Foreign Keynya
Contoh:
![1NF]('images/1NF.png')

## 2NF
Dalam tahap ini, kita akan memisahkan data-data yang seharusnya bisa diganti dengan Composite Key saja, contoh di sini adalah ProductName dan ProductPrice bisa kita pisahkan dari tabel TransactionDetail
![2NF]('images/2NF.png')

## 3NF
Dalam tahap ini, kita akan memisahkan data-data yang Transitive Dependent. Di sini, kita katakan Staff dan Customer punya attribut-attribut pada umumnya ya, seperti nama, DOB, dsb.
![3NF-Unfinished]('images/3NF-Unfinished.png')

Tidak cukup hanya normalisasi itu, mungkin saja Staff di IndoMerat mempunyai banyak Role, jadi alangkah baiknya kalau kita normalisasi Role dari Staff 
![3NF]('images/3NF')