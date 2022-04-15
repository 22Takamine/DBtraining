
SELECT * FROM major
;

--�C���f�b�N�X�̍쐬
CREATE INDEX subject ON major(major_name)
;

CREATE INDEX name ON student(student_name)
;

CREATE INDEX g_name ON student(grade, student_name)
;

--SELECT tablename, indexname FROM pg_indexes;

--�r���[�̍쐬
CREATE VIEW v_student AS 
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student AS s
INNER JOIN major AS m
ON s.major_id = m.major_id
WHERE s.hometown != '����'
ORDER BY major_name,student_id
;

SELECT *
FROM v_student
;

DROP VIEW v_student
;

CREATE MATERIALIZED VIEW mv_student AS
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student AS s
INNER JOIN major AS m
ON s.major_id = m.major_id
WHERE s.hometown != '����'
ORDER BY major_name,student_id
;

SELECT * FROM mv_student

--�ō��݋��z��Ԃ��t�@���N�V���� 
CREATE OR REPLACE FUNCTION tax(price DECIMAL) RETURNS DECIMAL
 LANGUAGE plpgsql
AS $function$
declare

begin
    return price * 1.1;
end;
$function$
;

SELECT *, tax(amount) AS �J�������Ȃ�
FROM sales 
;


