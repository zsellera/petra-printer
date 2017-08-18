$fn=32;

mgn12h=13;
zconnh=12;
c=mgn12h+zconnh;
nemaw=43.2;
nemah=31;

l=nemaw/2+c;
difference() {
    union() {
        
        hull() {
            translate([-nemaw/2-4,-nemaw/2,0]) cube([nemaw+8,l,5]);
            translate([-nemaw/2-4+3,c,0]) cylinder(d=6,h=5);
            translate([-nemaw/2-4+3+7,c+15,0]) cylinder(d=6,h=5);
            translate([nemaw/2+4-3-7,c+15,0]) cylinder(d=6,h=5);
            translate([nemaw/2+4-3,c,0]) cylinder(d=6,h=5);
        }
        difference() {
            hull() {
                translate([-nemaw/2-4,-nemaw/2,0]) cube([nemaw+8,l,5]);
                translate([-nemaw/2-4,c-5,0]) cube([nemaw+8,5,25]);
            }
            translate([-nemaw/2,-nemaw/2-1,5]) cube([nemaw, l-5+1, 30]);
        } 
    }
    
    // motor
    translate([0,0,-1]) {
        hull() {
            translate([0,1.5,0]) cylinder(d=23,h=10);
            translate([0,-1.5,0]) cylinder(d=23,h=10);
        }
        for (x=[-nemah/2,nemah/2]) for (y=[-nemah/2,nemah/2]) hull() {
            translate([x,y-1.5,0]) cylinder(d=3.2,h=10);
            translate([x,y+1.5,0]) cylinder(d=3.2,h=10);
        }
    }
    
    // connector
    translate([-5,c+10-3.5,-1]) cube([10,6.5,10]);
//    translate([13-4.5,c+10-3,-1]) cube([9,5.8,10]);
    
    translate([-13,c-6,15]) rotate([-90,0,0]) cylinder(d=5.4,h=10);
    translate([13,c-6,15]) rotate([-90,0,0]) cylinder(d=5.4,h=10);
}