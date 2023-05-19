create table employees (
    first_name varchar2(20),
    last_name varchar2(20),
    employee_id number,
    hire_date date
);

create sequence sec_employees
    maxvalue 999999
    increment by 1
    nocycle;

insert into employees values ('Pepe','Mestas',sec_employees.nextval,sysdate) ;
insert into employees values ('Mario','Bros',sec_employees.nextval,to_date('01012010','ddmmyyyy'));
insert into employees values ('Rosita','Alarcón',sec_employees.nextval,to_date('01012015','ddmmyyyy'));
insert into employees values ('Pedro','Zapata',sec_employees.nextval,to_date('01012005','ddmmyyyy'));
insert into employees values ('Marco','Andrich',sec_employees.nextval,to_date('01012011','ddmmyyyy'));
insert into employees values ('Andy','Zimmerman',sec_employees.nextval,to_date('01082005','ddmmyyyy'));

---------------------------------------------------

alter table employees add salary number(10,2);
update employees set salary = employee_id * 1.1 * 1000;

/*
Mostrar los datos: nombre, apellido y salario del empleado cuyo primera letra del apellido sea mas proxima a A y mas proxima a Z
*/

create or replace procedure Show_Employees is
    v_first_name employees.first_name%type;
    v_last_name employees.last_name%type;
    v_salary employees.salary%type;
begin
    select first_name, last_name, salary into v_first_name, v_last_name, v_salary
    	from employees where last_name = (select MIN(last_name) from employees where last_name >= 'A');

    DBMS_OUTPUT.PUT_LINE('Closest to "A": ' || v_first_name || ' ' || v_last_name || ', ' || v_salary || ' $' );

    select first_name, last_name, salary into v_first_name, v_last_name, v_salary
    	from employees where last_name = (select MIN(last_name) from employees where last_name >= 'Z');

    DBMS_OUTPUT.PUT_LINE('Closest to "Z": ' || v_first_name || ' ' || v_last_name || ', '  || v_salary || ' $' );
end;
/

exec Show_Employees;