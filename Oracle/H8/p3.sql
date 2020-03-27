-- KOD BLOGU
--SET  SERVEROUTPUT ON;
DECLARE
  --avg_sal EMP.SAL%TYPE;
 CURSOR empcur IS SELECT ename, deptno FROM emp;
 satir empcur%rowtype;
BEGIN
  --SELECT avg(sal) INTO avg_sal FROM emp;
  OPEN empcur;
  DBMS_OUTPUT.PUT_LINE('LISTE');
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
  LOOP
    FETCH empcur INTO satir;
    DBMS_OUTPUT.PUT_LINE(satir.ename || ', ' || satir.deptno);
    EXIT WHEN empcur%NOTFOUND;
  END LOOP;
END;


