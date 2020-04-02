SET SERVEROUTPUT ON;
------HAFTA 2 ----------
--SELECT *FROM EMPLOYEE;
--SELECT EMPNO, NAME, JOB FROM EMPLOYEE;
--SELECT EMPNO PNO, JOB ISTANIMI, NAME ISIM FROM EMPLOYEE;
--SELECT NAME , SALARY*12 YILLIKMAAS FROM EMPLOYEE;
--SELECT 'CEMBERIN ALANI ' || 3.14*2*2 FROM dual;
--SELECT 'Kisinin Adi : ' || EMPLOYEE.NAME, 'Calistigi Departman : ' || department.name FROM EMPLOYEE,DEPARTMENT WHERE employee.deptno = department.deptno;
--SELECT NAME , COMM FROM EMPLOYEE;
--SELECT NAME , NVL(COMM,0) FROM EMPLOYEE;
--SELECT NAME, 12* SALARY + NVL(COMM,0) FROM EMPLOYEE;
--SELECT SYSDATE FROM DUAL;

------ HAFTA 3 -----------
--SELECT NAME, EMPNO FROM EMPLOYEE WHERE (HIREDATE<='1991-01-01');
--SQL OPERATÖRLERÝ
-- BETWEEN, IN, IS NULL, LIKE
--SELECT NAME FROM EMPLOYEE WHERE DEPTNO BETWEEN 20 AND 50;
--SELECT NAME FROM EMPLOYEE WHERE DEPTNO IN(10,30);
--SELECT NAME, COMM FROM EMPLOYEE WHERE COMM IS  NULL;
--SELECT NAME FROM EMPLOYEE WHERE NAME LIKE 'S%';
--SELECT NAME FROM EMPLOYEE WHERE NAME LIKE '_A%';
--SELECT NAME FROM EMPLOYEE WHERE DEPTNO NOT IN (10,20);
--SELECT NAME , HIREDATE FROM EMPLOYEE ORDER BY  HIREDATE DESC;
--SELECT NAME, DEPTNO , JOB FROM EMPLOYEE WHERE (DEPTNO = 10) AND ((JOB = 'CLERK' )OR(JOB = 'MANAGER'));
--SELECT DISTINCT JOB FROM EMPLOYEE ORDER BY JOB;
-- Karakter Fonksiyonlarý 
--SELECT LOWER('AHMET') FROM DUAL;
--SELECT UPPER('AHMET') FROM DUAL;
--SELECT LPAD('SERDAR',10,'*') FROM DUAL;
--SELECT RPAD('SERDAR',10,'*') FROM DUAL;
--SELECT SUBSTR('ORACLE',3, 2) FROM dual;
--SELECT INSTR('ORACLE','CL') FROM dual;
--SELECT LTRIM('ORACLE','O') FROM dual;
--SELECT RTRIM('ORACLE','LE') FROM dual;
--SELECT LENGTH('ADAPAZARI') FROM dual;
--SELECT TRANSLATE('hekko', 'k', 'l') FROM dual;
--SELECT TRANSLATE('ggekko', 'gk', 'hl') FROM dual;
--SELECT REPLACE('orafred', 'fred', 'cle') FROM dual;
--SELECT REPLACE('oracleab', 'ab') FROM dual;

--- HAFTA 4 -----
--SELECT round(3.14,1) FROM dual; 3.2 yukarý yuvarlar ve virgülden sonra 1 hane alýr.
--SELECT round(12.145677,3) FROM dual; 12.146 yukarý yuvarlar ve virgülden sonra 3 hane alýr.
--SELECT round(sysdate) FROM dual; günü 1 yukarý yuvarlar.
--SELECT round(13.14,-1) FROM dual; -1 virgülden önceki haneyi yuvarlar. (-1) 10 -> 10 aþaðý yuvarlar
--SELECT round(13.14,-2) FROM dual; -1 virgülden önceki haneyi yuvarlar. (-1) 0 -> 100 aþaðý yuvarlar
--SELECT round(151.14,-2) FROM dual; --> 200
--SELECT trunc(15.14,1) FROM dual; 15.1  virgülden sonraki 1 haneyi alýr sadece. (kesmek için)
--SELECT trunc(15.16,-1) FROM dual; 10  -1 virgülden öncekini 10-20-30 a göre aþaðý yuvarla virgülden öncesini kes demek.
--SELECT trunc(15.16,-2) FROM dual; 0  -2 virgülden öncekini 100-200-300 a göre aþaðý yuvarla virgülden öncesini kes demek.
--SELECT sign(5-22) FROM dual; sonuc eger negatif ise -1, pozitif ise +1, sýfýra eþitse 0 sonucu verir.
--SELECT ceil(2.32), floor(3.34) FROM dual; -> ceil en yakýn tam sayýya yukarý yuvarlar. floor en yakýn aþaðý tam sayýya yuvarlar.
--SELECT power(2.12,3.78) FROM dual;
--SELECT mod(7,3) FROM dual;
--SELECT abs(-23) FROM dual;
--SELECT sqrt(25) FROM dual;
--SELECT log(123, 10) FROM dual;
--SELECT sin(3.14/4) FROM dual;
--SELECT exp(3) FROM dual; -exponansiyel
--SELECT ln(20.085) FROM dual; -doðal logaritma
--SELECT sysdate  FROM dual; -> bugünü gösterir.
--SELECT sysdate + 5 FROM dual; -> bugünün tarihine 5 gün ilave eder.
--SELECT sysdate - 5 FROM dual; -> bugünün tarihinden 5 gün önceki güne götürür.
--SELECT sysdate - to_date('18/04/1974') FROM dual; -> iki tarih arasýndaki fark. Gün olarak sonucu verir.
--SELECT months_between(sysdate, to_date('18/04/1974')) FROM dual; -> aradaki ay sayýsý
--SELECT sysdate + 3/24 FROM dual; -> saat ilave eder.
--SELECT add_months(sysdate, 5) FROM dual; -> ay ilave eder.
--SELECT next_day(sysdate, 'Cuma') FROM dual;-> bugünden sonraki ilk Cuma tarihini dönüdürür.
--SELECT last_day(sysdate+5) FROM dual; -> girilen tarihin içinde bulunduðu ayýn son 5. günü nedir.
--SELECT add_months(sysdate, 5), round(add_months(sysdate, 5), 'YEAR') FROM dual; -> round ile 6.ay sonrasýný seneye yuvarlar.
--SELECT to_char(sysdate, 'YYYY.MON.DAY') FROM dual; -> Tarih biçimini gösterimi deðiþir.
--SELECT to_char(sysdate, 'DD.MM.YY') FROM dual; -> Tarih biçimi gösterimi deðiþir.
--SELECT to_char(sysdate, 'DD.MM.YY-HH:MI') FROM dual;
--SELECT to_char(sysdate, 'DD.MM.YY-HH24:MI:SS') FROM dual;
--SELECT to_char(sysdate, 'SSSSS') FROM dual;-> gece yarýsýndan itibaren þuana kadar geçen saniye
--SELECT to_char(sysdate, 'WW') FROM dual; -> bugün yýlýn kaçýncý haftasý olduðunu gösterir.
--SELECT to_char(sysdate, 'W') FROM dual; -> bugün ayýn kaçýncý haftasý olduðunu gösterir.
--SELECT to_char(sysdate, 'Q') FROM dual; -> bugün yýlýn kaçýncý çeyreði olduðunu gösterir.
--SELECT power(2.3,3) FROM dual;
--SELECT to_char(23, '99999') FROM dual; -> 5 haneli olarak gösterir. boþlukboþlukboþluk23
--SELECT to_char(23, '00000') FROM dual; -> 5 haneli olarak gösterir. 00023
--SELECT to_char(23, '$999999') FROM dual;-> Önüne $ iþareti koyar. $boþlukboþlukboþluk23
--SELECT to_char(23, '$00000') FROM dual;-> Önüne $ iþareti koyar. $00023
--SELECT to_char(12345.87, '$99999.00') FROM dual;-> Önüne $ iþareti koyar ve virgülden sonra 2 hane. $12345.87 -> sýnavda çýkmýþ
--SELECT to_number('12343') + 5 FROM dual; -> to_number string'i number'a çevirir. 12348
--SELECT to_char('12343','99999') + 5 FROM dual; -> 
--SELECT to_char(sysdate - to_date('12/01/2020'), '99999') FROM dual; -> boþlukboþlukboþluk47
--SELECT greatest(4,5,7,-2) FROM dual; -> en büyüðünü döndürür.
--SELECT least(4,5,7,-2) FROM dual; -> en küçüküðünü döndürür.
--SELECT decode(grade, 
--1, 'DÜÞÜK',
--2, 'ORTA',
--3, 'YÜKSEK',
--4, 'ÇOK YÜKSEK') FROM salarygrade where losal = 1401;

--Grup fonksiyonlarý
--SELECT to_char(avg(SALARY), '999999.99') FROM EMPLOYEE; -> sal kolonundakilerin ortlamasýný alýr.
--SELECT count(*) FROM emp;-> kaç kayýt var döndürür.
--SELECT sum(sal) FROM emp;-> sal kolonundakileri toplar.
--SELECT to_char(sum(sal) / count(*), '99999.99') FROM emp;
--SELECT max(sal) FROM emp;-> sal kolonundaki max.'ý bulur.
--SELECT min(sal) FROM emp;
--SELECT to_char(stddev(sal), '9999.99') FROM emp;-> standar deviation( standart sapma)'yý döndürür.
--SELECT to_char(variance(sal), '999999999.99') FROM emp; -> varyans döndürür.
--SELECT job, avg(sal) FROM emp where deptno = 20 GROUP BY job; -> job kolonuna göre gruplayarak  ortalama maaþ döndürülür.
--SELECT job, sal FROM emp where deptno = 20;-> departmandaki job ve sal deðerlerini döndürür.
--SELECT job, avg(sal)  FROM emp where deptno = 20 GROUP BY job HAVING  avg(sal) > 1000; -> joblarý gruplayarak sal ortlamasý 1000 den büyük olaný döndürür.
--select job,count(*) from emp group by job;
--GRUP BY ile sadece gruplama fonksiyonlarý kullanýlabilir. ( avg, max, min, count vs. )

--- HAFTA 5 -----
--Product
--SELECT employee.name, department.name FROM employee,department;
--Joins Equi -- Eþitlik ile yapýlan inner join.
--SELECT e.name, d.name FROM employee e, department d WHERE e.deptno = d.deptno;
--Joins non-equi -- Eþitlik þeklinde deðilde aralýk yani between þeklinde olan inner join
--select e.name, s.grade from employee e, salarygrade s where e.salary between s.losal and s.hisal;
--Joins outer --> + koyulan taraf outer joinde OUTER OLAN taraftýr. 
--normal inner joinde her iki tablodan  gelens orgu sonuçlarda satýrýn biri null ise iki tablonunda 
--o satýr için olan sorgu sonucu dönmez.
--AMA outer join iþleminde OUTER kýsýmdan dönen sorgu sonucu null dahi olsa , 
--outer olmayan kýsýmdan dönen deðer yazýlýr, OUTER dönen kýsýmdan dönen olmadýðýndan NULL yazýlýr.
--select e.name,d.name from employee e, department d where e.deptno(+) = d.deptno; -- department outer employee
--select e.name,d.name from employee e, department d where e.deptno = d.deptno(+); -- employee  outer  department
--select employee.name, department.name from employee RIGHT OUTER JOIN department ON employee.deptno = department.deptno;
-- Joins self -- bazý durumlarda kendini join etmesi gerekebilir.
--select e.name, m.name from employee e, employee m where e.boss = m.empno(+); --> kiþileri ve managerlarý getir. en üst patronun manageri olmadýðýndan null getirecek.

---UNION -- iki tablodanda alanlarýn hepsini döndürür ama unique olarak
--select job from employee where deptno = 10
--UNION
--select job from employee where deptno = 30;

--SELECT deptno FROM department
--UNION
--SELECT deptno FROM employee
--ORDER BY 1; -- 1=> ilk field'a göre sýrala demek.

--INTERSECT -- iki tablodan ortak olanlarý döndürür.
--select deptno from employee
--INTERSECT
--select deptno from department;
--MINUS -- 
--select deptno from department
--MINUS
--select deptno from employee;

--ALT SORGULAR => alt sorgularda öncelikle alt sorgu çalýþýr sonra ana sorgu çalýþýr.
-- TEKLÝ SATIR ALTSORGULAR : alt sorgu sonucu tek bir ifade dönen sorgulardýr.
--select name, salary from employee where salary = (select min(salary) from employee);
--select name, job from employee where job = (select job from employee where name = 'BLAKE');
-- ÇOKLU SATIR ALTSORGULAR: alt sorgunun sonucu birden fazla deðer döndüðü sorgulardýr.
--select name,salary,deptno from employee where (deptno,salary) IN (select deptno, MIN(salary) from employee group by deptno);
-- çoklu satýrda ANY/SOME ve ALL kullanýmý : herbir satýr ile elindeki satýr karþýlaþtýrýlýr. 
-- ANY: herbir satýr ile elindeki satýr karþýlaþtýrýlýr, karþýlaþtýrma sonucu herhangi biriyle true olursa bunu döner.
-- ALL : herbir satýr ile elindeki satýr karþýlaþtýrýlýr, elindeki karþýlaþtýrýlan bütün satýrlardan karþýlaþtýrma sonucu olarak true dönerse, bu kayýdý sorgu döner.
--select name,salary,job from employee where salary > ANY (select distinct salary from employee where deptno = 30);
--select name,salary,job from employee where salary > ALL (select distinct salary from employee where deptno = 30);

-- GROUP BY da where kullanýlmaz. HAVING kullanýlýr.
--ortalamasý, genel ortalamadan daha fazla olan departmanlarýn ortalama maaþýný bul.
--select deptno,AVG(salary) from employee group by deptno HAVING avg(salary) > (select avg(salary) from employee);
--departmanda ortalamadan daha fazla maaþ alanlarý bul.
--select name,deptno,job from employee e where salary > (select avg(salary) from employee where e.deptno = deptno);

--- HAFTA 6 ----- 
--TRUNCATE iþlemi tablo içindeki verileri siler. ayný þekilde DELETE'te tablo içindeki  verileri siler.
-- foreign key içerenlerde truncate yapýlmýyor. 
-- truncate iþlemi sonrasýnda tablonun id'si 0-dan baþlar ama delete yapýldýktan sonra tablonun id'si kaldýðý yerden baþlar.
--create table abc (id number, ad varchar2(32));
--select * from abc;
--insert into abc values(1, 'Kalem');
--insert into abc values(2, 'Kitap');
--TRUNCATE TABLE abc;
--select * from abc;
--insert into abc values(1, 'Kalem');
--insert into abc values(2, 'Kitap');
--DELETE abc;
--desc abc; -- tablonun özelliklerini döndürür.
--commit;
--COMMIT ->
/*Veritabanýnda bulunan bilgileri deðiþtirecek bir  DML  ifadesini iþleme koyduðunuzda, aslýnda deðiþiklik veritabanýna yansýtýlmaz.  Bilgiler deðiþiklik tamponuna koyulur. 
 INSERT, UPDATE ve DELETE komutlarýnýn çalýþtýrýlmasý sonucu deðiþiklikleri sadece çalýþtýran kullanýcý görür. Veritabanýný kullanan diðer kullanýcýlar bu deðiþiklikleri görmezler. 
 Diðer kullanýcýlarýnda bu iþlemleri görmelerini istersek o takdirde bu komutlardan sonra COMMIT komutunu kullanmamýz gerekir. 
 Böylece  tablolar üzerinde yapýlan iþlemler kalýcý olur ve diðer kullanýcýlar da bunlarý görür. 
*/
--ROLLBACK ->
/*Bir  transaction ile DML ifadesi baþlatmýþ, fakat sonradan  deðiþiklikleri iptal etmeye ve ilk haline döndürmeye karar  vermiþ olabilirsiniz. Bu durumda “ROLLBACK” kullanýlýr.
 UPDATE department SET name='TEST';
 ROLLBACK;
 Yukarýdaki kod dept’in tüm satýrlarýný güncelleyecektir sonra deðiþiklikleri geri alacak (rollback) bu sanki hiç UPDATE deyimini kullanmamýþ gibi gerçekleþecektir.
*/

--- HAFTA 7 ----- PLSQL WHÝLE, FOR, IF, ELSE,CURSOR 
--PLSQL --> prosedural language demektir. program akýþlarýný kontrol edebilir.

--Anonim  blok
/*BEGIN
   DBMS_OUTPUT.PUT_LINE(to_char(sysdate, 'DD-MON-YYYY'));
END;*/

-- Blok
/*DECLARE
    A NUMBER(4,2); --4 DIGIT, 2 BASAMAK VÝRGÜLDEN SONRA yani xx,yy
    B NUMBER(3,2);
    C NUMBER(5,2);
BEGIN
    A:=43.44646456;
    B:=7.28;
    C:=A+B;
    DBMS_OUTPUT.PUT_LINE(C);
END;
*/
--IF - ELSE
/*DECLARE
 A NUMBER;
 B NUMBER;
 C NUMBER;
BEGIN
 A:=23;
 B:=A*5;
 IF(B>A) THEN
  DBMS_OUTPUT.PUT_LINE('A : ' || A || ' B : ' ||  B  || ' DEN KUCUKTUR');
  ELSE
   DBMS_OUTPUT.PUT_LINE('A : ' || A || ' B : ' ||  B  || ' DEN BUYUKTUR');
 END IF;
END;*/
-- 90 - 100 --> AA
-- 80-89 --> BA
-- 70-79 --> BB
-- 60-69 --> CB
-- 50-59 --> CC
-- 40-49 --> DC
-- 30-39 --> DD
-- 00-29 --> FF
/*DECLARE
  BNOT NUMBER;
  HNOT CHAR(2);

BEGIN  
  BNOT := 45;
  IF (BNOT >= 90) THEN
      HNOT := 'AA';
  ELSIF (BNOT >= 80) THEN
      HNOT := 'BA';
  ELSIF (BNOT >= 70) THEN
      HNOT := 'BB';
  ELSIF (BNOT >= 60) THEN
      HNOT := 'CB';
  ELSIF (BNOT >= 50) THEN
      HNOT := 'CC';
  ELSIF (BNOT >= 40) THEN
      HNOT := 'DC';
  ELSIF (BNOT >= 30) THEN
      HNOT := 'DD';
  ELSE   
      HNOT := 'FF';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('BAÞARI NOTU = ' || BNOT ||  ', HARF NOTU = ' || HNOT);     
  
END;*/
--CREATE TABLE  PROD (ID NUMBER, AD VARCHAR2(32));
/*
DECLARE
  PID NUMBER;
BEGIN
  PID := 20;
  INSERT INTO PROD VALUES (PID, 'SAMSUNG');
  PID := PID + 1;
  INSERT INTO PROD VALUES (PID, 'SONY');
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('--ÝÞLEM TAMAM--');
END;
*/
--SELECT * FROM PROD;

--LOOP 
/*DECLARE
 I  NUMBER(5);
BEGIN
 I:=0;
 LOOP
  DBMS_OUTPUT.PUT_LINE('I = ' || I);
    I := I +1;
    IF(I > 5) THEN
     EXIT;
     END IF;
 END LOOP;
 
 DBMS_OUTPUT.PUT_LINE('DÖNGÜDEN SONRA I = ' || I);
END;
*/
/*DECLARE
  I NUMBER(4);
BEGIN
  I := 1;
  
  LOOP
    DBMS_OUTPUT.PUT_LINE('I = ' || I);
    I := I + 1;
    
    EXIT WHEN (I > 5);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('DÖNGÜDEN SONRA I = ' || I);
  
END;*/

-- WHILE DONGUSU

/*DECLARE
 I NUMBER;
BEGIN
 I:= 0;
 WHILE(I<=5)
 LOOP
    DBMS_OUTPUT.PUT_LINE('I = ' || I);
    I := I+1;
 END LOOP;
   DBMS_OUTPUT.PUT_LINE('DÖNGÜDEN SONRA I = ' || I);

END;
*/

--FOR DÖNGÜSÜ
/*DECLARE
 I NUMBER;
BEGIN
  FOR I IN 1..5
  LOOP
      DBMS_OUTPUT.PUT_LINE('I = ' || I); 
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('DÖNGÜ DIÞINDA I = ' || I); -- I DONGU ICINDE ARTTIRILIYOR AMA DONGU DISINA BU YANSIMIYOR.!!!SCOPE'TA SADECE ISLEM OLUYOR.
END;
*/
/*DECLARE
  I NUMBER;
  K NUMBER;
  L NUMBER;
BEGIN
  K := 7;
  L := 15;
  FOR I IN REVERSE K..L
  LOOP
    DBMS_OUTPUT.PUT_LINE('I = ' || I);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('DÖNGÜ DIÞINDA I = ' || I); -- - I DONGU ICINDE ARTTIRILIYOR AMA DONGU DISINA BU YANSIMIYOR.!!!!
END;
*/
-- SUTUN DEGISKENI TANIMLAMA
/*DECLARE
 AD EMPLOYEE.NAME%tYPE;
 ID EMPLOYEE.EMPNO%TYPE;
BEGIN
 ID := 7654;
 SELECT NAME INTO AD FROM EMPLOYEE WHERE EMPNO = ID; -- SELECT SORGULARININ SONUCU BIR DEGISKENE ATANIYOR.
   DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || ID || ' OLAN PERSONELÝN ÝSMÝ  = ' || AD);
END;*/

--SATIR TIPINDE TANIMLAMA
/*DECLARE
  SATIR EMPLOYEE%ROWTYPE;
  ID EMPLOYEE.EMPNO%TYPE;
BEGIN 
  ID := 7654;
  SELECT * INTO SATIR FROM EMPLOYEE WHERE EMPNO = ID;
  
  DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || ID || ' OLAN PERSONELÝN MESLEÐÝ  = ' || SATIR.JOB);
  DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || ID || ' OLAN PERSONELÝN MAAÞI  = ' || SATIR.SALARY);

END;
*/ 

--CURSOR 
/*DECLARE
 SATIR EMPLOYEE%ROWTYPE;
 ID EMPLOYEE.NAME%TYPE;
 M EMPLOYEE.SALARY%TYPE;
 ORTM EMPLOYEE.SALARY%TYPE;
 CURSOR curr  IS  SELECT * FROM EMPLOYEE;
 
BEGIN
  OPEN curr; -- CURSOR'LAR KOD BASINDA OPEN ILE ACILIR.
  SELECT AVG(SALARY) INTO ORTM FROM EMPLOYEE; -- CURSOR OLMADAN SELECT ILE YAPILAN
  DBMS_OUTPUT.PUT_LINE ('ORTALAMA MAAÞ =  ' || ORTM);  
 
 LOOP
    FETCH curr INTO SATIR; -- her FETCH'te 1 satýr cevap donduruyor.
    EXIT WHEN curr%NOTFOUND;
    IF(SATIR.SALARY > ORTM) THEN
            DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || SATIR.EMPNO || ' OLAN PERSONELÝN MAAÞI  = ' || SATIR.SALARY);
    END IF;
 END LOOP;
 
END;
*/

/*DECLARE
  --avg_sal EMP.SAL%TYPE;
 CURSOR empcur IS SELECT name, deptno FROM employee;
 satir empcur%rowtype;
BEGIN
  --SELECT avg(sal) INTO avg_sal FROM emp;
  OPEN empcur;
  DBMS_OUTPUT.PUT_LINE('LISTE');
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
  LOOP
    FETCH empcur INTO satir;
    DBMS_OUTPUT.PUT_LINE(satir.name || ', ' || satir.deptno);
    EXIT WHEN empcur%NOTFOUND;
  END LOOP;
END;
*/

-- CURSOR for içinde kullanýlýrken FETCH ve OPEN kullanýlmaz.
/*DECLARE
  satir EMP%ROWTYPE;
  CURSOR isim IS SELECT * FROM emp;
BEGIN 
  FOR  satir IN isim LOOP
    DBMS_OUTPUT.PUT_LINE(satir.ename);
  END LOOP;
END;
*/

--PROCEDURE, FUNCTION
-- Procedure ile function arasýndaki en büyük fark procedure'in return deðeri  yoktur. Sadece OUT þeklinde bir parametre verirse
-- onu döndürür. 
/*CREATE OR REPLACE PROCEDURE pro1 IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Merhaba');
END;*/

-- PROCEDURE VEYA FOKSIYON ÇALIÞTIRMAK ÝÇÝN 
-- 3 yöntem vardýr. 
--1) BEGIN
--     PRO1();
--    END;
--2  CALL PRO1();
--3  EXEC PRO1();
/*create or replace procedure u_alan(kenar NUMBER, yukseklik NUMBER) IS
 tmp NUMBER;
BEGIN
 tmp := (kenar * yukseklik) / 2;
 DBMS_OUTPUT.PUT_LINE('ALAN : '  || tmp);
END;
*/
--CALL u_alan(10,10);

/*create or replace procedure goster(limit employee.salary%TYPE)IS
 satir employee%ROWTYPE;
 CURSOR bul IS SELECT * FROM employee WHERE salary > limit;
BEGIN
    FOR satir IN bul LOOP
     DBMS_OUTPUT.PUT_LINE(satir.name || ', ' || satir.salary);
    END LOOP;
END;*/
--CALL goster(1000); 

/*
IN OUT belirteci ile verilen parametrenin return edilip edilmeyeceði belirlenir.
create or replace procedure kareal( sayi IN number, sonuc OUT number) IS

BEGIN
    sonuc := sayi * sayi;
END;
*/
/*
DECLARE
 L NUMBER;
 K NUMBER;
BEGIN
    L:=2;
    kareal(L,K);
  DBMS_OUTPUT.PUT_LINE('L = ' || L || ',  KARESÝ = ' || K); 
END;
*/

-- aný parametre IN ve OUT tanýmlanabilir.
/*
CREATE OR REPLACE PROCEDURE m_ort (s IN OUT NUMBER) IS
BEGIN 
  SELECT avg(sal) INTO s FROM EMP WHERE deptno = s;
END;
*/

-- sayi: &sayi seklinde kullanýcýdan input alýnabilir.
/*
DECLARE
  sayi NUMBER;
BEGIN
  sayi := &sayi;
  m_ort(sayi);
  DBMS_OUTPUT.PUT_LINE('ORTALAMA MAAS = ' || sayi);
END;
*/





