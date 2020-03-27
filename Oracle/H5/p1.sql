-- Product
--SELECT ename, dname FROM emp, dept;
--SELECT ename, deptno FROM emp;
--Joins Equi
--SELECT ename, dname FROM emp, dept WHERE emp.deptno = dept.deptno;
-- Aliasing
--SELECT e.ename, d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;
--Joins non-equi
--SELECT e.ename, s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

--SELECT ename, deptno FROM emp;
--SELECT deptno FROM dept;
-- Joins outer
--SELECT e.ename, d.dname FROM emp e, dept d WHERE e.deptno(+) = d.deptno;
-- Joins self
--SELECT e.ename, m.ename FROM emp e, emp m WHERE m.empno(+) = e.mgr;
--SELECT job FROM emp WHERE deptno = 10;
--SELECT job FROM emp WHERE deptno = 30;
/* 
SELECT job FROM emp WHERE deptno = 10
UNION
SELECT job FROM emp WHERE deptno = 30;
*/
--SELECT job FROM emp WHERE deptno = 10 OR deptno = 30;
-- INTERSECT
--SELECT deptno FROM emp;
--SELECT deptno FROM dept;
/*
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;
*/
/*
SELECT deptno FROM dept
MINUS 
SELECT deptno FROM emp;
*/
/*
SELECT job FROM emp WHERE deptno = 10
UNION ALL
SELECT job FROM emp WHERE deptno = 30;
*/

SELECT deptno FROM dept
UNION
SELECT deptno FROM emp
ORDER BY 1;