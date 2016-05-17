from system.core.router import routes

routes['default_controller'] = 'Books'
routes['/books'] = 'Books#show'
routes['/books/<item_id>'] = 'Books#books_page'
routes['/books/add'] = 'Books#books_add'
routes['/delete/review/<item_id>'] = 'Books#reviews_delete'
routes['/users/<item_id>'] = 'Books#users_page'
routes['POST']['/process/login'] = 'Books#process_login'
routes['POST']['/process/register'] = 'Books#process_register'
routes['POST']['/process/add'] = 'Books#process_add'
routes['/process/logout'] = 'Books#process_logout'
