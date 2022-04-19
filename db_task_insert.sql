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
(1,'日本橋店')
,(2,'東京駅店')
,(3,'スカイツリー店')
;

INSERT INTO name
(name_id, name)
VALUES
(1,'店長')
,(2,'山田')
,(3,'西岡')
,(4,'吉田')
,(5,'富岡')
,(6,'ヘルプ')
,(7,'新人')
;

INSERT INTO goods
(goods_id, goods_name, unit_price)
VALUES
(1,'コカ・コーラ',130)
,(2,'CCレモン',120)
,(3,'いろはす天然水',100)
,(4,'プリン',180)
,(5,'コアラのマーチ',200)
,(6,'唐揚げ弁当',500)
,(7,'ツナマヨおにぎり',150)
,(8,'ファブリーズ',400)
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
(1,'現金')
,(2,'クレジット')
,(3,'paypay')
,(4,'EDY')
;

INSERT INTO store_code
(store_code, company_id, store_id, place, tell)
VALUES
(1001, 1, 1, '東京都中央区日本橋1-1-1','03-111-2222')
,(1002, 1, 2, '東京都千代田区丸の内1-1-1' ,'03-111-4523')
,(1003, 1, 3, '東京都墨田区押上1-1-1', '03-111-4587')
,(2001, 2, 1, '東京都中央区日本橋2-4-1', '05-152-1422')
,(3001, 3, 1, '東京都中央区日本橋4-5-1', '08-144-4785')
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

