CREATE OR REPLACE PROCEDURE m_ort (s IN OUT NUMBER) IS
BEGIN 
  SELECT avg(sal) INTO s FROM EMP WHERE deptno = s;
END;