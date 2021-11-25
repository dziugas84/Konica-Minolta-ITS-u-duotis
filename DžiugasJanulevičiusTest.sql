--variantas 1: Sukurti DB ir vien� lentel� joje, sukurti reikiamus stulpelius ir � juos importuoti reikiamus duomenis

-- 1.Duomen� baz�s suk�rimas
CREATE DATABASE testDB;

-- 2.Prid�dama lentele vartotojai "Users" su atitinkamais atributais
CREATE TABLE Users (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Pirkejas VARCHAR(15),
	DokumentoSerija VARCHAR(15),
	DokumentoNr int,
	SumaSuPVM FLOAT,
	);

-- 3.Lentel� papildoma papildomu atributu vieta, kuriame bus saugomas archyvo failo kelias
ALTER TABLE Users
ADD Vieta VARCHAR(max)

-- 4.�keliami �ra�ai i� pdf failo � lentel� "Users"
/*BULK INSERT Users 
FROM 'C:\Test\Archyvas\2020\2\26\HEMI LOGISTICS UAB\LOGISTICS UAB_HEMI_105_333.30_2020-02-26.pdf'
WITH 
(
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)*/
-- Nepavyko nuskaityti duomen� i� pdf failo

-- 5.�keliamas �ra�as kurioje vietoje saugomas archyvo failas
BULK INSERT Users 
FROM 'C:\Test\Archyvas\path.txt'
WITH 
(
FIRSTROW = 1,
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
