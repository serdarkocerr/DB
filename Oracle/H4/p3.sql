--SELECT to_char(23, '99999') FROM dual;
--SELECT to_char(23, '00000') FROM dual;
--SELECT to_char(23, '$999999') FROM dual;
--SELECT to_char(23, '$00000') FROM dual;
--SELECT to_char(12345.87, '$99999.00') FROM dual;
--SELECT to_number('12343') + 5 FROM dual;
--SELECT to_char('12343','99999') + 5 FROM dual;
--SELECT to_char(sysdate - to_date('12/01/2020'), '99999') FROM dual;
--SELECT greatest(4,5,7,-2) FROM dual;
--SELECT least(4,5,7,-2) FROM dual;
--SELECT grade FROM salgrade;

SELECT decode(grade, 
1, 'DÜÞÜK',
2, 'ORTA',
3, 'YÜKSEK',
4, 'ÇOK YÜKSEK') FROM salgrade where losal = 1401; 