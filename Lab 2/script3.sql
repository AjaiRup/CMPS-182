/*copied DowntownVideoDB into mg_customers*/
insert into mg_customers (customer_id, first_name, last_name, email, address_id, active)
select dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
from dv_customer;

/*customer_id sequence*/
create sequence mg_customers_seq start 600;
alter table mg_customers
alter column customer_id
set default nextval($$mg_customers_seq$$);


/*copied CityBooksDB into mg_customers without Duplicates*/
insert into mg_customers (first_name, last_name)
select cb_customers.first_name, cb_customers.last_name
from cb_customers
except
select cb_customers.first_name, cb_customers.last_name
from cb_customers, dv_customer
where cb_customers.last_name = dv_customer.last_name AND cb_customers.first_name = 	dv_customer.first_name;