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
 
select * from employees for update;

insert into employees values ('Pepe','Mestas',sec_employees.nextval,sysdate) ;
insert into employees values ('Mario','Bros',sec_employees.nextval,to_date('01012010','ddmmyyyy'));
insert into employees values ('Rosita','Sanchez',sec_employees.nextval,to_date('01012005','ddmmyyyy'));

---------------------------------------------------

alter table employees add salary number(10,2);
---------------------------------------------------

update employees set salary = employee_id * 1.1 * 1000;

select * from employees order by hire_date;

/*
Crear procedimiento almacenado ó bloque anonimo para aumentar el salario en 
10%, 20% ó 30% por fecha de antiguedad de contratacion de los empleados.
*/

create or replace procedure Increase_Salary(Id1 number, Id2 number, Id3 number) as
    percent number;
begin
    percent := 0.3;

    for employesList in (
        select * from employees where employee_id in (Id1, Id2, Id3) order by hire_date
    ) 
    loop
        update employees set salary = salary * (1 + percent) where employee_id = employesList.employee_id;
		percent := percent - 0.1;
    end loop;
end;
/

exec Increase_Salary(3,1,2);

select * from employees;

/*
1-1100 -> 1210
2-2200 -> 2640
3-3300 -> 4290
*/

