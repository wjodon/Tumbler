// hub_hardware.scad

include <1_4_hub.scad>;

// dimensional constants

hub_mount_radius = 15;
hub_reinforcement_radius = 50;
hub_reinforcement_thickness = 2;
hub_mount_thickness = 4;
crank_base_height=screw_head_height+hub_mount_thickness+hub_height;

knob_shaft_length = 30;
knob_shaft_radius = 5;

part_separation = 1.0;




module crank_crank(fs=.5) {
	$fs = fs;
	hub_mount_enclosed(thickness=4,fs=fs);
}


module crank_knob_base(fs=.5,crank_base_height=crank_base_height,knob_shaft_length=knob_shaft_length) {
	$fs = fs;
	color("Blue")
	translate(v=[0,-100,0])	{
		union() {
			cylinder(h=crank_base_height, r = 10);
			translate(v=[0,0,crank_base_height]) 
				cylinder(h=knob_shaft_length, r=knob_shaft_radius);
			translate(v=[0,0,crank_base_height+knob_shaft_length-2])
				cylinder(h=2, r = 8);
		}
	}
}

module crank_knob(fs=.5,crank_base_height=crank_base_height,knob_shaft_length=knob_shaft_length) {
	$fs = fs;
	translate(v=[0,-100,crank_base_height + part_separation])
	difference() {
		$fa = 24; cylinder(h=knob_shaft_length-(2+2*part_separation), r=10);
		cylinder(h=knob_shaft_length-2.6, r=knob_shaft_radius+part_separation);
	}
}

module crank_arm(fs=.5) {
	$fs=fs;
	union() {
		for (side=[1,-1]) {
			difference() {
				rotate(a=side*2.9, v=[0,0,1]) translate(v=[side*-12.5,-50,crank_base_height/2])
					cube([5,100,crank_base_height],center=true);
				cylinder(h=crank_base_height, r=hub_mount_radius-1);
			}
		}
	}
}

module crank() {
	$fa=1;
	fs = .1;
	union() {
		crank_crank(fs=fs);
		crank_knob_base(fs=fs);
		crank_arm(fs=fs);
	}
}

