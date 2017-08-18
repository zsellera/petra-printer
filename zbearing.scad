$fn=32;

mgn12h=13;
zconnh=12;
c=mgn12h+zconnh;
bearingd=24;
nemah=31;

l=bearingd/2+c;

difference() {
    union() {
        difference() {
            hull() {
                translate([-bearingd/2-4,-bearingd/2-1,0]) cube([bearingd+8,l+1,7]);
                translate([-bearingd/2-4,c-5,0]) cube([bearingd+8,5,20]);
            }
            translate([-bearingd/2,-bearingd/2-1,7]) cube([bearingd, l-5+1, 30]);
        } 
    }
    
    // bearing
    translate([0,0,-1]) {
        cylinder(d=22.2,h=10);
    }
    

    
    translate([0,c-6,10]) rotate([-90,0,0]) cylinder(d=5.4,h=10);
    hull() {
        translate([0,c-5,10]) rotate([90,0,0]) cylinder(d=11,h=3);
        translate([0,c-5,10]) rotate([90,0,0]) cylinder(d=8,h=10);
    }
}