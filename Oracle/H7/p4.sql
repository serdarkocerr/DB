
--IF ELSE

DECLARE
  A NUMBER;
  B NUMBER;
  C NUMBER;
BEGIN
 A := 23;
 B := A / 5;
  IF (A < B) THEN
    DBMS_OUTPUT.PUT_LINE('A (' || A || ') K���KT�R B (' || B || ')');
  ELSE
    DBMS_OUTPUT.PUT_LINE('B (' || B || ') K���KT�R A (' || A || ')' );
  END IF;
END;