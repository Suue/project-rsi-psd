-- Creating tables

create table user(
mac varchar(18) not null,
name varchar(40),
email varchar(40) not null,
password varchar(128) not null,
birth_date date not null,
is_deaf tinyint not null,
patience_level tinyint,

primary key(mac));

create table user_location(
id int not null auto_increment,
user_mac varchar(18) not null,
lat double not null,
lng double not null,
ts date not null,

primary key (id),
foreign key (user_mac) references user (mac));

create table animal_species(
id int not null auto_increment,
name varchar(40) not null,

primary key (id));

create table cage(
id int not null auto_increment,
name varchar(40),
animal_species_id int not null,

primary key (id),
foreign key (animal_species_id) references animal_species (id));

create table collector(
id int not null auto_increment,
cage_id int not null,
name varchar(40) not null,
lat double not null,
lng double not null,

primary key (id),
foreign key (cage_id) references cage (id));

create table animal_species_cage(
animal_species_id int not null,
cage_id int not null,

foreign key (animal_species_id) references animal_species (id),
foreign key (cage_id) references cage (id),
primary key (animal_species_id, cage_id));

create table animal_species_description(
id int not null auto_increment,
description text not null,
depth int not null,
animal_species_id int not null,

primary key (id),
foreign key (animal_species_id) references animal_species (id));

create table animal_species_image(
id int not null auto_increment,
animal_species_id int not null,
file_path varchar(3000),

primary key (id),
foreign key (animal_species_id) references animal_species (id));

create table user_session(
id int not null auto_increment,
active tinyint not null,
creation_date date not null,
user_mac varchar(18) not null,

primary key (id),
foreign key (user_mac) references user (mac));
