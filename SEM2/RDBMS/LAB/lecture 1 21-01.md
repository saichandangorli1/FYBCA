```sql
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
```

- **_In one line format :_**

```sql
create table cities (city char(20), state char(20));
create table warehouses (wid integer, wname char(30), location char(20));
create table stores (sid integer, store_name char(20), location_city char(20), wid integer);
create table items (itemno integer, description text, weight decimal(5,2), cost decimal(5,2));
create table customer (cno integer, cname char(50), addr varchar(50), cu_city char(20));
create table orders (ono int, odate date);
```
