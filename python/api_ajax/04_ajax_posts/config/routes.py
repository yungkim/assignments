from system.core.router import routes

routes['default_controller'] = 'Posts'
routes['/index_json'] = 'Posts#index_json'
routes['POST']['/posts/create'] = 'Posts#create_posts'
routes['/notes/create/<note>'] = 'Posts#create_notes'