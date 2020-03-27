SET SERVEROUTPUT ON;
DECLARE
  I NUMBER(4);
BEGIN
  I := 1;
  
  LOOP
    DBMS_OUTPUT.PUT_LINE('I = ' || I);
    I := I + 1;
    
    IF (I > 5) THEN
      EXIT;
    END IF;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('DÖNGÜDEN SONRA I = ' || I);
  
END;