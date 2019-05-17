--day04 : �ǽ� 4����

--(6)������ 2. �񱳿�����
--   �񱳿����ڴ� SELECT ���� ����� �� ����
--   WHERE, HAVING ������ ����� �� ����

--22) �޿��� 2000�� �Ѵ� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.sal �޿�
  FROM emp e
 WHERE e.sal > 2000
;
/*
���    �̸�    �޿�
--------------------
7566	JONES	2975
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7902	FORD	3000
*/
--�޿��� 1000 �̻��� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.sal �޿�
  FROM emp e
 WHERE e.sal >= 1000
;
/*
���    �̸�    �޿�
--------------------
7499	ALLEN	1600
7521	WARD	1250
7566	JONES	2975
7654	MARTIN	1250
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7844	TURNER	1500
7902	FORD	3000
7934	MILLER	1300
*/
--�޿��� 1000 �̻��̸� 2000���� ���� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.sal �޿�
  FROM emp e
 WHERE e.sal >= 1000 AND e.sal < 2000
;
/*
���    �̸�    �޿�
--------------------
7499	ALLEN	1600
7521	WARD	1250
7654	MARTIN	1250
7844	TURNER	1500
7934	MILLER	1300
*/
--comm(����) ���� 0���� ū ������
-- ���, �̸�, �޿�, ������ ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.sal �޿�
      ,e.comm ����
  FROM emp e
 WHERE e.comm > 0
;
/*
�̸�    �޿�    ����    ���
----------------------------
ALLEN	1600	300	    7499
WARD	1250	500	    7521
MARTIN	1250	1400	7654
*/
/*
=> ���� comm > 0 ������ ���� ������� �� �� �ִ� ��
comm �÷��� ���� (null) �� ������� ����
ó������ �񱳴�� ���� ������ �����ؾ��Ѵ�
(null)���� �� ������, ��� �����ڷ� ������ �� ���� ���̴�.

��, ���Ŀ����� null ���� ���� ū ������ ����Ѵ�.
*/

--23)null ������ ���� ����
-- salesman ������ ���� ����� ���� ���ɱ��� ����Ͽ�
-- ���, �̸�, ����, �� ���ɱ��� ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.job ����
      ,e.sal �޿�
      ,e.comm ����
      ,e.sal + e.comm "�� ���ɱ�"
  FROM emp e
;
-- ==> null �����ʹ� ��������ڷ� ���� �Ұ����� ��
SELECT e.empno ���
      ,e.ename �̸�
      ,e.job ����
      ,e.sal �޿�
      ,e.comm ����
      ,e.sal + e.comm "�� ���ɱ�"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
���    �̸�    ����        �޿�   ����  �� ���ɱ�
--------------------------------------------------
7499	ALLEN	SALESMAN	1600	300	   1900
7521	WARD	SALESMAN	1250	500	   1750
7654	MARTIN	SALESMAN	1250	1400   2650
7844	TURNER	SALESMAN	1500	0	   1500
*/
--(6)������ 3. ��������
--NOT ������

--24) �޿��� 2000���� ���� ���� ������
--    ���, �̸�, �޿��� ��ȸ
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
WHERE NOT e.sal < 2000
;
-- ���� ����� ���� �ٸ� ����
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
WHERE  e.sal >= 2000
;
/*
EMPNO   ENAME   SAL
--------------------
7566	JONES	2975
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7902	FORD	3000
*/

--(6) ������ 4. SQL ������
-- IN ������ : ���ϰ��� �ϴ� ���� ����
--             ���õ� ��Ͽ� �����ϸ� ������ �Ǵ�

-- 25) �޿��� 800, 3000, 5000�߿� �ϳ��� ������
-- ���, �̸�, �޿��� ��ȸ
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
WHERE  e.sal IN (800,3000,5000)
;
/*
EMPNO   ENAME   SAL
--------------------
7369	SMITH	800
7839	KING	5000
7902	FORD	3000
*/
-- OR �����ڿ� 3���� �������� ������ ����� ���� ����
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
WHERE  e.sal = 800 
   OR  e.sal = 3000 
   OR  e.sal = 5000
;
------------------------------------------
-- LIKE ������ : ���� ���� �˻��� �� ���
--               ��Ȯ�� ���� ���� ���� �� ���

--LIKE �������� ���� ���� : ���� �� �˻��� ���� 
--                          �����ڿ� �Բ� ����ϴ� ��ȣ 
-- % : �� ��ȣ�� �ڸ��� 0�ڸ� �� �̻��� ��� ���ڰ� �� �� ����
-- _ : �� ��ȣ�� �ڸ��� 1�ڸ� �� �̻��� ��� ���ڰ� �� �� ����

-- 26) �̸��� J�� �����ϴ� ������
--     ���, �̸� ��ȸ
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename LIKE 'J%'
;
/*
EMPNO   ENAME
-------------
7566	JONES
7900	JAMES
*/
 
 -- �̸��� M���� �����ϴ� ������ ���, �̸� ��ȸ
 SELECT e.empno
       ,e.ename
  FROM emp e
 WHERE e.ename LIKE 'M%'
 ;
/*
EMPNO   ENAME
7654	MARTIN
7934	MILLER
*/

SELECT e.empno
       ,e.ename
  FROM emp e
 WHERE e.ename LIKE '__M%'--�����νĹ���_�� �ι� ����Ͽ� 
                          --M���ڸ��� 2���ڷ� ����.
 ;
 
 /*
 EMPNO   ENAME
 -----------------
 7900	JAMES
 */
 
 --�̸��� ��°�ڸ����� LA�� ���� �̸��� ���� ������
 -- ���, �̸� ��ȸ
 
 SELECT e.empno
       ,e.ename
  FROM emp e
 WHERE e.ename LIKE '_LA%'
 ;

/*
 EMPNO   ENAME
 ---------------
7698	BLAKE
7782	CLARK
*/

--������ ����� ����
INSERT INTO "SCOTT"."EMP"(EMPNO, ENAME, JOB) 
VALUES ('9999', 'J_JAMES', 'CLERK')
;
COMMIT;

INSERT INTO "SCOTT"."EMP"(EMPNO, ENAME, JOB) 
VALUES ('9999', 'J%JAMES', 'CLERK')
;
COMMIT;

-- �̸��� J_�� �����ϴ� ������ ����� �̸��� ��ȸ
-- : ��ȸ �Ϸ��� ���� �����νĹ���(%._)�� ����ִ� �����ʹ�
--   ��� ��ȸ�� ���ΰ�?

SELECT e.empno
       ,e.ename
  FROM emp e
 WHERE e.ename LIKE 'J_%'
 ;
 
 -- ==> ���۷� LIKE������ �ۼ��ϸ� j�Ϳ� ��� 1���ڰ� �ִ�
 --     �̸��� ���� ������ ��� �˻���. ���ϴ� ����� �ƴϴ�.
 --     ���� �νĹ��ڸ� ��ȸ�Ϸ��� ESCAPE�� ����ؾ� �Ѵ�.
 --     �����νĹ��ڸ� ��ȿȭ�Ϸ��� ESCAPE�� ����ؾ� �Ѵ�.
 
 SELECT e.empno
       ,e.ename
  FROM emp e
 WHERE e.ename LIKE 'J\_%' ESCAPE '\'
 
 ;
 
 -- 9999 J_JAMES
 --�̸��� J%�� �����ϴ� ������ ���, �̸� ��ȸ
 
 SELECT e.empno
       ,e.ename
  FROM emp e
 WHERE e.ename LIKE 'J\%%' ESCAPE '\'
 ;
 
 /*
 
 8888	J%JAMES
 */
 
 ----------------------
 -- NULL�� ���õ� ������ SQL ������ 
 --: IS NULL, IS NOT NULL
 
 --IS NULL: ���Ϸ� �ϴ� �÷��� ���� NULL�ϱ� true(��)
 --         ���Ϸ� �ϴ� �÷��� ���� NULL�� �ƴϸ� false(����)
 
 -- IS NOT NULL: ���Ϸ� �ϴ� �÷��� ���� NULL�� �ƴϸ� true
--               ���Ϸ� �ϴ¤� �÷��� ���� NULL�϶� false

--NULL���� ���� �÷��� �񱳿����� (=,!=,<>)�� ������ �Ұ����ϹǷ�
--NULL�� �񱳸� ���� �����ڰ� ���� �����Կ� ����!

--col=NULL ==> NULL�� ���ؼ��� (=)���Ϻ� �����ڸ� ������.
--col !=NULL
--col <> NULL ==> NULL�� ���ؼ��� 
--                �ٸ��� ���ϴ� ������ (!=, <>)�� ������.


--27) � ������ ���(mgr)�� �������� ���� ������ 
--              ���, �̸�, ����� ��ȸ

SELECT e.empno
     , e.ename
     , e.mgr
    FROM emp e
WHERE e. mgr = NULL -- NULL�����ʹ� �񱳿����ڷ�
                    -- ������ �� ���� ��
;

--����� ��� ��:0
--���� ������ �ǰ�� ������ ������ ��� �ùٸ� ����� �ƴ�.

SELECT e.empno
     , e.ename
     , e.mgr
    FROM emp e
WHERE e. mgr IS NULL -- NULL�����ʹ� IS NULL�����ڷ� ���ؾ� ��
;
/*
 EMPNO   ENAME    MGB
9999	J%JAMES	
7839	KING	
*/

-- ��簡 ������ ������ ��ȸ

SELECT e.empno
     , e.ename
     , e.mgr
    FROM emp e
WHERE e. mgr IS NOT NULL
;
--e.mgr !=NULL / e.mgr <> NULL
--��� �� �� ����, �ᵵ ���� ������ ���� ������ �Ǵ� �Ϳ� ����!
--�� ������ !=,<> ���� ���� �����
--����� ��� ��:0
--�̷� ��� ������ �Ǳ⶧���� ������ ã�� �����Ƿ�
-- null�����͸� �ٷ� �� �׻� �����ؾ��Ѵ�.


/*
EMPNO   ENAME    MGB

---------------------------
7369	SMITH	7902
7499	ALLEN	7698
7521	WARD	7698
7566	JONES	7839
7654	MARTIN	7698
7698	BLAKE	7839
7782	CLARK	7839
7844	TURNER	7698
7900	JAMES	7698
7902	FORD	7566
7934	MILLER	7782
*/


------------------------------
--BETWEEN a AND b :���� ���� �� ������
--a <= sal <=b : �̷��� ���� ����� ������ ���

--28)�޿��� 500~1200 ������ ������
--   ���, �̸�, �޿� whghl

SELECT e.empno
     , e.ename
     , e.sal
    FROM emp e
WHERE e.
;
--BETWEEN 500 AND 1200 ���� ����� ���� �񱳿����ڷ� ����

SELECT e.empno
     , e.ename
     , e.sal
    FROM emp e
WHERE e.sal >= 500
  AND e.sal <= 1200
;

/*

EMPNO   ENAME    SAL
-----------------------
7369	SMITH	800
7900	JAMES	950

*/