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
--SQL OPERAT�RLER�
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
-- Karakter Fonksiyonlar� 
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
--SELECT round(3.14,1) FROM dual; 3.2 yukar� yuvarlar ve virg�lden sonra 1 hane al�r.
--SELECT round(12.145677,3) FROM dual; 12.146 yukar� yuvarlar ve virg�lden sonra 3 hane al�r.
--SELECT round(sysdate) FROM dual; g�n� 1 yukar� yuvarlar.
--SELECT round(13.14,-1) FROM dual; -1 virg�lden �nceki haneyi yuvarlar. (-1) 10 -> 10 a�a�� yuvarlar
--SELECT round(13.14,-2) FROM dual; -1 virg�lden �nceki haneyi yuvarlar. (-1) 0 -> 100 a�a�� yuvarlar
--SELECT round(151.14,-2) FROM dual; --> 200
--SELECT trunc(15.14,1) FROM dual; 15.1  virg�lden sonraki 1 haneyi al�r sadece. (kesmek i�in)
--SELECT trunc(15.16,-1) FROM dual; 10  -1 virg�lden �ncekini 10-20-30 a g�re a�a�� yuvarla virg�lden �ncesini kes demek.
--SELECT trunc(15.16,-2) FROM dual; 0  -2 virg�lden �ncekini 100-200-300 a g�re a�a�� yuvarla virg�lden �ncesini kes demek.
--SELECT sign(5-22) FROM dual; sonuc eger negatif ise -1, pozitif ise +1, s�f�ra e�itse 0 sonucu verir.
--SELECT ceil(2.32), floor(3.34) FROM dual; -> ceil en yak�n tam say�ya yukar� yuvarlar. floor en yak�n a�a�� tam say�ya yuvarlar.
--SELECT power(2.12,3.78) FROM dual;
--SELECT mod(7,3) FROM dual;
--SELECT abs(-23) FROM dual;
--SELECT sqrt(25) FROM dual;
--SELECT log(123, 10) FROM dual;
--SELECT sin(3.14/4) FROM dual;
--SELECT exp(3) FROM dual; -exponansiyel
--SELECT ln(20.085) FROM dual; -do�al logaritma
--SELECT sysdate  FROM dual; -> bug�n� g�sterir.
--SELECT sysdate + 5 FROM dual; -> bug�n�n tarihine 5 g�n ilave eder.
--SELECT sysdate - 5 FROM dual; -> bug�n�n tarihinden 5 g�n �nceki g�ne g�t�r�r.
--SELECT sysdate - to_date('18/04/1974') FROM dual; -> iki tarih aras�ndaki fark. G�n olarak sonucu verir.
--SELECT months_between(sysdate, to_date('18/04/1974')) FROM dual; -> aradaki ay say�s�
--SELECT sysdate + 3/24 FROM dual; -> saat ilave eder.
--SELECT add_months(sysdate, 5) FROM dual; -> ay ilave eder.
--SELECT next_day(sysdate, 'Cuma') FROM dual;-> bug�nden sonraki ilk Cuma tarihini d�n�d�r�r.
--SELECT last_day(sysdate+5) FROM dual; -> girilen tarihin i�inde bulundu�u ay�n son 5. g�n� nedir.
--SELECT add_months(sysdate, 5), round(add_months(sysdate, 5), 'YEAR') FROM dual; -> round ile 6.ay sonras�n� seneye yuvarlar.
--SELECT to_char(sysdate, 'YYYY.MON.DAY') FROM dual; -> Tarih bi�imini g�sterimi de�i�ir.
--SELECT to_char(sysdate, 'DD.MM.YY') FROM dual; -> Tarih bi�imi g�sterimi de�i�ir.
--SELECT to_char(sysdate, 'DD.MM.YY-HH:MI') FROM dual;
--SELECT to_char(sysdate, 'DD.MM.YY-HH24:MI:SS') FROM dual;
--SELECT to_char(sysdate, 'SSSSS') FROM dual;-> gece yar�s�ndan itibaren �uana kadar ge�en saniye
--SELECT to_char(sysdate, 'WW') FROM dual; -> bug�n y�l�n ka��nc� haftas� oldu�unu g�sterir.
--SELECT to_char(sysdate, 'W') FROM dual; -> bug�n ay�n ka��nc� haftas� oldu�unu g�sterir.
--SELECT to_char(sysdate, 'Q') FROM dual; -> bug�n y�l�n ka��nc� �eyre�i oldu�unu g�sterir.
--SELECT power(2.3,3) FROM dual;
--SELECT to_char(23, '99999') FROM dual; -> 5 haneli olarak g�sterir. bo�lukbo�lukbo�luk23
--SELECT to_char(23, '00000') FROM dual; -> 5 haneli olarak g�sterir. 00023
--SELECT to_char(23, '$999999') FROM dual;-> �n�ne $ i�areti koyar. $bo�lukbo�lukbo�luk23
--SELECT to_char(23, '$00000') FROM dual;-> �n�ne $ i�areti koyar. $00023
--SELECT to_char(12345.87, '$99999.00') FROM dual;-> �n�ne $ i�areti koyar ve virg�lden sonra 2 hane. $12345.87 -> s�navda ��km��
--SELECT to_number('12343') + 5 FROM dual; -> to_number string'i number'a �evirir. 12348
--SELECT to_char('12343','99999') + 5 FROM dual; -> 
--SELECT to_char(sysdate - to_date('12/01/2020'), '99999') FROM dual; -> bo�lukbo�lukbo�luk47
--SELECT greatest(4,5,7,-2) FROM dual; -> en b�y���n� d�nd�r�r.
--SELECT least(4,5,7,-2) FROM dual; -> en k���k���n� d�nd�r�r.
--SELECT decode(grade, 
--1, 'D���K',
--2, 'ORTA',
--3, 'Y�KSEK',
--4, '�OK Y�KSEK') FROM salarygrade where losal = 1401;

--Grup fonksiyonlar�
--SELECT to_char(avg(SALARY), '999999.99') FROM EMPLOYEE; -> sal kolonundakilerin ortlamas�n� al�r.
--SELECT count(*) FROM emp;-> ka� kay�t var d�nd�r�r.
--SELECT sum(sal) FROM emp;-> sal kolonundakileri toplar.
--SELECT to_char(sum(sal) / count(*), '99999.99') FROM emp;
--SELECT max(sal) FROM emp;-> sal kolonundaki max.'� bulur.
--SELECT min(sal) FROM emp;
--SELECT to_char(stddev(sal), '9999.99') FROM emp;-> standar deviation( standart sapma)'y� d�nd�r�r.
--SELECT to_char(variance(sal), '999999999.99') FROM emp; -> varyans d�nd�r�r.
--SELECT job, avg(sal) FROM emp where deptno = 20 GROUP BY job; -> job kolonuna g�re gruplayarak  ortalama maa� d�nd�r�l�r.
--SELECT job, sal FROM emp where deptno = 20;-> departmandaki job ve sal de�erlerini d�nd�r�r.
--SELECT job, avg(sal)  FROM emp where deptno = 20 GROUP BY job HAVING  avg(sal) > 1000; -> joblar� gruplayarak sal ortlamas� 1000 den b�y�k olan� d�nd�r�r.
--select job,count(*) from emp group by job;
--GRUP BY ile sadece gruplama fonksiyonlar� kullan�labilir. ( avg, max, min, count vs. )

--- HAFTA 5 -----
--Product
--SELECT employee.name, department.name FROM employee,department;
--Joins Equi -- E�itlik ile yap�lan inner join.
--SELECT e.name, d.name FROM employee e, department d WHERE e.deptno = d.deptno;
--Joins non-equi -- E�itlik �eklinde de�ilde aral�k yani between �eklinde olan inner join
--select e.name, s.grade from employee e, salarygrade s where e.salary between s.losal and s.hisal;
--Joins outer --> + koyulan taraf outer joinde OUTER OLAN taraft�r. 
--normal inner joinde her iki tablodan  gelens orgu sonu�larda sat�r�n biri null ise iki tablonunda 
--o sat�r i�in olan sorgu sonucu d�nmez.
--AMA outer join i�leminde OUTER k�s�mdan d�nen sorgu sonucu null dahi olsa , 
--outer olmayan k�s�mdan d�nen de�er yaz�l�r, OUTER d�nen k�s�mdan d�nen olmad���ndan NULL yaz�l�r.
--select e.name,d.name from employee e, department d where e.deptno(+) = d.deptno; -- department outer employee
--select e.name,d.name from employee e, department d where e.deptno = d.deptno(+); -- employee  outer  department
--select employee.name, department.name from employee RIGHT OUTER JOIN department ON employee.deptno = department.deptno;
-- Joins self -- baz� durumlarda kendini join etmesi gerekebilir.
--select e.name, m.name from employee e, employee m where e.boss = m.empno(+); --> ki�ileri ve managerlar� getir. en �st patronun manageri olmad���ndan null getirecek.

---UNION -- iki tablodanda alanlar�n hepsini d�nd�r�r ama unique olarak
--select job from employee where deptno = 10
--UNION
--select job from employee where deptno = 30;

--SELECT deptno FROM department
--UNION
--SELECT deptno FROM employee
--ORDER BY 1; -- 1=> ilk field'a g�re s�rala demek.

--INTERSECT -- iki tablodan ortak olanlar� d�nd�r�r.
--select deptno from employee
--INTERSECT
--select deptno from department;
--MINUS -- 
--select deptno from department
--MINUS
--select deptno from employee;

--ALT SORGULAR => alt sorgularda �ncelikle alt sorgu �al���r sonra ana sorgu �al���r.
-- TEKL� SATIR ALTSORGULAR : alt sorgu sonucu tek bir ifade d�nen sorgulard�r.
--select name, salary from employee where salary = (select min(salary) from employee);
--select name, job from employee where job = (select job from employee where name = 'BLAKE');
-- �OKLU SATIR ALTSORGULAR: alt sorgunun sonucu birden fazla de�er d�nd��� sorgulard�r.
--select name,salary,deptno from employee where (deptno,salary) IN (select deptno, MIN(salary) from employee group by deptno);
-- �oklu sat�rda ANY/SOME ve ALL kullan�m� : herbir sat�r ile elindeki sat�r kar��la�t�r�l�r. 
-- ANY: herbir sat�r ile elindeki sat�r kar��la�t�r�l�r, kar��la�t�rma sonucu herhangi biriyle true olursa bunu d�ner.
-- ALL : herbir sat�r ile elindeki sat�r kar��la�t�r�l�r, elindeki kar��la�t�r�lan b�t�n sat�rlardan kar��la�t�rma sonucu olarak true d�nerse, bu kay�d� sorgu d�ner.
--select name,salary,job from employee where salary > ANY (select distinct salary from employee where deptno = 30);
--select name,salary,job from employee where salary > ALL (select distinct salary from employee where deptno = 30);

-- GROUP BY da where kullan�lmaz. HAVING kullan�l�r.
--ortalamas�, genel ortalamadan daha fazla olan departmanlar�n ortalama maa��n� bul.
--select deptno,AVG(salary) from employee group by deptno HAVING avg(salary) > (select avg(salary) from employee);
--departmanda ortalamadan daha fazla maa� alanlar� bul.
--select name,deptno,job from employee e where salary > (select avg(salary) from employee where e.deptno = deptno);

--- HAFTA 6 ----- 
--TRUNCATE i�lemi tablo i�indeki verileri siler. ayn� �ekilde DELETE'te tablo i�indeki  verileri siler.
-- foreign key i�erenlerde truncate yap�lm�yor. 
-- truncate i�lemi sonras�nda tablonun id'si 0-dan ba�lar ama delete yap�ld�ktan sonra tablonun id'si kald��� yerden ba�lar.
--create table abc (id number, ad varchar2(32));
--select * from abc;
--insert into abc values(1, 'Kalem');
--insert into abc values(2, 'Kitap');
--TRUNCATE TABLE abc;
--select * from abc;
--insert into abc values(1, 'Kalem');
--insert into abc values(2, 'Kitap');
--DELETE abc;
--desc abc; -- tablonun �zelliklerini d�nd�r�r.
--commit;
--COMMIT ->
/*Veritaban�nda bulunan bilgileri de�i�tirecek bir  DML  ifadesini i�leme koydu�unuzda, asl�nda de�i�iklik veritaban�na yans�t�lmaz.  Bilgiler de�i�iklik tamponuna koyulur. 
 INSERT, UPDATE ve DELETE komutlar�n�n �al��t�r�lmas� sonucu de�i�iklikleri sadece �al��t�ran kullan�c� g�r�r. Veritaban�n� kullanan di�er kullan�c�lar bu de�i�iklikleri g�rmezler. 
 Di�er kullan�c�lar�nda bu i�lemleri g�rmelerini istersek o takdirde bu komutlardan sonra�COMMIT�komutunu kullanmam�z gerekir. 
 B�ylece  tablolar �zerinde yap�lan i�lemler kal�c� olur ve di�er kullan�c�lar da bunlar� g�r�r. 
*/
--ROLLBACK ->
/*Bir  transaction ile DML ifadesi ba�latm��, fakat sonradan  de�i�iklikleri iptal etmeye ve ilk haline d�nd�rmeye karar  vermi� olabilirsiniz. Bu durumda �ROLLBACK� kullan�l�r.
 UPDATE department SET name='TEST';
 ROLLBACK;
 Yukar�daki kod dept�in t�m sat�rlar�n� g�ncelleyecektir sonra de�i�iklikleri geri alacak (rollback) bu sanki hi� UPDATE deyimini kullanmam�� gibi ger�ekle�ecektir.
*/

--- HAFTA 7 ----- PLSQL WH�LE, FOR, IF, ELSE,CURSOR 
--PLSQL --> prosedural language demektir. program ak��lar�n� kontrol edebilir.

--Anonim  blok
/*BEGIN
   DBMS_OUTPUT.PUT_LINE(to_char(sysdate, 'DD-MON-YYYY'));
END;*/

-- Blok
/*DECLARE
    A NUMBER(4,2); --4 DIGIT, 2 BASAMAK V�RG�LDEN SONRA yani xx,yy
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
  
  DBMS_OUTPUT.PUT_LINE('BA�ARI NOTU = ' || BNOT ||  ', HARF NOTU = ' || HNOT);     
  
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
  DBMS_OUTPUT.PUT_LINE('--��LEM TAMAM--');
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
 
 DBMS_OUTPUT.PUT_LINE('D�NG�DEN SONRA I = ' || I);
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
  
  DBMS_OUTPUT.PUT_LINE('D�NG�DEN SONRA I = ' || I);
  
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
   DBMS_OUTPUT.PUT_LINE('D�NG�DEN SONRA I = ' || I);

END;
*/

--FOR D�NG�S�
/*DECLARE
 I NUMBER;
BEGIN
  FOR I IN 1..5
  LOOP
      DBMS_OUTPUT.PUT_LINE('I = ' || I); 
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('D�NG� DI�INDA I = ' || I); -- I DONGU ICINDE ARTTIRILIYOR AMA DONGU DISINA BU YANSIMIYOR.!!!SCOPE'TA SADECE ISLEM OLUYOR.
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
  DBMS_OUTPUT.PUT_LINE('D�NG� DI�INDA I = ' || I); -- - I DONGU ICINDE ARTTIRILIYOR AMA DONGU DISINA BU YANSIMIYOR.!!!!
END;
*/
-- SUTUN DEGISKENI TANIMLAMA
/*DECLARE
 AD EMPLOYEE.NAME%tYPE;
 ID EMPLOYEE.EMPNO%TYPE;
BEGIN
 ID := 7654;
 SELECT NAME INTO AD FROM EMPLOYEE WHERE EMPNO = ID; -- SELECT SORGULARININ SONUCU BIR DEGISKENE ATANIYOR.
   DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || ID || ' OLAN PERSONEL�N �SM�  = ' || AD);
END;*/

--SATIR TIPINDE TANIMLAMA
/*DECLARE
  SATIR EMPLOYEE%ROWTYPE;
  ID EMPLOYEE.EMPNO%TYPE;
BEGIN 
  ID := 7654;
  SELECT * INTO SATIR FROM EMPLOYEE WHERE EMPNO = ID;
  
  DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || ID || ' OLAN PERSONEL�N MESLE��  = ' || SATIR.JOB);
  DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || ID || ' OLAN PERSONEL�N MAA�I  = ' || SATIR.SALARY);

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
  DBMS_OUTPUT.PUT_LINE ('ORTALAMA MAA� =  ' || ORTM);  
 
 LOOP
    FETCH curr INTO SATIR; -- her FETCH'te 1 sat�r cevap donduruyor.
    EXIT WHEN curr%NOTFOUND;
    IF(SATIR.SALARY > ORTM) THEN
            DBMS_OUTPUT.PUT_LINE ('NUMARASI = ' || SATIR.EMPNO || ' OLAN PERSONEL�N MAA�I  = ' || SATIR.SALARY);
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

-- CURSOR for i�inde kullan�l�rken FETCH ve OPEN kullan�lmaz.
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
-- Procedure ile function aras�ndaki en b�y�k fark procedure'in return de�eri  yoktur. Sadece OUT �eklinde bir parametre verirse
-- onu d�nd�r�r. 
/*CREATE OR REPLACE PROCEDURE pro1 IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Merhaba');
END;*/

-- PROCEDURE VEYA FOKSIYON �ALI�TIRMAK ���N 
-- 3 y�ntem vard�r. 
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
IN OUT belirteci ile verilen parametrenin return edilip edilmeyece�i belirlenir.
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
  DBMS_OUTPUT.PUT_LINE('L = ' || L || ',  KARES� = ' || K); 
END;
*/

-- an� parametre IN ve OUT tan�mlanabilir.
/*
CREATE OR REPLACE PROCEDURE m_ort (s IN OUT NUMBER) IS
BEGIN 
  SELECT avg(sal) INTO s FROM EMP WHERE deptno = s;
END;
*/

-- sayi: &sayi seklinde kullan�c�dan input al�nabilir.
/*
DECLARE
  sayi NUMBER;
BEGIN
  sayi := &sayi;
  m_ort(sayi);
  DBMS_OUTPUT.PUT_LINE('ORTALAMA MAAS = ' || sayi);
END;
*/





