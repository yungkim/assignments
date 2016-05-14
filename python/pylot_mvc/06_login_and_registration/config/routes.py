from system.core.router import routes

routes['default_controller'] = 'Logins'
routes['/success'] = 'Logins#show'
routes['POST']['/login'] = 'Logins#login'
routes['POST']['/register'] = 'Logins#register'
routes['/logout'] = 'Logins#logout'