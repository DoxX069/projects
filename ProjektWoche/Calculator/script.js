var firstNum = '';
var secondNum = '';
var op = '';
var ergebnis;

function zahl(z) {
	if (op == '') {
		let display = document.getElementById("dieID");
		firstNum += z;
		display.value = firstNum;
	}
	else {
		let display = document.getElementById("dieID");
		secondNum += z;
		display.value = secondNum;
	}
	let sound = new Audio ("mouseClick.mp3");
	sound.play();
}
function operator(o) {
	let display = document.getElementById("dieID");
	display.value = o;
	op = o;
	let sound = new Audio ("mouseClick.mp3");
	sound.play();
}
function equal() {
	let display = document.getElementById("dieID");
	if (op == '/') {
		ergebnis = parseInt(firstNum) / parseInt(secondNum);
	}
	else if (op == '*') {
		ergebnis = parseInt(firstNum) * parseInt(secondNum);
	}
	else if (op == '-') {
		ergebnis = parseInt(firstNum) - parseInt(secondNum);
	}
	else if (op == '+') {
		ergebnis = parseInt(firstNum) + parseInt(secondNum);
	}
	let sound = new Audio ("mouseClick.mp3");
	sound.play();
	remove();
	display.value = ergebnis;
}
function remove() {
	let display = document.getElementById("dieID");
	firstNum = '';
	secondNum = '';
	op = '';
	display.value = '';
	let sound = new Audio ("mouseClick.mp3");
	sound.play();
}
