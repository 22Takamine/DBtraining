--grade��1����hometown�������̍i�荞�� ORDER BY �ŏ��� �~����DESC������
SELECT *    
FROM student
WHERE grade = 1 AND hometown = '����'
ORDER BY student_id
;

--like '%'�ł����܂�����
SELECT *
FROM student
WHERE grade = 1 OR student_name like '%�{'
ORDER BY student_id DESC
;

--major_id�œ����l�����l�ŃO���[�v�ɂ��A���̒���MAX�l���o���B
SELECT major_id, max(grade) AS max
FROM student
GROUP BY major_id
ORDER BY major_id
;

--GROUP BY�œ����o�g�n�ŃO���[�v�ɂ��Acount�ŃO���[�v���̐��𐔂���
--HAVUING��2�ȏ�̍i�荞�݂������AOREDER BY�ŕ��������������ɂ��Ă���B
SELECT hometown, count(hometown) AS count
FROM student
GROUP BY hometown
HAVING count(hometown) >= 2
ORDER BY hometown 
;

--FROM��1�ڂ̃e�[�u����,INNER JOIN��2�ڂ̃e�[�u�����w�肷��B
--ON�̕�����1�ڂ̃e�[�u���ƃJ�����ƁA2�ڂ̃e�[�u���̃J�������w�肵�A��������B
--AS s��student�Ə����̂��߂�ǂ��������߁B�܂��w�肵�Ȃ���2�̃e�[�u�������邽��
--�ǂꂩ���킩��Ȃ��BORDER BY��1�ڂŕ��ёւ��A2�ڂ́A���ёւ������œ���ւ��Ă����B
SELECT s.student_name, m.major_name
FROM student AS s
INNER JOIN major AS m
ON s.major_id = m.major_id
ORDER BY major_name, student_name
;

--
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student AS s
INNER JOIN major AS m
ON s.major_id = m.major_id
WHERE s.hometown != '����'
ORDER BY m.major_name, s.student_id
;

SELECT student_id, student_name, grade
FROM student
WHERE major_id = (  SELECT major_id
                    FROM major
                    WHERE major_name = '�p���w'
                  ) 
ORDER BY student_id
;

SELECT student_id, student_name, major_id
FROM student
WHERE major_id IN  (SELECT major_id--, count(major_id)
                    FROM student
                    GROUP BY major_id
                    HAVING count(major_id) >=3 
            )
ORDER BY major_id, student_id
;
                 

