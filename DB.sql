CREATE TABLE major(     --�e�[�u���쐬
major_id INT PRIMARY KEY
, major_name VARCHAR(50)
);

CREATE TABLE student(   --�e�[�u���쐬
student_id INT PRIMARY KEY
, student_name VARCHAR(50)
, grade INT
, hometown VARCHAR(50)
, major_id INT NOT NULL REFERENCES major(major_id)
);

INSERT INTO major       --major�ɒl��}��
(major_id, major_name)
VALUES
(1,'�p���w')
,(2,'���p�Ȋw')
,(3,'���H�w')
,(4,'�o�ϊw')
,(5,'���ە���')
;

INSERT INTO student     --student�ɒl��}��
(student_id,student_name,grade,hometown,major_id)
VALUES
(1,'�R�c',1,'�{��',1)
,(2,'�c��',1,'����',2)
,(3,'����',1,'����',3)
,(4,'���',2,'������',1)
,(5,'����',2,'�k�C��',2)
,(6,'�g�c',2,'����',1)
,(7,'�ɓ�',3,'������',2)
,(8,'�R�{',3,'�_�ސ�',3)
,(9,'�X�{',4,'����',4)
,(10,'�g��',4,'�_�ސ�',5)
;

SELECT * FROM student WHERE grade = 1           --student��grade�̒l���P��\��
;

SELECT * FROM student WHERE hometown = '����'     --student��hometown�̒l��������\��
;

SELECT major_name FROM major                    --major��major_name�݂̂�\��
;

UPDATE student SET grade = 3 WHERE student_id = 10      --student��student_id��10�̃��R�[�h��grade��3�ɍX�V
;

SELECT * FROM student --�X�V�̊m�F
;

DELETE FROM student WHERE student_id = 10               --student��student_id��10�̃��R�[�h���폜
;

SELECT * FROM student --�X�V�̊m�F


 
