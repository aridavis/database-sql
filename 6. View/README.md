# View

## Pengertian View
View adalah sebuah tabel yang dibuat dari beberapa tabel ataupun view lainnya. Sama seperti subquery, View juga adalah sebuah tabel virtual. Syntax untuk view adalah seperti di bawah ini. View bersifat mereference ke tabel yang sudah ada, jadi dia tidak membuat sebuah tabel baru. Jadi, data-data yang ada dalam view akan tetap mengikuti data pada tabel aslinya. Kalau kita ganti data di tabel asli, otomatis data view juga akan terganti.

```
  CREATE VIEW nama_view AS
    SELECT ...
    FROM ...
    WHERE ...
    ....
```

## Cara Menggunakan View
Gampang sekali, caranya adalah:
```
  SELECT * FROM nama_view
```

## Peraturan
Untuk membuat sebuah view, ada beberapa hal yang harus diperhatikan:
  - Kolom yang ada dalam view, tidak boleh duplikat
  - View hanya bisa digunakan untuk SELECT DATA

## Keuntungan menggunakan View
Ini ada beberapa keuntungan menggunakan View:
  **- Untuk menyembunyikan data-data / kolom yang penting**
  Seandainya kita mempunyai sebuah tabel user, di dalamnya ada kolom password dan data-data lainnya. Tiba-tiba katakanlah ada orang awam minta data semua orang yang ada di Database kalian. Tidak mungkin dong kalian akan memberikan data password. Maka kalian perlu membuat sebuah View dibandingkan membuat suatu tabel baru ataupun memberikan nama tabelnya langsung.
  Kita contohkan menggunakan database [TokoCamera](https://raw.githubusercontent.com/aridavis/database-sql/master/CREATE%20%2B%20INSERT.sql). Di dalam tabel Customer ada CustomerDoB, katakan ada seseorang meminta data-data customer kita. Tapi berhubung karena orang yang minta itu ada latar belakang sebagai paranormal, pasti kita takut juga untuk memberikan tanggal lahir. Nah, untuk memberikan data-data nama customer doang, kita bisa suruh jalanin query berikut:
  ```
    SELECT CustomerName FROM MsCustomer
  ```
  Apakah aman? Tentu saja tidak, karena dia tahu nama tabel kita adalah MsCustomer, jadi solusinya adalah kita berikan aja sebuah View, tapi kita buat dahulu
  ```
    CREATE VIEW data_customer AS
    SELECT CustomerName, CustomerEmail FROM MsCustomer
  ```
  Barulah kita suruh dia tampilin isi dari data_customer
  ```
    SELECT * FROM data_customer
  ```

  **- Untuk memudahkan query yang kompleks**
  Contoh, kita mau mengambil data transaksi, tanggal transaksi, nama staff, nama pabrik, nama camera, quantity dan total bayarnya, kita bisa menjalankan query ini
  ```
  SELECT
      th.TransactionId,
      th.TransactionDate,
      StaffName,
      ManufacturerName,
      CameraName,
      Quantity,
      '$' + CAST(Quantity * CameraPrice AS VARCHAR) AS 'Total Payment'
  FROM
      TransactionHeader th
      JOIN MsStaff s on th.StaffId = s.StaffID
      JOIN TransactionDetail td on td.TransactionId = th.TransactionId
      JOIN MsCamera cam on cam.CameraId = td.CameraId
      JOIN MsManufacturer manu on manu.ManufacturerId = cam.ManufacturerId
  WHERE
      MONTH(TransactionDate) = 8
  GROUP BY
      th.TransactionId,
      th.TransactionDate,
      StaffName,
      ManufacturerName,
      CameraName,
      Quantity,
      CameraPrice
  HAVING
      SUM(Quantity * CameraPrice) > AVG(CameraPrice)
  ```

  Seandainya Query itu akan kalian jalankan berkali-kali di waktu yang berbeda, dari pada kalian mengetikkan query yang panjang itu lagi, lebih bagus kalian membuat query di atas menjadi sebuah View, jadi setiap kali kalian ingin menjalankan query tersebut, kalian hanya perlu menjalankan query
  ```
    SELECT * FROM view_yang_kita_buat_di_atas
  ```

# Alter View
Dari tadi kita sudah membahas cara read dan membuat sebuah view. Sekarang kita akan belajar caranya mengganti isi view. Dari subjudul di atas, kita kira-kira sudah dapat bayangan apa yang akan kita buat. Cara menggantinya adalah dengan menjalankan
```
  ALTER VIEW nama_view AS
    SELECT ..
    FROM ..
    WHERE ..
    GROUP BY ..
    HAVING ..
    ORDER BY ..
```

# Delete View
Caranya seperti biasa di mana kita menghapus table, database, dsb. Untuk menghapus view kita hanya perlu menjalankan
```
  DROP VIEW nama_view
```