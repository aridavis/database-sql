# Stored Procedure
**Stored Procedure** adalah sebuah fitur dari SQL yang memperbolehkan user untuk menjalankan perintah SQL tanpa tahu apa aja di dalamnya. Kita bisa katakan **Stored Procedure** adalah sebuah **Function**, namun kedua hal tersebut berbeda. **Function** harus mengembalikan sebuah return value sedangkan **Stored Procedure** tidak. Supaya lebih mudah dimengerti, **Stored Procedure** itu seperti *void namaFunction(){ }* sedangkan **Function** seperti *int namaFunction(){ }*

salah satu contoh dari stored-procedure yang pernah kita gunakan adalah:
```
    EXEC sp_MSforeachtable 'select * from ?'
```
**sp_MSforeachtable** adalah salah satu contoh prosedur bawaan SQL Server yang digunakan untuk melakukan iterasi ke semua tabel yang ada di database.

# Cara Membuat
Untuk membuat stored procedure, kita gunakan sintaks di bawah.
```
    CREATE PROCEDURE nama_procedure
    AS
        <Transact-SQL>
    RETURN
```

Contoh, kita akan membuat sebuah stored procedure yang memiliki fungsi untuk menampilkan data MsCustomer
```
    CREATE PROCEDURE select_all_customers
    AS
        SELECT * FROM MsCustomer
    RETURN
```
dan sekarang kita coba jalankan dengan menggunakan sintaks **EXEC** yang berarti **Execute**
```
    EXEC select_all_customers
```

# Parameter Stored Procedure
Kita bisa memasukkan parameter ke dalam suatu procedure, dan sintaksnya akan menjadi
```
    CREATE PROCEDURE nama_procedure(@var1 tipedata, @var2 tipedata, ...)
    AS
        <Transact-SQL>
    RETURN
```
dan untuk menjalankannya kita hanya perlu mengetikkan parameternya setelah nama_procedure
```
    EXEC nama_procedure 'x', 20, ..
```

 kita langsung contohkan saja.
Contoh: membuat sebuah procedure yang mengoutputkan data Customer dengan nama yang diinput oleh user
```
    CREATE PROCEDURE select_customer(@name varchar(255))
    AS
        SELECT * FROM MsCustomer
        WHERE CustomerName LIKE '%' + @name + '%'
    RETURN
```

dan untuk menjalankannya kita menggunakan sintaks
```
    EXEC select_customer 'rafael'
```

# Rename Stored-Procedure
Untuk melakuakn rename terhadap suatu procedure, kita harus menggunakan sintaks **SP_RENAME**
Contoh, kita ingin mengganti nama procedure yang sudah kita buat yaitu **select_customer** menjadi **sp_find_customer**
```
    SP_RENAME 'select_customer', 'sp_find_customer'
```

# Melihat isi Stored-Procedure
Untuk melihat isi dari Stored-Procedure, kita gunakan sintaks **SP_HELPTEXT**
Contoh, kita ingin melihat isi **sp_find_customer**
```
    SP_HELPTEXT 'sp_find_customer'
```

# Update Stored-Procedure
Caranya sama seperti mengupdate sebuah table, tapi sintaksnya menjadi
```
    ALTER PROCEDURE nama_procedure
    AS
        <transact-SQL>
    END
```

# Delete Stored-Procedure
Caranya juga sama seperti DROP sebuah table, tapi sintaksnya menjadi
```
    DROP PROCEDURE nama_procedure
```