|テーブル一覧| | | |
|:----|:----|:----|:----|
|No.|論理テーブル名|物理テーブル名|備考|
|1|company|public.company| |
|2|discount|public.discount| |
|3|goods|public.goods| |
|4|name|public.name| |
|5|pay|public.pay| |
|6|price|public.price| |
|7|receipt|public.receipt| |
|8|slip|public.slip| |
|9|staff|public.staff| |
|10|store|public.store| |
|11|store_code|public.store_code| |
|12|tax|public.tax| |

|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|:----|:----|:----|:----|:----|:----|:----|
|1|company_id|company_id|integer|Yes (PK)| | |
|2|company_name|company_name|character varying(50)|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|discount_id|discount_id|integer|Yes (PK)| | |
|2|discount|discount|integer|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|goods_id|goods_id|integer|Yes (PK)| | |
|2|goods_name|goods_name|character varying(50)|Yes| | |
|3|unit_price|unit_price|integer|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|name_id|name_id|integer|Yes (PK)| | |
|2|name|name|character varying(50)|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|pay_id|pay_id|integer|Yes (PK)| | |
|2|pay|pay|character varying(50)|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|price_id|price_id|integer|Yes (PK)| | |
|2|goods_id|goods_id|integer|Yes| | |
|3|amount|amount|integer|Yes| | |
|4|tax_id|tax_id|integer|Yes| | |
|5|discount_id|discount_id|integer|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|receipt_id|receipt_id|integer|Yes (PK)| | |
|2|price_id|price_id|integer|Yes| | |
|3|slip_id|slip_id|integer|Yes| | |
|4|pay_id|pay_id|integer|Yes| | |
|5|staff_id|staff_id|integer|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|slip_id|slip_id|integer|Yes (PK)| | |
|2|store_code|store_code|integer|Yes| | |
|3|day_date|day_date|date|Yes| | |
|4|reg_num|reg_num|integer|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|staff_id|staff_id|integer|Yes (PK)| | |
|2|store_code|store_code|integer|Yes| | |
|3|num|num|integer|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|store_id|store_id|integer|Yes (PK)| | |
|2|store_name|store_name|character varying(50)|Yes| | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|store_code|store_code|integer|Yes (PK)| | |
|2|company_id|company_id|integer|Yes| | |
|3|store_id|store_id|integer|Yes| | |
|4|place|place|character varying(80)|Yes| | |
|5|tell|tell|character varying(30)| | | |
|No.|論理名|物理名|データ型|Not Null|デフォルト|備考|
|1|tax_id|tax_id|integer|Yes (PK)| | |
|2|tax|tax|integer|Yes| | |


