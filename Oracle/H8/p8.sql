CREATE OR REPLACE PROCEDURE goster (limit emp.sal%TYPE) IS
  satir emp%ROWTYPE;
  CURSOR bul IS SELECT * FROM emp WHERE sal > limit;
BEGIN
  FOR satir IN bul LOOP
    DBMS_OUTPUT.PUT_LINE(satir.ename || ', ' || satir.sal);
  END LOOP;
END;