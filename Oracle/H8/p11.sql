DECLARE
  sayi NUMBER;
BEGIN
  sayi := &sayi;
  m_ort(sayi);
  DBMS_OUTPUT.PUT_LINE('ORTALAMA MAAS = ' || sayi);
END;