DECLARE
  K NUMBER;
  L NUMBER;
BEGIN
  L := 2;
  dpro(L, K);
  DBMS_OUTPUT.PUT_LINE('L = ' || L || ',  KARESÝ = ' || K); 
END;