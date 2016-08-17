var app = angular.module('app', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'static/partials/dashboard.html',
        // controller: 'dashboardController'
    })
    .when('/products', {
        templateUrl: 'static/partials/products.html',
        controller: 'productsController'
    })
    .when('/orders', {
        templateUrl: 'static/partials/orders.html',
        controller: 'ordersController'
    })
    .when('/customers', {
        templateUrl: 'static/partials/customers.html',
        controller: 'customersController'
    }).when('/settings', {
        templateUrl: 'static/partials/settings.html',
        // controller: 'dashboardController'
    })
    .otherwise({
        redirectTo: '/'
    });
});