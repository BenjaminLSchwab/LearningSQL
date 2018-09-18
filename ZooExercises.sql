use db_zoo;

select * from tbl_habitat;
-- drill 1


select species_name from tbl_species
	where species_order = 3
;
-- drill 2


select nutrition_type from tbl_nutrition
	where nutrition_cost < 600
;
-- drill 3


select species_name from tbl_species
	where species_nutrition between 2202 and 2206
;
-- drill 4


select species_name as 'Species Name:', nutrition_type as 'Nutrition Type:' from tbl_species
	INNER JOIN tbl_nutrition on tbl_species.species_nutrition = tbl_nutrition.nutrition_id
;
-- drill 5


select specialist_fname, specialist_lname, specialist_contact
	from ((tbl_specialist 
		inner join tbl_care on tbl_specialist.specialist_id = tbl_care.care_specialist) 
		inner join tbl_species on tbl_species.species_care = tbl_care.care_id)
		where tbl_species.species_name = 'penguin'
;
-- drill 6


create database db_hotdog_cart;
use db_hotdog_cart;


create table tbl_dogs(
	dog_id int identity(1,1) primary key,
	dog_name varchar(15) not null,
	dog_topping varchar(50) not null,
	dog_price money not null
);

create table tbl_customers(
	customer_id int identity(1,1) primary key,
	customer_name varchar(30) not null,
	customer_fav_dog int not null,
	customer_dogs_consumed int not null 
);


insert into tbl_dogs (dog_name, dog_topping, dog_price) values(
	'classic',
	'mustard',
	3
);

insert into tbl_dogs (dog_name, dog_topping, dog_price) values(
	'speciality',
	'onions, pickles, mustard',
	4
);

insert into tbl_dogs (dog_name, dog_topping, dog_price) values(
	'german',
	'sauerkraut, mustard',
	4
);

insert into tbl_dogs (dog_name, dog_topping, dog_price) values(
	'the works',
	'mustard, ketchup, onions, pickes, sauerkraut',
	5
);


insert into tbl_customers (customer_name, customer_fav_dog, customer_dogs_consumed) values(
	'garry',
	2,
	3
);

insert into tbl_customers (customer_name, customer_fav_dog, customer_dogs_consumed) values(
	'larry',
	1,
	5
);

insert into tbl_customers (customer_name, customer_fav_dog, customer_dogs_consumed) values(
	'jerry',
	3,
	4
);

insert into tbl_customers (customer_name, customer_fav_dog, customer_dogs_consumed) values(
	'trent',
	4,
	13
);

insert into tbl_customers (customer_name, customer_fav_dog, customer_dogs_consumed) values(
	'dog lord',
	4,
	27
);


select tbl_customers.customer_name as 'Name', tbl_dogs.dog_name as 'Favorite Dog', tbl_customers.customer_dogs_consumed as 'Dogs Consumed' 
	from tbl_customers inner join tbl_dogs on tbl_customers.customer_fav_dog = tbl_dogs.dog_id
	order by tbl_customers.customer_dogs_consumed desc
;

select * from tbl_customers;
select * from tbl_dogs;






