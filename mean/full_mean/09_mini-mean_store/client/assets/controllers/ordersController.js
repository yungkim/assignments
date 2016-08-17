app.controller('ordersController', function(customersFactory, productsFactory, ordersFactory, $scope){    

    $scope.repeater = function (range) {
        var arr = []; 
        for (var i = 0; i < range; i++) {
            arr.push(i);
        }
        return arr;
    };

    var index = function(){
        customersFactory.show(function(customersFromFactory){
            console.log('customersFromFactory');
            $scope.customers = customersFromFactory;
        });
        productsFactory.index(function(data){
            $scope.products = data;
            console.log('products from http: ', $scope.products);
        });
        ordersFactory.index(function(data){
            console.log('data');
            $scope.orders = data;
        });
    }
    index();

    $scope.create = function(order){
        
        order.name = order.name.name;
        
        var productUpdate = {};
        productUpdate._id = order.product._id;
        productUpdate.quantity = order.product.quantity - order.quantity
        order.product = order.product.name;

        ordersFactory.create(order, (data)=>{
            console.log('returned', data);
            $scope.error = data.error;}) ;
        if (!$scope.error) {
        productsFactory.update(productUpdate, (data)=>{
            console.log('returned', data);$scope.error = data.error;}) ;
    };
        index();
    };
    // $scope.delete = function(customer){
    //     customersFactory.destroy(customer) ;
    //     index();
    // };

});