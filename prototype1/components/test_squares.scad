// test_squares.scad
$fs = 0.5;

rivet_diam = 3.3;

difference() {
	union() {
		cube(size=[20,20,2]);
		translate(v=[20,0,0]) cube(size=[20,20,3]);
		translate(v=[20,20,0]) cube(size=[20,20,4]);
		translate(v=[0,20,0]) cube(size=[20,20,5]);
	}
	translate(v=[10,10,-.2]) cylinder(h=6,d=rivet_diam);
	translate(v=[30,10,-.2]) cylinder(h=6,d=rivet_diam);
	translate(v=[10,30,-.2]) cylinder(h=6,d=rivet_diam);
	translate(v=[30,30,-.2]) cylinder(h=6,d=rivet_diam);
}