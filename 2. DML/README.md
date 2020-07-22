# DML (Data Manipulation Language)

## Pengertian

DML adalah operasi-operasi yang digunakan untuk memanipulasi data dari sebuah dari tabel. Analoginya begini, DDL itu ketika kita membuat kerangka dari sebuah rumah (kita pasang pondasi, taruh batu, di cat), sedangkan DML adalah ketika kita mengisi rumah tersebut dengan furniture (taruh meja, tempat tidur, dsb).

## CRUD

Mungkin kalian sering atau pernah mendengar **CRUD**. Apa itu CRUD? CRUD adalah singkatan dari

| Huruf | Kepanjangan |
| ----- | ----------- |
| C     | CREATE      |
| R     | READ        |
| U     | UPDATE      |
| D     | DELETE      |

## CREATE

CREATE adalah syntax yang digunakan untuk menambahkan data ke dalam suatu tabel. Syntax dari CREATE ADALAH

```
    INSERT INTO nama_tabel
    VALUES
        (value1A, value1B),
        (value2A, value2B)
```

Contoh:

Tambahkan data ke MsStaff dengan data di bawah:

| Atribut     | Nilai             |
| ----------- | ----------------- |
| StaffID     | ST019             |
| StaffName   | Ashley            |
| StaffEmail  | ashley@ashley.com |
| StaffSalary | 7000000           |
| StaffDob    | 1999-02-02        |

| Atribut     | Nilai             |
| ----------- | ----------------- |
| StaffID     | ST020             |
| StaffName   | Gordon            |
| StaffEmail  | gordon@gordon.com |
| StaffSalary | 7000000           |
| StaffDob    | 1999-03-03        |

```
    INSERT INTO MsStaff
    VALUES
        ('ST019', 'Ashley', 'ashley@ashley.com', 7000000, '1999-02-02'),
        ('ST020', 'Gordon', 'gordon@gordon.com', 7000000, '1999-03-03'),
```

Urutan dari Value harus sesuai dengan urutan ketika kita membuat atribut tabel tersebut. Jikalau kita mau mengganti urutannya ataupun mengabaikan sesuatu yang bernilai default, maka kita harus menggunakan syntax ini

```
    INSERT INTO NamaTabel(atribut2, atribut3, atribut1)
    VALUES (value2, value3, value1)
```

## READ

**READ** berguna untuk menampilkan data yang ada dalam suatu tabel atau lebih.

```
    PERHATIAN!
    Berikut urutan yang harus diperhatikan ketika kita mau READ data:

    SELECT
    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY
```

Ya, seperti yang kita lihat di urutan di atas. Syntax paling umum yang akan kita pakai adalah SELECT

Syntax yang akan digunakan adalah

```
    SELECT atribut FROM tabel
    WHERE kondisi
```

Silahkan jalankan dulu [CREATE + INSERT.sql](https://raw.githubusercontent.com/aridavis/database-sql/master/CREATE%20%2B%20INSERT.sql)

Sekarang, kita akan menampilkan data-data staff.

```
    SELECT * FROM MsStaff -- * artinya adalah semua kolom
```

Sekarang, kita akan menampilkan nama Staff yang gajinya di atas 8000000

```
    SELECT StaffName FROM MsStaff
    WHERE StaffSalary > 8000000
```

## UPDATE

**UPDATE** berguna untuk mengganti satu atau lebih data dari sebuah tabel.

Syntax yang digunakan adalah:

```
    UPDATE nama_tabel
    SET
        atribut1 = valueBaru,
        atribut2 += nilaiYangMauDiIncrement
```

Contoh:

1. Kita ingin mengupdate gaji staff dengan ID ST001 menjadi 8000000

```
    UPDATE MsStaff
    SET StaffSalary = 8000000
    WHERE StaffID = 'ST001'
```

2. Kita ingin menaikkan gaji karyawan sebesar 1000000 kepada karyawan yang melayani di bulan Agustus

```
    UPDATE MsStaff
    SET StaffSalary += 1000000
    FROM MsStaff s, TransactionHeader h
    WHERE s.StaffID = h.StaffId AND MONTH(h.TransactionDate) = 8
```

```
    PERHATIKAN!
    Jika kita tidak membuat WHERE ketika UPDATE,
    maka semua datanya akan terupdate
```

## DELETE

**DELETE** berguna untuk menghapus data yang sudah ada

Syntax

```
    DELETE FROM nama_tabel
    WHERE kondisi
```

Contoh:

1. Kita ingin menghapus data staff yang memiliki id ST001

```
    DELETE FROM MsStaff
    WHERE StaffID = 'ST001'
```

2. Kita ingin menghapus semua data staff

```
    DELETE FROM MsStaff
```

## BEGIN TRAN, Commit, Rollback

### Begin Tran

**Begin Tran** itu ibarat kita melakukan sesuatu di MsWord / Notepad. Ketika kita menulis sesuatu, kita masih diperbolehkan undo. Tetapi proses Begin Tran itu bukan proses Undo, tetapi seperti menyimpan data yang dari state sebelumnya, dan ketika di undo, system menampilkan data yang disimpan sebelumnya.

### Rollback

**Rollback** adalah proses Undo nya

### Commit

**Commit** adalah kebalikan dari Rollback, jika kita sudah Commit, maka kita tidak bisa Rollback lagi

Contoh:

```
    BEGIN TRAN
    DELETE FROM MsCustomer
```

kemudian

```
    SELECT * FROM MsCustomer
    -- Pasti datanya hilang semua
```

sekarang kalian Rollback dan tampilkan data MsCustomer lagi, pastilah semua data customer akan kembali

```
    ROLLBACK
```

Tetapi kalau kalian Commit, maka semua data yang sudah ada akan hilang selamanya dan kalian sudah tidak bisa rollback

```
    COMMIT
```
