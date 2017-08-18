

difference() {
    square(size=[220,220], center=true);
    translate([0,-71]) {
        circle(d=40);
        translate([0,-20]) square(size=[40,40], center=true);
    }
    translate([0,71]) {
        circle(d=40);
        translate([0,20]) square(size=[40,40], center=true);
    }
    translate([104.5,104.5]) circle(d=3);
    translate([104.5,-104.5]) circle(d=3);
    translate([-104.5,104.5]) circle(d=3);
    translate([-104.5,-104.5]) circle(d=3);
    
    translate([-70,60]) {
        translate([-16,0]) circle(d=3);
        translate([16,0]) circle(d=3);
    }
    translate([-70,-60]) {
        translate([-16,0]) circle(d=3);
        translate([16,0]) circle(d=3);
    }
    translate([70,60]) {
        translate([-16,0]) circle(d=3);
        translate([16,0]) circle(d=3);
    }
    translate([70,-60]) {
        translate([-16,0]) circle(d=3);
        translate([16,0]) circle(d=3);
    }
    translate([0,0]) {
        #translate([0,9.5]) circle(d=3);
        translate([0,-9.5]) circle(d=3);
    }
}