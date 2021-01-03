# DDL (Data Definition Language)

## Pengertian

DDL adalah operasi-operasi yang digunakan untuk mendefinisikan suatu identitas dari database, tabel, kolom, tipe data dan sebagainya yang tidak berhubungan dengan isinya. Bisa dikatakan kita membuat kerangka dari database, tabel, dsb.

## Apa Saja yang Dipelajari

Singkatnya, kita bakal mempelejari

- **CREATE**
- **ALTER**
- **DROP**
- **Constraint**

Berikut adalah yang akan kita operasikan:

- **Database**
- **Tabel**
- **Kolom**

## Database

### Membuat Database

Untuk membuat database, diperlukan syntax yang cukup sederhana yaitu

```
    CREATE DATABASE nama_database
```

PERLU DIPERHATIKAN!
Nama Database harus unique (tidak boleh duplikat). Ketika kalian sudah membuat databasenya, pastikan kalian menggunakan database yang kalian gunakan (by default, kalian akan berada di database master). Kalian boleh menggunakan syntax di bawah untuk menggunakan database yang kalian buat tadi

```
    GO
    USE nama_database
    GO
```

Contoh:
Sekarang kita akan membuat sebuah database yang bernama TokoCamera (yang sesuai dengan repository ini)

```
    CREATE DATABASE computer_science_b
    GO
    USE computer_science_b
    GO
```

### Menghapus Database

Untuk menghapus database, kalian hanya perlu menjalankan syntax:

```
    DROP DATABASE nama_database
```

## Tabel

### Membuat Tabel

Membuat tabel sama seperti membuat database tetapi sedikit berbeda. Formatnya bisa dilihat di bawah

```
    CREATE TABLE nama_table(
        atribut1 tipe_data,
        atribut2 tipe_data
    )
```

### Mengganti Tabel (Update Table)

Mengganti tabel maksudnya adalah mengupdate kerangka dari si tabel, bisa digunakan untuk:

- Menambahkan kolom
- Menghapus kolom
- Mengganti kolom
- Menambah constraint
- Menghapus constraint
- mungkin masih ada lagi yang tidak akan saya sebutkan satu per satu

Untuk update tabel, sedikit lebih banyak dan bervarian seperti list di atas, tapi pada dasarnya adalah

```
    ALTER TABLE nama_tabel OPERASI_YANG_AKAN_DIJALANKAN
```

### Menghapus Tabel

Untuk menghapus tabel, sama seperti menghapus database namun yang berbeda adalah apa yang dihapus dan nama dari tabel. Kalau kita DROP sebuah tabel, maka data di dalamnya juga akan hilang

```
    DROP TABLE nama_tabel
```

## Constraint

Constraint adalah ibarat validasi atau peraturan-peraturan yang ada di dalam tabel. Constraint terbagi menjadi 5 yaitu:
| Constraint | Deskripsi |
| PRIMARY KEY | Sebuah key yang digunakan untuk mengidentifikasi setiap baris dari sebuah tabel secara unik, ibarat sebuah NIM di setiap identitas mahasiswa |
| FOREIGN KEY | Sebuah key yang menciptakan sebuah relationship antar 2 tabel |
| NOT NULL | Peraturan di mana sebuah atribut diwajibkan untuk memiliki isi (tidak boleh kosong) |
| UNIQUE | Peraturan di mana sebuah atribut tidak boleh memiliki data yang duplikat |
| CHECK | Peraturan di mana sebuah data harus berisi nilai yang bernilai True jika divalidasi |

Untuk lebih jelas tentang Key, silahkan baca [Normalisasi](https://github.com/aridavis/database-sql/tree/master/0.%20Normalisasi)

### Cara Membuat Constraint

Ada beberapa cara untuk membuat constraint pada sebuah tabel, tapi saya akan bahas 2 saja

#### 1. Didefinisikan ketika tabel dibuat

Ketika kita sudah tahu, constraint-constraint apa saja yang harus ada sebuah tabel, maka kita hanya perlu mengetikkan syntax create table tapi dengan beberapa tambahan

```
    CREATE TABLE sample (
        attribut tipe_data CONSTRAINT
    )
```

contoh:

```
    CREATE TABLE Mahasiswa (
        ID INT PRIMARY KEY,
        Nama VARCHAR(255) CHECK(LEN(Nama) < 20),
        JurusanID INT FOREIGN KEY REFERENCES TabelLainYangSudahKebuat(PrimaryKeyDariTabelLainTersebut) ON UPDATE CASCADE ON DELETE CASCADE,
        Alamat VARCHAR(255) UNIQUE NOT NULL, -- Kita juga bisa menambahkan beberapa constraint dalam 1 kolom sekaligus
    )
```

Notes

```
    ON UPDATE CASCADE ON DELETE CASCADE adalah FOREIGN KEY OPTIONS yang akan menghandle bagaimana nasib dari suatu data yang memiliki foreign key
    jika data primary keynya diupdate atau didelete.

    CASCADE bisa diganti menjadi beberapa macam syntax, salah satunya adalah SET NULL.
    Ada banyak lagi syntax yang bisa digunakan
```

[Lebih Detail Tentang Foreign Key Options](https://bayu.pinasthika.com/ti/database/perbedaan-restrict-cascade-set-null-dan-no-action-pada-foreign-key-options/)

#### 2. Didefinisikan setelah tabel terbuat

Untuk mendefiniskan constraint setelah tabel terbuat adalah dengan menggunakan **ALTER TABLE**.

```
    ALTER TABLE Mahasiswa
    ADD CONSTRAINT
    NamaConstraint CONSTRAINT_YANG_MAU_DIBUAT
```

Contoh:

```
    ALTER TABLE Mahasiswa
    ADD CONSTRAINT
    Nama20Char CHECK(LEN(Nama) < 20),
    AlamatUnik UNIQUE(Alamat)
```

### Contoh Kasus

Contoh:
Sekarang kita akan membuat sebuah table sederhana dahulu yang bernama MsStaff.
MsStaff berisi data-data di bawah ini:

| Atribut     | Tipe Data    |
| ----------- | ------------ |
| StaffID     | CHAR(5)      |
| StaffName   | VARCHAR(255) |
| StaffEmail  | VARCHAR(255) |
| StaffSalary | INT          |
| StaffDob    | Date         |

```
    PERHATIAN!
    Supaya kita bisa paham tentang ALTER TABLE, kita akan sengaja menyalah-nyalahkan data yang kita buat
```

Pertama sekali, kita coba buat tabel dengan data StaffID dan StaffName doang

```
    CREATE TABLE MsStaff(
        StaffID CHAR(5),
        StaffName VARCHAR(255)
    )
```

Sekarang kita tambahkan data lainnya, tentu saja kita menggunakan **ALTER**

```
    ALTER TABLE MsStaff
    ADD -- BY DEFAULT, ADD DI ALTER TABLE AKAN MENAMBAHKAN KOLOM
    StaffEmail VARCHAR(255),
    StaffSalary INT,
    StaffDob DATE
```

**Tiba-tiba dapat pemberitahuan bahwa**

| Atribut     | Tipe Data                          |
| ----------- | ---------------------------------- |
| StaffID     | PRIMARY KEY, TIPE DATA MENJADI INT |
| StaffName   | UNIQUE                             |
| StaffEmail  | MEMILIKI '@'                       |
| StaffSalary | TIDAK BOLEH KOSONG                 |
| StaffDob    | TIDAK BOLEH KOSONG                 |

Kalian memiliki 2 pilihan, menghapus tabel dan membuat tabelnya dengan membuat constraint sekaligus, atau kalian Alter Tabel.
Anggap saja kalian memiliki 2 juta data mahasiswa, kalau kalian menggunakan opsi pertama, maka semua data akan hilang, maka kita gunakan saja opsi kedua

Agar sebuah atribut bisa menjadi PRIMARY KEY, sebuah atribut harus menjadi **NOT NULL** terlebih dahulu. Untuk mengganti suatu atribut menjadi NOT NULL, kita harus ALTER COLUMN juga. Tapi di sini kita langsung menyelesaikan yang StaffSalary dan StaffDob

```
    ALTER TABLE MsStaff
    ALTER COLUMN
        StaffID INT NOT NULL

    ALTER TABLE MsStaff
    ALTER COLUMN
        StaffSalary INT NOT NULL

    ALTER TABLE MsStaff
    ALTER COLUMN
        StaffDob DATE NOT NULL
```

Kalau sudah, barulah kita bisa membuat StaffID menjadi PRIMARY KEY

```
    ALTER TABLE MsStaff
    ADD CONSTRAINT
        PK_STAFF PRIMARY KEY (StaffID)

    ALTER TABLE MsStaff
    ADD CONSTRAINT
        NAMA_UNIK UNIQUE (StaffName),

    ALTER TABLE MsStaff
    ADD CONSTRAINT
        HARUS_ADA_KEONG CHECK(CHARINDEX('@', StaffEmail, 1) != 0)
```

Dengan demikian tabel MsStaff sudah selesai dibuat
