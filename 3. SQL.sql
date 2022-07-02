USE Prodaja
GO


SELECT COUNT (Ime) AS [Broj kupaca] FROM Kupci WHERE Grad = 'Podgorica'


SELECT MAX (CijenaJedinice) FROM Proizvodi

SELECT ImeProizvoda, CijenaJedinice FROM Proizvodi
WHERE CijenaJedinice = (SELECT Max (CijenaJedinice) FROM Proizvodi)


SELECT SUM (Kolicina) AS [Prodata kolicina] FROM DetaljiPorudzbine
WHERE UPC = 'P102'


SELECT Proizvodi.ImeProizvoda AS Proizvod, SUM (DetaljiPorudzbine.Kolicina) AS [Prodata kolicina] FROM Proizvodi
INNER JOIN DetaljiPorudzbine ON Proizvodi.UPC = DetaljiPorudzbine.UPC
GROUP BY Proizvodi.ImeProizvoda
ORDER BY [Prodata kolicina] DESC


SELECT p.ImeProizvoda AS Proizvod, SUM (dp.Kolicina) AS [Prodata kol] FROM Proizvodi p
INNER JOIN DetaljiPorudzbine dp ON p.UPC = dp.UPC
GROUP BY p.ImeProizvoda
HAVING SUM (dp.Kolicina) > 2
ORDER BY [Prodata kol] DESC

SELECT p.[ImeProizvoda], AVG (dp.[Kolicina]) AS [Prosjecna kol.] FROM Proizvodi p
INNER JOIN [DetaljiPorudzbine] dp ON p.[UPC] = dp.[UPC]
GROUP BY p.[ImeProizvoda]
HAVING p.[ImeProizvoda] = 'Sony Vaio laptop VGN-FW11E'


SELECT p.[ImeProizvoda], AVG (dp.[Kolicina]) AS [Prosjecna kol.] FROM Proizvodi p
INNER JOIN [DetaljiPorudzbine] dp ON p.[UPC] = dp.[UPC]
WHERE p.ImeProizvoda = 'Sony Vaio laptop VGN-FW11E'
GROUP BY p.[ImeProizvoda]

SELECT p.[ImeProizvoda], AVG (dp.[Kolicina]) AS [Prosjecna kol.] FROM Proizvodi p
INNER JOIN [DetaljiPorudzbine] dp ON p.[UPC] = dp.[UPC]
GROUP BY p.[ImeProizvoda]
HAVING AVG (dp.[Kolicina]) > 1


SELECT p.[ImeProizvoda], AVG (CAST (dp.[Kolicina] AS DECIMAL(8,2))) AS [Prosjecna kol.] FROM Proizvodi p
INNER JOIN [DetaljiPorudzbine] dp ON p.[UPC] = dp.[UPC]
GROUP BY p.[ImeProizvoda]
HAVING AVG (CAST (dp.[Kolicina] AS DECIMAL(8,2))) > 1

SELECT DISTINCT Proizvodi.ImeProizvoda, DetaljiPorudzbine.UPC FROM DetaljiPorudzbine
RIGHT JOIN Proizvodi ON DetaljiPorudzbine.UPC = Proizvodi.UPC
WHERE DetaljiPorudzbine.UPC IS NULL

SELECT k.Ime, p.DatumPorudzbine, pr.ImeProizvoda FROM Kupci K
INNER JOIN Porudzbine p ON K.KupacID = P.KupacID
INNER JOIN DetaljiPorudzbine dp ON p.PorudzbinaID = dp.PorudzbinaID
INNER JOIN Proizvodi pr ON dp.UPC = pr.UPC
WHERE  k.Ime = 'Marko Markovic'
ORDER BY p.DatumPorudzbine DESC

select Proizvodi.ImeProizvoda, Proizvodi.CijenaJedinice, sum (DetaljiPorudzbine.Kolicina) as Kolicina from Proizvodi
inner join DetaljiPorudzbine on Proizvodi.UPC = DetaljiPorudzbine.UPC
where Proizvodi.UPC = 'P100' or Proizvodi.UPC = 'P103'
group by Proizvodi.ImeProizvoda, Proizvodi.CijenaJedinice
having sum (DetaljiPorudzbine.Kolicina) > 2
order by Kolicina desc

CREATE TABLE Klijenti
(
klijentID int PRIMARY KEY NOT NULL,
ime varchar (25) NOT NULL,
adresa varchar (25) NOT NULL,
grad varchar (25) NOT NULL
)

CREATE TABLE Rentiranje
(
sifraRezervacije int PRIMARY KEY NOT NULL,
regBroj varchar (15) NOT NULL,
klijentID int NOT NULL,
datumOd date NOT NULL,
datumDo date NOT NULL
)

CREATE TABLE Automobili
(
regBroj varchar (15) PRIMARY KEY NOT NULL,
nazivModela varchar (25) NOT NULL,
datumReg date NOT NULL,
godProizvodnje date NOT NULL,
boja varchar (10)
)

CREATE TABLE Modeli
(
nazivModela varchar (25) PRIMARY KEY NOT NULL,
proizvodjac varchar (25) NOT NULL,
motor varchar (15)
)

CREATE TABLE Proizvodjaci
(
proizvodjac varchar (25) PRIMARY KEY NOT NULL,
drzava varchar (25)
)

CREATE TABLE Servisi
(
serviser varchar (25) PRIMARY KEY NOT NULL,
adresa varchar (25),
grad varchar (25)
)

CREATE TABLE Racuni
(
brRacuna int PRIMARY KEY NOT NULL,
serviser varchar (25) NOT NULL,
datumServisa date NOT NULL,
servis varchar (50) NOT NULL,
cijena money
)

CREATE TABLE Servisiranje
(
brRacuna int NOT NULL,
regBroj varchar (15) NOT NULL

CONSTRAINT Servisiranje_PK PRIMARY KEY (brRacuna, regBroj)



