

--Rafay Khan ID 2346111

CREATE TABLE ShoppingCartItem
(
id	number,
product_id number,
customer_id number,
quantity id number
PRIMARY KEY (id),
FOREIGN KEY (product_id) REFERENCES Product(id),
FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE Address
(
id number,
customer_id number,
street number,
city varchar(100),
state varchar (100),
zip number,
PRIMARY KEY (id),
FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE CreditCard
(
id number,
billing_address_id number,
customer_id number,
number number,
expiration_date date,
cvv number,
PRIMARY KEY (id),
FOREIGN KEY (billing_address_id) REFERENCES Address(id),
FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE Customer
(
id number NOT NULL,
preferred_shipping varchar(100),
first_name varchar(100),
last_name varchar(100),
email varchar(100),
preferred_creditcard varchar(100),
PRIMARY KEY (id),
FOREIGN KEY (preferred_shipping) REFERENCES Address(id),
FOREIGN KEY (preferred_creditcard) REFERENCES CreditCard(id)
);

CREATE TABLE Order
(
  id number,
  customer_id number,
  status varchar(100),
  create_time varchar(100),
  shipping_street varchar(100),
  shipping_city varchar(100),
  shipping_state varchar(100),
  shipping_zip varchar(100),
  billing_street varchar(100),
  billing_city varchar(100),
  billing_state varchar(100),
  billing_zip varchar(100),
  card_number number,
  card_expiration_date date,
  card_cvv number,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE Product
(
  id number,
  category_id number,
  name varchar(100),
  description varchar(100),
  picture_url varchar(100),
  price number,
  stock_count number,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Order_Product
(
  id number,
  order_id number,
  product_id number,
  quantity number,
  product_price number,
  product_name varchar(100)
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES Order(id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Category
(
  id number,
  parent_category_id number,
  name varchar(100),
  PRIMARY KEY (name),
  FOREIGN KEY (parent_category_id) REFERENCES Category(id),
);

CREATE TABLE Product_Supplier
(
  id number,
  product_id number,
  supplier_id number,
  supply_price number,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES Product(id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Supplier
(
  id number,
  name varchar(100),
  PRIMARY KEY (id)
);
