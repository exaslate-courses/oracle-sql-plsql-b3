-- Cursor.
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

SELECT * FROM TOY_MANUFACTURER;

-- Cursor using parameters.
DECLARE
    CURSOR toy_manufacturer_cur(p_name VARCHAR2) IS
    SELECT * FROM toy_manufacturer WHERE name=p_name;

    l_toy_manufacturer toy_manufacturer_cur%ROWTYPE;
BEGIN
    OPEN toy_manufacturer_cur('Lego'); -- IMP: Make sure to send parameter value.

    LOOP
    FETCH toy_manufacturer_cur INTO l_toy_manufacturer;
    EXIT WHEN toy_manufacturer_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(l_toy_manufacturer.ID || ': ' || l_toy_manufacturer.NAME);
    END LOOP;

    CLOSE toy_manufacturer_cur;
END;
/

-- FOR loop with CURSOR.
DECLARE
    CURSOR toy_manufacturer_cur IS
    SELECT * FROM toy_manufacturer ORDER BY CREATED_DATE;

    l_toy_manufacturer toy_manufacturer_cur%ROWTYPE;
BEGIN
    OPEN toy_manufacturer_cur('Lego'); -- IMP: Make sure to send parameter value.

    LOOP
    FETCH toy_manufacturer_cur INTO l_toy_manufacturer;
    EXIT WHEN toy_manufacturer_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(l_toy_manufacturer.ID || ': ' || l_toy_manufacturer.NAME);
    END LOOP;

    CLOSE toy_manufacturer_cur;
END;
/