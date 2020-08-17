
// Please insert the measures of the condenser as illustrated in the drawing if you know only the Iris diameter, put it and leave the other number as generated



// Diameter of the small mirror sphere
sph_diam_1 = 25.89; //[25.89]
//Diameter of the beam exit sphere
sph_diam_2 = 41.69;  //[41.69]
// Distance between the two spheres centre
sph_offset = 12.23; //[12.23]
// Maximum Diameter of the plug 
outer_diam = 33.6; //[33.60]
// Height of max diameter rim use 05 or 1 mm
rim_height = 0.5; //[0.5]

sph_center_2 = rim_height -  pow(pow(sph_diam_2/2,2) - pow(outer_diam/2,2),0.5);
sph_center_1 = sph_center_2 + sph_offset;
   
    

module make_part(){
intersection(){
    translate([0,0,0])cylinder(100,   outer_diam, outer_diam, true);
intersection() {
    translate([0,0,100])cube(200, center=true);
    union() {
    translate([0,0,sph_center_1])sphere(sph_diam_1/2);
    translate([0,0,sph_center_2])sphere(sph_diam_2/2); 
          }
        }
      }
}


    make_part();

