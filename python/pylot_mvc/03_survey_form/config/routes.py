from system.core.router import routes

routes['default_controller'] = 'Surveys'
routes['POST']['/surveys/process'] = 'Surveys#process'
routes['/result'] = 'Surveys#result'
routes['/clear'] = 'Surveys#clear'