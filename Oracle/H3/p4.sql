--1. SALGRADE atblosunun tüm satýrlarýný yazdýrýn.
--SELECT * FROM salgrade;
--SELECT ename, sal FROM emp WHERE sal >= 1600 AND sal <= 3000;
--SELECT ename, sal FROM emp WHERE sal BETWEEN 1600 AND 3000;
--SELECT * FROM dept;
--SELECT deptno, dname FROM dept ORDER BY deptno, dname;
--SELECT DISTINCT job FROM emp ORDER BY job DESC;
--SELECT ename, hiredate, deptno, job FROM emp WHERE (job = 'CLERK') AND (deptno = 20);
--SELECT ename, mgr, sal FROM emp WHERE mgr IS NOT NULL ORDER BY sal DESC;
SELECT ename, sal, comm, sal*12 +NVL(comm,0) maas FROM emp WHERE (sal < NVL(comm, 0)) ORDER BY maas DESC;