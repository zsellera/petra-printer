$fn=24;

m3h=3.4;         // hole for an m3 screw

mgn12h=[46,27,13];          // carrige sizes
idler_total_dia=11;         // idler pulley's diameter with it's collars
idler_center_offset=4;      // where the idler's shaft is, in relation to 2020 frame

cablechain_min_bottom_from_frame=30;
cablechain_width=26;
cablechain_hole_1=[4,10,0];
cablechain_hole_2=[9.5,17,0];
cablechain_mount_width=15;

max_width=mgn12h[2]+20-3;     // 2020 frame + mgn12 heigth

module nut3(h=4) {
    hull() {
        for (r=[0:60:300]) rotate([0,0,r]) translate([3.3,0,0]) cylinder(d=0.1,h=h, $fn=2);
    }
}

module bottom() {
    hull() {
        translate([2,2,0]) cylinder(d=4,h=4);
        translate([2,18,0]) cylinder(d=4,h=4);
        translate([max_width-2,2,0]) cylinder(d=4,h=4);
        translate([max_width-2,18,0]) cylinder(d=4,h=4);
    }
}

*bottom();

module cablechain_column() {
    translate([4,0,0]) rotate([0,-90,0]) {
        difference() {
            cube([cablechain_min_bottom_from_frame+cablechain_width
                  ,cablechain_mount_width
                  ,4]);
            
            translate([cablechain_min_bottom_from_frame,0,-1]) 
            mirror([0,1,0]) rotate([0,0,-90]) {
                translate(cablechain_hole_1) cylinder(d=m3h,h=6);
                translate(cablechain_hole_1+[0,0,-1]) nut3();
                translate(cablechain_hole_2) cylinder(d=m3h,h=6);
                translate(cablechain_hole_2+[0,0,-1]) nut3();
            }
        }         
    }
}

*cablechain_column();

module cablechain_mount_top() {
    difference() {
        union() {
            bottom();
            translate([max_width*0.6,5,0]) cablechain_column();
            hull() {
                translate([max_width*0.6,16,0])
                    cube([4,4,cablechain_min_bottom_from_frame]);
                translate([2,16,0]) cube([max_width-4,4,4]);
            }
        }
        
        translate([7,10,-1]) cylinder(d=5.6,10);
        translate([7,10,4]) cylinder(d=11,10);
    }
}

cablechain_mount_top();

module cablechain_mount_bottom() {
    $fn=32;
    difference() {
        hull() {
            translate([2,2,0]) cylinder(d=4,h=15);
            translate([2,16,0]) cylinder(d=4,h=15);
            translate([16,2,0]) cylinder(d=4,h=15);
            translate([16,16,0]) cylinder(d=4,h=15);
        }
        translate([4,4,4]) cube([10,10,15]);
        translate([9,9,-1]) cylinder(d=5.6,h=17);
        translate([9,9,4]) cylinder(d=11,h=17);
        
        translate([9,3,8+19]) rotate([-90,0,0]) difference() {
            cylinder(d=38,h=12);
            translate([0,0,-1]) cylinder(d=33,h=14);
        }
        
        translate([9,-1,8+19]) rotate([-90,0,0]) cylinder(d=28,h=20);
    }
}

translate([-20,0,0]) cablechain_mount_bottom();