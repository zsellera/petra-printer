$fn=32;

belt_above_frame=10;
belt_width=9;
idler_height=14;
idler_dia=19;
idler_center_offset=4;

module idlerpulley() {
    difference() {
        cylinder(d=idler_dia,h=idler_height+2,center=true);
        translate([0,0,-idler_height/2-2]) cylinder(d=8,h=2);
        translate([0,0,idler_height/2]) cylinder(d=8,h=2);
    }
}

difference() {
    h_above_profile=belt_above_frame+belt_width/2-idler_height/2+5;
    
    union() {
        hull() {
            cylinder(r=7,h=20+h_above_profile);
            
            //translate([0,-idler_center_offset-10,0]) cylinder(r=7,h=20+h_above_profile);
            //translate([-13,-idler_center_offset-10,0]) cylinder(r=7,h=20+h_above_profile);
        }
        translate([0,-idler_center_offset,10]) rotate([-90,0,0]) hull() {
            translate([11,-3,0]) cylinder(r=7,h=8);
            translate([11,3,0]) cylinder(r=7,h=8);
            translate([-4,-10+3-belt_above_frame-belt_width/2+idler_height/2,0]) cylinder(r=3,h=8);
            translate([4,-10+3-belt_above_frame-belt_width/2+idler_height/2,0]) cylinder(r=3,h=8);
            translate([-11,-3,0]) cylinder(r=7,h=8);
            translate([-11,3,0]) cylinder(r=7,h=8);
        }
    }
    
    //shaft
    translate([0,0,-1]) cylinder(d=5.2,h=100);
    
    //idler
    translate([0,0,20+belt_above_frame+belt_width/2]) {
        idlerpulley();
        hull() {
            translate([20,0,0]) cylinder(d=idler_dia,h=idler_height,center=true);
            translate([0,0,0]) cylinder(d=idler_dia,h=idler_height,center=true);
        }
    }
    
    //2020 profile
    translate([-50,-20-idler_center_offset,-1]) cube([100,20,41]);
    
    // support chamfer
    hull() {
        r=12;
        translate([7+r/2,5+r-idler_center_offset,-1]) cylinder(r=r,h=100);
        translate([27+r/2,5+r-idler_center_offset,-1]) cylinder(r=r,h=100);
    }
    mirror([1,0,0]) hull() {
        r=12;
        translate([7+r/2,5+r-idler_center_offset,-1]) cylinder(r=r,h=100);
        translate([27+r/2,5+r-idler_center_offset,-1]) cylinder(r=r,h=100);
    }
    
    // nuts
    translate([13,-idler_center_offset+6,10]) rotate([90,0,0]) cylinder(d=5.6,h=20);
    translate([13,-idler_center_offset+8,10]) rotate([90,0,0]) cylinder(d=11,h=3);
    translate([-13,-idler_center_offset+6,10]) rotate([90,0,0]) cylinder(d=5.6,h=20);
    translate([-13,-idler_center_offset+8,10]) rotate([90,0,0]) cylinder(d=11,h=3);
    
    // support
    for (z=[4:4:25]) translate([-6,-idler_center_offset-1,z]) cube([12,20,0.3]);
    
}
    