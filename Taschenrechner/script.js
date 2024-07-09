var a;
var b;

function addition() {
    a = document.getElementById("num1").value;
    b = document.getElementById("num2").value;
    document.getElementById("result").value = parseInt(a) + parseInt(b);
}