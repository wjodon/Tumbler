// hub_hardware.scad

// dimensional constants
hub_height = 9.553;
screw_offset = 6.910;

screw_head_radius = 2.85;
screw_head_height = 3.51;
screw_diameter = 1.8;

hub_mount_thickness = 5.0;
hub_mount_radius = 15;
hub_reinforcement_radius = 50;
hub_reinforcement_thickness = 2;

axle_radius = 3.25;

rivet_diam = 3.3;

show_hardware = true;


if (show_hardware) {
	translate(v=[0,0,screw_head_height+hub_mount_thickness]) {
	rotate(a=-90,v=[1,0,0]) {
		translate(v=[0,-hub_height,0]) {
			color("cornflowerBlue") import("metal_hub.stl",convexity=3);
		}
	}
	}
	for (dirX=[1, -1]) {
		for (dirY=[1,-1]) {
			translate(v=[screw_offset * dirX,screw_offset * dirY,0]) { $fs = 0.5;
				//cylinder(h=10, r=1.3);
				rotate(a=90, v=[1,0,0]){
					translate(v=[-screw_head_radius,0,-screw_head_radius]) {
						color("salmon") import("screws/ROB-12332.STL",convexity=3);	
					}
				}
			}
		}
	}
}