/*DowntownVideoDB*/
\copy dv_customer from dv_customer.data
\copy dv_address from dv_address.data
\copy dv_film from dv_film.data

/*CityBooksDB*/
\copy cb_customers from cb_customers.data
\copy cb_books from cb_books.data
\copy cb_authors from cb_authors.data