$fs = 1;

difference() {
    translate([0,0,-.5]) linear_extrude(height = 1) {
        square([55,9.5], false)
	;}
    linear_extrude(height = 4) {translate([1,7,1])
        text("marine orbit clown light muscle skirt find", size = 1.5, font = "PT Mono");}
    linear_extrude(height = 4) {translate([1,5,1])
        text("caution alarm barrel gold tumble fatigue", size = 1.5, font = "PT Mono");}
    linear_extrude(height = 4) {translate([1,3,1]) 
        text("frown amused cheap course error guess", size = 1.5, font = "PT Mono");}
    linear_extrude(height = 4) {translate([1,1,1])
        text("digital gentle trick razor stool", size = 1.5, font = "PT Mono");}
    translate([53,2,-2]) cylinder(4, 1, false);
}