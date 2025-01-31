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
