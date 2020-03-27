DECLARE
  satir EMP%ROWTYPE;
  CURSOR isim IS SELECT * FROM emp;
BEGIN 
  FOR  satir IN isim LOOP
    DBMS_OUTPUT.PUT_LINE(satir.ename);
  END LOOP;
END;