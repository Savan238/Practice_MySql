show databases;

create database company;

use  company;

create table company_must ( COM_ID int not null ,
COM_NAME varchar(30) not null ,
 primary key (COM_ID)
 );
 
 insert into company_must ( COM_ID ,COM_NAME ) 
 values (11 , "Samsung"),
        (12 , "iBall"),
		( 13, "Epsion"),
	    ( 14, "Zebronics"),
	    ( 15, "Asus"),
        ( 16, "Frontech");
select * from company_must;

create table item_must (PRO_ID int not null , PRO_NAME varchar(30) not null, 
PRO_PRICE decimal (8,2) not null
,PRO_COM int not null , primary key (PRO_ID));

insert into item_must (PRO_ID , PRO_NAME , PRO_PRICE ,PRO_COM )
values (101 , "Mother Board" ,  3200.00 , 15),
(102 ,    'Key Board'        ,  450.00  , 16),
(103 ,    'ZIP drive'         , 250.00  ,    14),
(104 ,    'Speaker'          , 550.00  ,   16),
(105 ,    'Monitor'          ,  5000.00 ,   11),
(106  ,   'DVD drive'        ,  900.00  ,   12),
(107  ,   'CD drive'         ,  800.00  ,   12),
(108  ,   'Printer'           , 2600.00 ,   13),
(109  ,   'Refill cartridge' ,  350.00  ,   13),
(110  ,   'Mouse'            ,  250.00  ,   12);

select * from item_must;

 ## (1) write SQL query to select all raws from both participating tables as long as there is 
 # a match between pro_com and com_id.
 
 select * from company_must 
 inner join item_must on item_must.PRO_COM = company_must.COM_ID;
 
 ## (2)  write SQL query to display item name , price, and company name of all the products.
 
select PRO_NAME as item_name , PRO_PRICE , COM_NAME as comapny_name from item_must
inner join company_must on company_must.COM_ID = item_must.PRO_COM;

## (3) write SQL query to calculate the avarage price of item of each company 
# RETURN avarage value and company name.

select avg(PRO_PRICE) , COM_NAME from  item_must  
inner join company_must  on item_must.PRO_COM = company_must.COM_ID 
group by COM_NAME ; 

## (4) write SQL query to calculate and find the avarage price of item of each company
# higher than or equal to RS. 3500  Return avarage value and company name
 
select avg(PRO_PRICE)  , COM_NAME from  item_must  
inner join company_must  on item_must.PRO_COM = company_must.COM_ID 
group by COM_NAME
having avg(PRO_PRICE) >= 3500 ; 

## (5)  write SQL query to  find most expensive product of each company
# FReturn PRO_NAME , PRO_PRICE and COM_NAME.

select PRO_NAME , PRO_PRICE, COM_NAME from  item_must  
inner join company_must  on item_must.PRO_COM = company_must.COM_ID 
where PRO_PRICE =  (select max(PRO_PRICE) from item_must where item_must.PRO_COM = company_must.COM_ID );

##(6) write SQL query to  find lower cost product of each company
# FReturn PRO_NAME , PRO_PRICE and COM_NAME.

select PRO_NAME , PRO_PRICE, COM_NAME from  item_must  
inner join company_must  on item_must.PRO_COM = company_must.COM_ID 
where PRO_PRICE =  (select min(PRO_PRICE) from item_must where item_must.PRO_COM = company_must.COM_ID );

## (7) write SQL query to calculate and find the avarage price of item of each company
# higher than or equal to RS. 2000  Return avarage value and company name

select avg(PRO_PRICE) , COM_NAME from item_must
inner join  company_must on item_must.PRO_COM = company_must.COM_ID
group by COM_NAME
having avg(PRO_PRICE) >= 2000;








        