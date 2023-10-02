drop table user_country_codes;
/

create table user_country_codes(
    id number not null,
    country_code_3 char(3) not null,
    country_code_2 varchar2(3) not null,
    country_name varchar2(50) null,
    num_states number(2) null,
    population number(10) null
);
/

insert into user_country_codes(id, country_code_3, country_code_2, country_name, num_states, population)
values(1, 'USA', 'US', 'United States', 50, 350000000);
/

declare
    c_g CONSTANT NUMBER := 9.81;
    c_pi CONSTANT NUMBER NOT NULL DEFAULT 3.1413;
    v_country_code_3 user_country_codes.country_code_3%TYPE;
    v_country_code_2 char(3);
begin
    select country_code_3, country_code_2 into v_country_code_3, v_country_code_2 from user_country_codes where country_code_2='US';
    dbms_output.put_line('country_code_3 = ' || v_country_code_3);
    dbms_output.put_line('country_code_2 = ' || v_country_code_2);
    dbms_output.put_line('c_g = ' || c_g);
    dbms_output.put_line('c_pi = ' || c_pi);
end;
/

-- Bind variables
VARIABLE v_b_1 NUMBER;
EXEC :v_b_1 := 100;

declare
    c_g CONSTANT NUMBER := 9.81;
    c_pi CONSTANT NUMBER NOT NULL DEFAULT 3.1413;
    v_country_code_3 user_country_codes.country_code_3%TYPE;
    v_country_code_2 char(3);
begin
    select country_code_3, country_code_2 into v_country_code_3, v_country_code_2 from user_country_codes where country_code_2='US';
    dbms_output.put_line('country_code_3 = ' || v_country_code_3);
    dbms_output.put_line('country_code_2 = ' || v_country_code_2);
    dbms_output.put_line('c_g = ' || c_g);
    dbms_output.put_line('c_pi = ' || c_pi);

    -- bind variable
    :v_b_1 := 101;
    DBMS_OUTPUT.PUT_LINE('v_b_1 = ' || :v_b_1);
end;
/

DECLARE
    v_1 NUMBER := 100;
BEGIN
    IF v_1 < 1000 THEN
        DBMS_OUTPUT.PUT_LINE('v_1 is < 1000');
    END IF;
END;
/

DECLARE
    v_1 NUMBER := 100;
BEGIN
    IF v_1 < 1000 THEN
        DBMS_OUTPUT.PUT_LINE('v_1 is < 1000');
    ELSIF v_1 > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('v_1 is > 1000');
    END IF;
END;
/

DECLARE
    v_inc NUMBER := 100;
    v_value NUMBER;
BEGIN
    LOOP
        v_inc := v_inc + 1;
        v_value := v_inc * 10;

        IF v_inc > 5 THEN
            EXIT;
        END IF;
        -- EXIT WHEN v_inc > 5;
    END LOOP;
END;
/