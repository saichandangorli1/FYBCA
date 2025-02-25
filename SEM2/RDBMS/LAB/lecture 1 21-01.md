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
INSERT INTO cities VALUES ('Pune', 'MH'), ('Mumbai', 'MH'), ('Nagpur', 'MH');

-- Warehouses
INSERT INTO warehouses VALUES (1, 'Spares', 'Chinchwad', 'Pune'), (2, 'Electronics', 'Andheri', 'Mumbai'), (3, 'Books', 'Civil Lines', 'Nagpur');

-- Stores
INSERT INTO stores VALUES (101, 'Spares Pune', 'Pune', 1), (102, 'Spares Mumbai', 'Mumbai', 1), (201, 'Electronic Andheri', 'Mumbai', 2), (301, 'Book Nagpur', 'Nagpur', 3);

-- Items
INSERT INTO items VALUES (1, 'Wheel', 5.2, 250.00), (2, 'Wire', 1.0, 50.00); -- Add more items as needed

-- Customers
INSERT INTO customer VALUES (1, 'Mr. Joshi', '123 Main St', 'Pune'), (2, 'Ms. Patil', '456 Park Ave', 'Mumbai'), (3, 'Mr. Sharma', '789 High St', 'Pune');

-- Orders
INSERT INTO orders VALUES (1, '2013-10-03', 1), (2, '2013-10-03', 2), (3, '2013-10-05', 1), (4, '2013-10-03', 3);

```

## question

1. List the names of stores of ‘Spares’ warehouse, located at Pune.

```sql
 SELECT s.storename FROM stores s JOIN warehouses w ON s.wid = w.wid WHERE w.wname = 'Spares' AND w.city = 'Pune';
```

2. List the names of customers from Pune city, who have placed orders on 03-10-2013

```sql
 SELECT c.cname FROM customer c JOIN orders o ON c.cno = o.cno WHERE c.cu_city = 'Pune' AND o.odate = '2013-10-03';
```

3. List the orders placed by “Mr. Joshi”.

```sql
 select o.* from orders o inner join customer c on o.cno=c.cno where c.cname='Mr. Joshi';
```
