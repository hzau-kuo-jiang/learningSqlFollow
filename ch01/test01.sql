show databases;

create database learning_sql_follow;

use learning_sql_follow;

create table corporation
(
    corp_id smallint,
    name    varchar(30),
    constraint pk_corporation primary key (corp_id)
);

show tables;

insert into corporation (corp_id, name)
values (27, 'Acme Paper Corporation');

select name
from corporation
where corp_id = 27;