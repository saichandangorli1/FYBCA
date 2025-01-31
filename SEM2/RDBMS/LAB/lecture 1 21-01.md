<!-- ```sql
CREATE TABLE cities (
    city CHAR(20),
    state CHAR(20)
);

CREATE TABLE warehouses (
    wid INTEGER,
    wname CHAR(30),
    location CHAR(20)
);

CREATE TABLE stores (
    sid INTEGER,
    store_name CHAR(20),
    location_city CHAR(20),
    wid INTEGER
);

CREATE TABLE items (
    itemno INTEGER,
    description TEXT,
    weight DECIMAL(5,2),
    cost DECIMAL(5,2)
);

CREATE TABLE customer (
    cno INTEGER,
    cname CHAR(50),
    addr VARCHAR(50),
    cu_city CHAR(20)
);

CREATE TABLE orders (
    ono INT,
    odate DATE
);
``` -->

- **_In one line format :_**

```sql
create table cities(city char(20) primary key, state char(20));

create table warehouses(wid int primary key, wname char(30), location char(50),city char(20) references cities(city));

 create table stores (sid int primary key, storename char(20), location_city char(20), wid int references warehouses(wid));

create table items (itemno int primary key, description text, weight decimal(5,2), cost decimal(5,2));

create table customer(cno int primary key, cname char(50), addr varchar(50), cu_city char(20));

create table orders(ono int primary key, odate date,cno int references customer(cno));
```

- **_Added Table :_**

```sql

create table item_order(itemno int references items(itemno),ono int references orders(ono),ordered_quantity int);

create table store_item(sid int references stores(sid),itemno int references items(itemno),quantity int);
```

- **_Data For Tables :_**

```sql
-- Cities
INSERT INTO cities VALUES ('pune', 'mh'), ('mumbai', 'mh'), ('nagpur', 'mh');

-- Warehouses
INSERT INTO warehouses VALUES (1, 'spares', 'chinchwad', 'pune'), (2, 'electronics', 'andheri', 'mumbai'), (3, 'books', 'civil lines', 'nagpur');

-- Stores
INSERT INTO stores VALUES (101, 'spares pune', 'pune', 1), (102, 'spares mumbai', 'mumbai', 1), (201, 'electronic andheri', 'mumbai', 2), (301, 'book nagpur', 'nagpur', 3);

-- Items
INSERT INTO items VALUES (1, 'wheel', 5.2, 250.00), (2, 'wire', 1.0, 50.00); -- Add more items as needed

-- Customers
INSERT INTO customer VALUES (1, 'mr. joshi', '123 main st', 'pune'), (2, 'ms. patil', '456 park ave', 'mumbai'), (3, 'mr. sharma', '789 high st', 'pune');

-- Orders
INSERT INTO orders VALUES (1, '2013-10-03', 1), (2, '2013-10-03', 2), (3, '2013-10-05', 1), (4, '2013-10-03', 3);

```
