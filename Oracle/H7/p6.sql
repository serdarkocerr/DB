-- 90 - 100 --> AA
-- 80-89 --> BA
-- 70-79 --> BB
-- 60-69 --> CB
-- 50-59 --> CC
-- 40-49 --> DC
-- 30-39 --> DD
-- 00-29 --> FF
DECLARE
  BNOT NUMBER;
  HNOT CHAR(2);

BEGIN  
  BNOT := 45;
  IF (BNOT >= 90) THEN
      HNOT := 'AA';
  ELSIF (BNOT >= 80) THEN
      HNOT := 'BA';
  ELSIF (BNOT >= 70) THEN
      HNOT := 'BB';
  ELSIF (BNOT >= 60) THEN
      HNOT := 'CB';
  ELSIF (BNOT >= 50) THEN
      HNOT := 'CC';
  ELSIF (BNOT >= 40) THEN
      HNOT := 'DC';
  ELSIF (BNOT >= 30) THEN
      HNOT := 'DD';
  ELSE   
      HNOT := 'FF';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('BAÞARI NOTU = ' || BNOT ||  ', HARF NOTU = ' || HNOT);     
  
END;
