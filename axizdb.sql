
 -- �e�[�u���폜
-- drop table company;
-- drop table student;

-- ���
create table company(
    id int primary key
    , name varchar(50)
    , short_name varchar(20)
);

-- ���C��
create table student (
    id int primary key
    , name varchar(30)
    , kana varchar(30)
    , gender int -- ���� 1�F�j���A2�F����s
    , company_id int
    , pg_score int -- PG�̃X�R�A
    , db_score int -- DB�̃X�R�A
);

-- company�f�[�^�o�^
insert into company(id, name, short_name)
values 
(1, '�������ABC', 'ABC')
, (2, 'EFG�������', 'EFG')
, (3, '�������HIJ', 'HIJ')
, (4, '�������KLM', 'KLM')
;

insert into student values(1,'���� �ꂢ��','�N���L ���C�i',2,1,round(random() * 100), round(random() * 100))
insert into student values(2,'���� �ՎO','�R�W�} �^�C�]�E',1,1,round(random() * 100), round(random() * 100));
insert into student values(3,'�V�� �ޏ���','�T�C�g�E �i�I�~',2,1,round(random() * 100), round(random() * 100));
insert into student values(4,'�y�� ���s','�c�`�� �J�c���L',1,1,round(random() * 100), round(random() * 100));
insert into student values(5,'���R ���K','�������} �i�I���L',1,1,round(random() * 100), round(random() * 100));
insert into student values(6,'���i �h���q','�}�c�i�K �G���R',2,1,round(random() * 100), round(random() * 100));
insert into student values(7,'�c�� �t��','�^�i�x �n���~',2,1,round(random() * 100), round(random() * 100));
insert into student values(8,'��� �p��','�e�d�J �G�C�]�E',1,1,round(random() * 100), round(random() * 100));
insert into student values(9,'���� �k��','���i�M�T�� �R�E�X�P',1,1,round(random() * 100), round(random() * 100));
insert into student values(10,'���c ���Y','�j�V�^ �V�Y�I',1,1,round(random() * 100), round(random() * 100));
insert into student values(11,'�n�� �����Y','���^�i�x �P�T�I',1,2,round(random() * 100), round(random() * 100));
insert into student values(12,'���� �I�q','�Z�g �g�V�R',2,2,round(random() * 100), round(random() * 100));
insert into student values(13,'���c ���v','�X�M�^ �X�~�I',1,2,round(random() * 100), round(random() * 100));
insert into student values(14,'�R�{ ����','���}���g �Z�C�i',2,2,round(random() * 100), round(random() * 100));
insert into student values(15,'�� �~�q','�n�� �W�����R',2,2,round(random() * 100), round(random() * 100));
insert into student values(16,'�R�� ���L','���}�E�` �i�I�q��',1,3,round(random() * 100), round(random() * 100));
insert into student values(17,'�{�� �h��','�~���E�` ���V�}�T',1,3,round(random() * 100), round(random() * 100));
insert into student values(18,'�ѓc �^��','�n���V�_ �}�L',2,3,round(random() * 100), round(random() * 100));
insert into student values(19,'�쌴 �e�q','�J���n�� �L�N�R',2,5,round(random() * 100), round(random() * 100));
insert into student values(20,'��� ���₩','�I�I�C�V �T���J',2,5,round(random() * 100), round(random() * 100));

SELECT * FROM student
;

SELECT * FROM company
;

SELECT 'aaa',10
;

-- �l�����Z
SELECT 10 + 20, 100 - 50, 10 * 10, 10 / 2
;

-- �G�C���A�X AS�͏ȗ��\
SELECT 
name ��Ɩ�
, short_name AS ����
FROM company
;

-- �֐�
-- MySQL�̏ꍇ
select name, pg_score, db_score
, (pg_score + db_score) ���v
, truncate((pg_score + db_score) / 2, 0) ����
from student;

-- PostgreSQL�̏ꍇ        --�����_��؂�̂Ă���truncate�֐��y��trunc�֐����g�p���Ă��܂�
select name, pg_score, db_score
, (pg_score + db_score) ���v
, trunc((pg_score + db_score) / 2, 0) ����
from student
;

-- CASE��
SELECT name
, CASE 
     WHEN gender = 1 THEN '�j��'
     WHEN gender = 2 THEN '����'
     ELSE '���̑�'
END ����
FROM student;

-- ORDER BY�i�����j
SELECT name, pg_score
FROM student
ORDER BY pg_score;

-- ORDER BY�i�~���j
SELECT name, pg_score
FROM student
ORDER BY pg_score DESC;

-- ORDER BY�i�����j��������
SELECT *
FROM student
ORDER BY company_id, pg_score;

-- ORDER BY�ipg_score�̍~���Adb_score�̏����j
SELECT name, pg_score, db_score
FROM student
ORDER BY pg_score DESC, db_score;

-- �W��֐� ���O�͎g���Ȃ����AMAX�Ȃǂɓ���邱�Ƃŕ����R�[�h�Ŕ��f����
SELECT
sum(pg_score) ���v, avg(pg_score) ����
, max(pg_score) �ō�, min(pg_score) �Œ�
, count(*) ����   --count�͉�����Ă��ǂ����ANULL���Ɛ������Ȃ����Ƃ�����̂ŁA�����*��t����
FROM student;

-- �W��֐�
SELECT
gender
, sum(pg_score) PG���v
, avg(pg_score) PG����
FROM student
GROUP BY gender;

-- �W��֐�
SELECT
company_id
, sum(pg_score) PG���v
, avg(pg_score) PG����
FROM student
GROUP BY company_id
ORDER BY company_id;

-- ����
SELECT s.name AS s_name    --.�ŕʖ��̎w��ł���
, c.name AS c_name          --join�������ď������ƂŌ������Ă��邩���킩��₷���Ȃ�B
FROM student AS s
INNER JOIN company AS c
ON s.company_id = c.id;

SELECT student.name, company.name
FROM student, company
WHERE student.company_id = company.id;

-- ���O������
SELECT s.name s_name
, c.name c_name
FROM student s
LEFT OUTER JOIN company c
ON s.company_id = c.id
WHERE s.company_id IN (3, 4, 5);

--�N���X���� ���ׂĂ̑g�ݍ��킹��\��
SELECT *
FROM student,company;

-- �T�u�N�G��
select name, company_id
from student
where company_id = (SELECT id 
                    FROM company
                    WHERE short_name = 'ABC');

select name, company_id     --id = 1���Ƃ킩��ɂ������A��Ж��Ō����ł���
from student
where company_id = 1;

-- �T�u�N�G��                --�����̒l�́AIN
SELECT name, company_id
FROM student
WHERE company_id IN
                    (SELECT id 
                    FROM company 
                    WHERE name like '�������%');

-- ���փT�u�N�G��               �O���Ő錾�����G�C���A�X�͓����Ŏg�p�ł���     
select name, company_id
from student s
where exists (SELECT id 
                FROM company
                WHERE short_name = 'ABC'
                AND id = s.company_id);

-- ���փT�u�N�G��
SELECT 
   (SELECT name  
    FROM company 
    WHERE id = s.company_id) ��Ɩ�
, s.name
FROM student s;


SELECT c.name, s.pg_avg
FROM company c
-- �C�����C���r���[
JOIN (SELECT company_id,
          avg(pg_score) pg_avg
          FROM student 
          GROUP BY company_id) s
ON c.id = s.company_id;


-- UNION            �d���������邪�A��x���ёւ���̂ŁA�����͒x���Ȃ�B
SELECT 1 id, 'aaa' name
UNION 
SELECT 1, 'aaa';

-- UNION ALL        �d�����_�C�W���u
SELECT 1 id, 'aaa' name
UNION  ALL
SELECT 2, 'aaa';

-- company�e�[�u��������company_backup�e�[�u�����쐬
-- �e�[�u�����쐬�����Ɠ����ɁA�f�[�^���o�^�����
CREATE TABLE company_backup as SELECT * FROM company;

-- ��U�f�[�^���폜
DELETE FROM company_backup;

-- company�e�[�u���̃f�[�^��company_backup��INSERT
INSERT INTO company_backup SELECT * FROM company;

    



