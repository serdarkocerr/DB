-- WHILE D�NG�S�

DECLARE
  I NUMBER;
BEGIN
  I := 1;
  WHILE (I <= 5) 
  LOOP
    DBMS_OUTPUT.PUT_LINE('I = ' || I);
    I := I+1;
    
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('D�NG� DI�INDA I = ' || I);
END;