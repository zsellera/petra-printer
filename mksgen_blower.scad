difference() {
    union() {
        hull() {
            translate([-7,-8,0]) cylinder(d=4,h=13);
            translate([-7,8,0]) cylinder(d=4,h=13);
            translate([12,-8,0]) cylinder(d=4,h=13);
            translate([12,8,0]) cylinder(d=4,h=13);
        }
        hull() {
            translate([-9,-11,0]) cube([8,22,1]);
            translate([-5,-11,13]) rotate([-90,0,0]) cylinder(d=8,h=22);
        }
    }
    translate([-10,-8,8]) cube([30,16,10]);
    translate([8,-12,4]) cube([4,24,3]);
    translate([0,0,3])  cylinder(d=10,h=24);
    translate([0,0,-1])  cylinder(d=5.4,h=24);
    translate([-5,-12,13.5]) rotate([-90,0,0]) cylinder(d=3.4,h=24);
}