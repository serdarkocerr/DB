/*SORU 1)

Bir banka için sadece para yatýrma iþlemini tutan 
veritabaný þemasý aþaðýda verilmiþtir. Verilen varlýk-iliþki (E-R) 
diyagramýnda yer alan tablolarý “KOD BLOÐU ÝÇÝNDE” ve Oracle-DDL 
kullanarak oluþturunuz. Ýliþki tablolarýnda en az iki varlýðýn temel
anahtarý olmalýdýr, bunun dýþýnda nitelikleri (örneðin iþlem tarihi, miktar gibi) 
sizin diðer sorulara göre belirleyip koymanýz beklenmektedir.
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

/*SORU 2)
Tablolara uygun veriler belirleyin ve bu verilerin giriþini yapan en az bir prosedür yazýnýz.
*/
CREATE OR REPLACE PROCEDURE TABLOVERILERIGIR IS

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

/*SORU 3)
Bir kiþinin TCno’su girilince üzerine:
a. Kiþinin üzerine kayýtlý hesaplarýn tüm detaylarýný (hangi þubede ve balans deðerini) geri döndüren prosedürü yazýnýz.
*/
DECLARE
BALANS  HESAP.BALANS%TYPE;
SUBEADI SUBE.SUBE_ADI%TYPE;
BEGIN
    HESAPTUMDETAYDON('78979875214',SUBEADI,BALANS);
    DBMS_OUTPUT.PUT_LINE('SUBEADI: ' || SUBEADI);
    DBMS_OUTPUT.PUT_LINE('BALANS: ' || BALANS);    
END;

/*SORU 3)
b. Kiþinin en son ne zaman para yatýrdýðýný geri döndüren fonksiyonu yazýnýz.
*/
DECLARE
TC_NO MUDI.TCNO%TYPE;
TARIH DATE;
BEGIN
    TC_NO := '27661862513';
    TARIH:= ENSONPARAYATIRMATARIHIAL(TC_NO);
    DBMS_OUTPUT.PUT_LINE('TARIH= ' || TARIH  );

END;

/*SORU 3)
c.Varlýklarý en yüksek olan þubeyi bulan fonksiyonu yazýnýz. Varlýklar þubedeki hesaplarýn toplamýdýr.
NOT:
Soruda verilen TC kimlik numarasýna göre iþlem yapýlmasý talimatýndan dolayý soru aþaðýdaki gibi
algýlanýp çözülmüþtür.
Kiþinin TC kimlik numarasý girildiðinde, en yüksek varlýða sahip olduðu subeyi dönecek.

*/

DECLARE
SUBEADI SUBE.SUBE_ADI%TYPE;
TC_NO MUDI.TCNO%TYPE;
BEGIN
 TC_NO := '52345678901';

 SUBEADI := TOPLAMVARLIGAGORESUBEDON(TC_NO);
 DBMS_OUTPUT.PUT_LINE('SUBEADI= ' || SUBEADI  );

END;

/*SORU 4)
Hesaba para yatýrýldýðýnda hesaptaki eski miktarý ve hesabýn son halini ekrana yazdýran trigger’ý yazýnýz
*/

BEGIN
UPDATE HESAP SET BALANS = 2000 WHERE hesap_no='1'; 
END;
