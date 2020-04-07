# Subquery & Alias Subquery

## Pengertian
**Subquery** dan **Alias Subquery** adalah query di dalam query. Sebenarnya ketika kita melakukan **SELECT**, **FROM**, **WHERE** atau apapun itu, kita bisa memasukkan query ke dalamnya.
Di sini, kita akan mengambil data dari database [TokoCamera](https://raw.githubusercontent.com/aridavis/database-sql/master/CREATE%20%2B%20INSERT.sql)

Contoh Subquery & Alias Subquery
```
  SELECT (SELECT 'INI HASIL SUBQUERY')
  FROM (SELECT * from MsCamera) mc
  WHERE mc.CameraName IN (SELECT 'D5')
```
Contoh di atas sama seperti ini
```
  SELECT 'INI HASIL SUBQUERY'
  FROM MsCamera
  WHERE CameraName = 'D5'
```

Sekilas terkesan sepele, tapi ada beberapa kasus di mana kita perlu menggunakan subquery misalkan untuk mengambil data customer yang tidak pernah melakukan transaksi dan sebagainya.

## Perbedaan
Simple, **Subquery** terletak di **WHERE** sedangkan **Alias Subquery** terletak di **FROM**

## Subquery
Subquery bisa digunakan untuk beberapa hal (yang sudah pernah saya dapati):
  - Mengurangi penggunaan Group By
  - Melakukan JOIN tanpa harus JOIN

### Syntax:
```
  SELECT *
  FROM Table
  WHERE Attribute OPERATOR (Subquery)
```

### Contoh Kasus Subquery 1 
  #### Tampilkan nama kamera yang memilki harga di atas rata-rata
  ```
    SELECT CameraName
    FROM MsCamera
    WHERE CameraPrice > (
        SELECT AVG(CameraPrice) FROM MsCamera
    )
  ```
  Untuk debugging sebuah subquery, kita harus mulai dari yang terdalam, yaitu yang (SELECT AVG(CameraPrice)) FROM MsCamera.
  Query AVG tersebut akan menghasilkan nilai **31550**, itu sama saja seperti
  ```
    SELECT CameraName
    FROM MsCamera
    WHERE CameraPrice > 31550
  ```
  Kalian boleh coba dengan menggunakan metode **GROUP BY** dan **HAVING**. Kalau dari yang saya coba sih tidak ada data yang ditampilin karena dia ke GROUP BY CameraPrice nya

Setelah mendapatkan bayangan tentang subquery, sekarang kita harus mengetahui keempat syntax ini:
  - **ANY / SOME**
  
    Syntax **ANY** dan **SOME** sama-sama memiliki arti **OR**. Kita lihat contoh kasus saja kalau kurang mengerti
    #### Tampilkan semua data kamera yang dibeli di semua transaksi
    ```
      SELECT *
      FROM MsCamera
      WHERE CameraId = ANY (
        SELECT CameraId FROM TransactionDetail
      )
    ```
    Itu sama saja seperti
    ```
      SELECT *
      FROM MsCamera
      WHERE CameraId = CA004 OR CameraId = CA005 OR ...
    ```
  - **ALL**

    **ALL** memiliki arti **AND**, kita pakai contoh di atas
    ```
      SELECT *
      FROM MsCamera
      WHERE CameraId = ALL (
        SELECT CameraId FROM TransactionDetail
      )
    ```
    Itu sama seperti
    ```
      SELECT *
      FROM MsCamera
      WHERE CameraId = CA004 AND CameraId = CA005 AND ...
    ```
  - **IN**

    **IN** sama seperti **ANY** hanya saja cara menggunakannya sedikit berbeda. Kalau **ANY** menggunakan operator =,>,<,> kalau **IN** tidak menggunakan operator tersebut, melainkan langsung menggunakan syntaxnya.
    ```
      SELECT *
      FROM MsCamera
      WHERE CameraId IN (
        SELECT CameraId FROM TransactionDetail
      )
    ```
  - **EXISTS**

    **EXISTS** sendiri adalah sebuah syntax untuk mengecek apakah subquery di dalamnya ada isinya atau tidak, kalau ada maka nilainya True, dan sebaliknya
    ```
      SELECT *
      FROM MsCamera
      WHERE EXISTS (
        SELECT * FROM TransactionDetail
      )
    ```
    Kita lihat, **SELECT * FROM TransactionDetail**  memiliki isi, maka secara otomatis, syntax tersebut menjadi
    ```
      SELECT *
      FROM MsCamera
      WHERE TRUE
    ```

## Alias Subquery
Sebenarnya, kita bisa membuat sebuah tabel virtual di dalam sebuah query.
### Syntax
```
  SELECT *
  FROM TableA, (SELECT * FROM TableB) AliasTableName
```
### Contoh Alias Subquery:
```
  SELECT st.StaffId FROM (
    SELECT * FROM MsStaff
  ) st
```
Kita lihat, st itu adalah sebuah tabel virtual yang terbentuk dari **SELECT * FROM MsStaff**, **Alias Subquery** sendiri adalah sebuah tabel virtual. Sama seperti **subquery** namun hanya berada di **FROM** dan tidak memiliki operator macam-macam.
### Contoh Kasus Alias Subquery 
  #### Tampilkan nama kamera yang memilki harga di atas rata-rata
  ```
    SELECT CameraName
    FROM MsCamera, (
        SELECT AVG(CameraPrice) as average FROM MsCamera
    ) CameraAVG
    WHERE CameraPrice > CameraAVG.average
  ```