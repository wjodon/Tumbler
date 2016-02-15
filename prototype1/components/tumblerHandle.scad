// hub_hardware.scad

include <1_4_hub.scad>;

// dimensional constants

hub_mount_radius = 15;
hub_reinforcement_radius = 50;
hub_reinforcement_thickness = 2;
hub_mount_thickness = 4;
handle_base_height=screw_head_height+hub_mount_thickness+hub_height;

knob_shaft_length = 30;
knob_shaft_radius = 5;

rivet_diam = 3.3;

show_hardware = true;

module handle_center() {
	$fs = 0.5;
	color("Blue")
	hub_mount_enclosed(thickness=4);
}


module handle_knob_base() {
	$fs = .5;
	color("Blue")
	translate(v=[0,-100,0])	{
		union() {
			cylinder(h=handle_base_height, r = 10);
			translate(v=[0,0,handle_base_height]) 
				cylinder(h=knob_shaft_length, r=knob_shaft_radius);
			translate(v=[0,0,handle_base_height+knob_shaft_length-2])
				cylinder(h=2, r = 8);
		}
	}
}

module knob() {
	$fs = .5;
	color("Orange")
	translate(v=[0,-100,handle_base_height + 1])
	difference() {
		cylinder(h=knob_shaft_length-4, r=10);
		cylinder(h=knob_shaft_length-4, r=6);
	}
}

module handle_arm() {
	union() {
		color("Blue")
		for (side=[1,-1]) {
			difference() {
				rotate(a=side*2.9, v=[0,0,1]) translate(v=[side*-12.5,-50,handle_base_height/2])
					cube([5,100,handle_base_height],center=true);
				cylinder(h=handle_base_height, r=hub_mount_radius-1);
			}
		}
	}
}

module handle() {
	union() {
		handle_center();
		handle_knob_base();
		handle_arm();
	}
}

handle();

knob();

if (show_hardware) {
	translate(v=[0,0,screw_head_height]) hub_assembly(thickness=4);
}