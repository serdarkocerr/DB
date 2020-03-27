
--IF ELSE

DECLARE
  A NUMBER;
  B NUMBER;
  C NUMBER;
  ABCM NUMBER;
BEGIN
 A := 23;
 B := A / 5;
 C := B*7;
 
  IF (A > B) THEN
    ABCM := A;
    IF (ABCM < C) THEN
        ABCM := C;
    END IF;
  ELSE
    ABCM := B;
    IF (ABCM < C) THEN
      ABCM := C;
    END IF;
  END IF; 
  DBMS_OUTPUT.PUT_LINE('A = ' || A || ', B = ' || B || ', C = ' || C );
  DBMS_OUTPUT.PUT_LINE('MAX = ' || ABCM);
END;