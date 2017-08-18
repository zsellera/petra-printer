
d=110;
mksl=75;
mksw=135;
board2l=55;
board2w=88;

module baseplate() {
    difference() {
        union() {
            hull() {
                translate([-6,d/2+6,0]) cylinder(d=6,h=4);
                translate([-6,-d/2-6,0]) cylinder(d=6,h=4);
            }
            hull() {
                translate([6,d/2+6,0]) cylinder(d=6,h=4);
                translate([6,-d/2-6,0]) cylinder(d=6,h=4);
            }
            hull() {
                translate([0,d/2,0]) cylinder(d=6,h=4);
                translate([0,-d/2,0]) cylinder(d=6,h=4);
            }
        }

        hull() {
            translate([0,d/2,-1]) cylinder(d=6,h=6);
            translate([0,d/2+11,-1]) cylinder(d=6,h=6);
        }
        hull() {
            translate([0,-d/2,-1]) cylinder(d=6,h=6);
            translate([0,-d/2-11,-1]) cylinder(d=6,h=6);
        }
    }
}

difference() {
    union() {
        baseplate();
        intersection() {
            scale([1,1,10]) baseplate();
            
            translate([-6,mksl/2,0]) hull() {
                cylinder(d=15,h=4);
                cylinder(d=8,h=10);
            }
        }
        intersection() {
            scale([1,1,10]) baseplate();
            
            translate([-6,-mksl/2,0]) hull() {
                cylinder(d=15,h=4);
                cylinder(d=8,h=10);
            }
        }
        translate([-6,-board2l/2,0]) hull() {
            translate([6,0,0]) cylinder(d=18,h=4);
            translate([mksw/2-board2w/2,0,0]) cylinder(d=8,h=4);
        }
        translate([-6,board2l/2,0]) hull() {
            translate([6,0,0]) cylinder(d=18,h=4);
            translate([mksw/2-board2w/2,0,0]) cylinder(d=8,h=4);
        }
    }
    
    translate([-6,mksl/2,-1]) cylinder(d=3.6,h=20);
    translate([-6,-mksl/2,-1]) cylinder(d=3.6,h=20);
    
    translate([-6+mksw/2-board2w/2,-board2l/2,-1]) cylinder(d=3.6,h=20);
    translate([-6+mksw/2-board2w/2,board2l/2,-1]) cylinder(d=3.6,h=20);
}