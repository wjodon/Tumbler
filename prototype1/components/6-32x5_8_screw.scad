// 6-32x5_8_screw.scad

// dimensional constants
screw_head_radius = 2.85;
screw_head_height = 3.51;
screw_radius = 1.9;
screw_length = 15.7;

module screw() {
	rotate(a=90, v=[1,0,0]){
		translate(v=[-screw_head_radius,0,-screw_head_radius]) {
			color("salmon") import("../parts/screws/ROB-12332.STL",convexity=3);	
		}
	}
}

module screw_cavity(fs=.5) {
	$fs = fs;
	union() {
		shim =.1;
		translate(v=[0,0,screw_head_height]) {
			cylinder(h=screw_length+.2, r=screw_radius);
		}
		translate(v=[0,0,-shim]) {
			cylinder(h=screw_head_height+shim,r=screw_head_radius + .2 );
		}
	}
}


//screw();
//screw_cavity();