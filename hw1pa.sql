drop database if exists DB1;
create database DB1;
use DB1;

create table Stations(
	station_id int NOT NULL,
	station_name varchar(50) NOT NULL,
	primary key (station_id)
);

create table Trains(
	train_id int NOT NULL,
	train_number varchar(10) NOT NULL,
	number_of_seats int NOT NULL,
	primary key (train_id)
);

create table Persons(
	person_id int NOT NULL,
	person_first_name varchar(50) NOT NULL,
	person_last_name varchar(50) NOT NULL,
	date_of_birth date NOT NULL,
	primary key (person_id)
);

create table TrainsShedule(
	stop_id int NOT NULL,
	train_id int NOT NULL,
	station_id int NOT NULL,
	arrive_time datetime NOT NULL,
	departure_time datetime NOT NULL,
	foreign key (train_id) references Trains(train_id),
	foreign key (station_id) references Stations(station_id),
	primary key (stop_id)
);

create table SoldTickets(
	ticket_id int NOT NULL,
	person_id int NOT NULL,
	train_id int NOT NULL, 
	first_station_id int NOT NULL, -- ссылка на поле stop_id в таблице 							--TrainsShedule
	last_station_id int NOT NULL, -- ссылка на поле stop_id в таблице 							--TrainsShedule
	foreign key (person_id) references Persons(person_id),
	foreign key (train_id) references Trains(train_id),
	primary key (ticket_id)
);


	

	

	
	
	
	
	
	