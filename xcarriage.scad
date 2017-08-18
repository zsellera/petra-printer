$fn=32;

mgn12h=[46,27,13];  // carrige sizes

nema17_w=43;     // motor width
nema17_d=32;     // distance between holes on motor
nema17_c=22;     // center shaft/bearing diameter

m3h=3.4;         // hole for an m3 screw

idler_height=14;
idler_dia=11;
idler_center_offset=4;      // where the idler's shaft is, in relation to 2020 frame
belt_above_frame=10;        // 2020 frame, empty space, belt (--> upwards)
belt_width=9;
belt_front_frame=idler_center_offset+idler_dia/2;

base_height=7;      // 3mm for plate + 3mm for m3 screw head
motor_height=base_height+4;    // titan has a +3.5mm edge, motor must be put heigher
titan_cogwheel_from_bottom=22;
titan_cogwheel_at_baseheight_from_bottom=26;
titan_cogwheel_dia=35;
titan_cogwheel_width=5;
titan_cogwheel_plate_distance=5;
nema_bottom_space=mgn12h[1]-titan_cogwheel_at_baseheight_from_bottom;
titan_width=27;

motor_plate_width=2.0;
motor_support_width=5.0;
motor_plate_start=mgn12h[0]/2-10+5;//motor_plate_width-3.5;

beltconnector_vertical_distance=nema17_w-mgn12h[1]+motor_support_width-nema_bottom_space-5.5-m3h/2;
cablechain_min_bottom_from_frame=30;
beltconnector_height=9;
cablechain_width=26;
cablechain_hole_1=[4,10,0];
cablechain_hole_2=[9.5,17,0];
cablechain_mount_width=16;

inductive_sensor_width=12;

module m3screw(l=10) {
    // head
    cylinder(d=7,h=l+3);
    // thread
    translate([0,0,-l]) cylinder(d=m3h, h=l+1);
}

module nut3(h=4) {
    hull() {
        for (r=[0:60:300]) rotate([0,0,r]) translate([3.2,0,0]) cylinder(d=0.1,h=h, $fn=2);
    }
}

module mgn12mountscrews() {
    translate([mgn12h[0]/2, mgn12h[1]/2, 3.2]) {
        translate([-10,-10,0]) m3screw();
        translate([-10,10,0]) m3screw();
        translate([10,-10,0]) m3screw();
        translate([10,10,0]) m3screw();
    }
}

module nema17(h=30) {
    translate([-nema17_w/2,-nema17_w/2,0]) cube([nema17_w, nema17_w, h]);
    
    hull() {
        translate([nema17_c/2-1,3,-10]) cylinder(d=2,h=11);
        translate([nema17_c/2-1,-3,-10]) cylinder(d=2,h=11);
        translate([0,0,-10]) cylinder(d=nema17_c,h=11);
    }
    
    for (r=[0:90:270]) 
        rotate([0,0,r]) translate([nema17_d/2,nema17_d/2,-10])
        cylinder(d=m3h,h=11);
}

module cablepin(height=10) {
    difference() {
        cube([motor_support_width,height,5]);
        
        translate([motor_support_width/2,-1,4+1.5*motor_support_width]) 
        rotate([-90,0,0]) cylinder(d=3*motor_support_width,h=height+2);
        
        translate([motor_support_width/2,2.5,1.5*motor_support_width]) rotate([-90,0,0])
        difference() {
            cylinder(d=3*motor_support_width,h=height-5);
            translate([0,0,-1]) cylinder(d=3*motor_support_width-4,h=height-3);
        }
    }
}

module motor_holder() {
    difference() {
        union() {
            hull() {
                cube([motor_plate_start+motor_plate_width,
                      motor_support_width+nema17_w+motor_support_width,
                      motor_height]);
                
                translate([motor_plate_start+motor_plate_width-motor_support_width,0,0])
                cube([motor_support_width,
                      motor_support_width+nema17_w+motor_support_width,
                      motor_height+nema17_w+3]);
            }
            translate([motor_plate_start+motor_plate_width-motor_support_width,
                       motor_support_width,
                       motor_height+nema17_w+3]) cablepin();
            translate([motor_plate_start+motor_plate_width-motor_support_width,
                       motor_support_width+nema17_w-10,
                       motor_height+nema17_w+3]) cablepin();
        }
        
        translate([motor_plate_start,motor_support_width,motor_height]) 
        translate([0,nema17_w/2,nema17_w/2]) rotate([0,-90,0]) nema17();
    }
}

module beltconnection_mount(vert_dist=20) {
    translate_z=-mgn12h[2]+1.5;
    translate([0,0,translate_z]) {
        translate([m3h/2+1.5,0,0]) {
            mirror([0,0,1]) m3screw(l=24);
            translate([0,0,-translate_z+3]) hull() {
                nut3();
                translate([-5,0,0]) nut3();
            }
        }
        
        translate([motor_plate_start+motor_plate_width-m3h/2-1.5,0,0]) {
            mirror([0,0,1]) m3screw(l=24);
            translate([0,0,-translate_z+3]) hull() {
                nut3();
                translate([5,0,0]) nut3();
            }
        }
        
        translate([m3h/2+1.5,vert_dist,0]) {
            mirror([0,0,1]) m3screw(l=24);
            translate([0,0,-translate_z+3]) hull() {
                nut3();
                translate([-5,0,0]) nut3();
            }
        }
        
        translate([motor_plate_start+motor_plate_width-m3h/2-1.5,vert_dist,0]) {
            mirror([0,0,1]) m3screw(l=24);
            translate([0,0,-translate_z+3]) hull() {
                nut3();
                translate([5,0,0]) nut3();
            }
        }
    }
}

module beltconnector_with_cablechain(start_above_mgn12h) {
    height=cablechain_min_bottom_from_frame
            + cablechain_width
            - (mgn12h[1]-20)/2
            - start_above_mgn12h;
    cablechain_base_pos=height-cablechain_width;
    
    belt_offset_z=beltconnector_height-mgn12h[2]+belt_front_frame;
    belt_notch_depth=-(mgn12h[1]-20)/2+belt_above_frame+belt_width+1;
    
    extra_width=3;
    extra_heigth=2;
    width=motor_plate_start+motor_plate_width + 2*extra_width;
    total_height=beltconnector_height+extra_heigth;
    
    curving_radius=motor_plate_start+motor_plate_width+extra_width-cablechain_mount_width;
    
    motor_holder_ending=nema17_w+nema_bottom_space-mgn12h[1]+motor_support_width+0.5;
    
    difference() {
        translate([-extra_width,0,0]) cube([width,height,total_height]);
        
        translate([-0.3,-0.1,beltconnector_height])
        cube([motor_plate_start+motor_plate_width+0.6,
              motor_holder_ending,
              10]);
        
        translate([0,cablechain_base_pos,-1]) {
            translate(cablechain_hole_1) cylinder(d=m3h,h=total_height);
            translate(cablechain_hole_1+[0,0,total_height-2]) nut3();
            translate(cablechain_hole_2) cylinder(d=m3h,h=total_height);
            translate(cablechain_hole_2+[0,0,total_height-2]) nut3();
        }
        
        translate([0,m3h/2+3.5,beltconnector_height])
        beltconnection_mount(vert_dist=beltconnector_vertical_distance);
        
        translate([-extra_width-1,-1,belt_offset_z-1])
        cube([width+2,belt_notch_depth+1,2.4]);
        
        translate([m3h*1.5+1.5,belt_notch_depth,belt_offset_z]) 
        rotate([90,0,0]) m3screw(15);
        translate([motor_plate_start+motor_plate_width-m3h*1.5-1.5,belt_notch_depth,belt_offset_z]) 
        rotate([90,0,0]) m3screw(belt_notch_depth);
        hull() {
            translate([m3h*1.5+2,belt_notch_depth,belt_offset_z]) rotate([90,0,0]) cylinder(d=7.5,h=belt_notch_depth+2);
            translate([motor_plate_start+motor_plate_width-m3h*1.5-2,belt_notch_depth,belt_offset_z]) rotate([90,0,0]) cylinder(d=7.5,h=belt_notch_depth+2);
        }
        
        translate([motor_plate_start+motor_plate_width+extra_width,motor_holder_ending+curving_radius,-1]) hull() {
            cylinder(r=curving_radius,h=total_height+2);
            translate([0,height,0]) cylinder(r=curving_radius,h=total_height+2);
        }
    }
    
    translate([-extra_width,cablechain_base_pos,0]) rotate([0,-90,0]) 
    cablepin(cablechain_width/2);
}


module pindamount(extra_height=3) {
    difference() {
        union() {
            hull() {
                translate([0,mgn12h[1]-2,0]) cylinder(d=4,h=base_height);
                translate([-10,2,0]) cylinder(d=4,h=base_height);
                translate([2,-10,0]) cylinder(d=4,h=base_height+extra_height);
                translate([3+inductive_sensor_width+m3h,-10,0]) 
                    cylinder(d=4,h=base_height+extra_height);
            }
            translate([0,-30,0]) hull() {
                cube([3+inductive_sensor_width+m3h+2,20,base_height+extra_height]);
                
                translate([3+inductive_sensor_width/2,0,3+inductive_sensor_width/2])
                rotate([-90,0,0]) cylinder(d=inductive_sensor_width+6,h=20);
                
                translate([3+inductive_sensor_width,0,0])
                cube([2+m3h,20,inductive_sensor_width+6]);
            }
        }
        
        translate([-100,-1,base_height]) cube([100,nema17_w,100]);
        translate([3+inductive_sensor_width/2,-31,3+inductive_sensor_width/2]) {
            rotate([-90,0,0]) cylinder(d=inductive_sensor_width,h=mgn12h[1]+32);
            
            translate([inductive_sensor_width/2+m3h/2,10,-inductive_sensor_width/2-4])
                nut3();
            
            translate([inductive_sensor_width/2+m3h/2,10,inductive_sensor_width/2+2.6])
                m3screw(20);
        }
    }
}

module pindamount_bottom() {
    extra_height=3;
    difference() {
        pindamount(extra_height);
        translate([-1,-31,base_height+extra_height])
            cube([inductive_sensor_width+m3h+8,100,inductive_sensor_width+3]);
    }
}

module pindamount_top() {
    extra_height=3;
    intersection() {
        pindamount(extra_height);
        translate([-1,-31,base_height+extra_height+2])
            cube([inductive_sensor_width+m3h+8,100,inductive_sensor_width+2]);
    }
}

module fanmount(distance=16,h=6) {
    difference() {
        hull() {
            translate([0,-1,0]) cube([distance+8,5,h]);
            for (d=[0,distance]) translate([d+4,-5,0]) cylinder(d=8,h=h);
        }
        for (d=[0,distance]) translate([d+4,-5,-1]) cylinder(d=m3h,h=h+2);
    }
}
    


color([0.5,0.3,0.7,0.5]) {
//2020 frame
translate([-100,mgn12h[1]/2-10,-mgn12h[2]-20]) cube([200,20,20]);
//belt:
translate([-100,mgn12h[1]/2+10+belt_above_frame,-mgn12h[2]+belt_front_frame])
    cube([200,belt_width,2]);
//cogwheel
*translate([motor_plate_start+motor_plate_width+titan_cogwheel_plate_distance,
           nema_bottom_space+nema17_w/2+nema17_d/2,
           motor_height+nema17_w/2-nema17_d/2])
rotate([0,90,0]) cylinder(d=titan_cogwheel_dia,h=titan_cogwheel_width);
}

difference() {
    union() {
        translate([0,-motor_support_width+nema_bottom_space,0]) motor_holder();
        
        translate([0,-motor_support_width+nema_bottom_space,0])
        cube([motor_plate_start+motor_plate_width+titan_width,mgn12h[1]+motor_support_width-nema_bottom_space,base_height]);
        
        translate([motor_plate_start+motor_plate_width+titan_width,0,0])      
            pindamount_bottom();
        
        translate([0,-nema_bottom_space-1,0]) fanmount();
    }
    mgn12mountscrews();
    
    //cogwheel
    translate([motor_plate_start+motor_plate_width+titan_cogwheel_plate_distance-2,
           nema_bottom_space+nema17_w/2+nema17_d/2,
           motor_height+nema17_w/2-nema17_d/2])
    rotate([0,90,0]) cylinder(d=titan_cogwheel_dia+3,h=titan_cogwheel_width+4);
    
    translate([0,mgn12h[1]+m3h/2+3.5,0])
    beltconnection_mount(vert_dist=beltconnector_vertical_distance);
    
}

pindamount_top();

translate([0,mgn12h[1],-beltconnector_height])
    beltconnector_with_cablechain(0);

// motor:
//translate([motor_plate_start,nema17_w/2+nema_bottom_space,nema17_w/2+motor_height]) 
//    rotate([0,-90,0]) nema17();