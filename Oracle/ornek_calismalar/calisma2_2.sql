--1.Soru
/*
DECLARE 
 sube_var varchar2(4000);
 hesap_subesi_var VARCHAR2(4000);
 hesap_var VARCHAR2(4000);
 para_yatiran_var VARCHAR2(4000);
 mudi_var VARCHAR2(4000);
 
BEGIN

sube_var:='CREATE TABLE sube( 
    sube_adi VARCHAR2(50) NOT NULL,
    sube_sehir VARCHAR2(50),
    varlik INTEGER,
    CONSTRAINT SubePK PRIMARY KEY (sube_adi)
)';
EXECUTE IMMEDIATE sube_var;



hesap_var:='CREATE TABLE hesap( 
    hesap_no VARCHAR2(50) NOT NULL,
    balans INTEGER,
    CONSTRAINT HesapPK PRIMARY KEY (hesap_no)
)';
EXECUTE IMMEDIATE hesap_var;


mudi_var:='CREATE TABLE mudi( 
    tcno VARCHAR2(50) NOT NULL,
    mudi_sokak VARCHAR2(50),
    mudi_sehir VARCHAR2(50),
    CONSTRAINT MudiPK PRIMARY KEY (tcno)
)';
EXECUTE IMMEDIATE mudi_var;



hesap_subesi_var:='CREATE TABLE hesap_subesi( 
    hesap_no VARCHAR2(50),
    sube_adi VARCHAR2(50),
    CONSTRAINT HesapSubesiPK PRIMARY KEY(hesap_no, sube_adi),
    CONSTRAINT fk_hesap_no  FOREIGN KEY (hesap_no)  REFERENCES hesap(hesap_no),
    CONSTRAINT fk_sube_adi  FOREIGN KEY (sube_adi)  REFERENCES sube(sube_adi)
)';
EXECUTE IMMEDIATE hesap_subesi_var;


para_yatiran_var:='CREATE TABLE para_yatiran( 
    hesap_no VARCHAR2(50),
    tcno VARCHAR2(50),
    islem_tarihi DATE  DEFAULT (sysdate),
    miktar INTEGER,
    CONSTRAINT ParaYatiranPK PRIMARY KEY(hesap_no, tcno),
    CONSTRAINT fk_py_hesap_no  FOREIGN KEY (hesap_no)  REFERENCES hesap(hesap_no),
    CONSTRAINT fk_Py_tcnoi  FOREIGN KEY (tcno)  REFERENCES mudi(tcno)
)';
EXECUTE IMMEDIATE para_yatiran_var;
 

END;
 */
/*
DROP TABLE sube;
DROP TABLE hesap;
DROP TABLE mudi;
DROP TABLE hesap_subesi;
DROP TABLE para_yatiran;
*/


--2.Soru - Tablolara uygun veriler belirleyin ve bu verilerin giriþini yapan en az bir prosedür yazýnýz
/*
CREATE OR REPLACE PROCEDURE defaultverilerigir IS

BEGIN
DBMS_OUTPUT.PUT_LINE('defaultverilerigir - begin');

   INSERT INTO sube (sube_adi, sube_sehir, varlik) VALUES('Kartepe', 'Kocaeli', 9000);
   INSERT INTO sube (sube_adi, sube_sehir, varlik) VALUES('Pendik', 'Istanbul', 25000);
   
   INSERT INTO hesap (hesap_no, balans) VALUES('1', 1000);--1111 Kartepe
   INSERT INTO hesap (hesap_no, balans) VALUES('2', 5000);--9999 Pendik
   INSERT INTO hesap (hesap_no, balans) VALUES('3', 20000);--8888 Pendik
   INSERT INTO hesap (hesap_no, balans) VALUES('4', 8000);--9999 - Kartepe

   
   INSERT INTO mudi (tcno, mudi_sokak,mudi_sehir ) VALUES('11111111111', 'Emek','Kocaeli');
   INSERT INTO mudi (tcno, mudi_sokak,mudi_sehir ) VALUES('99999999999', 'Cinardere','Istanbul');
   INSERT INTO mudi (tcno, mudi_sokak,mudi_sehir ) VALUES('88888888888', 'Kurtkoy','Istanbul');

   INSERT INTO hesap_subesi (hesap_no, sube_adi ) VALUES('1', 'Kartepe');
   INSERT INTO hesap_subesi (hesap_no, sube_adi ) VALUES('2', 'Pendik');
   INSERT INTO hesap_subesi (hesap_no, sube_adi ) VALUES('3', 'Pendik');
   INSERT INTO hesap_subesi (hesap_no, sube_adi ) VALUES('4', 'Kartepe');


   INSERT INTO para_yatiran (hesap_no, tcno,  islem_tarihi, miktar ) VALUES('1', '11111111111', SYSDATE -10, 300);
   INSERT INTO para_yatiran (hesap_no, tcno,  islem_tarihi, miktar) VALUES('2', '99999999999',  SYSDATE -8, 2000);
   INSERT INTO para_yatiran (hesap_no, tcno,  islem_tarihi, miktar) VALUES('4', '99999999999',  SYSDATE -9, 6000);
   INSERT INTO para_yatiran (hesap_no, tcno,  islem_tarihi, miktar) VALUES('3', '88888888888',  SYSDATE -1, 3000);

DBMS_OUTPUT.PUT_LINE('defaultverilerigir - end');


END;

BEGIN
    defaultverilerigir();
END;
*/

--3 Bir kiþinin TCno’su girilince üzerine:
--a. Kiþinin üzerine kayýtlý hesaplarýn tüm detaylarýný (hangi þubede ve balans deðerini) geri döndüren prosedürü yazýnýz
/*
DECLARE
subeadi sube.sube_adý%TYPE;
balans  hesap.balans%TYPE;
BEGIN
    KAYÝTLÝHESAPDEAYLAR('11111111111',subeadi,balans);
    DBMS_OUTPUT.PUT_LINE('subeAdi: ' || subeadi);
    DBMS_OUTPUT.PUT_LINE('balans: ' || balans);

    DBMS_OUTPUT.PUT_LINE('*********************');

    KAYÝTLÝHESAPDEAYLAR('99999999999',subeadi,balans);
    DBMS_OUTPUT.PUT_LINE('subeAdi: ' || subeadi);
    DBMS_OUTPUT.PUT_LINE('balans: ' || balans);
    
END;
*/

--b. Kiþinin en son ne zaman para yatýrdýðýný geri döndüren fonksiyonu yazýnýz.
/*
DECLARE
tc_no mudý.tcno%TYPE;
tarih DATE;
BEGIN
    tc_no := '99999999999';
    tarih:= NEZAMANPARAYATIRDI(tc_no);
    DBMS_OUTPUT.PUT_LINE('tarih= ' || tarih  );

END;
*/

--c.Varlýklarý en yüksek olan þubeyi bulan fonksiyonu yazýnýz. Varlýklar þubedeki hesaplarýn toplamýdýr.
-- Bu soru kiþinin TC 'si girilince, en yüksek varlýga sahip oldugu subeyi dönecek sekilde yapýldý.(Bir þubedeki varlýgý ise o subedeki hesaplarýnýn toplamýdýr)
/*
DECLARE
 subeadi sube.sube_adý%TYPE;
 tc_no mudý.tcno%TYPE;
BEGIN
 tc_no := '99999999999';

 subeadi := ENYUKSEKVARLIKSUBE(tc_no);
 DBMS_OUTPUT.PUT_LINE('subeadi= ' || subeadi  );

END;

*/
--4. Hesaba para yatýrýldýðýnda hesaptaki eski miktarý ve hesabýn son halini ekrana yazdýran trigger’ý yazýnýz
/*
BEGIN
UPDATE hesap SET balans = 5000 WHERE hesap_no='1'; 
END;
*/

