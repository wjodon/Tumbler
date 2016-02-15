// 1_4_hub.scad

include <6-32x5_8_screw.scad>;

// dimensional constants
hub_height = 9.553;
hub_body_radius = 10.25;
hub_screw_mount_radius = 3.43;
screw_offset = 6.910;
hub_mount_thickness = 5.0;
hub_mount_radius = 15;
axle_radius = 3.25;


module hub() {
	rotate(a=-90,v=[1,0,0]) {
		translate(v=[0,-hub_height,0]) {
			color("cornflowerBlue") import("../parts/hubs/1_4_metal_hub.stl",convexity=3);
		}
	}
}

module hub_cavity_profile() {
	color("Orange") scale(v=[1.05,1.05]) union() {
		projection(cut=false) hub();
		square(size = [2*hub_body_radius-2,2*hub_body_radius-2], center=true);
	}
}

module hub_cavity(height=hub_height + .2) {
	union() {
		linear_extrude(height=height, center = false, convexity = 10, twist=0) hub_cavity_profile();
		$fs = 0.5; translate(v=[0,0,3.52]) rotate(a=90, v=[-1,0,0]) cylinder(h=20,r=2);
	}
}

module hub_screws() {
	for (dirX=[1, -1]) {
		for (dirY=[1,-1]) {
			translate(v=[screw_offset * dirX,screw_offset * dirY,0]) { $fs = 0.5;
				screw();
			}
		}
	}
}

module hub_screw_cavities() {
	for (dirX=[1, -1]) {
		for (dirY=[1,-1]) {
			translate(v=[screw_offset*dirX,screw_offset*dirY,0]) {
				screw_cavity();
			}
		}
	}
}

module hub_assembly (v_offset=0,thickness=hub_mount_thickness) {
	hub_mount_thickness=thickness;
	translate(v=[0,0,hub_mount_thickness+v_offset]) {
		hub();
	}
	translate(v=[0,0,-screw_head_height+v_offset]) {
		hub_screws();
	}
}

module hub_mount_surface(thickness=hub_mount_thickness) {
	hub_mount_thickness = thickness;
	difference() {
		cylinder(h=hub_mount_thickness, r=hub_mount_radius);
		translate(v=[0,0,-screw_head_height - .1]) hub_screw_cavities();
		$fs=.5; translate(v=[0,0,-.1])  cylinder(h=hub_mount_thickness+.2,r=axle_radius);
	}
}

module hub_mount_inset_screw(thickness=hub_mount_thickness) {
	hub_mount_thickness = thickness;
	difference() {
		cylinder(h=hub_mount_thickness+screw_head_height, r=hub_mount_radius);
		hub_screw_cavities();
		$fs=.5; translate(v=[0,0,-.1])
			cylinder(h=hub_mount_thickness+screw_head_height+.2, r=axle_radius);
	}
}


module hub_mount_enclosed(thickness=hub_mount_thickness) {
	hub_mount_thickness = thickness;
	difference() {
		cylinder(h=hub_mount_thickness+screw_head_height+hub_height-.1, r=hub_mount_radius);
		translate(v=[0,0,hub_mount_thickness+screw_head_height]) hub_cavity();
		hub_screw_cavities();
		$fs=.5; translate(v=[0,0,-.1])
			cylinder(h=hub_mount_thickness+screw_head_height+.2, r=axle_radius);
	}
}

//hub();
//hub_screws();
//hub_cavity();
//hub_screw_cavities();
//translate([0,0,-screw_head_height]) hub_screw_cavities();

//hub_assembly();
//hub_mount_surface();

//translate(v=[0,0,screw_head_height]) hub_assembly();
//hub_mount_inset_screw();
//hub_mount_enclosed();


