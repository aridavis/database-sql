# Transact SQL
Transact SQL adalah bahasa pemrograman yang dikembangkan dari SQL. Kita sudah coba sendiri, SQL itu adalah bahasa non-procedural yang berarti tidak memiliki alur seperti program pada umumnya tapi melalui Request dan Response.
Transact SQL ini dibuat supaya SQL kita bisa menjalankan program secara prosedural seperti Function, Prosedure, Looping, Selection dan sebagainya.

# PRINT
**PRINT** adalah sebuah sintaks yang cara kerjanya sama seperti **SELECT**, tapi perbedannya adalah jenis outputnya. Kalau SELECT dia menghasilkan output dalam bentuk tabel, sedangkan PRINT akan menghasilkan output dalam bentuk text/console. Contoh
```
    PRINT 'Hello World'
```

# Deklarasi Variable
Penamaan variable di Transact-SQL harus dimulai dari simbol @, untuk membuat sebuah variable kita menggunakan sintaks
```
    DECLARE @namaVariable tipe_data
```
dan untuk memasukkan nilainya, kita gunakan sintaks
```
    SELECT @namaVariable = value
```

Contoh: di sini kita akan membuat variable nama dan memasukkan valuenya, dan kita PRINT
```
    DECLARE @name VARCHAR(255)
    SELECT @name = 'Ari Davis'
    PRINT @name
```

Kita bisa juga membuat suatu variabel dari tabel. Tetapi by default hanya **Data Terakhir** yang diambil. Untuk mengePRINT semua datanya, kita harus menggunakan **CURSOR** yang akan kita pelajari nanti. Contoh me sebagai berikut
```
    DECLARE @cameraName VARCHAR(255)
    SELECT @cameraName = CameraName, FROM MsCamera
    PRINT 'Nama Kamera: ' + @cameraName
```

# IF
**IF** sendiri adalah sintaks yang kita gunakan untuk melakuakan selection (condition). Sintaks dari **IF** adalah
```
    IF condition
        Statement
    IF condition
        Statement
    Else
        Statement
```
kita juga bisa menggunakan sintaks BEGIN dan END untuk menentukan awal dari statement dan akhirnya (kita bisa katakan sebagai kurawalnya)
```
    IF condition
        BEGIN
            Statement
            ...
        END
    ElSE
        ...
```

Contoh: kita memiliki suatu variabel, dan kita akan melakukan selection terhadap variabel itu
```
    DECLARE @x int
    SELECT @x = 10
    IF (@x < 10)
        PRINT CAST(@x AS VARCHAR) + ' lebih kecil dari 10'
    IF (@x > 10)
        PRINT CAST(@x AS VARCHAR) + ' lebih besar dari 10'
    ELSE
        PRINT CAST(@x AS VARCHAR) + ' adalah 10'
```

Kita juga bisa melakukan selection terhadap tabel, contohnya
```
    IF EXISTS (SELECT * FROM MsCamera)
        SELECT * FROM MsCamera
    ELSE
        PRINT 'KOSONG'
```

# CASE WHEN
**Case** adalah sintaks yang kita gunakan untuk membuat selection juga seperti **IF**, pada umumnya **CASE** di bahasa pemrogramman lainhanyua mengizinkan kondisinya dalam bentuk konstanta, tapi tidak di SQL. Kita bisa menaruh kondisi yang memiliki nilai True/False. **CASE WHEN** juga tidak bisa dijalankan seperti **IF** yang bisa langsung mengePRINT statement, **CASE WHEN** akan mengembalikan sebuah value dan harus ditampung oleh suatu variabel Sintaks dari **CASE WHEN** adalah:
```
    CASE 
        WHEN condition THEN
            statement
        WHEN condition THEN
            statement
        ELSE
            statement
    END
```
Kita gunakan contoh di atas, namun dalam versi **CASE WHEN**
```
    DECLARE @x int, @hasil varchar(255)
    SELECT @x = 10
	SELECT @hasil = 
    CASE
        WHEN @x < 10 THEN
         CAST(@x AS VARCHAR) + ' lebih kecil dari 10'
        WHEN @x > 10 THEN
             CAST(@x AS VARCHAR) + ' lebih besar dari 10'
        ELSE
             CAST(@x AS VARCHAR) + ' adalah 10'
    END
    print @hasil
```


# WHILE
Di dalam SQL, untuk melakukan loopingan, kita hanya bisa menggunakan sintaks **WHILE**. Sintaks dari **WHILE** adalah
```
    WHILE condition
        BEGIN
            Statement
        END
```

Contoh, kita akan mengeprint angka 1 sampai 10, tapi kita akan mengskip angka 6 dan berhenti di angka 8 saja dengan menggunakan sintaks **CONTINUE** dan **BREAK**
```
    DECLARE @i int
    SELECT @i = 1
    WHILE @i <= 10
        BEGIN
            IF @i = 6
                BEGIN
                    SELECT @i = @i + 1
                    CONTINUE
                END
           IF @i = 8
                BEGIN
                    BREAK	
                END
            PRINT @i
            SELECT @i = @i + 1
        END
```