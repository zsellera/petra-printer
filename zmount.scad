$fn=32;

module nutfit() {
    translate([0,0,-1]) cylinder(d=10.5,h=10);
    translate([0,0,7]) cylinder(d=14.5,h=50);
    for (r=[45:90:360]) {
        rotate([0,0,r]) {
            translate([8,0,-1]) cylinder(d=3.2,h=10);
            translate([8,0,4]) cylinder(d=6,h=15);
        }
    }
}

module nutfit_with_mgn12hfit() {
    translate([-12,0,0]) nutfit();
    translate([0,0,(45.5-20)/2]) rotate([0,-90,0]) {
        for (x=[0,20]) for (y=[-10,10]) {
            translate([x,y,-1]) cylinder(d=3.2,h=20);
        }
        h=12.8; // m3x15mm screw
        for (x=[0,20]) hull() {
            translate([x,-10,h]) cylinder(d=5.5,h=30);
            translate([x,10,h]) cylinder(d=5.5,h=30);
        }
    }
}

module all_nuts() {
    translate([0,27/2,0]) nutfit_with_mgn12hfit();
    translate([-20,0,13]) rotate([-90,0,0]) {
        translate([0,0,-6]) cylinder(d=5.3,h=7);
        hull() {
            translate([0,0,0]) cylinder(d=11,h=30);
            translate([-20,0,0]) cylinder(d=11,h=30);
        }
    }
}

//all_nuts(); 

difference() {
    union() {
        hull() {
            cube([5,27,45.5]);
            translate([0,-5,0]) cube([26,5,45.5]);
            translate([18,22,0]) cylinder(r=5,h=45.5);
        }
        hull() {
            translate([0,-5,10]) cube([18,1,6]);
            translate([0,-6.5,10.5]) cube([16,3,5]);
        }
        hull() { // top connection
            translate([2.5,-20,13+10]) cylinder(d=5,h=14);
            translate([20.5-6-2.5,-20,13+10]) cylinder(d=5,h=14);
            translate([2.5,0,13+10]) cylinder(d=5,h=14);
            translate([20.5-6-2.5,0,13+10]) cylinder(d=5,h=14);
        }
    }
    mirror([1,0,0]) all_nuts();
    
    translate([33,0,0]) hull() {
        translate([0,10,-1]) cylinder(d=20,h=50);
        translate([20,10,-1]) cylinder(d=20,h=50);
        translate([0,35,-1]) cylinder(d=20,h=50);
    }
   
    hull() {
        translate([11,-6,50]) rotate([-90,0,0]) cylinder(d=12,h=40);
        translate([11,-6,43]) rotate([-90,0,0]) cylinder(d=12,h=40);
        translate([40,-6,42]) rotate([-90,0,0]) cylinder(d=12,h=40);
    }
    
    hull() {
        translate([20.5,-6,50]) rotate([-90,0,0]) cylinder(d=12,h=40);
        translate([20.5,-6,13+10+6]) rotate([-90,0,0]) cylinder(d=12,h=40);
        translate([40,-6,13+10+6]) rotate([-90,0,0]) cylinder(d=12,h=40);
    }
    
    hull() {
        translate([-1,-20.5,38]) rotate([0,90,0]) cylinder(d=18,h=20);
        translate([-1,-14.5,38]) rotate([0,90,0]) cylinder(d=18,h=20);
    }
    hull() {
        translate([14.5/2,-14.5,22]) cylinder(d=5.6,h=20);
        translate([14.5/2,-15.5,22]) cylinder(d=5.6,h=20);
    }
    hull() {
        translate([14.5/2,-14.5,27]) cylinder(d=11,h=20);
        translate([14.5/2,-15.5,27]) cylinder(d=11,h=20);
    }
}