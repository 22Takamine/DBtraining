INSERT INTO company
(company_id, company_name)
VALUES
(1,'LonelyMart')
,(2,'WANSON')
,(3,'nana-zyuiti')
;

INSERT INTO store
(store_id, store_name)
VALUES
(1,'���{���X')
,(2,'�����w�X')
,(3,'�X�J�C�c���[�X')
;

INSERT INTO name
(name_id, name)
VALUES
(1,'�X��')
,(2,'�R�c')
,(3,'����')
,(4,'�g�c')
,(5,'�x��')
,(6,'�w���v')
,(7,'�V�l')
;

INSERT INTO goods
(goods_id, goods_name, unit_price)
VALUES
(1,'�R�J�E�R�[��',130)
,(2,'CC������',120)
,(3,'����͂��V�R��',100)
,(4,'�v����',180)
,(5,'�R�A���̃}�[�`',200)
,(6,'���g���ٓ�',500)
,(7,'�c�i�}�����ɂ���',150)
,(8,'�t�@�u���[�Y',400)
;

INSERT INTO tax
(tax_id, tax)
VALUES
(1,5)
,(2,8)
,(3,10)
;

INSERT INTO discount
(discount_id, discount)
VALUES
(0,0)
,(1,10)
,(2,20)
,(3,30)
,(4,40)
,(5,50)
,(6,60)
,(7,70)
,(8,80)
,(9,90)
,(10,100)
,(20,200)
,(30,300)
;

INSERT INTO pay
(pay_id, pay)
VALUES
(1,'����')
,(2,'�N���W�b�g')
,(3,'paypay')
,(4,'EDY')
;

INSERT INTO store_code
(store_code, company_id, store_id, place, tell)
VALUES
(1001, 1, 1, '�����s��������{��1-1-1','03-111-2222')
,(1002, 1, 2, '�����s���c��ۂ̓�1-1-1' ,'03-111-4523')
,(1003, 1, 3, '�����s�n�c�扟��1-1-1', '03-111-4587')
,(2001, 2, 1, '�����s��������{��2-4-1', '05-152-1422')
,(3001, 3, 1, '�����s��������{��4-5-1', '08-144-4785')
;

INSERT INTO slip
(slip_id, store_code, day_date, reg_num)
VALUES
(00000001, 1001, '2022/04/01', 1)
,(00000002, 1002, '2022/04/01', 1)
,(00000003, 1003, '2022/04/01', 1)
;

INSERT INTO staff
(staff_id, store_code, num)
VALUES
(001,1001, 1)
,(002, 1001, 2)
,(003, 1001, 3)
;

INSERT INTO price
(price_id, goods_id, amount, tax_id, discount_id)
VALUES
(0001, 1, 1, 2,0)
,(0002, 2, 1, 2,1)
,(0003, 3, 1, 2,0)
,(0004, 8, 1, 3,0)
;

INSERT INTO receipt
(receipt_id, price_id, slip_id, pay_id, staff_id)
VALUES
(000001, 0001, 00000001, 1,1)
,(000002, 0002, 00000001, 1,1)
,(000003, 0003, 00000001, 1,1)
,(000004, 0004, 00000001, 1,1)
;

