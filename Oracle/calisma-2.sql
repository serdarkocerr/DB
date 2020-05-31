---Hafta 10 ---
/*--SET SERVEROUTPUT ON;
--CLERK'lere %15 zam veren
--FOR UPDATE --> se�ilen sat�r� lock eder ve update yapaca��n� s�yler. 
-- WHERE CURRENT OF --> �uandaki cursor bilgisini ifade eder.
DECLARE
  CURSOR zam_curr IS SELECT empno,name FROM employee WHERE job = 'CLERK' FOR UPDATE;
  satir zam_curr%ROWTYPE;
BEGIN
    OPEN zam_curr;
    LOOP
    FETCH zam_curr INTO satir ;
    EXIT WHEN zam_curr%NOTFOUND;

    UPDATE employee SET salary = salary * 1.15 WHERE CURRENT OF zam_curr;
    DBMS_OUTPUT.PUT_LINE(satir.name );
    END LOOP;
    CLOSE zam_curr;
END;
*/

/*Cursor'a parametre gecme*/

/*create or replace NONEDITIONABLE PROCEDURE zam(mes VARCHAR2) IS
  CURSOR zam_curr(mes employee.job%TYPE) IS SELECT empno,name FROM employee WHERE job = mes FOR UPDATE;
  satir zam_curr%ROWTYPE;
BEGIN
    OPEN zam_curr(mes);--& ile bilgiyi kullan�c�dan al�r�z.
    LOOP
    FETCH zam_curr INTO satir ;
    EXIT WHEN zam_curr%NOTFOUND;

    UPDATE employee SET salary = salary * 1.15 WHERE CURRENT OF zam_curr;
    DBMS_OUTPUT.PUT_LINE(satir.name );
    END LOOP;
    CLOSE zam_curr;
END;
CALL ZAM('SALESMAN');
**/

/*
create or replace PROCEDURE zam1(mes IN VARCHAR2, zam_orani IN NUMBER, adet OUT NUMBER) IS
  CURSOR zam_curr(mes employee.job%TYPE) IS SELECT empno,name FROM employee WHERE job = mes FOR UPDATE;
  satir zam_curr%ROWTYPE;
  --sayac  NUMBER := 0;
BEGIN
    OPEN zam_curr(mes);--& ile bilgiyi kullan�c�dan al�r�z.
    adet := 0;
    LOOP
    FETCH zam_curr INTO satir ;
    EXIT WHEN zam_curr%NOTFOUND;
    adet:= adet + 1;
    UPDATE employee SET salary = salary *  (1 + zam_orani) WHERE CURRENT OF zam_curr;
    DBMS_OUTPUT.PUT_LINE(satir.name );
    END LOOP;
    CLOSE zam_curr;
END;


DECLARE
sayac NUMBER;
BEGIN
 ZAM1('MANAGER',1,sayac);
 DBMS_OUTPUT.PUT_LINE('SAYAC = ' ||sayac);
END;

*/

/*--CALISMADI BU!!!
CREATE OR REPLACE PROCEDURE pro1(uid IN employee.empno%TYPE, 
                                 isim OUT employee.name%TYPE,
                                 meslek OUT employee.job%TYPE,
                                 dep OUT employee.deptno%TYPE) IS
                            CURSOR emp_info (pno employee.empno%TYPE) IS  SELECT name,job,deptno FROM employee WHERE employee.empno = uid;
                          tmp_data emp_info%ROWTYPE;
BEGIN
    OPEN emp_info(uid);
    
    FETCH emp_info INTO tmp_data;
    CLOSE emp_info;
    isim := tmp_data.name;
    meslek := tmp_data.job;
    dep := tmp_data.deptno;
END;

DECLARE
isim employee.name%TYPE;
 meslek  employee.job%TYPE;
 dep  employee.deptno%TYPE;
BEGIN
    PRO1(7782,isim,meslek,dep);
    DBMS_OUTPUT.PUT_LINE('ISIM =' || isim);
    DBMS_OUTPUT.PUT_LINE('MESLEK =' || meslek);
    DBMS_OUTPUT.PUT_LINE('DEPARTMAN =' || dep);

END;
*/

/*Hafta 11 - ek ders */
--TRIGGERS -> triggeers sag tik -> new Trigger -> Base Obecjt EMPLOYEE -> Timing: before,update
-- eger kolona gore tetiklenecekse kolon secilir ve -> Tamam  ile bir trigger olusuturulur. Olusturulan 
-- Triggera gerekli islemleri yaz�ld�ktan sonra Compile edilir.
-- Herhangi bir  trigger tetiklenince , bu trigger logs tablosuna loglar� yazacak.
/*CREATE TABLE logs (
      audit_id         NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
      table_name       VARCHAR2(255),
      transaction_name VARCHAR2(10),
      by_user          VARCHAR2(30),
      transaction_date DATE
);
*/

/*
--EMPLOYEE tablosunda bir update veya delete oldugunda once bu trigger calisacak.
-- logs tablosuna EMPLOYEE tablosunun update veya delete islemi oldugunu yazacak.
CREATE OR REPLACE TRIGGER EMP_TRG 
BEFORE UPDATE OR DELETE ON EMPLOYEE 
DECLARE
 msg VARCHAR2(10);
BEGIN
  msg:=CASE
    WHEN UPDATING THEN 'UPDATE'
    WHEN DELETING THEN 'DELETE'
    END;  
  
    -- insert a row into the logs   
   INSERT INTO logs (table_name, transaction_name, by_user, transaction_date)
   VALUES('EMPLOYEE', msg, USER, SYSDATE);
END;
--Update edilince LOGS tablosunda log tutuldu .Yani trigger tetiklendi.
--UPDATE employee SET salary  = 1000 WHERE empno=15;
--DELETE FROM employee WHERE empno =15;
*/

/**OLD  - NEW kullanimi**/

/*
-- FOR EACH ROW ifadesi herhangi bir row update edildiginde manas�ndad�r.
-- OF SALARY ifadeside Salary kolonunda bir update 'ten once tetiklenecegini soyler.

CREATE OR REPLACE TRIGGER TR2 
BEFORE UPDATE OF SALARY ON EMPLOYEE 
FOR EACH ROW
BEGIN
  --old ve new ifadeleri tablo bazinda degil satir bazinda olur.
  --bu sebepten FOR EACH ROW ifadesi koyulmalidir ki her row icin manasindadir.
  DBMS_OUTPUT.PUT_LINE('SALARY GUNCELLEME:' || :old.salary || 'Yeni SALARY :'||:new.salary );
END;

--SET SERVEROUTPUT ON;
--UPDATE employee SET SALARY = 805 WHERE name = 'SMITH';
*/

/*
CREATE OR REPLACE TRIGGER TR3 
AFTER UPDATE OF SALARY ON EMPLOYEE 
FOR EACH ROW
DECLARE
 limit EMPLOYEE.SALARY%TYPE;
 sal_old EMPLOYEE.SALARY%TYPE; 
 sal_new EMPLOYEE.SALARY%TYPE; 

BEGIN

    sal_old:= :old.salary;
    sal_new:= :new.salary;
    limit:=1.20*sal_old;
    IF sal_new>limit
    THEN 
    --hata raporu veriyor ekrana ve update komutu calismaz.
     RAISE_APPLICATION_ERROR(-20225, 'MAAS ARTIS SINIRI ASTI');
   --  UPDATE employee SET salary = sal_old WHERE sal_new>limit;
   ELSE
   
       DBMS_OUTPUT.PUT_LINE('ARTIS ORANI ASILMADI =' || :new.salary);
    END IF;

END;

UPDATE employee SET SALARY = 900 WHERE name = 'SMITH';
UPDATE employee SET SALARY = 1300 WHERE name = 'SMITH';
*/


/*KOSULLU TRIGGER*/

/*
CREATE OR REPLACE TRIGGER TR4 
BEFORE UPDATE OF SALARY ON EMPLOYEE 
FOR EACH ROW
-- When icinde new old kullan�yorsak : koymam�za gerek yok.
WHEN(new.salary > old.salary*1.20)
BEGIN
  -- yeni degere eski degeri atayabiliyoruz. Bu sekilde update islemi eski kal�r.
 :new.salary := :old.salary;
 
END;
UPDATE employee SET SALARY = 1000 WHERE name = 'SMITH';
UPDATE employee SET SALARY = 900 WHERE name = 'SMITH';

*/
---�DEV SERDAR---
--1.Soru

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
 
 --2.Soru - Tablolara uygun veriler belirleyin ve bu verilerin giri�ini yapan en az bir prosed�r yaz�n�z

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

--3 Bir ki�inin TCno�su girilince �zerine:
--a. Ki�inin �zerine kay�tl� hesaplar�n t�m detaylar�n� (hangi �ubede ve balans de�erini) geri d�nd�ren prosed�r� yaz�n�z

create or replace  PROCEDURE KAY�TL�HESAPDEAYLAR 
(
 tc_no IN mud�.tcno%TYPE, 
 subeadi OUT sube.sube_ad�%TYPE, 
 balans OUT hesap.balans%TYPE 
) AS 
CURSOR kisidetaylari(tc_no  mud�.tcno%TYPE) IS 
SELECT hesap.balans, sube.sube_ad� FROM sube INNER JOIN hesap_subes� ON sube.sube_ad�=hesap_subes�.sube_ad� INNER JOIN hesap ON hesap.hesap_no=hesap_subes�.hesap_no INNER JOIN para_yat�ran ON para_yat�ran.hesap_no = hesap.hesap_no WHERE para_yat�ran.tcno=tc_no;
satir kisidetaylari%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('kayitlihesapdeaylar - begin');


 OPEN kisidetaylari(tc_no);
 LOOP
 FETCH kisidetaylari INTO satir;
 EXIT WHEN kisidetaylari%NOTFOUND;
 DBMS_OUTPUT.PUT_LINE('sube_ad�= ' || satir.sube_ad�  || 'balans= ' || satir.balans );
 subeadi:= satir.sube_ad�;
 balans:= satir.balans;
 END LOOP;
 CLOSE kisidetaylari;

DBMS_OUTPUT.PUT_LINE('kayitlihesapdeaylar - end');
END KAY�TL�HESAPDEAYLAR;
 
DECLARE
subeadi sube.sube_ad�%TYPE;
balans  hesap.balans%TYPE;
BEGIN
    KAY�TL�HESAPDEAYLAR('11111111111',subeadi,balans);
    DBMS_OUTPUT.PUT_LINE('subeAdi: ' || subeadi);
    DBMS_OUTPUT.PUT_LINE('balans: ' || balans);

    DBMS_OUTPUT.PUT_LINE('*********************');

    KAY�TL�HESAPDEAYLAR('99999999999',subeadi,balans);
    DBMS_OUTPUT.PUT_LINE('subeAdi: ' || subeadi);
    DBMS_OUTPUT.PUT_LINE('balans: ' || balans);
    
END;

--3b. Ki�inin en son ne zaman para yat�rd���n� geri d�nd�ren fonksiyonu yaz�n�z.

create or replace  FUNCTION NEZAMANPARAYATIRDI(
 tc_no IN mud�.tcno%TYPE
) RETURN DATE AS 

CURSOR ensonparayatirmatarihi(tc_no mud�.tcno%TYPE) IS 
SELECT MAX(�slem_tar�h�) FROM para_yat�ran WHERE para_yat�ran.tcno=tc_no;
--SELECT MAX(�slem_tar�h�) FROM para_yat�ran WHERE para_yat�ran.tcno=tc_no;
--satir para_yat�ran%ROWTYPE;
islemtarihi DATE;
BEGIN
 OPEN ensonparayatirmatarihi(tc_no);
 FETCH ensonparayatirmatarihi INTO islemtarihi;
 CLOSE ensonparayatirmatarihi;

  RETURN islemtarihi;
END NEZAMANPARAYATIRDI;

DECLARE
tc_no mud�.tcno%TYPE;
tarih DATE;
BEGIN
    tc_no := '99999999999';
    tarih:= NEZAMANPARAYATIRDI(tc_no);
    DBMS_OUTPUT.PUT_LINE('tarih= ' || tarih  );

END;

--3c.Varl�klar� en y�ksek olan �ubeyi bulan fonksiyonu yaz�n�z. Varl�klar �ubedeki hesaplar�n toplam�d�r.
--NOT Bu soru ki�inin TC 'si girilince, en y�ksek varl�ga sahip oldugu subeyi d�necek sekilde yap�ld�.(Bir �ubedeki varl�g� ise o subedeki hesaplar�n�n toplam�d�r)

create or replace  FUNCTION ENYUKSEKVARLIKSUBE(
tc_no IN mud�.tcno%TYPE
) RETURN sube.sube_ad�%TYPE AS 

CURSOR enyuksekvarliklisubeyibul(tc_no mud�.tcno%TYPE) IS 
SELECT SONUC.SUBE_ADI, SONUC.TOPLAM FROM (
    SELECT sube.sube_ad�, SUM(hesap.balans) AS toplam FROM hesap  
    INNER JOIN hesap_subes� ON hesap_subes�.hesap_no=hesap.hesap_no
    INNER JOIN sube ON sube.sube_ad�=hesap_subes�.sube_ad�
    INNER JOIN para_yat�ran ON hesap.hesap_no = para_yat�ran.hesap_no
    INNER JOIN mud� ON mud�.tcno = para_yat�ran.tcno WHERE mud�.tcno=tc_no  GROUP BY(sube.sube_ad�)
) SONUC  where ROWNUM = 1 ORDER BY TOPLAM DESC ;
-- ROWNUM ile s�ralanm�s degerlerin ilkini yani max al�nd�
satir enyuksekvarliklisubeyibul%ROWTYPE;
subeadi  sube.sube_ad�%TYPE;
BEGIN
 OPEN enyuksekvarliklisubeyibul(tc_no);
 FETCH enyuksekvarliklisubeyibul INTO satir;
 CLOSE enyuksekvarliklisubeyibul;
 subeadi:=satir.SUBE_ADI;

  
  RETURN subeadi;
END ENYUKSEKVARLIKSUBE;

DECLARE
 subeadi sube.sube_ad�%TYPE;
 tc_no mud�.tcno%TYPE;
BEGIN
 tc_no := '99999999999';

 subeadi := ENYUKSEKVARLIKSUBE(tc_no);
 DBMS_OUTPUT.PUT_LINE('subeadi= ' || subeadi  );

END;

--4. Hesaba para yat�r�ld���nda hesaptaki eski miktar� ve hesab�n son halini ekrana yazd�ran trigger�� yaz�n�z
create or replace  TRIGGER TRESKIHALIVESONHALI 
BEFORE INSERT OR UPDATE OF BALANS ON HESAP 
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('ESKI = ' || :old.balans  );
   DBMS_OUTPUT.PUT_LINE('YENI= ' ||  :new.balans  );

END;

BEGIN
UPDATE hesap SET balans = 5000 WHERE hesap_no='1'; 
END;
------�DEV NIL --- 
/*SORU 1)

Bir banka i�in sadece para yat�rma i�lemini tutan 
veritaban� �emas� a�a��da verilmi�tir. Verilen varl�k-ili�ki (E-R) 
diyagram�nda yer alan tablolar� �KOD BLO�U ���NDE� ve Oracle-DDL 
kullanarak olu�turunuz. �li�ki tablolar�nda en az iki varl���n temel
anahtar� olmal�d�r, bunun d���nda nitelikleri (�rne�in i�lem tarihi, miktar gibi) 
sizin di�er sorulara g�re belirleyip koyman�z beklenmektedir.
*/
DECLARE 
 mudi_query VARCHAR2(2000);
 sube_query varchar2(2000);
 para_yatiran_query VARCHAR2(2000);
 hesap_subesi_query VARCHAR2(2000);
 hesap_query VARCHAR2(2000);
BEGIN

sube_query:='CREATE TABLE SUBE( sube_adi VARCHAR2(100) NOT NULL,
                                    sube_sehir VARCHAR2(100),
                                    varlik INTEGER,
                                    CONSTRAINT SUBEPRIKEY PRIMARY KEY (sube_adi)
)';
EXECUTE IMMEDIATE sube_query;

hesap_query:='CREATE TABLE HESAP( hesap_no VARCHAR2(100) NOT NULL,
                                    balans INTEGER,
                                    CONSTRAINT HESAPPRIKEY PRIMARY KEY (hesap_no)
)';
EXECUTE IMMEDIATE hesap_query;


mudi_query:='CREATE TABLE MUDI( TCno VARCHAR2(100) NOT NULL,
                                mudi_sokak VARCHAR2(100),
                                mudi_sehir VARCHAR2(100),
                                CONSTRAINT MUDIPRIKEY PRIMARY KEY (tcno)
)';
EXECUTE IMMEDIATE mudi_query;



hesap_subesi_query:='CREATE TABLE HESAP_SUBESI( hesap_no VARCHAR2(100),
                                                sube_adi VARCHAR2(100),
                                                CONSTRAINT HesapSubesiPK PRIMARY KEY(hesap_no, sube_adi),
                                                 CONSTRAINT FKEYHESPNO   FOREIGN KEY (hesap_no)  REFERENCES HESAP(hesap_no),
                                                CONSTRAINT FKEYSUBEADI   FOREIGN KEY (sube_adi)  REFERENCES SUBE(sube_adi)
)';
EXECUTE IMMEDIATE hesap_subesi_query;


para_yatiran_query:='CREATE TABLE PARA_YATIRAN( hesap_no VARCHAR2(100),
                                                TCno VARCHAR2(100),
                                                miktar INTEGER,
                                                tarih DATE  DEFAULT (sysdate),
                                                CONSTRAINT ParaYatiranPK PRIMARY KEY(hesap_no, tcno),
                                                CONSTRAINT FKEYPYHESAPNO  FOREIGN KEY (hesap_no)  REFERENCES HESAP(hesap_no),
                                                CONSTRAINT FKPYTCNO  FOREIGN KEY (TCno)  REFERENCES MUDI(TCno)
)';
EXECUTE IMMEDIATE para_yatiran_query;
 

END;



/*
DROP TABLE sube;
DROP TABLE hesap;
DROP TABLE mudi;
DROP TABLE hesap_subesi;
DROP TABLE para_yatiran;
*/

/*SORU 2)
Tablolara uygun veriler belirleyin ve bu verilerin giri�ini yapan en az bir prosed�r yaz�n�z.
*/
/*CREATE OR REPLACE PROCEDURE TABLOVERILERIGIR IS

BEGIN

   INSERT INTO SUBE (sube_adi, sube_sehir, varlik) VALUES('Eskibaglar', 'Eskisehir', 26200);
   INSERT INTO SUBE (sube_adi, sube_sehir, varlik) VALUES('Kartal', 'Istanbul', 4300);
   INSERT INTO SUBE (sube_adi, sube_sehir, varlik) VALUES('Gebze', 'Kocaeli', 10400);

   INSERT INTO HESAP (hesap_no, balans) VALUES('1', 25000);
   INSERT INTO HESAP (hesap_no, balans) VALUES('2', 1200);
   INSERT INTO HESAP (hesap_no, balans) VALUES('3', 300);
   INSERT INTO HESAP (hesap_no, balans) VALUES('4', 4000);
   INSERT INTO HESAP (hesap_no, balans) VALUES('5', 3000);
   INSERT INTO HESAP (hesap_no, balans) VALUES('6', 7400);
      
   INSERT INTO MUDI (tcno, mudi_sokak,mudi_sehir ) VALUES('52345678901', 'Yenibaglar','Eskisehir');--1,2 hesap
   INSERT INTO MUDI (tcno, mudi_sokak,mudi_sehir ) VALUES('27661862513', 'Yenisehir','Istanbul');--3,4 hesap
   INSERT INTO MUDI (tcno, mudi_sokak,mudi_sehir ) VALUES('14785223693', 'Dragos','Istanbul');--5 hesap
   INSERT INTO MUDI (tcno, mudi_sokak,mudi_sehir ) VALUES('78979875214', 'Gebze','Kocaeli');--6 hesap

   INSERT INTO HESAP_SUBESI (hesap_no, sube_adi ) VALUES('1', 'Eskibaglar');
   INSERT INTO HESAP_SUBESI (hesap_no, sube_adi ) VALUES('2', 'Eskibaglar');
   INSERT INTO HESAP_SUBESI (hesap_no, sube_adi ) VALUES('3', 'Kartal');
   INSERT INTO HESAP_SUBESI (hesap_no, sube_adi ) VALUES('4', 'Kartal');
   INSERT INTO HESAP_SUBESI (hesap_no, sube_adi ) VALUES('5', 'Gebze');
   INSERT INTO HESAP_SUBESI (hesap_no, sube_adi ) VALUES('6', 'Gebze');

   INSERT INTO PARA_YATIRAN (hesap_no, tcno,  tarih, miktar ) VALUES('1', '52345678901', SYSDATE -12, 400);
   INSERT INTO PARA_YATIRAN (hesap_no, tcno,  tarih, miktar) VALUES('2', '52345678901',  SYSDATE -15, 500);
   INSERT INTO PARA_YATIRAN (hesap_no, tcno,  tarih, miktar) VALUES('3', '27661862513',  SYSDATE -6, 200);
   INSERT INTO PARA_YATIRAN (hesap_no, tcno,  tarih, miktar) VALUES('4', '27661862513',  SYSDATE -4, 1000);
   INSERT INTO PARA_YATIRAN (hesap_no, tcno,  tarih, miktar) VALUES('5', '14785223693',  SYSDATE -7, 750);
   INSERT INTO PARA_YATIRAN (hesap_no, tcno,  tarih, miktar) VALUES('6', '78979875214',  SYSDATE -13, 250);



END;

BEGIN
    TABLOVERILERIGIR();
END;
*/
/*SORU 3)
Bir ki�inin TCno�su girilince �zerine:
a. Ki�inin �zerine kay�tl� hesaplar�n t�m detaylar�n� (hangi �ubede ve balans de�erini) geri d�nd�ren prosed�r� yaz�n�z.
*/
/*

CREATE OR REPLACE PROCEDURE HESAPTUMDETAYDON(
    TC_NO IN MUDI.TCNO%TYPE,
    SUBEADI OUT SUBE.SUBE_ADI%TYPE,
    BALANS OUT HESAP.BALANS%TYPE
) AS 
CURSOR HESAPSAHIBIDETAYLARIDON(TC_NO  MUDI.TCNO%TYPE) IS
SELECT SUBE.SUBE_ADI, HESAP.BALANS FROM SUBE 
INNER JOIN HESAP_SUBESI ON SUBE.SUBE_ADI=HESAP_SUBESI.SUBE_ADI
INNER JOIN HESAP ON HESAP.HESAP_NO=HESAP_SUBESI.HESAP_NO
INNER JOIN PARA_YATIRAN ON PARA_YATIRAN.HESAP_NO=HESAP.HESAP_NO
WHERE PARA_YATIRAN.TCNO=TC_NO;

BEGIN
 FOR satir IN HESAPSAHIBIDETAYLARIDON(TC_NO)
 LOOP
 SUBEADI:=satir.SUBE_ADI;
 BALANS:=satir.BALANS;
 END LOOP;
  
END HESAPTUMDETAYDON;

DECLARE
BALANS  HESAP.BALANS%TYPE;
SUBEADI SUBE.SUBE_ADI%TYPE;
BEGIN
    HESAPTUMDETAYDON('78979875214',SUBEADI,BALANS);
    DBMS_OUTPUT.PUT_LINE('SUBEADI: ' || SUBEADI);
    DBMS_OUTPUT.PUT_LINE('BALANS: ' || BALANS);    
END;
*/
/*SORU 3)
b. Ki�inin en son ne zaman para yat�rd���n� geri d�nd�ren fonksiyonu yaz�n�z.
*/
/*
CREATE OR REPLACE FUNCTION ENSONPARAYATIRMATARIHIAL(
 TC_NO IN MUDI.TCNO%TYPE
)
RETURN DATE AS 
CURSOR YATIRMATARIHI( TC_NO  MUDI.TCNO%TYPE) IS 
SELECT * FROM (
SELECT * FROM PARA_YATIRAN  WHERE PARA_YATIRAN.TCNO = TC_NO ORDER BY TARIH DESC
) WHERE ROWNUM =1;
satir PARA_YATIRAN%ROWTYPE;
SONUC DATE;
BEGIN
 OPEN YATIRMATARIHI(TC_NO);
 
 FETCH YATIRMATARIHI INTO satir;
 
 SONUC:=satir.TARIH;

 CLOSE YATIRMATARIHI;
   RETURN SONUC;
END ENSONPARAYATIRMATARIHIAL;

DECLARE
TC_NO MUDI.TCNO%TYPE;
TARIH DATE;
BEGIN
    TC_NO := '27661862513';
    TARIH:= ENSONPARAYATIRMATARIHIAL(TC_NO);
    DBMS_OUTPUT.PUT_LINE('TARIH= ' || TARIH  );

END;
*/
/*SORU 3)
c.Varl�klar� en y�ksek olan �ubeyi bulan fonksiyonu yaz�n�z. Varl�klar �ubedeki hesaplar�n toplam�d�r.
NOT:
Soruda verilen TC kimlik numaras�na g�re i�lem yap�lmas� talimat�ndan dolay� soru a�a��daki gibi
alg�lan�p ��z�lm��t�r.
Ki�inin TC kimlik numaras� girildi�inde, en y�ksek varl��a sahip oldu�u subeyi d�necek.

*/

CREATE OR REPLACE FUNCTION TOPLAMVARLIGAGORESUBEDON(
        TC_NO IN MUDI.TCNO%TYPE ) RETURN SUBE.SUBE_ADI%TYPE AS 
    CURSOR SUBEBAZLITOPLAMBUL(TC_NO MUDI.TCNO%TYPE) IS 
    SELECT SUBE.SUBE_ADI AS SUBEADI, SUM(HESAP.BALANS) AS MIKTAR  FROM HESAP
    INNER JOIN HESAP_SUBESI ON  HESAP_SUBESI.HESAP_NO=HESAP.HESAP_NO
    INNER JOIN SUBE ON SUBE.SUBE_ADI=HESAP_SUBESI.SUBE_ADI
    INNER JOIN PARA_YATIRAN ON HESAP.HESAP_NO=PARA_YATIRAN.HESAP_NO
    WHERE PARA_YATIRAN.TCNO=TC_NO GROUP BY(SUBE.SUBE_ADI);
    SUBEADI SUBE.SUBE_ADI%TYPE;
    TOPLAM HESAP.BALANS%TYPE;
BEGIN
    TOPLAM:=0;
    SUBEADI:='';
    FOR satir IN SUBEBAZLITOPLAMBUL(TC_NO)
    LOOP
    IF TOPLAM < satir.MIKTAR
    THEN 
    TOPLAM:=satir.MIKTAR;
    SUBEADI:= satir.SUBEADI;
     END IF;
 END LOOP;
 RETURN SUBEADI;

END TOPLAMVARLIGAGORESUBEDON;

DECLARE
SUBEADI SUBE.SUBE_ADI%TYPE;
TC_NO MUDI.TCNO%TYPE;
BEGIN
 TC_NO := '52345678901';

 SUBEADI := TOPLAMVARLIGAGORESUBEDON(TC_NO);
 DBMS_OUTPUT.PUT_LINE('SUBEADI= ' || SUBEADI  );

END;

/*SORU 4)
Hesaba para yat�r�ld���nda hesaptaki eski miktar� ve hesab�n son halini ekrana yazd�ran trigger�� yaz�n�z
*/

CREATE OR REPLACE TRIGGER ODEVTRIGGER 
BEFORE INSERT OR UPDATE OF BALANS ON HESAP 

FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('ESKI HESAP MIKTARI = ' || :old.BALANS  );
   DBMS_OUTPUT.PUT_LINE('YENI HESAP MIKTARI = ' ||  :new.BALANS  );

END;

BEGIN
UPDATE HESAP SET BALANS = 2000 WHERE hesap_no='1'; 
END;

-----------------ODEVLER SON ------------





