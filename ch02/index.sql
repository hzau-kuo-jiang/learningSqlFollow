show databases;

use sakila;

show tables;

select now();

show character set;

use learning_sql_follow;

create table person
(
    person_id   smallint unsigned,
    fname       varchar(20),
    lname       varchar(20),
    eye_color   enum ('BR', 'BL', 'GR'),
    birth_date  date,
    street      varchar(30),
    city        varchar(20),
    state       char(20),
    country     varchar(20),
    postal_code char(20),
    constraint pk_person primary key (person_id)
);

desc person;

create table favorite_food
(
    person_id smallint unsigned,
    food      varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_fav_food_person_id foreign key (person_id)
        references person (person_id)
);

desc favorite_food;

set foreign_key_checks = 0;
alter table person
    modify person_id smallint unsigned auto_increment;
set foreign_key_checks = 1;

insert into person (person_id, fname, lname, eye_color, birth_date)
values (null, 'William', 'Turner', 'BR', '1972-05-27');

select person_id, fname, lname, birth_date
from person;

select person_id, fname, lname, birth_date
from person
where lname = 'Turner';

insert into favorite_food (person_id, food)
values (1, 'pizza');
insert into favorite_food (person_id, food)
values (1, 'cookies');
insert into favorite_food (person_id, food)
values (1, 'nachos');

select food
from favorite_food
where person_id = 1
order by food;

select *
from favorite_food;

insert into person (person_id, fname, lname, eye_color, birth_date,
                    street, city, state, country, postal_code)
values (null, 'Susan', 'Smith', 'BL', '1975-11-02',
        '23 Maple St.', 'Arlington', 'VA', 'USA', '20220');

select person_id, fname, lname, birth_date
from person;

update person
set street     ='1225 Tremont St.',
    city='Boston',
    state='MA',
    country='USA',
    postal_code='02138'
where person_id = 1;

delete
from person
where person_id = 2;

update person
set birth_date=str_to_date('DEC-21-1980', '%b-%d-%Y')
where person_id = 1;

use sakila;
show tables;

use learning_sql_follow;
drop table favorite_food;
drop table person;
drop table corporation;

desc customer;