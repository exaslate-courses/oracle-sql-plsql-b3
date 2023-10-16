-- cursor.

DECLARE
    CURSOR toy_inventory_cur IS
    SELECT * FROM toy_inventory ORDER BY CREATED_DATE DESC;

    l_toy_inventory toy_inventory_cur%ROWTYPE;
BEGIN
    OPEN toy_inventory_cur;

    LOOP
    FETCH toy_inventory_cur INTO l_toy_inventory;
    EXIT WHEN toy_inventory_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(l_toy_inventory.MANUFACTURER_ID);
    END LOOP;

    CLOSE toy_inventory_cur;
END;
/