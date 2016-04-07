// hub_test.scad

// must print with support

include <1_4_hub.scad>;

$vpr= [55,0,25];
$vpd = 500;
$vpt = [0,0,0];

$fa = 1;

color("Blue") hub_mount_enclosed(thickness=4,fs=.1);