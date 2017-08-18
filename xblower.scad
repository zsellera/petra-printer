$fn=16;

// copy-paste from xcarrige.scad
mgn12h=[46,27,13];  // carrige sizes
titan_cogwheel_at_baseheight_from_bottom=26;
nema_bottom_space=mgn12h[1]-titan_cogwheel_at_baseheight_from_bottom;

motor_plate_width=2.0;
motor_plate_start=mgn12h[0]/2-10+5;//motor_plate_width-3.5;
// copy-paste end

e3d_h=65.5;
titan_e3d_offset=13;

mount_holes_distance=16;
mount_hole_0_x=(4+mount_holes_distance) - (motor_plate_start+motor_plate_width);
mount_hole_1_x=mount_hole_0_x-mount_holes_distance;
mount_holes_to_motor=8;
mount_holes_to_tip=e3d_h-titan_e3d_offset-mount_holes_to_motor;
mount_holes_to_bottom=mount_holes_to_tip-4;
mount_width_from_hole_0=26;

fan_w=40;
fan_holes=32;

blower_width=5;
blower_height=10;

module base(h=15) {
    rr=(fan_w-fan_holes)/2;
    cc=[rr,fan_w-rr];
 
    difference() {
        hull() {
            for (x=cc,y=cc) translate([x,y,0]) cylinder(r=rr,h=h);
        }
        hull() {
            for (x=cc,y=cc) translate([x,y,1]) cylinder(r=rr-1.2,h=h);
        }
    }
    
    difference() {
        for (x=cc,y=cc) translate([x,y,0]) cylinder(r=rr,h=h);
        for (x=cc,y=cc) translate([x,y,1]) cylinder(d=3, h=h);
    }

}

module duct() {
    
    intersection() {
        difference() {
            hull() {
                translate([-1,-fan_holes/2+2,0]) cube([1,fan_holes-4,blower_height]);
                translate([blower_width+1,-fan_holes/2+4,0]) cube([1,fan_holes-8,1]);
            }
            hull() {
                translate([-2,-fan_holes/2+3,-1]) cube([2,fan_holes-6,blower_height]);
                translate([blower_width,-fan_holes/2+5,0]) cube([1,fan_holes-10,1]);
            }
        }
        
        translate([-1,-fan_holes/2+2,0]) cube([1+blower_width,fan_holes-4,blower_height]);
    }
}

module blower() {
    rr=(fan_w-fan_holes)/2;
    difference() {
        union() {
            base();
            translate([fan_w,fan_w/2,0]) duct();
        }
        
        ww=10;
        translate([fan_w-ww,rr+3,-1]) cube([ww+0.1,fan_holes-6,blower_height]);
    }
}


module nut3(h=4) {
    hull() {
        for (r=[0:60:300]) rotate([0,0,r]) translate([3.2,0,0]) cylinder(d=0.1,h=h, $fn=2);
    }
}


module blower_with_mount() {
    translate([-fan_w-blower_width,-fan_w,0]) blower();
    difference() {
        translate([mount_hole_0_x-mount_width_from_hole_0,-0.1,mount_holes_to_bottom-7])
            cube([mount_width_from_hole_0+4,7,11]);
        
        for (hole=[mount_hole_0_x,mount_hole_1_x]) {
            translate([hole,-1,mount_holes_to_bottom]) rotate([-90,0,0]) {
                cylinder(d=3.4,h=10);
                translate([0,0,4]) nut3();
            }
        }
    }
    hull() {
        translate([mount_hole_0_x-mount_width_from_hole_0,-0.1,mount_holes_to_bottom-8])
            cube([mount_width_from_hole_0+4,7,2]);
        translate([-blower_width-fan_w+4,-0.1,0]) cube([fan_w-8,3,1]);
    }
}

echo(mount_holes_to_bottom);
blower_with_mount();
