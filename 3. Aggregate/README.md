# Aggregate Function & Group By

## Note
Silahkan jalankan [CREATE + INSERT.sql](https://github.com/aridavis/database-sql/blob/master/CREATE%20%2B%20INSERT.sql)dahulu

## Defisini
Aggregate Function adalah fungsi yang menerima semua data / value, memprosesnya dan mengembalikan nilai tunggal. 
Sebagai contoh:
kita punya 10 data nilai mahasiswa, jika kita ingin mendapatkan total nilai dari semua data tersebut, tentu saja total nilai dari data tersebut adalah sebuah data tunggal

## Jenis Fungsi Aggregate
Ada 5 Aggregate Function yang standard:
  1. **SUM**
  SUM berguna untuk mendapatkan hasil penjumlahan dari semua data. Dari database TokoCamera, kita akan mengambil total dari semua harga kamera.
  ```
    SELECT SUM(CameraPrice) AS 'Total Camera Price' FROM MsCamera
  ```
  2. **AVG**
  SUM berguna untuk mendapatkan rata-rata dari semua data. Dari database TokoCamera, kita akan mengambil rata-rata harga kamera. 
  ```
    SELECT AVG(CameraPrice) AS 'Camera Price Average' FROM MsCamera
  ```
  3. **COUNT**
  COUNT berguna untuk mendapatkan ada berapa banyak data dari suatu data, COUNT itu didapat dari jumlah baris dari data tersebut. Dari database TokoCamera, kita ingin melihat, ada berapa banyak transaksi yang sudah pernah dilakukan.
  ```
    SELECT COUNT(*) FROM TransactionHeader
  ```
  4. **MAX**
  MAX berguna untuk mendapatkan nilai tertinggi dari semua data. Dari database TokoCamera, kita akan mengambil harga tertinggi kamera.
  ```
    SELECT MAX(CameraPrice) as 'Max Camera Price' FROM MsCamera
  ```
  5. **MIN**
  MIN berguna untuk mendapatkan nilai terendah dari semua data. Dari database TokoCamera, kita akan mengambil harga terendah kamera.
  ```
    SELECT MIN(CameraPrice) as 'Min Camera Price' FROM MsCamera
  ```

## GROUP BY
**Group By** berguna untuk mengelompokkan data, biasanya akan dipakai dengan Aggregate Function, namun tidak selamanya. Kalau tadi kita hanya mengambil 1 hasil dari keseluruhan data, sekarang kita ambil hasilnya berdasarkan suatu attribute.
Contoh:
  1. Dari data yang sudah kita punya, kita ingin menampilkan harga total kamera berdasarkan nama perusahaanya serta menampilkan nama perusahannya
  ```
    SELECT 
        ManufacturerName, 
        SUM(CameraPrice) AS 'Total Price' 
    FROM MsCamera mc, MsManufacturer mm
    WHERE mc.ManufacturerId = mm.ManufacturerId
    GROUP BY ManufacturerName
  ```