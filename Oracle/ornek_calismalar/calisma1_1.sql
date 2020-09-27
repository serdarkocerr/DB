/*1. Soru*/
/*CREATE TABLE araba(
    plaka VARCHAR2(9) NOT NULL,
    model VARCHAR2(30) NOT NULL,
    yýl VARCHAR2(4),
    marka VARCHAR2(50),
    CONSTRAINT primaryKeyAraba PRIMARY KEY(plaka)
);

CREATE TABLE kisi
( 
    tc VARCHAR2(11) NOT NULL,
    ad VARCHAR2(30) NOT NULL,
    soyad VARCHAR2(30) NOT NULL,
    adres VARCHAR2(100),
    CONSTRAINT primaryKeyKisi PRIMARY KEY (tc)
);

CREATE TABLE kaza(
    kaza_no VARCHAR2(10) NOT NULL,
    surucu_tc VARCHAR2(11) NOT NULL,
    hasar_miktari VARCHAR2(20),
    tarih DATE ,
    CONSTRAINT primaryKeyKaza PRIMARY KEY (kaza_no)
);

CREATE TABLE kayit(
      plaka VARCHAR2(9) NOT NULL,
      kno VARCHAR2(20) NOT NULL,
      CONSTRAINT primariyKeyKayit PRIMARY KEY(plaka, kno),
      CONSTRAINT foreignKey_plaka  FOREIGN KEY (plaka)  REFERENCES araba(plaka),
      CONSTRAINT foreignKey_kno  FOREIGN KEY (kno)  REFERENCES kaza(kaza_no)

);
CREATE TABLE sahip(
      tc VARCHAR2(11) NOT NULL,
      arac_plaka VARCHAR2(10) NOT NULL,
      CONSTRAINT primaryKeySahip PRIMARY KEY(tc, arac_plaka),
      CONSTRAINT foreignKey_tc  FOREIGN KEY (tc)  REFERENCES Kisi(tc),
      CONSTRAINT foreignKey_aracPlaka  FOREIGN KEY (arac_plaka)  REFERENCES araba(plaka)

);

*/

/*2. Soru*/
/*
INSERT INTO araba values('01ADA111', 'A180', 2018, 'MERCEDES');
INSERT INTO araba values('34CCC123', '3.16', 2015, 'BMW');
INSERT INTO araba values('34RRR123', 'CLIO', 2012, 'RENAULT');
INSERT INTO araba values('34OZR587', 'EGEA', 2018, 'FIAT');
INSERT INTO araba values('54ABC122', 'ACCENT', 2005, 'HYUNDAI');

INSERT INTO Kaza values('1111111111','99999999999','5000',SYSDATE - 30);
INSERT INTO Kaza values('2222222222','01234567890','10000',TO_DATE('01/08/2017'));
INSERT INTO Kaza values('3333333333','88888888888','7200',SYSDATE-1 );

INSERT INTO kisi values('99999999999', 'Nil', 'KOCER', 'ISTANBUL');
INSERT INTO kisi values('01234567890', 'Buket','OZER', 'ADANA');
INSERT INTO kisi values('88888888888', 'Buse', 'OZER', 'ADANA');
INSERT INTO kisi values('14714714714', 'Serap' ,'OZER', 'ADANA');
INSERT INTO kisi values('36996336933', 'Ceyda' ,'AKTAS', 'ESKISEHIR');
INSERT INTO kisi values('55555555555', 'Hilal' ,'TERZI', 'ISTANBUL');
INSERT INTO kisi values('66666666666', 'Boran' ,'TERZI', 'ISTANBUL');
INSERT INTO kisi values('77777777777', 'IPEK' ,'OZ', 'ISTANBUL');
INSERT INTO kisi values('65656565656', 'NUR' ,'KARA', 'KAHRAMANMARAS');
INSERT INTO kisi values('84848484848', 'ALI', 'KURAL', 'YOZGAT');
INSERT INTO kisi values('78878878878', 'CEVAHIR', 'TEMEL', 'BALIKESIR');
INSERT INTO kisi values('10101010101', 'SEFIK' ,'OZAN', 'SAKARYA');
INSERT INTO kisi values('15995115915', 'TURGUT' ,'UTKU', 'YALOVA');


INSERT INTO Sahip values('99999999999','01ADA111');
INSERT INTO Sahip values('99999999999','34CCC123');
INSERT INTO Sahip values('01234567890','34RRR123');
INSERT INTO Sahip values('88888888888','34OZR587');
INSERT INTO Sahip values('14714714714','54ABC122');

INSERT INTO Kayit values('01ADA111','1111111111');
INSERT INTO Kayit values('34RRR123','2222222222');
INSERT INTO Kayit values('34OZR587','3333333333');

UPDATE Kisi SET adres='ADANA' WHERE tc = '78878878878';
UPDATE Kisi SET adres='GAZIANTEP' WHERE tc = '10101010101';
UPDATE Kisi SET adres='GIRESUN' WHERE tc = '15995115915';
DELETE FROM Kisi WHERE tc='78878878878' ;
DELETE FROM Kisi WHERE tc='10101010101' ;
DELETE FROM Kisi WHERE tc='15995115915' ;
*/


/*3. Soru  Bir kiþinin TCno’su girilince üzerine:*/
/*3a  Kiþinin üzerine kayýtlý arabalarýn tüm detaylarýný*/
/*
SELECT * FROM araba ar 
INNER JOIN sahip sa ON sa.arac_plaka = ar.plaka
LEFT OUTER JOIN kayit kay ON kay.plaka = sa.arac_plaka
LEFT OUTER JOIN kaza kaz ON kaz.kaza_no = kay.kno;
*/
/*3b Kiþinin üzerinde görülen kaza sayýsý ve toplam hasar miktarý*/
--SELECT  Count(*) KAZASAYISI  , nvl(SUM(k.hasar_mýktarý),0) TOPLAMHASAR FROM   kaza k WHERE k.surucu_tc = '99999999999';
/*3c Kiþinin en büyük tutarlý kazayý hangi marka, model, plakalý araçla yaptýðýný ekrana yazdýran sorgularý yazýnýz.*/
/*
SELECT ar.marka, ar.model,ar.plaka FROM araba ar 
WHERE ar.plaka = (SELECT kay.plaka FROM kayit kay
WHERE kay.kno =(SELECT kaz.kaza_no FROM kaza kaz WHERE kaz.hasar_mýktarý = 
(SELECT MAX(hasar_mýktarý) FROM kaza WHERE surucu_tc = '99999999999')));
*/
/*4. Soru Plakasý girilen bir aracýn durumunu ekrana yazdýran sorguyu yazýnýz (kaza adedi, ve toplam hasar).*/
SELECT COUNT(*)KAZAADEDI, SUM(kaz.hasar_mýktarý) TOPLAMHASAR FROM kaza kaz , kayit kay Where kaz.kaza_no = kay.kno AND kay.plaka = '01ADA111';
