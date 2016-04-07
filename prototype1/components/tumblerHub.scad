// tumblerHub.scad

include <1_4_hub.scad>;

hubRadius = 60;

rivet_diam = 3.4;

show_hardware = false;

$vpr= [55,0,25];
$vpd = 500;
$vpt = [0,0,0];

echo("translation: ", $vpt);

fs = 0.1;
$fs = fs;
$fa = 1;

color("Blue")
difference(){
	union(){
		hub_mount_inset_screw(thickness=4,fs=fs);
		difference() {
			cylinder(h=2, r=hubRadius);
			translate([0,0,-1])	cylinder(h=4, r=14);
		}
	
	}


	for(angle=[0:60:300]) {
		echo("<b>angle:</b> ",angle);
		rotate(a=angle, v=[0,0,1]) {
			translate(v=[hubRadius - 4,0,-1]){
				cylinder(h=4, d=rivet_diam);
			}
		}
	}
}

if (show_hardware) {
	translate(v=[0,0,screw_head_height]) hub_assembly(thickness=4);
}