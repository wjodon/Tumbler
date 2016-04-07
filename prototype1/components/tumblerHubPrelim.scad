// tumblerHub.scad

hubRadius = 30;

$fs = 0.5;

difference(){

	union(){
		$fa=1;
		cylinder(h=2, r=hubRadius);
	
		translate(v=[0,0,2]){
			cylinder(h=6, r = 6);
		}
	}
	cylinder(h=9, r=2);

	for(angle=[0:60:300]) {
		echo("<b>angle:</b> ",angle);
		rotate(a=angle, v=[0,0,1]) {
			translate(v=[hubRadius - 4,0,0]){
				cylinder(h=2, r=1);
			}
		}
	}
}

