create database concessionaria_epicode;
use concessionaria_epicode;

create table Branch (
IdBranch int primary key,
CityBranch varchar (80)
);

create table SalesPerson (
IdSalesPerson int primary key,
Nome varchar (50),
Cognome varchar (50),
Email varchar (100),
IdBranch int,
foreign key (IdBranch) references Branch (IdBranch)
);


create table CarBrand (
IdCarBrand int primary key,
NameBrand varchar (100)
);

create table Car (
IdCar int primary key,
IdCarBrand int,
foreign key (IdCarBrand) references CarBrand (IdCarBrand),
Targa char (7),
DataSalesCar date, 
IdBranch int,
foreign key (IdBranch) references Branch (IdBranch)
)

create table Customer (
IdCustomer int primary key,
Nome varchar (50),
Cognome varchar (50),
Email varchar (100),
Indirizzo varchar (100),
Citta varchar (50),
DataAcquistoAuto date,
IdCar int,
foreign key (IdCar) references Car (IdCar)
)

create table SalesCar (
IdSalesPerson int,
IdCar int,
primary key (IdSalesPerson, IdCar),
foreign key (IdSalesPerson) references SalesPerson (IdSalesPerson),
foreign key (IdCar) references Car (IdCar)
)

alter table Car
add constraint foreign key (IdCustomer) references Customer (IdCustomer);

show tables;

insert into Branch (IdBranch, CityBranch)
values (1, 'Napoli'),
(2, 'Palermo'),
(3, 'Catania'),
(4, 'Benevento'),
(5, 'Firenze'),
(6, 'Milano'),
(7, 'Torino'),
(8, 'Como'),
(9, 'Bologna'),
(10, 'Ferrara'),
(11, 'Modena'),
(12, 'Bari'),
(13, 'Foggia'),
(14, 'Genova');
select * 
from Branch

insert into SalesPerson (IdSalesPerson, Nome, Cognome, Email)
values (1, 'Roberto', 'Loffredo', 'roberto.loffredo@concessionaria.it' ),
(2, 'Luisa', 'Rossi', 'luisa.rossi@concessionaria.it'),
(3, 'Giacomo', 'Ferrandino', 'giacomo.ferrandino@concessionaria.it'),
(4, 'Katia', 'Castaldo', 'katia.castaldo@concessionaria.it'),
(5, 'Bruno', 'Pereira', 'bruno.pereira@concessionaria.it'),
(6, 'Federica', 'Brunelli', 'federica.brunelli@concessionaria.it');
UPDATE SalesPerson
SET IdBranch = '10'
WHERE IdSalesPerson = 6; 

select *
from Car

insert into CarBrand (IdCarBrand, NameBrand)
values (1,'BMW'),
(2,'MINI'),
(3,'Audi'),
(4,'Mercedes'),
(5,'Renault'),
(6,'Peugeot'),
(7,'CUPRA'),
(8,'Land Rover'),
(9,'Porsche'),
(10,'Aston Martin'),
(11,'Opel'),
(12,'Tesla');

select *
from SalesCar;

insert into Car (IdCar, IdCarBrand, Targa, DataSalesCar, IdBranch)
values (1001, 11, 'PN356FN', '2025-05-01', 12),
(1002, 12, 'LO234FR', '2024-09-06', 8),
(1003, 3, 'SE230DR', '2024-03-31', 12),
(1004, 8, 'FW197RT', '2025-02-20', 7),
(1005, 1, 'LM912FG', '2025-03-14', 13),
(1006, 11, 'HR216MW', '2025-01-27', 4);

UPDATE Car
SET IdCustomer = '12'
WHERE IdCar = 1006; 


insert into Customer (IdCustomer, Nome, Cognome, Email, Indirizzo, Citta, DataAcquistoAuto, IdCar)
values (7510,'Riccardo', 'Liguori', 'riccardoliguori@gmail.com', 'Via Luigi II', 'Torino', '2025-05-01', 1001),
(5482,'Luciano', 'Spirandente', 'lucianospirandente@gmail.com', 'Via Verdi', 'Bologna', '2024-09-06', 1002),
(1956,'Veronica', 'Spessotto', 'veronicaspessotto@gmail.com', 'Via Rossi', 'Milano', '2024-03-31', 1003),
(2345,'Giulio', 'Merolla', 'giuliomerolla@gmail.com', 'Via Napoleone', 'Milano', '2025-02-20', 1004),
(5894,'Zoe', 'Peres', 'zoeperes@gmail.com', 'Via Roma', 'Palermo', '2025-03-14', 1005),
(12,'Domenico', 'Esposito', 'domenicoesposito@gmail.com', 'Via Napoli', 'Napoli', '2025-01-27', 1006)

insert into SalesCar (IdSalesPerson, IdCar, DataAutoVenduta)
values (3, 1001, '2025-05-01'),
(1, 1002, '2024-09-06'),
(5, 1003, '2024-03-31'),
(2, 1004, '2025-02-20'),
(3, 1005, '2025-03-14'),
(5, 1006, '2025-01-27')

#PER CONTROLLARE LE TABELLE
show tables;
describe Branch;
select * 
from SalesPerson
