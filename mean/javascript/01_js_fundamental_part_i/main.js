    var x = [3,5,"Dojo", "rocks", "Michael", "Sensei"];
    x.push(100)
    var y = ["hello", "world", "JavaScript is Fun"]
    
    for (var i = 0; i < y.length; i++) {
        x.push(y[i])
    }
    
    for (var i = 0; i < x.length; i++) {
        console.log(x[i]);
    }
    
    var z = [1, 5, 90, 25, -3, 0]
    var min = z[0]
    for (var i = 0; i < z.length; i++) {
        if (min > z[i]) { min = z[i] }
    }
    console.log(min)

    var sum = 0
    for (var i = 0; i < z.length; i++) {
        sum += z[i]
    }
    console.log(sum/z.length)


var new_ninja = {
 name: 'Jessica',
 profession: 'coder',
 favorite_language: 'JavaScript', //like that's even a question!
 dojo: 'Dallas'
}
for (var key in new_ninja) {
  if (new_ninja.hasOwnProperty(key)) {
    console.log(key);
    console.log(new_ninja[key]);
  }
}