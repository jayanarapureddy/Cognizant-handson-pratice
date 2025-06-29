-- Step 1: Create the customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER,
    interest_rate NUMBER(5,2)
);

-- Step 2: Insert sample data
INSERT INTO customers VALUES (1, 'Ravi', 65, 12.5);
INSERT INTO customers VALUES (2, 'Anita', 45, 11.0);
INSERT INTO customers VALUES (3, 'Suresh', 70, 13.0);

COMMIT;

-- Step 3: PL/SQL Block with Control Structure
DECLARE
    CURSOR senior_cursor IS
        SELECT customer_id, interest_rate
        FROM customers
        WHERE age > 60;
BEGIN
    FOR rec IN senior_cursor LOOP
        UPDATE customers
        SET interest_rate = rec.interest_rate - 1
        WHERE customer_id = rec.customer_id;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('1% interest discount applied to all senior citizens.');
END;
/

-- Step 4: View updated data
SELECT * FROM customers;
