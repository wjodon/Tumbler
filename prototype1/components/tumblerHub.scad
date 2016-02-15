// tumblerHub.scad

include <1_4_hub.scad>;

hubRadius = 60;

rivet_diam = 3.3;

show_hardware = true;

$fs = 0.5;

difference(){
	color("Blue")
	union(){
		hub_mount_inset_screw(thickness=4);
		difference() {
			cylinder(h=2, r=hubRadius);
			cylinder(h=2, r=14);
		}
	
	}


	for(angle=[0:60:300]) {
		echo("<b>angle:</b> ",angle);
		rotate(a=angle, v=[0,0,1]) {
			translate(v=[hubRadius - 4,0,0]){
				cylinder(h=2, d=rivet_diam);
			}
		}
	}
}

if (show_hardware) {
	translate(v=[0,0,screw_head_height]) hub_assembly(thickness=4);
}