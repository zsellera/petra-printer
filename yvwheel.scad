$fn=32;

D=4;
ll=15;
dd = 16.4;  // EDIT THIS - distance to fit V-wheel to your extrusion
d5=5.2;
d3=3.6;


module nut3() {
    hull() {
        cylinder(d=0.5,h=7);
        translate([3,0,0]) cylinder(d=0.5,h=5);
        rotate([0,0,60]) translate([3,0,0]) cylinder(d=0.5,h=5);
        rotate([0,0,120]) translate([3,0,0]) cylinder(d=0.5,h=5);
        rotate([0,0,180]) translate([3,0,0]) cylinder(d=0.5,h=5);
        rotate([0,0,240]) translate([3,0,0]) cylinder(d=0.5,h=5);
        rotate([0,0,300]) translate([3,0,0]) cylinder(d=0.5,h=5);
    }
}

difference() {
    union() {
        hull() {
            translate([dd,ll,0]) cylinder(d=12,h=D);
            translate([dd,-ll,0]) cylinder(d=12,h=D);
            translate([-dd,ll,0]) cylinder(d=12,h=D);
            translate([-dd,-ll,0]) cylinder(d=12,h=D);
        }
        translate([dd,ll,0]) cylinder(d=12,h=D+1);
        translate([dd,-ll,0]) cylinder(d=12,h=D+1);
        translate([-dd,ll,0]) cylinder(d=12,h=D+1);
        translate([-dd,-ll,0]) cylinder(d=12,h=D+1);
        hull() {
            translate([-16,0,0]) cylinder(d=10,h=15);
            translate([16,0,0]) cylinder(d=10,h=15);
        }
    }
    translate([-16,0,-1]) cylinder(d=d3,h=29);
    translate([-16,0,-0.1]) nut3();
    translate([16,0,-1]) cylinder(d=d3,h=29);
    translate([16,0,-0.1]) nut3();
    translate([dd,ll,-1]) cylinder(d=5.1,h=9);
    translate([dd,-ll,-1]) cylinder(d=5.1,h=9);
    translate([-dd,ll,-1]) cylinder(d=5.1,h=9);
    translate([-dd,-ll,-1]) cylinder(d=5.1,h=9);
}
