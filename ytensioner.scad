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

module tensioner() {
    difference() {
        union() {
            translate([0,-2.5,-4.5]) cube([18,5,9]);
            intersection() {
                cylinder(d=21,h=22,center=true);
                translate([-9,-6,-11]) cube([25,12,22]);
            }
        }
        translate([-3,0,0]) cylinder(d=20,h=16,center=true);
        translate([-3,0,0]) cylinder(d=5.4,h=30,center=true); 
        translate([9,0,0]) rotate([0,-90,0]) nut3();
        rotate([0,90,0]) cylinder(d=3.3,h=40);
    }
}

module ytensioner() {
    difference() {
        union() {
            hull() {
                translate([-15,0,0]) cylinder(d=20,h=6);
                translate([15,0,0]) cylinder(d=20,h=6);
            }
            hull() {
                translate([0,0,11]) rotate([90,0,0]) {
                    translate([-5,0,0]) cylinder(d=12,h=10);
                    translate([5,0,0]) cylinder(d=12,h=10);
                }
                translate([-11,-10,0]) cube([22,20,6]);
            }
        }
        translate([-3,-20,4]) cube([6,20,10]);
        translate([0,-1,9]) rotate([-90,0,0]) cylinder(d=3.8,h=30);
        translate([0,3,9]) rotate([-90,0,0]) cylinder(d=14,h=30);
        
        translate([-17,0,-1]) cylinder(d=5.8,h=10);
        translate([17,0,-1]) cylinder(d=5.8,h=10);
    }
}

ytensioner();
*tensioner();