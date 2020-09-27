
--1.soru
/*CREATE TABLE Kisi
( 
    tcno VARCHAR2(11) NOT NULL,
    ad_soyad VARCHAR2(50) NOT NULL,
    adres VARCHAR2(50),
    CONSTRAINT KisiPK PRIMARY KEY (TCNo)
);

CREATE TABLE Araba(
    plaka VARCHAR2(10) NOT NULL,
    model VARCHAR2(20) NOT NULL,
    y�l NUMBER,
    marka VARCHAR2(50),
    CONSTRAINT ArabaPK PRIMARY KEY(plaka)
);

CREATE TABLE Kaza(
    kno VARCHAR2(10) NOT NULL,
    surucu_tc VARCHAR2(11) NOT NULL,
    hasar_mik VARCHAR2(20),
    tarih DATE DEFAULT (sysdate),
    CONSTRAINT KazaPK PRIMARY KEY (kno)
);

CREATE TABLE Sahip(
      sahip_tcno VARCHAR2(11) NOT NULL,
      sahip_arac_plaka VARCHAR2(10) NOT NULL,
      tarih DATE DEFAULT (sysdate),
      CONSTRAINT SahipPK PRIMARY KEY(sahip_tcno, sahip_arac_plaka),
      CONSTRAINT fk_sahip_tcno  FOREIGN KEY (sahip_tcno)  REFERENCES Kisi(tcno),
      CONSTRAINT fk_sahip_arac_plaka  FOREIGN KEY (sahip_arac_plaka)  REFERENCES Araba(plaka)

);

CREATE TABLE Kayit(
      kayit_arac_plaka VARCHAR2(11) NOT NULL,
      kayit_kno VARCHAR2(10) NOT NULL,
      tarih DATE DEFAULT (sysdate),
      CONSTRAINT KayitPK PRIMARY KEY(kayit_arac_plaka, kayit_kno),
      CONSTRAINT fk_kayit_arac_plaka  FOREIGN KEY (kayit_arac_plaka)  REFERENCES Araba(plaka),
      CONSTRAINT fk_kayit_kno  FOREIGN KEY (kayit_kno)  REFERENCES Kaza(kno)

);
*/

--2.soru
/* Kisi Tablosu Insert
INSERT INTO Kisi values(12345678912, 'Serdar KOCER', 'ISTANBUL');
INSERT INTO Kisi values(11111111111, 'Hakan KOCER', 'SAKARYA');
INSERT INTO Kisi values(22222222222, 'Aynur KOCER', 'KOCAELI');
INSERT INTO Kisi values(33333333333, 'Alaattin KOCER', 'KOCAELI');
INSERT INTO Kisi values(44444444444, 'Unzile KOCER', 'KOCAELI');
INSERT INTO Kisi values(55555555555, 'Busra KOCER', 'ISTANBUL');
INSERT INTO Kisi values(66666666666, 'Fatih KOCA', 'ISTANBUL');
INSERT INTO Kisi values(77777777777, 'Talha KARA', 'ISTANBUL');
INSERT INTO Kisi values(88888888888, 'BUKET OZER', 'SAMSUN');
INSERT INTO Kisi values(99999999999, 'EMRE TASCI', 'BALIKESIR');
*/
/* -- ARABA TABLOSU INSERT
INSERT INTO Araba values('34BVS359', '208', 2016, 'PEUGEOT');
INSERT INTO Araba values('10ABC123', 'i20', 2012, 'HYUNDAI');
INSERT INTO Araba values('34DDD344', 'FLUENCE', 2008, 'RENAULT');
INSERT INTO Araba values('34KCR101', 'RANGER', 2019, 'FORD');
INSERT INTO Araba values('34KCR102', 'FOCUS', 2018, 'FORD');
*/
/*  KAZA tablosu
INSERT INTO Kaza values('0000000001','99999999999','5000',SYSDATE - 10);
INSERT INTO Kaza values('0000000002','77777777777','1000',SYSDATE - 1);
INSERT INTO Kaza values('0000000003','12345678912','7200',SYSDATE );
*/

/* Sahip tablosu insert
INSERT INTO Sahip values('12345678912','34BVS359',TO_DATE('01/08/2018'));
INSERT INTO Sahip values('99999999999','10ABC123',TO_DATE('01/09/2018'));
INSERT INTO Sahip values('77777777777','34DDD344',TO_DATE('01/10/2018'));
INSERT INTO Sahip values('55555555555','34KCR101',TO_DATE('01/12/2019'));
INSERT INTO Sahip values('55555555555','34KCR102',TO_DATE('01/12/2018'));
*/
/* Kayit Tablosu insert
INSERT INTO Kayit values('34BVS359','0000000003',SYSDATE);
INSERT INTO Kayit values('34DDD344','0000000002',SYSDATE - 1);
INSERT INTO Kayit values('10ABC123','0000000001',SYSDATE - 10);
*/

/* DELETE-UPDATE islemleri
INSERT INTO Kisi values('78878878878', 'OZAN ZIPLAR', 'BALIKESIR');
INSERT INTO Kisi values('10101010101', 'SEFIK TEMEL', 'KARS');
INSERT INTO Kisi values('15995115915', 'NAZIM UTKU', 'TEKIRDAG');

UPDATE Kisi SET adres='ISTANBUL' WHERE tcno = '78878878878';
UPDATE Kisi SET adres='ISTANBUL' WHERE tcno = '10101010101';
UPDATE Kisi SET adres='ISTANBUL' WHERE tcno = '15995115915';

DELETE FROM Kisi WHERE tcno='10101010101' ;
DELETE FROM Kisi WHERE tcno='15995115915' ;
DELETE FROM Kisi WHERE tcno='78878878878' ;
*/
--3.soru
--3a --> Ki�inin �zerine kay�tl� arabalar�n t�m detaylar�n�,
--SELECT * FROM Araba a WHERE a.plaka IN (SELECT s.sah�p_arac_plaka FROM Sahip s WHERE s.sah�p_tcno = '12345678912');
--SELECT * FROM Kaza  WHERE kno IN (SELECT kay�t_kno FROM Kayit WHERE kay�t_arac_plaka IN (SELECT s.sah�p_arac_plaka FROM Sahip s WHERE s.sah�p_tcno = '12345678912'));
--SELECT * FROM Araba a,Kaza kaz WHERE  a.plaka IN (SELECT s.sah�p_arac_plaka FROM Sahip s WHERE s.sah�p_tcno = '12345678912') AND 
-- kaz.kno IN (SELECT kay�t_kno FROM Kayit WHERE  kayit.kay�t_arac_plaka != a.plaka  );

/*A�a��daki ikiside �al���yor.*/
/*SELECT * FROM Araba a 
INNER JOIN Sahip s ON s.sah�p_arac_plaka = a.plaka
INNER JOIN Kayit k ON k.kay�t_arac_plaka = s.sah�p_arac_plaka
RIGHT OUTER JOIN Kaza kaz ON kaz.kno = k.kay�t_kno WHERE s.sah�p_tcno = '55555555555';*/
--SELECT * FROM Araba a ,Sahip s ,Kayit k , Kaza kaz WHERE s.sah�p_arac_plaka = a.plaka  AND s.sah�p_tcno = '12345678912' AND k.kay�t_arac_plaka(+) = a.plaka AND kaz.kno(+) = k.kay�t_kno;

--3b --> Ki�inin �zerinde g�r�len kaza say�s� ve toplam hasar miktar�,
--SELECT nvl(SUM(kaz.hasar_m�k),0) ToplamHasarMiktari FROM Araba a ,Sahip s ,Kayit k , Kaza kaz WHERE s.sah�p_arac_plaka = a.plaka  AND s.sah�p_tcno = '55555555555' AND k.kay�t_arac_plaka(+) = a.plaka AND kaz.kno(+) = k.kay�t_kno;
--SELECT Count(*) KazaSayisi FROM Araba a ,Sahip s ,Kayit k , Kaza kaz WHERE s.sah�p_arac_plaka = a.plaka  AND s.sah�p_tcno = '12345678912' AND k.kay�t_arac_plaka = a.plaka AND kaz.kno = k.kay�t_kno;
--SELECT nvl(SUM(kaz.hasar_m�k),0) ToplamHasarMiktari FROM   Kaza kaz WHERE kaz.surucu_tc = '12345678912';
--SELECT Count(*) KazaSayisi FROM   Kaza kaz WHERE kaz.surucu_tc = '12345678912';
--SELECT  Count(*) KazaSayisi  ,nvl(SUM(kaz.hasar_m�k),0) ToplamHasarMiktari FROM   Kaza kaz WHERE kaz.surucu_tc = '12345678912';
--3c --> Ki�inin en b�y�k tutarl� kazay� hangi marka, model, plakal� ara�la yapt���n� ekrana yazd�ran sorgular� yaz�n�z.
--SELECT a.marka, a.model, a.plaka FROM Araba a, Kayit k  WHERE a.plaka = k.kay�t_arac_plaka AND k.kay�t_kno = (SELECT kaz.kno  FROM Kaza  kaz WHERE kaz.hasar_m�k = (SELECT MAX(kaz.hasar_m�k) FROM Kaza kaz2 WHERE kaz.surucu_tc = '12345678912'));

--4.Plakas� girilen bir arac�n durumunu ekrana yazd�ran sorguyu yaz�n�z (kaza adedi, ve toplam hasar).
--SELECT COUNT(*)KazaAdedi, SUM(Kaza.hasar_m�k) ToplamHasar FROM Kaza, Kayit Where kaza.kno = kayit.kay�t_kno AND kayit.kay�t_arac_plaka = '34BVS359';

