DECLARE
    TYPE nested_table_1 IS TABLE OF VARCHAR2(32);
    v_nested_table nested_table_1;
BEGIN
    v_nested_table := nested_table_1('Hello', 'World');
    
    FOR i IN 1..2
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_nested_table(i));
    END LOOP;
END;
/

DECLARE
    TYPE nested_table_1 IS TABLE OF VARCHAR2(32);
    v_nested_table nested_table_1;
BEGIN
    v_nested_table := nested_table_1('Hello', 'World');
    
    FOR i IN 1..v_nested_table.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_nested_table(i));
    END LOOP;
END;
/

-- VARRAY
DECLARE
    TYPE varray_type IS VARRAY(10) OF VARCHAR2(32);
    v_varray_1 varray_type := varray_type();
BEGIN
    v_varray_1.EXTEND(10);
    FOR i IN 1..v_varray_1.LIMIT
    LOOP
        v_varray_1(i) := 'Hi: ' || i;
    END LOOP;
    
    FOR i IN 1..v_varray_1.LIMIT
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_varray_1(i));
    END LOOP;
END;
/

-- Associative array
DECLARE
    TYPE planets_moons IS TABLE OF VARCHAR2(32) INDEX BY VARCHAR2(32);
    v_planets planets_moons;
    
    next_index VARCHAR2(32);
BEGIN
    v_planets('Earth') := 'Moon';
    
    next_index := v_planets.FIRST;
    WHILE next_index IS NOT NULL
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_planets(next_index));
        next_index := v_planets.NEXT(next_index);
    END LOOP;
END;
/

-- PROCEDURE
CREATE OR REPLACE PROCEDURE print_num_toys_available(p_id IN NUMBER)
IS
    l_num_available hr.toy_inventory%ROWTYPE;
BEGIN
    SELECT * INTO l_num_available FROM toy_inventory WHERE id=p_id;
    DBMS_OUTPUT.PUT_LINE(l_num_available.num_available);
END;
/

EXECUTE print_num_toys_available(3365599054);

-- FUNCTION
CREATE OR REPLACE FUNCTION tot_inventory
RETURN NUMBER
IS
    l_num_inventory NUMBER;
BEGIN
    SELECT COUNT(*) INTO l_num_inventory FROM toy_inventory;
    RETURN l_num_inventory;
END;
/

DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE(tot_inventory());
END;
/

SELECT * FROM toy_inventory;