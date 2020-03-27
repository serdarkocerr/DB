CREATE OR REPLACE FUNCTION toplam1 (s1 number, s2 number) RETURN number IS
  sonuc number;
BEGIN
  sonuc := s1 + s2;
  RETURN sonuc;
END;