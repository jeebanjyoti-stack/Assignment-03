--Part-1
create database ExerciseDb
use ExerciseDb

create table CompanyInfo
(Cid int primary key,
CName varchar(50))

insert into CompanyInfo (Cid, CName) values
    (1, 'SamSung'),
    (2, 'HP'),
    (3, 'Apple'),
    (4, 'Dell'),
    (5, 'Toshiba'),
    (6, 'Redmi')

create table ProductInfo
(Pid int primary key,
PName varchar(50),
PPrice decimal,
PMDate  date,
Cid int,
foreign key (Cid) references CompanyInfo(Cid))

insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values
    (101, 'Laptop', 55000.90, '12/12/2023', 1),
    (102, 'Laptop', 35000.90, '12/12/2012', 2),
    (103, 'Mobile', 15000.90, '12/03/2012', 2),
    (104, 'Laptop', 135000.90, '12/12/2012', 3),
    (105, 'Mobile', 65000.90, '12/12/2012', 3),
    (106, 'Laptop', 35000.90, '12/12/2012', 5),
    (107, 'Mobile', 35000.90, '12/01/2012', 5),
    (108, 'Earpod', 1000.90, '12/01/2022', 3),
    (109, 'Laptop', 85000.90, '12/12/2021', 6),
    (110, 'Mobile', 55000.70, '12/12/2020', 1)

select c.CName, p.PName, P.PPrice,p.PMDate
from CompanyInfo c
join ProductInfo p 
on c.Cid = p.Cid

select p.PName, c.CName, p.PMDate
from ProductInfo p
join CompanyInfo c on p.Cid = c.Cid

select c.CName,p.PName,p.PMDate
from CompanyInfo c
cross join ProductInfo p

--Part-2
create table Products
(Pid int primary key,
PQ int,
PPrice float,
Discount float)

insert into Products (Pid, PQ, PPrice, Discount) values 
(1, 10, 100.00, 10),
(2, 5, 50.00, 40),
(3, 20, 200.00, 30)
select * from Products

create function CalculateDiscount
(
@price float,
@discountPercentage float
)
returns float
as
begin
declare @discountedValue float
set @discountedValue = @price - (@price * (@discountPercentage / 100.0))
return @discountedValue
end

select PId, PPrice Price, Discount,
dbo.CalculateDiscount(PPrice, Discount)
as 'Price after Discount' 
from Products