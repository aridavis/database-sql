CREATE DATABASE TokoCamera

GO
USE TokoCamera
GO

CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(255),
	StaffEmail VARCHAR(255),
	StaffSalary INT,
	StaffDob DATE
)

CREATE TABLE MsCustomer(
	CustomerId CHAR(5) PRIMARY  KEY CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(255),
	CustomerEmail VARCHAR(255),
	CustomerDob DATE
)

CREATE TABLE MsManufacturer(
	ManufacturerId INT PRIMARY KEY,
	ManufacturerName VARCHAR(255)
)

CREATE TABLE MsCamera(
	CameraId CHAR(5) PRIMARY KEY CHECK(CameraId LIKE 'CA[0-9][0-9][0-9]'),
	CameraName VARCHAR(255),
	ManufacturerId INT FOREIGN KEY REFERENCES MsManufacturer(ManufacturerId) ON DELETE CASCADE ON UPDATE CASCADE,
	CameraPrice INT
)

CREATE TABLE TransactionHeader(
	TransactionId CHAR(5) PRIMARY KEY CHECK(TransactionId LIKE 'TR[0-9][0-9][0-9]'),
	TransactionDate DATE,
	StaffId CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffId) ON DELETE CASCADE ON UPDATE CASCADE,
	CustomerId CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerId) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE TransactionDetail(
	TransactionId CHAR(5) FOREIGN KEY REFERENCES TransactionHeader(TransactionId) ON DELETE CASCADE ON UPDATE CASCADE,
	CameraId CHAR(5) FOREIGN KEY REFERENCES MsCamera(CameraId) ON DELETE CASCADE ON UPDATE CASCADE,
	Quantity INT
)

INSERT INTO MsStaff VALUES
('ST001', 'Alicia', 'alicia@alicia.com', '5500000', '1998-12-22'),
('ST002', 'Angelia Salim', 'angelia@salim.com', '3600000', '1999-05-30'),
('ST003', 'Ari Davis', 'ari@davis.com', '6900000', '2000-11-23'),
('ST004', 'Audrey Chen', 'audrey@chen.com', '9300000', '1999-08-14'),
('ST005', 'Aviel Leonardo Wijaya', 'aviel@wijaya.com', '7200000', '2001-12-15'),
('ST006', 'Benedictus Danielle', 'benedictus@danielle.com', '9500000', '1998-02-02'),
('ST007', 'Calvin Antonius', 'calvin@antonius.com', '5100000', '1998-02-22'),
('ST008', 'Carl Ludwi Hendiarta', 'carl@hendiarta.com', '4000000', '2001-12-06'),
('ST009', 'Christina Yuanita', 'christina@yuanita.com', '5300000', '1998-10-24'),
('ST010', 'Devinca Limto', 'devinca@limto.com', '5300000', '1999-12-11'),
('ST011', 'Edwin Farrel Juniawan', 'edwin@juniawan.com', '6300000', '2000-08-23'),
('ST012', 'Eliora Dharmajayanti', 'eliora@dharmajayanti.com', '8000000', '1998-01-14'),
('ST013', 'Frandi Rianto', 'frandi@rianto.com', '5200000', '2000-11-17'),
('ST014', 'Gerry Lukman', 'gerry@lukman.com', '9600000', '2001-03-03'),
('ST015', 'Hanson Robertus', 'hanson@robertus.com', '4600000', '1999-04-07'),
('ST016', 'Ivan Rivaldi', 'ivan@rivaldi.com', '4000000', '1999-04-01'),
('ST017', 'Joko Sentosa Chandra', 'joko@chandra.com', '6600000', '1998-03-13'),
('ST018', 'Junaedi Dede', 'junaedi@dede.com', '6000000', '2000-08-03')


INSERT INTO MsCustomer VALUES
('CU001', 'Kevin Bachtiar Santoso', 'kevin@santoso.com', '2001-09-22'),
('CU002', 'Kevin Orlando Sutanto', 'kevin@sutanto.com', '1999-10-07'),
('CU003', 'Muhamad Zaenul Hasan Basri', 'muhamad@basri.com', '2000-09-16'),
('CU004', 'Muhammad At Thariq Filardi', 'muhammad@filardi.com', '2001-07-14'),
('CU005', 'Muhammad Daffa Mennawi', 'muhammad@mennawi.com', '2000-06-08'),
('CU006', 'Nicky Hendrik Sen', 'nicky@sen.com', '1998-11-16'),
('CU007', 'Rafael Jonathan Patrick Tjoa', 'rafael@tjoa.com', '1999-01-24'),
('CU008', 'Reinardus Ronaldo Raharja', 'reinardus@raharja.com', '2000-01-18'),
('CU009', 'Reiven Candra Hamid', 'reiven@hamid.com', '2001-03-17'),
('CU010', 'Steven Leonardi', 'steven@leonardi.com', '2001-03-12'),
('CU011', 'Teodorus Nathaniel Kurniawan', 'teodorus@kurniawan.com', '1998-12-31'),
('CU012', 'Wahyu', 'wahyu@wahyu.com', '1998-06-18'),
('CU013', 'William Rusdyputra', 'william@rusdyputra.com', '2001-03-11'),
('CU014', 'Winner Pranata', 'winner@pranata.com', '2000-12-26'),
('CU015', 'Yohanes Paulus Setiawan Budihardja', 'yohanes@budihardja.com', '1999-03-26')

INSERT INTO MsManufacturer VALUES
(1, 'Nikon'),
(2, 'Canon'),
(3, 'Sony'),
(4, 'Pentax'),
(5, 'Fujifilm')

INSERT INTO MsCamera VALUES
('CA001', 'D5', '1', '41000'),
('CA002', 'D4', '1', '26000'),
('CA003', 'D810', '1', '4000'),
('CA004', 'D500', '1', '14000'),
('CA005', '1DX Mk iii', '2', '32000'),
('CA006', '5D Mk iv', '2', '7000'),
('CA007', '7D', '2', '34000'),
('CA008', '700D', '2', '59000'),
('CA009', 'A7Sii', '3', '45000'),
('CA010', 'A7Rii', '3', '12000'),
('CA011', 'A7', '3', '11000'),
('CA012', 'A5000', '3', '3000'),
('CA013', 'K-5', '4', '44000'),
('CA014', 'K-01', '4', '6000'),
('CA015', 'KP', '4', '58000'),
('CA016', '645Z', '4', '16000'),
('CA017', 'X-H1', '5', '55000'),
('CA018', 'X-Pro3', '5', '49000'),
('CA019', 'X-T4', '5', '56000'),
('CA020', 'X-T3', '5', '59000')


INSERT INTO TransactionHeader VALUES
('TR001', '2018-02-06', 'ST006', 'CU009'),
('TR002', '2018-02-23', 'ST006', 'CU003'),
('TR003', '2018-06-29', 'ST013', 'CU004'),
('TR004', '2018-08-08', 'ST011', 'CU008'),
('TR005', '2018-09-11', 'ST007', 'CU004'),
('TR006', '2018-09-21', 'ST007', 'CU011'),
('TR007', '2018-10-16', 'ST004', 'CU006'),
('TR008', '2018-12-04', 'ST016', 'CU012'),
('TR009', '2018-12-28', 'ST010', 'CU014'),
('TR010', '2018-12-29', 'ST004', 'CU013'),
('TR011', '2019-01-19', 'ST011', 'CU015'),
('TR012', '2019-06-05', 'ST010', 'CU015'),
('TR013', '2019-08-22', 'ST005', 'CU003'),
('TR014', '2019-10-12', 'ST016', 'CU006'),
('TR015', '2019-10-17', 'ST013', 'CU011'),
('TR016', '2020-01-15', 'ST006', 'CU001'),
('TR017', '2020-02-07', 'ST011', 'CU015'),
('TR018', '2020-02-10', 'ST004', 'CU004'),
('TR019', '2020-02-16', 'ST007', 'CU010'),
('TR020', '2020-02-25', 'ST005', 'CU006')

INSERT INTO TransactionDetail VALUES
('TR010', 'CA014', '2'),
('TR005', 'CA017', '2'),
('TR007', 'CA010', '2'),
('TR010', 'CA003', '2'),
('TR003', 'CA017', '1'),
('TR004', 'CA017', '2'),
('TR008', 'CA017', '1'),
('TR005', 'CA009', '1'),
('TR001', 'CA012', '1'),
('TR003', 'CA014', '2'),
('TR008', 'CA003', '2'),
('TR009', 'CA019', '2'),
('TR002', 'CA003', '2'),
('TR009', 'CA015', '1'),
('TR008', 'CA007', '2'),
('TR002', 'CA003', '2'),
('TR006', 'CA010', '2'),
('TR001', 'CA014', '2'),
('TR008', 'CA013', '1'),
('TR010', 'CA009', '1')