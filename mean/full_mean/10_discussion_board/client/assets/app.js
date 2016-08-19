var app = angular.module('app', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'static/partials/index.html',
        controller: 'indexController'
    })
    .when('/dashboard', {
        templateUrl: 'static/partials/dashboard.html',
        controller: 'dashboardController'
    })
    .when('/topic/:id', {
        templateUrl: 'static/partials/topic.html',
        controller: 'topicsController'
    })
    .when('/user/:id', {
        templateUrl: 'static/partials/user.html',
        controller: 'usersController'
    })
    .otherwise({
        redirectTo: '/'
    });
});