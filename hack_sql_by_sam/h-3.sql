--procedemos a crear las tablas solicitadas

--TABLA #1 COUNTRIES

create table countries(
    id_country serial primary key,
    name VARCHAR (25) NOT NULL 
);

--TABLA #1 PRIORITIES

create table priorities(
    id_priority serial primary key,
    type_name VARCHAR (25) NOT NULL
);

--TABLA #1 CONTACT REQUEST

create table contact_request(
    id_email serial primary key,
    id_country INT,
    id_priority INT,
    foreign key(id_country) references countries(id_country),
    foreign key(id_priority) references priorities(id_priority),
    name VARCHAR (25),
    detail TEXT (100),
    physical_address VARCHAR (50)
);