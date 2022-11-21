

--Rafay Khan ID 2346111

--A.
INSERT INTO Product
values(
58, -- id
580, -- category_id
'iPhone XS', --name
'Apple iPhone', --description
'https://www.ApplePics.com', --picture_url
1000, --price
200 -- stock_count
);

INSERT INTO Product
values(
68, --id
680, -- category_id
'light bulb', --name
'GE LED 100W Bulb', --description
'https://www.GEPics.com', --picture_url
8, --price
200 -- stock_count
);

INSERT INTO Product
values(
78, --id
780, -- category_id
'box of AA battery', --name
'Duracell AA 20 count / box', --description
'https://www.DuracellPics.com', --picture_url
20, --price
200 -- stock_count
);

--B.
INSERT INTO Customer
values(
105, --id
'company_address', --preferred_shipping
'Jason', --first_name
'Bourne', --last_name
'JB@gmail.com', --email
'Visa' --preferred_creditcard
);

--C.
INSERT INTO Address
values(
  512, --id home billing
  105, --customer_id
  1507, -- street
  'Miami', -- city
  'FL', -- state
  '33056' -- zip
);

INSERT INTO Address
values(
  513, --id company shipping
  105, --customer_id
  1567, -- street
  'Miami', -- city
  'FL', -- state
  '33423' -- zip
);

--D.

INSERT INTO CreditCard
values(
  713, --id
  512, --billing_address_id
  105, -- customer_id
  '123782784', -- number
  to_date('05/22/2015', 'mm/dd/yyyy'), -- expiration_date
  '675' -- cvv
);

INSERT INTO CreditCard
values(
  715, --id
  512, --billing_address_id
  105, -- customer_id
  '339482784', -- number
  to_date('07/22/2015', 'mm/dd/yyyy'), -- expiration_date
  '625' -- cvv
);

--E.
INSERT INTO ShoppingCartItem
values(
  395, --id
  58, --product_id
  105, -- customer_id
    1 -- quantity
);

INSERT INTO ShoppingCartItem
values(
  395, --id
  68, --product_id
  105, -- customer_id
    3 -- quantity
);

INSERT INTO ShoppingCartItem
values(
  395, --id
  78, --product_id
  105, -- customer_id
    4 -- quantity
);

--F.

INSERT INTO Order
values(
  294, --id
  105, --customer_id
  'Processing', --status
  '10/28/2017, 13:58', --create_time
  1567, -- shipping_street
  'Miami', -- city
  'FL', -- state
  '33423' -- zip
  1507, -- billing_street
  'Miami', -- city
  'FL', -- state
  '33056' -- zip
);

DELETE FROM ShoppingCartItem where customer_id = 105;

UPDATE Product
SET stock_count = 199
WHERE product_id = 58;

UPDATE Product
SET stock_count = 197
WHERE product_id = 68;

UPDATE Product
SET stock_count = 196
WHERE product_id = 78;

--G.
DELETE FROM Order
WHERE id in (
SELECT op.product_id FROM Order_Product op
INNER JOIN Order o ON op.order_id = o.id
WHERE op.product_name = 'iPhone XS');

UPDATE Product
SET stock_count = 200
WHERE product_id = 58;

--H. statement 1
SELECT status, create_time, card_number, card_expiration_date, shipping_street, shipping_city, shipping_state, shipping_zip, billing_street, billing_city, billing_state, billing_zip
FROM Order
WHERE order_id = 294;

--H. statement 2
SELECT product_name, quantity, product_price
FROM Order_Product op
INNER JOIN Order o on op.order_id = o.id;

--H. statement 3
select
	total_prod_price * total_quantity as total_order_cost
from (
select
	sum(product_price) as total_prod_price,
	sum(quantity) as total_quantity
from Order_Product op
inner join Order o on op.order_id = o.id
and o.custmer_id = 105 and op.order_id = 294) a;

--I.
UPDATE Order
SET status = 'completed'
WHERE id = 294;

ALTER TABLE Order READ ONLY
WHERE id = 294;

--J.
UPDATE Product
SET price = 10
WHERE id = 68;

--K.
UPDATE addr
SET street = 73954, city = 'Dearborn', state = 'MI', zip = 74394
FROM Address addr
INNER JOIN Customer c on addr.customer_id = c.id
WHERE addr.id = 512;

UPDATE cc
SET expiration_date = to_date('04/23/2020', 'mm/dd/yyyy')
FROM CreditCard cc
INNER JOIN Customer c on cc.customer_id = c.id
WHERE c.id = 713;

UPDATE cc
SET expiration_date = to_date('01/23/2020', 'mm/dd/yyyy')
FROM CreditCard cc
INNER JOIN Customer c on cc.customer_id = c.id
WHERE c.id = 715;

--L.
--Everything Works Good. Same output as H.
