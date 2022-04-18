CREATE TABLE BOOK
(id INT PRIMARY KEY, book_name VARCHAR(50), company_id INT, price INT, book_date DATE, author_id INT)
;

CREATE TABLE COMPANY
(id INT PRIMARY KEY,name VARCHAR(50))
;

CREATE TABLE AUTHOR
(id INT PRIMARY KEY,name VARCHAR(50))
;

INSERT INTO BOOK
(id, book_name, company_id, price, book_date, author_id)
VALUES
(1001, '�l�R�̂Ђ݂�', 101, 600, '2018/1/1', 101)
,(1002, '���ɂ�������l', 101, 600, '2020/4/1', 101)
,(1003, '���̉�', 102, 1100, '2015/5/2', 102)
,(1004, '����', 102, 750, '2012/3/4', 103)
,(1005, '������', 102, 3850, '2019/2/18', 104)
,(1006, '���t', 101, 800, '2005/12/12', 104)
,(1007, '�����Ȃ����͂Ȃ�', 101, 1800, '1992/7/7', 105)
,(1008, '�����Ȃ��������', 102, 2530, '2001/9/4', 105)
;

INSERT INTO COMPANY
(id, name)
VALUES
(101, '�e�N�m�o��')
,(102, 'Axiz����')
;

INSERT INTO AUTHOR
(id, name)
VALUES
(101, '�����')
,(102, '�R�c���Y')
,(103, '��؎��Y')
,(104, '��v��q��')
,(105, '��c�O�Y')
;

SELECT *
FROM BOOK AS b
INNER JOIN COMPANY AS c
ON b.company_id = c.id
;

SELECT *
FROM BOOK AS b
INNER JOIN AUTHOR AS a
ON b.author_id = a.id
;

SELECT b
FROM BOOK AS b,COMPANY AS c, AUTHOR AS a
;
