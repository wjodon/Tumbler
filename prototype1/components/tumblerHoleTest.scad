// tumblerHoleTest.scad

include <1_4_hub.scad>;

$fs = .1;
$fa = 1;

rivet_diam = 3.4;

color("Blue") difference() {
	cube([20,40,2]);
	translate([10,10,-1]) cylinder(h=4, r=axle_radius);
	translate([10,20,-1]) cylinder(h=4, d=rivet_diam);
	translate([10,30,-1]) cylinder(h=4, r=screw_radius);
}