/*#1*/
select cb_customers.first_name, cb_customers.last_name
from cb_customers, dv_customer
where cb_customers.last_name = dv_customer.last_name AND cb_customers.first_name = 	dv_customer.first_name;

/*#2*/
select phone
from dv_address, cb_customers, dv_customer
where cb_customers.last_name = dv_customer.last_name AND cb_customers.first_name = 	dv_customer.first_name AND dv_address.address_id = dv_customer.address_id;

/*#3*/
select first_name, last_name
from dv_address, dv_customer
where dv_address.address_id = dv_customer.address_id
AND district = (select district 
from dv_address 
group by district
order by count(*) desc
limit 1);

/*#4*/
select rating, count(a)
from dv_film a
group by rating
order by count(*) asc
limit 1;

/*#5*/
select distinct first_name, last_name
from cb_authors, cb_books
where cb_authors.author_id = cb_books.author_id
AND cb_authors.author_id IN (select a.author_id
from cb_books a
group by a.author_id
order by count(*) desc
limit 10);