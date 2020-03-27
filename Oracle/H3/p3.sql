--SELECT ename, sal, deptno FROM emp WHERE (deptno = 10) AND (sal > 1000);
--SELECT ename, sal, deptno FROM emp WHERE (deptno = 10) OR (sal >= 1000);
--SELECT ename, comm, hiredate FROM emp WHERE (hiredate < '01/07/1999') AND NVL(comm, 0) BETWEEN 1001 AND 1499; 
--SELECT ename, job, deptno FROM emp WHERE NOT job = 'CLERK' AND deptno IN (10, 40, 50);
--SELECT ename, job, deptno FROM emp WHERE job != 'CLERK' AND deptno IN (10, 40, 50);
--SELECT ename, job, deptno FROM emp WHERE job <> 'CLERK' AND deptno IN (10, 40, 50);
--SELECT ename, deptno, sal*12 FROM emp WHERE (deptno = 10 AND sal*12 > 10000) OR (deptno = 30 AND sal*12 > 15000);
-- OPERATÖR ÖNCELÝK SIRASI: 1.MANTIKSAL, 2. NOT, 3. AND, 4. OR
SELECT ename, job, deptno FROM emp WHERE (deptno = 10) AND ((job = 'CLERK') OR (job = 'MANAGER'));