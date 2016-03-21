var universe = document.getElementById("canvas");
var scale = 200;
var offset_x = 300;
var offset_y = 300;
var buffer = [];
var current_state;
var gray = '#555555';
var white = "#FFFFFF";

function display_circle(r, p, color) {
    var ctx = universe.getContext("2d");
    var x = (scale * p[0]) + offset_x,
		y = (scale * p[1]) + offset_y;
    //console.log("r = " + r + ", p = " + [x,y]);
    ctx.beginPath();
    ctx.moveTo(x+r,y);
    ctx.arc(x,y,r,0,2*Math.PI,false);
    ctx.fillStyle = color;
    ctx.fill();
    ctx.lineWidth = 3;
    ctx.strokeStyle = color;
    ctx.stroke();
    ctx.closePath();
}

function clear_canvas() {
	universe.width = universe.width;
}

function r(m) {
    return Math.pow(m, 1/3.0)*scale/16;
}

function display_current() {
    clear_canvas();
    for(i = 0; i < current_state.length; i++) {
        var p = current_state[i].p;
		var m = current_state[i].m;
        display_circle(r(m), p, gray);
    }
}
var ws = new WebSocket("ws://hausdorff.local:8080/");
ws.onopen = function (event) {};
ws.onmessage = function(event) {
    current_state = JSON.parse(event.data);
    window.requestAnimationFrame(display_current);
}
