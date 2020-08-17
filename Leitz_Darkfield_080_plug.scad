/* This short code generates the Leitz 0.80 darkfield condenser plug with the geometry pulled from Leitz catalogue illustration */
/* Need as input the Iris diameter   */
/*run in OpenSCAD*/

//Diameter of the iris mm
iris_diam = 25;


sph_rad_1 = iris_diam*1.0356/2;
sph_rad_2 = iris_diam*1.668/2;
sph_offset = iris_diam*0.489;
outer_rad = iris_diam*1.344/2;
rim_height = 0.5;
sph_center_2 = rim_height -  pow(pow(sph_rad_2,2) - pow(outer_rad,2),0.5);
sph_center_1 = sph_center_2 + sph_offset;

intersection(){
    translate([0,0,0])cylinder(100,   outer_rad, outer_rad, true);
intersection() {
    translate([0,0,100])cube(200, center=true);
    union() {
    translate([0,0,sph_center_1])sphere(sph_rad_1);
    translate([0,0,sph_center_2])sphere(sph_rad_2); 
}
}
}


echo(version=version());

