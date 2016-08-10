/* configuration for angular route */
app.config(function($routeProvider) {
  $routeProvider
    .when('/index', {
      templateUrl: '/partials/index.html',
      controller: 'indexController'
    })
    .when('/edit/:id', {
      templateUrl: '/partials/edit.html',
      controller: 'editController',
      controllerAs: 'eC'
    })
    .when('/delete/:id', {
      templateUrl: '/partials/index.html',
      controller: 'indexController',
    })
    .when('/new', {
      templateUrl: '/partials/new.html',
      controller: 'newController',
    })
    .otherwise({
      redirectTo: '/index'
    });
});