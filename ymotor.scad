$fn=16;

module ymotor() {
    difference() {
        union() {
            cube([44+10,20+5+5+43,5]);
            translate([0,20,0]) hull() {
                cube([44+10,5+5+43,5]);
                cube([44+10,5,26]);
            }
        }
        
        // motor place
        translate([5,25,5]) cube([44,44+5,44]);
        
        // nema17 mount
        translate([5+22,20+5+5+22,-1]) {
            hull() {
                cylinder(d=24,h=10);
                translate([0,30,0]) cylinder(d=24,h=10);
            }
            translate([15.5,-15.5,0]) cylinder(d=3.4,h=10);
            translate([15.5,15.5,0]) cylinder(d=3.4,h=10);
            translate([-15.5,-15.5,0]) cylinder(d=3.4,h=10);
            translate([-15.5,15.5,0]) cylinder(d=3.4,h=10);
        }
        
        // 2020 mounts
        translate([10,10,-1]) cylinder(d=6,h=10);
        translate([54-10,10,-1]) cylinder(d=6,h=10);
        translate([54/2,19,14]) rotate([-90,0,0]) hull() {
            cylinder(d=6,h=10);
            translate([0,-15,0]) cylinder(d=6,h=10);
        }
    }
}

ymotor();