
$fn=32;

difference() {
    translate([0,-4-44/2,0])
    rotate([-90,0,0])
    translate([0,-10,0])
    difference() {
        union() {
            hull() {
                d=44/2+5+8;
                translate([-d,0,0]) cylinder(d=20,h=4);
                translate([d,0,0]) cylinder(d=20,h=4);
            }
            hull() {
                d=44/2+5+8;
                translate([-d,-10,0]) cube([d+d,20,20]);
                translate([-d,6,0]) cube([d+d,4,4+44]);
            }
        }
        translate([-22,-11,4]) cube([44,17,45]);
        
        translate([-44/2-5-8,0,4+8]) {
            rotate([90,0,0]) cylinder(r=8,h=22, center=true);
            translate([-8,-11,0]) cube([16,22,44]);
        }
        
        translate([44/2+5+8,0,4+8]) {
            rotate([90,0,0]) cylinder(r=8,h=22, center=true);
            translate([-8,-11,0]) cube([16,22,44]);
        }
        
        translate([44/2+5+8,0,4]) cylinder(d=11.5,h=10);
        translate([-44/2-5-8,0,4]) cylinder(d=11.5,h=10);
        translate([44/2+5+8,0,-1]) cylinder(d=5.6,h=10);
        translate([-44/2-5-8,0,-1]) cylinder(d=5.6,h=10);
    }
    
    // motor cutout
    union() {
        translate([0,0,-1]) cylinder(d=24,h=17);
        translate([-15.5,-15.5,-1]) cylinder(d=3.4,h=17);
        translate([-15.5,15.5,-1]) cylinder(d=3.4,h=17);
        translate([15.5,15.5,-1]) cylinder(d=3.4,h=17);
        translate([15.5,-15.5,-1]) cylinder(d=3.4,h=17);
    }
}