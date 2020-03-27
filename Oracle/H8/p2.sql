-- KOD BLOGU
--SET  SERVEROUTPUT ON;
DECLARE
  avg_sal EMP.SAL%TYPE;
  satir EMP%ROWTYPE;
  CURSOR hsal IS SELECT * FROM emp where SAL > avg_sal;
BEGIN
  SELECT avg(sal) INTO avg_sal FROM emp;
  OPEN hsal;
  DBMS_OUTPUT.PUT_LINE('ORTALAMA MAAS = ' || avg_sal);
  DBMS_OUTPUT.PUT_LINE('ORTALAMA USTU MAAS ALANLAR');
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
  LOOP
    FETCH hsal INTO satir;
    DBMS_OUTPUT.PUT_LINE(satir.ename || ', ' || satir.sal);
    EXIT WHEN hsal%NOTFOUND;
  END LOOP;
END;

--CURSOR empcur IS SELECT ename, deptno FROM emp; 
