$fn=32;

endstop_d=19;
endstop_w=18;

difference() {
    union() {
        hull() {
            translate([-2,4,0]) cylinder(r=4,h=4);
            translate([-2,-4,0]) cylinder(r=4,h=4);
            translate([endstop_w,4,0]) cylinder(r=4,h=4);
            translate([endstop_w,-endstop_d,0]) cylinder(r=4,h=4);
        }
        translate([-5,-3,0]) cube([endstop_w+8,6,6]);
    }
    
    //holes
    translate([0,0,-1]) cylinder(d=5.5,h=8);
    hull() {
        translate([-4,0,4]) cylinder(d=10,h=11);
        translate([0,0,4]) cylinder(d=10,h=11);
    }
    translate([endstop_w,0,-1]) cylinder(d=3.3,h=8);
    hull() {
        translate([endstop_w,0,4]) cylinder(d=7,h=8);
        translate([endstop_w+4,0,4]) cylinder(d=7,h=8);
    }
    translate([endstop_w,-endstop_d,-1]) cylinder(d=3.3,h=8);
    
    // szerkezet
    hull() {
        translate([0,-6,-1]) cylinder(r=1,h=8);
        translate([endstop_w,-6,-1]) cylinder(r=1,h=8);
        translate([endstop_w,-endstop_w+6,-1]) cylinder(r=1,h=8);
        translate([8,-endstop_w+6,-1]) cylinder(r=1,h=8);
    }
}
    