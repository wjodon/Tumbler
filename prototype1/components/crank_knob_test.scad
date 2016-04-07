// crank_knob_test.scad

// must print with support

include <tumblerCrankMembers.scad>;

$fa = 1;

$vpr= [55,0,25];
$vpd = 500;
$vpt = [0,0,0];

test_base_height = 10;
test_shaft_length = 20;

//difference() {
	translate(v=[0,100,0]) {
		color("Blue") crank_knob_base(fs=.1,crank_base_height=test_base_height,knob_shaft_length=test_shaft_length);
	}
//	cube([40,40,40]);
//}

//difference() {
	translate(v=[0,100,0]) {
		color("Orange") crank_knob(fs=.1,crank_base_height=test_base_height,knob_shaft_length=test_shaft_length);
	}
// 	cube([40,40,40]);
//}