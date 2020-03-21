-- DDL -> DATA DEFINITION LANGUAGE

-- CONSTRAINT
	-- PRIMARY KEY -> NIK 
			-- 12345
			-- Ari Davis
			-- Jakarta
			-- A

	-- FOREIGN KEY
			-- Table Transaksi
					-- NIK
					-- Tanggal
					-- Tanggungan (Expense)
	-- UNIQUE	-- Data G boleh duplikat, 
	-- NOT NULL -- Datanya ga boleh kosong -> '' dengan null
 	-- CHECK	-> validasi di suatu attribut
						-- Nama harus > 5 char
						-- CHECK(LEN(Nama) > 5)

-- MENDEFINISIKAN DATABASE

CREATE DATABASE TokoCamera

-- MENDEFINISIKAN TABLE
-- ID Staff -> ST002
CREATE TABLE MsStaff(
	StaffId	CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(50),
	StaffDob DATE,
	StaffSalary INT
)

-- MENGGANTI DEFINISI TABLE
ALTER TABLE MsStaff 
ADD StaffPhone VARCHAR(25)

ALTER TABLE MsStaff DROP COLUMN
StaffPhone

ALTER TABLE MsStaff
ALTER COLUMN StaffName VARCHAR(50) NOT NULL

-- NAMA_CONSTRAINT CONSTRAINT
ALTER TABLE MsStaff ADD CONSTRAINT
StaffNameHarusUnik UNIQUE(StaffName)

-- MENGGUNAKAN CONSTRAINT CHECK
ALTER TABLE MsStaff ADD CONSTRAINT
CekNamaHarusPunyaSpasi CHECK(StaffName LIKE '% %')

-- STAFF ID HARUS [STXXX] DI MANA XXX ITU ADALAH ANGKA 3 DIGIT
ALTER TABLE MsStaff ADD CONSTRAINT
CekStaffIDHarusFormat CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]')


-- HAPUS CONSTRAINT
ALTER TABLE MsStaff DROP CONSTRAINT
StaffNameHarusUnik



-- MENGHAPUS TABLE
DROP TABLE MsStaff

-- MENGHAPUS DATABASE
DROP DATABASE TokoCamera