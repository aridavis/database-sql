# Normalisasi
Sama seperti membuat sebuah software, sebuah database harus memiliki desain yang baik. Untuk merancang suatu database yang baik, kita harus melakukan **normalisasi**
Normalisasi adalah sebuah teknik untuk menghasilkan set relasi dengan property yang desirable dan memberikan data sesuai dengan kebutuhan enterprise (HOL Basic Database - Software Laboratory Center).
Tujuan dari normalisasi adalah:
- menghindari anomali database
- membuat relasi dengan tujuan untuk membentuk suatu database
- mengkombinasikan atribut untuk membuat database
- mendidentifikasi hubungan antar atribut

# Proses Normalisasi

Untuk lebih muda mempelajarinya, kita akan buat menggunakan contoh dari sebuah receipt:
![receipt](https://live.staticflickr.com/3294/2623977987_8937dd3bc7_b.jpg)

## 1. UNF
Dalam proses ini, kita akan mengambil semua atribut yang ada dalam sebuah form yang akan kita normalisasi. 
Berdasarkan Contoh di atas:
```
    Order(OrderNumber, Date, Time, TillNumber, StaffName, ProductName, Weight, ProductPrice, SubTotalPrice, TotalPrice, VATA, VATB, VAT, VATTotal)
```

## 1. UNF
Dalam tahap ini, kita akan menghilangkan semua atribut yang berulang (contoh: nomor urut), atribut hasil perhitungan (contoh: total payment) dan dalam tahap ini kita sudah menentukan sebuah **Primary Key**. Di sini, simplenya kita hanya memisahkan TransactionHeader dengan TransactionDetail
```
    OrderHeader(OrderNumber, Date, Time, TillNumber, StaffName)
    OrderDetail(OrderNumber, ProductName, Weight, ProductPrice)
```

## 3. 2NF
Dalam tahap ini, kita akan memindahkan sebagian atribut yang ada dalam 1NF ke dalam sebuah tabel baru. Simplenya, kita memisahkan OrderDetail dengan data-data yang bisa dipindah, sebagai contoh Product dan tabel OrderDetail akan berelasi dengan table Product melalui Foreign Key yang reference ke Primary Key tabel Product
Contoh:
```
    OrderHeader(OrderNumber, Date, Time, TillNumber, StaffName)
    OrderDetail(OrderNumber, Weight, ProductID)
    Product(ProductID, ProductName, ProductPrice)
```

## 4. 3NF
Dalam tahap ini, kita akan memindahkan beberapa attribut ke dalam tabel-tabel baru berdasarkan kebutuhan. Simplenya, kita memindahkan semua attribut yang bisa dipindah, bukan hanya di Header ataupun Detail, bisa saja sampai ke akar-akarnya.
```
    OrderHeader(OrderNumber, Date, Time, TillNumber, StaffID)
    Staff(StaffID, StaffName, StaffSalary, StaffPosition)
    Cashier(TillNumber, TillBuyDate)
    OrderDetail(OrderNumber, Weight, ProductID)
    Product(ProductID, ProductName, ProductPrice)
```

Tidak cukup hanya di situ, kita harus menormalisasi sampai ke akar-akarnya, sebagai contoh, StaffPosition masih bisa kita pindahkan, Jadi Pada akhirnya desainnya akan menjadi
```
    OrderHeader(OrderNumber, Date, Time, TillNumber, StaffID)
    Staff(StaffID, StaffName, StaffSalary, StaffPositionID)
    StaffPosition(StaffPositionID, StaffPositionName)
    Cashier(TillNumber, TillBuyDate)
    OrderDetail(OrderNumber, Weight, ProductID)
    Product(ProductID, ProductName, ProductPrice)
```