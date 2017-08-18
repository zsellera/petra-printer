$fn=32;

module nut3(h=50) {
    hull() {
        translate([3.1,0,0]) cylinder(d=0.5,h=4);
        rotate([0,0,60]) translate([3.1,0,0]) cylinder(d=0.5,h=4);
        rotate([0,0,120]) translate([3.1,0,0]) cylinder(d=0.5,h=4);
        rotate([0,0,180]) translate([3.1,0,0]) cylinder(d=0.5,h=4);
        rotate([0,0,240]) translate([3.1,0,0]) cylinder(d=0.5,h=4);
        rotate([0,0,300]) translate([3.1,0,0]) cylinder(d=0.5,h=4);
    }
}

module ycarriage() {
    difference() {
        union() {
            hull() {
                translate([-7,-22,0]) cylinder(d=6,h=4);
                translate([-7,22,0]) cylinder(d=6,h=4);
                translate([7,-22,0]) cylinder(d=6,h=4);
                translate([7,22,0]) cylinder(d=6,h=4);
            }
            hull() {
                translate([-5,-21,0]) cylinder(d=6,h=14);
                translate([-5,21,0]) cylinder(d=6,h=14);
                translate([5,-21,0]) cylinder(d=6,h=14);
                translate([5,21,0]) cylinder(d=6,h=14);
            }
        }
        
        translate([0,9.5,0]) {
            translate([0,0,3]) difference() {
                cylinder(d=14,h=12);
                cylinder(d=9,h=13);
            }
            translate([0,0,-1]) cylinder(d=3.5,h=30);
            translate([0,0,11]) nut3();
        }
        translate([-1.5,15,3]) cube([3,20,12]);
        
        translate([0,-9.5,0]) {
            translate([0,0,3]) difference() {
                cylinder(d=14,h=12);
                cylinder(d=9,h=13);
            }
            translate([0,0,-1]) cylinder(d=3.5,h=30);
            translate([0,0,11]) nut3();
        }
        translate([-1.5,-35,3]) cube([3,20,12]);
    }
}

ycarriage();