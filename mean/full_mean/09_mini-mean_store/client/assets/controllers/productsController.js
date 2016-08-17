app.controller('productsController', function(productsFactory, $scope){

    $scope.products = [];
    $scope.dup_msg = "";

    $scope.repeater = function (range) {
        var arr = []; 
        for (var i = 0; i < range; i++) {
            arr.push(i);
        }
        return arr;
    };

    var index = function(){
        productsFactory.index(function(data){
            $scope.products = data;
            console.log('products from http: ', $scope.products);
        });
    };
    index();

    $scope.create = function(product){
        console.log(product)
        productsFactory.create(product, (data)=>{
            console.log('returned', data);$scope.error = data.error;}) ;
        index();
    }

});