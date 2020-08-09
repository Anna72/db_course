drop database if exists AudioTrackStore;
create database AudioTrackStore;
use AudioTrackStore;

-- Описание колонок таблицы:
--  ArtistId               Id исполнителя 
--  ArtistName             Имя исполнителя
--  AlbumId                Id альбома
--  AlbumTitle             Название альбома
--  TrackId                Id композиции
--  TrackName              Название композиции
--  TrackLength            Продолжительность композиции в секундах
--  TrackGenre             Жанр композиции
--  TrackPrice             Цена за композицию
--  OrderId                Id заказа
--  CustomerId             Id заказчика
--  CustomerName           Имя заказчика
--  CustomerEmail          E-mail заказчика
--  OrderDate              Дата получения заказа
--  DeliveryAddress        Адрес доставки заказа

create table Artists( 
	ArtistId int NOT NULL primary key, 
	ArtistName varchar(120) NOT NULL
);

create table Albums (
	AlbumId int NOT NULL primary key,
	AlbumTitle varchar(120) NOT NULL,
	ArtistId int NOT NULL,
	foreign key (ArtistId) references Artists(ArtistId)
);

create table Tracks (
	TrackId int NOT NULL primary key,
	AlbumId int NOT NULL,
	TrackName varchar(200) NOT NULL,
	TrackLength bigint NOT NULL,
	TrackGenre varchar(120) NOT NULL,
	TrackPrice decimal(10,2) NOT NULL,
	foreign key (AlbumId) references Albums(AlbumId)
);

create table Customers (
	CustomerId int NOT NULL primary key,
	CustomerName varchar(60) NOT NULL,
	CustomerEmail varchar(60) NOT NULL
);

create table OrdersTable (
	OrderId int NOT NULL primary key,
        CustomerId int NOT NULL,
	OrderDate date NOT NULL, 
	DeliveryAddress varchar(70) NOT NULL,
	foreign key (CustomerId) references Customers(CustomerId)
);


create table TrackOrder (
	TrackOrderId int NOT NULL primary key,
	TrackId int NOT NULL,
	OrderId int NOT NULL,
	foreign key (TrackId) references Tracks(TrackId),
	foreign key (OrderId) references OrdersTable(OrderId)
);
	
	
	
	