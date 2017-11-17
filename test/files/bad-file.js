/*
The code below will change
is an example of valid javascript
that does nothing
*/
var a = "Brad's Deals"

var test = function (a, b, c) {
  this.a = a; this.b = b;
  this.c = c;
};

// Test Single Line Comment

// Arithmetic
var x, y, z;
x = 5 // End of Line Comment;
y = 6;
var z = x + y;

x = "5" + 2 + 3;

y = 5;
x = ++y;
x = --y;
z = x % y;
z = x * y;
x += 5;
x -= 5;
x *= 5;

var txt1 = 'What a very';
var txt2 = 'nice day';
var txt3 = txt1 + txt2;

// Objects
var person = {
  firstName : 'John',
  lastName  :  'Doe',
  age       :  50,
  eyeColor  :  'blue'
};

function toCelsius(f) {
  return (5 / 9) * (f - 32);
};

var d = new Date();
console.log(d.getFullYear());

var cars = [
  'Saab',
  'Volvo',
  'BMW'
];
