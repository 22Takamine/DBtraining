CREATE TABLE customer(      --�e�[�u���̍쐬
customer_id INT PRIMARY KEY
,customer_name VARCHAR(50)
);

CREATE TABLE sales(         --�e�[�u���̍쐬
sales_id INT PRIMARY KEY
,order_date DATE
,customer_id INT NOT NULL REFERENCES customer(customer_id)
,amount DECIMAL
);

INSERT INTO customer        --customer�ɒl��ǉ�
(customer_id, customer_name)
VALUES
(1,'�c��')
,(2,'���')
,(3,'�c��')
,(4,'�c��')
;

INSERT INTO sales           --sales�ɒl��ǉ�
(sales_id, order_date, customer_id, amount)
VALUES
(1, '2018/11/1', 1, 3000)
,(2, '2018/10/01', 3, 5000)
,(3, '2018/10/01', 4, 6000)
,(4, '2018/11/02', 2, 2000)
,(5, '2018/11/15', 2, NULL)
;

SELECT * FROM sales         --sales�̃e�[�u�����m�F
;

--ALTER TABLE sales RENAME COLUMN order_data TO order_date ;    �C���O order_data �C���� order_date  order_date���X�y���~�X�����ׁA�ύX���s�����B

SELECT * FROM sales WHERE amount < 5000     --amount�̒l��5000������\��
;

SELECT * FROM sales WHERE amount >= 5000    --amount�̒l��5000�ȏ��\��
;

SELECT *, amount * 1.1 FROM sales           --sales�̒l�̂ق���amount��1.1���|�����l��\��
;

SELECT * FROM sales WHERE amount IS NOT NULL    --NULL�͔�ׂ��Ȃ��̂�IS NOT���g�p����BIS���Ɠ����ێg�p����B
;                                               --sales��NULL�ȊO��\������

SELECT * FROM customer WHERE customer_name != '�c��'  --customer�̓c���ȊO��\�� �������Ȃ��ꍇ��<>��!=���g�p����B
;

UPDATE sales SET order_date = '2018/11/05', customer_id = 4 WHERE sales_id = 4  --�l���X�V����B2018/11/05��customer_id���X�V
;

SELECT * FROM sales             --�X�V���m�F
;

DELETE FROM sales WHERE amount IS NULL      --NULL�������Ă��郌�R�[�h�̍폜
;

SELECT * FROM sales             --�X�V���m�F
;


