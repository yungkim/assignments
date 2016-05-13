from system.core.router import routes

routes['default_controller'] = 'Courses'
routes['POST']['/courses/add'] = 'Courses#add'
routes['/courses/delete/<course_id>'] = 'Courses#delete'
routes['/courses/delete/confirm/<course_id>'] = 'Courses#delete_confirm'
