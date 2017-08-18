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

module endstop() {
    difference() {
        union() {
            hull() {
                translate([-15,0,0]) cylinder(d=18,h=6);
                translate([15,0,0]) cylinder(d=18,h=6);
            }
            hull() {
                translate([-9.5,-5.5,0]) cylinder(d=7,h=12);
                translate([9.5,-5.5,0]) cylinder(d=7,h=12);
            }
        }
        
        translate([-9.5,-5.5,-1]) cylinder(d=3.3,h=14);
        translate([-9.5,-5.5,-1]) nut3();
        translate([9.5,-5.5,-1]) cylinder(d=3.3,h=14);
        translate([9.5,-5.5,-1]) nut3();
        
        translate([-18,0,-1]) cylinder(d=5.4,h=8);
        translate([18,0,-1]) cylinder(d=5.4,h=8);
    }
}

endstop();