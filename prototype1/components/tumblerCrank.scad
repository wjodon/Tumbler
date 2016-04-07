// tumblerHandle.scad

include <tumblerCrankMembers.scad>;

show_hardware = false;

$vpr= [55,0,25];
$vpd = 500;
$vpt = [0,0,0];

color("Blue") crank();

$fa=1; color("Orange") crank_knob(fs=.1);

if (show_hardware) {
	translate(v=[0,0,screw_head_height]) hub_assembly(thickness=4);
}