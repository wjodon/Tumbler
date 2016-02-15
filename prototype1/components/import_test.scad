// import_test.scad


rotate(a=-90,v=[1,0,0]) {
	translate(v=[0,-9.553,0]) {
		import("metal_hub.stl",convexity=3);
	}
}

screw_head_diam = 2.85;
screw_head_height = 3.51;
rotate(a=90, v=[1,0,0]){
	translate(v=[-screw_head_diam,-screw_head_height,-screw_head_diam]) {
		import("screws/ROB-12332.STL",convexity=3);	
	}
}