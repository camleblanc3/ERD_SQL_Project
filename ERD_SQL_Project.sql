create table cars(
car_id serial primary key,
vin VARCHAR(21),
make VARCHAR(120),
model VARCHAR(120),
color VARCHAR(120),
years VARCHAR(120)
);

create table parts_inventory(
part_id serial primary key,
part_name VARCHAR(120),
brand VARCHAR(120)
);

create table mechanics(
mechanic_id serial primary key,
first_name VARCHAR(120),
last_name VARCHAR(120)
);

create table sales_people(
salesperson_id serial primary key,
first_name VARCHAR(120),
last_name VARCHAR(120)
);

create table customer(
customer_id serial primary key,
first_name VARCHAR(120),
last_name VARCHAR(120),
email VARCHAR(120),
phone integer,
car_id integer,
foreign key(car_id) references cars(car_id)
);

create table invoice(
invoice_id serial primary key,
invoice_date date default current_date,
invoice_price numeric(8,2),
car_id integer,
foreign key(car_id) references cars(car_id),
salesperson_id integer,
foreign key(salesperson_id) references sales_people(salesperson_id) 
);

create table service_ticket(
service_id serial primary key,
service_date date default current_date,
service_done VARCHAR(120),
service_price numeric(8,2),
car_id integer,
foreign key(car_id) references cars(car_id),
part_id integer,
foreign key(part_id) references parts_inventory(part_id)
);

create table mechanic_service(
service_id integer,
foreign key(service_id) references service_ticket(service_id),
mechanic_id integer,
foreign key(mechanic_id) references mechanics(mechanic_id)
);

insert into cars(vin,make,model,color,years)
values 
('4A3AK24FX6E028812', 'Mitsubishi', 'Eclipse', 'Red', 2006),
('JHMWD5523DS022721', 'Honda', 'Civic', 'Silver', 1983),
('5XYKUDA21DG367493', 'KIA', 'Sorento', 'Blue', 2013),
('3C3CFFER6CT225038', 'Fiat', '500', 'Black', 2012);

insert into customer(first_name,last_name,email,phone,car_id)
values 
('Russell', 'Westbrook', 'russwest@yahoo.com', 5555555, 1),
('Chris', 'Paul', 'cp3@gmail.com', 5555555, 2),
('Zach', 'Lavine', 'zlavine@yahoo.com', 5555555, 3),
('Paul', 'George', 'pg13@gmail.com', 5555555, 4);


