 // design of objective funnel stops for darkfield, luminance, 3D, dispersion staining etc..
// OpenSCAD file
// of all types to fit into microscope objectives from the foreseeable past.

// Giorgio Pattarini Oktober-November 2021
// Released under CC0 





//user-defined parameters---------------


/*[ Choice of model]*/

// Choose the design that fits best  into your objective. "funnels" are printed from the base upward, "tubs" from the aperture
Model="Funnel neck fit"; //[Funnel neck fit, Funnel tab flange, Funnel flush flange, Tub sleeve fit, Tub tip fit, Flat disk, Flat tab flange]


//Choice of fitting, the main contact and centering between funnel and objective
fitting="Press fit"; //[Screw thread, Press fit, Straight, Fake thread]





/*[ Body and fitting dimensions]*/

// Nominal diameter of the fitting AS MEASURED (for screw, diameter of male thread)  (for press fit, inner diameter of the bore to fit)
fit_diam_nom=15.1;

// Tweak the fitting diameter to get optimal fit ( use zero for the first print trial) (change it for looser or tighter fit, +0.2 mm makes it larger, therefore tighter)  (by default: Thread and Straight are designed with nominal diameter. Press-fit has built-in 0.2mm extra diameter)
fit_diam_tweak= 0.001;

// Pitch of the screw thread in case(most common is 0.5 mm)
passo_vite=0.51;  //italian because the english is already in use


//Funnel total height (it is 0 for flat ) (does not include base thickness)
funnel_height=33.3;


// Outer diameter of the funnel tip (will get overridden by fit diameter for flat and tip-fit models)(0.1 for automatic) 
tip_diameter=0.1;

// Heigth of the tip, (will override total height if larger) (is overridden only for tip-fit tub, by minimum fit height) (0.1 for automatic) 
tip_height= 0.1; // heigth tip

// Outer diameter of the funnel base tube (may get overridden if there is no space)(0.1 for automatic) 
tube_diameter= 0.1;

//Height of the tapered cone (funnels only)(leave 0.1  for auto) (put zero for a step)
cone_height=0.1;

// Diameter of the base flange (only for funnel models) (0.1 for auto, +3mm step)
flange_diameter=0.1;

// Thickness of the base flange for funnel models (also tot thickness for flat models)
flange_thickness=2.1;




/*[Type and dimensions of the stop]*/

// Type of stop (some designs are available only for flat-printed aperture)
tip="Standard"; //[Standard, Half Moon, Center stop,Stop that removes all aberrations, Ohers ]

//  Main stop diameter (will be overridden if smaller than available diameter, and also baffling may chime in ) (0.1 for automatic, will set the maximum)
main_aperture_diameter=5.1;
;
// Main stop off-center, for oblique illumination and 3D imaging (leave 0 for centered)
main_aperture_off_center=0.1;
// inner stop disk diameter , for inverted darkfield aka luminance contrast 
inner_stop_disk_diameter= 2.1;
// Inner stop disk off-center, for oblique illumination
inner_stop_center_offset=0;
// Half moon stop coverage, 0 is half
moon_phase=0.1;
// Rotate the off-center of secondary stops wrt primary aperture off-center direction
angle_stops=0;




/*[Baffling]*/

//  Size of small baffles (they may restrict the desired aperture, put 0 to get rid of them)
small_baffles_size=0.3;
// Number of big baffles (put 0 for no main baffles)
baffleantall=5; 
// Open optical diameter of the main baffle at the flange, (if left to 0.1, diameter gets generated automatically )(may get overridden if there is not enough space)
flange_baffle_diameter = 0.1; //


/*[Interchangeable funnel cap]*/

// For funnel models only, tip can be integrated (one piece, more solid) or separated (interchangeable, more options, neater aperture) 
tip_style="Fixed tip"; //[Fixed tip, Interchangeable tip]

// For Interchangeable tip funnels, choose what to print
inter_print="One base and one tip"; //[ "One base and one tip", "Base only", "Tip only"]

// adjust the interference between base and tip so it fits right (acts on caps)
cap_fit_angle=3;




/*[Render and print tweaks]*/

// Cuts half of the body so the inside is visible 
cross_section="Full body";//[Full body, Cross section]

//build geometries slightly larger to avoid issues in intersections and differences
 overmaterial=0.001; 
 
 // render quality, number of divisions in rotations, global $fn (higher, smoother 3D, but longer processing time)(12 crude)(30 normal) (60 fine)
divs= 30; //  

// screw design, circumferential step (heavily affect processing time) (1mm is ok )
screw_resolution = 1.1;  // in mm
// unknown tweak with unknown results
cylrad=7.5;



/*[ Geometry tweaks]*/


// Normal wall thickness of the parts (funnel walls, tabs etc have this thickness by default)(1.5mm robust, 1 mm normal, 0.5mm risky)(wall thickness may reduce inner aperture diameter)
wallth_normal=1.1;
//Use wallth for most modules
wallth=wallth_normal;

// max overhang angle, for FDM 3D printing (it affects shape, baffles, etc) (30, safe) (45, ok) (60, risk of printing defects) (90, printer or software crash) ( >90 , tachions)
maxoverhang=30;
overhang=maxoverhang;
rake_overhang=tan(90-maxoverhang);

// number of braces supporting the stop(spiders)(only for aperture printed down)(otherwise 4 spiders & no discussions)
spidernumber=3;

// width spiders, to make them as thin as possible
wspider = 0.8;

// the spider can be made curved, to smooth out diffraction spikes (works only for bottom print and if the stop button is centered with the aperture)
spider_curve="Curved"; //["Curved", "Straight"]

// for bottom print, the edge of apertures can be made recessed so comes out better from the print (otherwise are printed directly on the plate)
aperture_recess="Recessed edge"; //["Recessed edge", "Front edge"]






/*[Fitting tweaks]*/

// Tweak the size of the relief cuts for press fit models (Large, 1 makes for better print and fit, but takes space, 1/2 takes half space, 0 no cuts)
pressfit_cut_size=1; //[1, 0.7, 0]

// Tweak the standard interference for press fit models (0.2 mm recommended)
pressfit_interference_diameter=0.2;

// changes the position of the notches for screwing
notch_override=0.01;


// fitting ring
// Tweaks of the fitting ring:  total height of the fitting tab block (0 for automatic, the minimum to have some fit) (to remove the fitting tab altogether, choose "straight fit" above) (if shorter than the Auto, will remove relief and rake)
ring_height_override=0;
// Rake angle of the fitting tab (0 for automatic, the rake_overhang angle)
tab_rake_override=0;
// relief of the fitting tab, in both direction (here zero means zero)
tab_relief=0.5;
//moves up and down the fit tab wrt its auto position
tab_height=0;
// makes the fitting tab of different thickness, (extra radius wrt supporting ring)(0 auto)
tab_thickness_override=0.0;



 








/*  [Make an array of pieces]

// number of stop diameters  (it generates several caps together with the funnel) put 0 for no caps, With 1, it makes the minimum
rcapsteps=4;
// minimum radius of the central stop
rcapmin=1; 
// maximum radius of the central stop
rcapmax=3; 
// The central stop can be off centered, Here how many offset caps will print
offcapsteps=1;
// minimum off center of the central stop, Leave zero for centered stop
offcapmin=0; 
// max stop offset, distance from center
offcapmax=1; 

*/


 // end variables--------------

{// Geometry drawings and calculations----------------------------


{  // Drawings   
    /* 
  
                 _
                |_| minimum wall thickness
    
|    
|
+ center axe - Half-section profile views 
| 
|  
    
      - STANDARD FUNNELS - 
    
 _               ____                   _
|    aperture_or-\   |-tip_rad_build     |tip_height_build
|                 \  |                   |
|                  | |                  _| 
|                  \ \-(taper cone)
|tot_height_build   \ \ 
|                    | |-tube_rad_build
|                    | |   
|                    | |__|fit_ring_rad_in        _
|                    | |  | |                      |fit_ring_height_build
|                    | |  | \                      |
| fit_bore_rad_build-| |  |  |-fit_rad_out         |
|                    | |  | /                      |
|                    | |  |-fit_ring_rad_out       |
|_                   | |  | |__________           _|        _
   baffle_flange_rad_build|_| |  |            |                     |flange_height_build
                    \__|__|____________|-flange_rad_build   _| 
    
 
 
   
    - TIP FIT FUNNEL -
  
 _                  ___
|   baffle_flange_rad_build\  |
|                    | |-tube_rad_build
|                    | |
|                    / /
|                   / /                   __ tip_height_build
|tot_height_build   | |                    _|
|                   | |                     |fit_ring_height_build
|fit_bore_rad_build-| \                     |
|   fit_ring_rad_in-|  |-fit_rad_out        |
|                   | /                     |
|                ___| |-tip_rad_build       |
|_  aperture_or-/_____|-fit_ring_rad_out  __|             
  
 
 
 
 
    - SLEEVE FIT FUNNEL- 
    
 _                  ___
|  baffle_flange_rad_build-\  |                 
|                    | |-tube_rad_build    _
|                    | |-fit_ring_rad_out   |fit_ring_height_build
| fit_bore_rad_build-| \                    |
|    fit_ring_rad_in-|  |-fit_rad_out       |
|                    | /                    |
|                    | |                   _|
|                    / /
|                   / /                 _ 
|tot_height_build   | |                  |tip_height_build
|                   | |                  |
|                   | |                  |
|                   | |                  |
|                   | |                  |
|                ___| |-tip_rad_build    |
|_  aperture_or-/_____|                 _|   
  
  
 
 
           - FLAT DISK -    
    
    
            tube_rad_build-| |-fit_ring_rad_in
 _                        _____
|                        | | | |
|                        | | | |                   _
|tot_height_build        | | | |                    |fit_ring_height_build
|                        | | | \                    |
|     fit_bore_rad_build-| | |  |-fit_rad_out       |
|                    ____| | | /                    |
|_      aperture_or-/__________|-fit_ring_rad_out  _|




           - FLANGED DISK -
   
   
           tube_rad_build-| |-fit_ring_rad_in    
                         _____                    _ 
                        | | | |-fit_ring_rad_out   |fit_ring_height_build
     fit_bore_rad_build-| | |  \                   |
                        | | |  |-fit_rad_out       |
                        | | |  /                   |
                        | | | |________     _     _|    
                   _____|              |     |
      aperture_or-/____________________|    _| flange_height_build
                        

  
    
    */  
}

{// Dimension calculations
    echo();
    echo("------- Construction dimensions: -------");   
    echo(Model);
    echo(fitting);
    echo(tip);
    
{// fit rings
//  checks the type of fitting and determines the diameters and sizes of the fit tab, with global variables & horrible formatting
      //the screw thread needs an outer diameter as fit, supporting tube diameter matching the female thread inner with pointy tips; heigth such that makes at least two full threads
      // The press fit is made with some interference, 0.4mm tab depth, 1mm tab height
      // The straight fit is made at build diameter and height as minimum thickness
    
//   external radius to fit in the bore or female thread
    fit_diam=fit_diam_nom + fit_diam_tweak;

    fit_rad_out=   
    (fitting=="Press fit")  ?
    (1/2)*(fit_diam+pressfit_interference_diameter)
    :
    (1/2)*fit_diam;
    
    echo("Build fitting diameter:  ", fit_rad_out*2, "mm"); 
    

        
// radius of tube supporting the ring
    fit_ring_rad_out=
    (tab_thickness_override!=0)?
    fit_rad_out-tab_thickness_override
    :
    (fitting=="Screw thread" || fitting=="Fake thread")   ?
    fit_rad_out - 0.86603 * passo_vite -overmaterial
    :
    (fitting=="Press fit")      ?
    fit_rad_out-0.4
    :   
    fit_rad_out;
    
    
    fit_ring_rad_in=fit_ring_rad_out-wallth;
  
// rake of the tab
    fit_tab_rake=
    (tab_rake_override!=0)?
    tan(90-tab_rake_override)
    :
    rake_overhang;  

// height of the tab (the portion at full diameter)
    fit_tab_height=  
    (ring_height_override!=0)?
    ring_height_override-2*(tab_relief + fit_tab_rake*(fit_ring_rad_out-fit_rad_out))
    :
    (fitting=="Screw thread")   ?
    2*passo_vite
    :
    (fitting=="Fake thread" )   ?
    2*passo_vite
    :   (
    fitting=="Press fit")  ?
    1
    :
    wallth;
    
    


    fit_ring_height_build= fit_tab_height + 2*(tab_relief + fit_tab_rake*(fit_rad_out-fit_ring_rad_out));
    
    echo("Build height of fitting assembly:  ", fit_ring_height_build, "mm");
   

}//end fit rings------------------------------------------


{// bores heights for the tubes and tips

//  max available inner optical bore radius, as restricted by the fitting ring
    // in most cases can go until the fitting
    // for some press fit, need to accomodate the flexing tab and its cut
    //also if the tube diameter is user defined, may restrict it

    fit_bore_rad_build=
    ( (Model=="Funnel tab flange" || Model=="Funnel flush flange" || Model=="Flat disk" || Model=="Flat tab flange")&&( fitting=="Press fit"))?
        (tube_diameter==0.1)? 
        fit_ring_rad_in-wallth*(1+pressfit_cut_size)
        :
        min(tube_diameter/2, (fit_ring_rad_in-wallth*(1+pressfit_cut_size)))
    :
    (Model=="Tub tip fit" || Model=="Tub sleeve fit")?
        fit_ring_rad_in          
        :
        (Model== "Funnel neck fit" || tube_diameter==0.1)?
        fit_ring_rad_in
        :
        min(tube_diameter/2, fit_ring_rad_in);
     
    tube_rad_build=
    ( Model=="Tub tip fit")?
    max(tube_diameter/2, fit_ring_rad_out)
    :
    fit_bore_rad_build+wallth;
    
   
  if( tube_rad_build<tube_diameter/2)
    {
        echo("Tube diameter overridden by max fit diameter");       
        echo("Wanted tube diameter:  " ,tube_diameter, "mm");
    } 
    echo("Build  tube diameter:  ", 2*tube_rad_build, "mm");
      
// available outer diameter for the tip
    
    tip_rad_build=
    ( Model=="Tub tip fit")?
    fit_bore_rad_build+wallth
    :
    (tip_diameter==0.1)?
        min(tube_rad_build, main_aperture_diameter/2 + wallth+0.5+main_aperture_off_center)
        :
        min(tip_diameter/2, tube_rad_build);

if((tip_diameter!=0.1) && (tip_diameter!=2*tip_rad_build))  
    { 
        echo("Wanted tip diameter overridden by fitting diameter");
        echo("Wanted tip diameter:  " ,tip_diameter, "mm");  
    }
    echo("Build_ tip diameter:  ", tip_rad_build*2, "mm"); 
        
        
// for the Tub fit models, tip height overrides total height
// for all other models, the opposite
//fit ring height always overrides
// for Interchangeable tip models, needs at least 5* wall thickness tip height to fit the clamping mechanism

      
    tot_height_build=
        (Model=="Tub tip fit")?
         max(funnel_height, tip_height, fit_ring_height_build)
         :
         (Model=="Tub sleeve fit")?
            max(funnel_height, tip_height + fit_ring_height_build + rake_overhang*(tube_rad_build-tip_rad_build))          
            :
            max(funnel_height, fit_ring_height_build );
       
    tip_height_build=
        (Model=="Tub tip fit")?
        max(tip_height, fit_ring_height_build)
        :
        (tip_style=="Interchangeable tip")?
               min( max(5*wallth, tip_height), tot_height_build)
                :
        (tip_height==0.1)?
            tot_height_build/4
            :
        min(tip_height, tot_height_build);
        

 
    if(tot_height_build!=funnel_height)  
    { 
        echo("Wanted tot height overridden");
        echo("Wanted tot height:  " ,funnel_height, "mm");  
    }
    echo("Build_ tot heigth:  ", tot_height_build, "mm"); 

    if(tip_height_build!=tip_height)  
    { 
        echo("Wanted tip height overridden");
        echo("Wanted tip height:  " ,tip_height, "mm");  
    }
    echo("Build_ tip heigth:  ", tip_height_build, "mm");  
       
              
// Determines the main aperture DIAMETER of the funnel, either user defined or auto with a tiny 0.2mm baffle, overrides the user defined if too small 
        aperture_od=  
        (main_aperture_diameter==0.1)?
        2*(tip_rad_build-wallth - 0.2 ) 
        :
        min(main_aperture_diameter, 2*(tip_rad_build-wallth - 0.2 )) ;
        
    if( main_aperture_diameter>aperture_od)
    {
        echo("Aperture overridden by max tube diameter");       
        echo("Wanted aperture__ :  ",main_aperture_diameter, "mm");
    } 
    echo("Build max aperture:  ", aperture_od, "mm");
        
// Determines the radius of the main baffles, either auto (start with aperture then rake 1/10 or 0.2mm baffle on top if less) or user defined

    baffle_aperture_rad_build=
    (tip_style=="Interchangeable tip")?
    min(aperture_od/2+ abs(main_aperture_off_center), (tip_rad_build-wallth - 0.2 ))
    :
    aperture_od/2;


    baffle_flange_rad_build=
    ((tip_style=="Interchangeable tip" )&&(flange_baffle_diameter==0.1) )?
        min(baffle_aperture_rad_build+ (1/15)*tot_height_build ,tube_rad_build-wallth-0.2)
    :
    (flange_baffle_diameter==0.1 )?
    min(baffle_aperture_rad_build + (1/15)* tot_height_build, tube_rad_build -wallth-0.2)
    :
    min(flange_baffle_diameter/2,tube_rad_build -wallth-0.2) ;

    echo("Build aperture baffle diameter:  ", 2*baffle_aperture_rad_build, "mm"); 
    
    if( baffle_flange_rad_build<flange_baffle_diameter/2)
    {
        echo("Mac baffle diameter overridden by max tube diameter");     
        echo("Wanted base baffle diameter:  ",flange_baffle_diameter, "mm");
    } 
    echo("Build base baffle diameter_:  ", 2*baffle_flange_rad_build, "mm");             
  

// base flange overrides, thickness and diameter
// minimum diameter the supporting tube, thickness wallth, or need rake for bottom-built tubs
    
    flange_rad_build=
    (Model=="Funnel flush flange" || Model=="Flat disk")?
    fit_ring_rad_out
    :
    (flange_diameter==0.1)?
        max(fit_rad_out+2.5,tube_rad_build+2.5)
        :
    max(flange_diameter/2, tube_rad_build, fit_ring_rad_out);
    
    if((flange_diameter!=0) && ((2*flange_rad_build)>flange_diameter))  
    { 
        echo("Wanted flange diameter overridden by fitting diameter");
        echo("Wanted flange diameter:  " ,flange_diameter, "mm");  
    }
    echo("Build_ flange diameter:  ", flange_rad_build*2, "mm"); 
   
   flange_height_build=
    (Model=="Tub sleeve fit" ||Model=="Tub tip fit")?
    max(flange_thickness, (wallth/2) + rake_overhang*(flange_rad_build-tube_rad_build+ overmaterial))
    :
   (flange_thickness==0.1)?
        (Model=="Funnel flush flange" || Model=="Flat disk")?
        0
        :           
        2
   :
   max(flange_thickness, wallth);

    if(flange_height_build> flange_thickness && flange_thickness!=0)  
    { 
        echo("Wanted flange thickness overridden");
        echo("Wanted flange height:  " ,flange_thickness, "mm");  
    }
    echo("Build_ flange height:  ", flange_height_build, "mm");


     
// for top-print models, the height needs  include conical rake from tip radius to sleeve radius; it is only auto. For bottom-print, it can be user defined
    cone_height_build=
    (Model=="Tub sleeve fit" ||Model=="Tub tip fit")?
    (tube_rad_build-tip_rad_build)*rake_overhang
    :
    (cone_height==0.1)?
    max(0, tot_height_build-tip_height_build-fit_ring_height_build)
       :
    max(0, min (cone_height, tot_height_build-tip_height_build-fit_ring_height_build));

// needs also internal cone
    cone_inner_height_build=
    (Model=="Tub sleeve fit" ||Model=="Tub tip fit")?
    (tube_rad_build-tip_rad_build)*rake_overhang
    :
    max(cone_height_build, (tube_rad_build-tip_rad_build)*rake_overhang);

    echo("Outer cone height build =", cone_height_build);
    echo("Inner cone height build =", cone_inner_height_build);

// the fitting tab height may be shifted, for the sleeve Model, or zeroed for the flush and flat
    fit_ring_zero=
    (Model=="Tub sleeve fit")?
    tip_height_build + cone_height_build + tab_height
    :
    (Model=="Funnel flush flange"|| Model=="Flat disk")?
    tab_height
    :
    tab_height;
    
    echo("Fit ring start z", fit_ring_zero);




echo(" ------- End construction dimensions --------");
echo();
        
}    // end bores        
}    // end calculations--------------------
}    //end geometry setup-------------------
{//utility modules-----------------
module crossection(){
    //cuts half of the body to make the inside visible
    if(cross_section=="Cross section"){
     
    difference(){
        children();
        rotate(90,[0,0,1])
    linear_extrude(200, center=true)
       polygon(
points=[
    [100,-100],[100,0],[-100,0],[-100,-100]]);}
}
    else {children();}
    }
    
    
     //clean everything below zero
 module clean_negative(){
     difference(){
     children();
     rotate_extrude($fn=divs)
polygon(
points=[
  [0, 0],[100,0],
    [100, -100], [0, -100],
  [0,0]
  ]
  ); 
     }}
    
} // end utility modules
    
    
{// screw design modules-----------
    
    
    
// Created 2016-2017 by Ryan A. Colyer.
// This work is released with CC0 into the public domain.
// https://creativecommons.org/publicdomain/zero/1.0/
//
// https://www.thingiverse.com/thing:1686322
//
// v2.1

// This generates a closed polyhedron from an array of arrays of points

module ClosePoints(pointarrays) {
  function recurse_avg(arr, n=0, p=[0,0,0]) = (n>=len(arr)) ? p :
    recurse_avg(arr, n+1, p+(arr[n]-p)/(n+1));

  N = len(pointarrays);
  P = len(pointarrays[0]);
  NP = N*P;
  lastarr = pointarrays[N-1];
  midbot = recurse_avg(pointarrays[0]);
  midtop = recurse_avg(pointarrays[N-1]);

  faces_bot = [
    for (i=[0:P-1])
      [0,i+1,1+(i+1)%len(pointarrays[0])]
  ];

  loop_offset = 1;
  bot_len = loop_offset + P;

  faces_loop = [
    for (j=[0:N-2], i=[0:P-1], t=[0:1])
      [loop_offset, loop_offset, loop_offset] + (t==0 ?
      [j*P+i, (j+1)*P+i, (j+1)*P+(i+1)%P] :
      [j*P+i, (j+1)*P+(i+1)%P, j*P+(i+1)%P])
  ];

  top_offset = loop_offset + NP - P;
  midtop_offset = top_offset + P;

  faces_top = [
    for (i=[0:P-1])
      [midtop_offset,top_offset+(i+1)%P,top_offset+i]
  ];

  points = [
    for (i=[-1:NP])
      (i<0) ? midbot :
      ((i==NP) ? midtop :
      pointarrays[floor(i/P)][i%P])
  ];
  faces = concat(faces_bot, faces_loop, faces_top);

  polyhedron(points=points, faces=faces);
}



// This creates a vertical rod at the origin with external threads.  It uses
// metric standards by default.
module ScrewThread(outer_diam, height, pitch=0, tooth_angle=30, tolerance=0.4, tip_height=0, tooth_height=0, tip_min_fract=0) {

  pitch = (pitch==0) ? ThreadPitch(outer_diam) : pitch;
  tooth_height = (tooth_height==0) ? pitch : tooth_height;
  tip_min_fract = (tip_min_fract<0) ? 0 :
    ((tip_min_fract>0.9999) ? 0.9999 : tip_min_fract);

  outer_diam_cor = outer_diam + 0.25*tolerance; // Plastic shrinkage correction
  inner_diam = outer_diam - tooth_height/tan(tooth_angle);
  or = (outer_diam_cor < screw_resolution) ?
    screw_resolution/2 : outer_diam_cor / 2;
  ir = (inner_diam < screw_resolution) ? screw_resolution/2 : inner_diam / 2;
  height = (height < screw_resolution) ? screw_resolution : height;

  steps_per_loop_try = ceil(2*3.14159265359*or / screw_resolution);
  steps_per_loop = (steps_per_loop_try < 4) ? 4 : steps_per_loop_try;
  hs_ext = 3;
  hsteps = ceil(3 * height / pitch) + 2*hs_ext;

  extent = or - ir;

  tip_start = height-tip_height;
  tip_height_sc = tip_height / (1-tip_min_fract);

  tip_height_ir = (tip_height_sc > tooth_height/2) ?
    tip_height_sc - tooth_height/2 : tip_height_sc;

  tip_height_w = (tip_height_sc > tooth_height) ? tooth_height : tip_height_sc;
  tip_wstart = height + tip_height_sc - tip_height - tip_height_w;


  function tooth_width(a, h, pitch, tooth_height, extent) =
    let(
      ang_full = h*360.0/pitch-a,
      ang_pn = atan2(sin(ang_full), cos(ang_full)),
      ang = ang_pn < 0 ? ang_pn+360 : ang_pn,
      frac = ang/360,
      tfrac_half = tooth_height / (2*pitch),
      tfrac_cut = 2*tfrac_half
    )
    (frac > tfrac_cut) ? 0 : (
      (frac <= tfrac_half) ?
        ((frac / tfrac_half) * extent) :
        ((1 - (frac - tfrac_half)/tfrac_half) * extent)
    );


  pointarrays = [
    for (hs=[0:hsteps])
      [
        for (s=[0:steps_per_loop-1])
          let(
            ang_full = s*360.0/steps_per_loop,
            ang_pn = atan2(sin(ang_full), cos(ang_full)),
            ang = ang_pn < 0 ? ang_pn+360 : ang_pn,

            h_fudge = pitch*0.001,

            h_mod =
              (hs%3 == 2) ?
                ((s == steps_per_loop-1) ? tooth_height - h_fudge : (
                 (s == steps_per_loop-2) ? tooth_height/2 : 0)) : (
              (hs%3 == 0) ?
                ((s == steps_per_loop-1) ? pitch-tooth_height/2 : (
                 (s == steps_per_loop-2) ? pitch-tooth_height + h_fudge : 0)) :
                ((s == steps_per_loop-1) ? pitch-tooth_height/2 + h_fudge : (
                 (s == steps_per_loop-2) ? tooth_height/2 : 0))
              ),

            h_level =
              (hs%3 == 2) ? tooth_height - h_fudge : (
              (hs%3 == 0) ? 0 : tooth_height/2),

            h_ub = floor((hs-hs_ext)/3) * pitch
              + h_level + ang*pitch/360.0 - h_mod,
            h_max = height - (hsteps-hs) * h_fudge,
            h_min = hs * h_fudge,
            h = (h_ub < h_min) ? h_min : ((h_ub > h_max) ? h_max : h_ub),

            ht = h - tip_start,
            hf_ir = ht/tip_height_ir,
            ht_w = h - tip_wstart,
            hf_w_t = ht_w/tip_height_w,
            hf_w = (hf_w_t < 0) ? 0 : ((hf_w_t > 1) ? 1 : hf_w_t),
          
            ext_tip = (h <= tip_wstart) ? extent : (1-hf_w) * extent,
            wnormal = tooth_width(ang, h, pitch, tooth_height, ext_tip),
            w = (h <= tip_wstart) ? wnormal :
              (1-hf_w) * wnormal +
              hf_w * (0.1*screw_resolution + (wnormal * wnormal * wnormal /
                (ext_tip*ext_tip+0.1*screw_resolution))),
            r = (ht <= 0) ? ir + w :
              ( (ht < tip_height_ir ? ((2/(1+(hf_ir*hf_ir))-1) * ir) : 0) + w)
          )
          [r*cos(ang), r*sin(ang), h]
      ]
  ];


  ClosePoints(pointarrays);
}




// This creates a threaded hole in its children using metric standards by
// default.
module ScrewHole(outer_diam, height, position=[0,0,0], rotation=[0,0,0], pitch=0, tooth_angle=30, tolerance=0.4, tooth_height=0) {
  extra_height = 0.001 * height;

  difference() {
    children();
    translate(position)
      rotate(rotation)
      translate([0, 0, -extra_height/2])
      ScrewThread(1.01*outer_diam + 1.25*tolerance, height + extra_height,
        pitch, tooth_angle, tolerance, tooth_height=tooth_height);
  }
}

// example from rcoyle
// Solid rod on the bottom, internal threads on the top.
// Flips around x-axis after printing to pair with RodStart.
module RodEnd(diameter, height, thread_len=0, thread_diam=0, thread_pitch=0) {
  // A reasonable default.
  thread_diam = (thread_diam==0) ? 0.75*diameter : thread_diam;
  thread_len = (thread_len==0) ? 0.5*diameter : thread_len;
  thread_pitch = (thread_pitch==0) ? ThreadPitch(thread_diam) : thread_pitch;

  ScrewHole(thread_diam, thread_len, [0, 0, height], [180,0,0], thread_pitch)
    cylinder(r=diameter/2, h=height, $fn=24*diameter);
}



// pattas modifications-------------------

// nominal screw hole
module ScrewHoleNominal(outer_diam, height, position=[0,0,0], rotation=[0,0,0], pitch=0, tooth_angle=30, tolerance=0.0, tooth_height=0) {
  extra_height = 0.001 * height;

  difference() {
    children();
    translate(position)
      rotate(rotation)
      translate([0, 0, -extra_height/2])
      ScrewThread(1.001*outer_diam , height + extra_height,
        pitch, tooth_angle, tolerance, tooth_height=tooth_height);
  }
}

// ghiera nominale
// the module used to tap the thread
module TapNominal(diameter, height, thread_len, thread_diam, thread_pitch) {
  ScrewHoleNominal(thread_diam, thread_len, [0, 0, height], [180,0,0], thread_pitch)
    cylinder(r=diameter/2, h=height, $fn=24*diameter);
}


}// end screw modules






{// baffle modules -------------------------------

  //single baffle module; zero at top; overhang slightly smaller than others to avoid useless details
  module baffle( or, ir,rake_overhang) {
      rotate_extrude($fn=divs)
polygon(
points=[
[or, 0],[ir,0 ], [or,-0.99*rake_overhang*(or-ir)],[or, 0]
  ] );  }
  
  
  // Conical and tilted array of baffles
  //start with the centered flange and sweeps until the offsetted tip aperture
  //base of baffles may protrude below start
  module bafflecone(antall, start, stop, aperture_top, aperture_bottom, decenter_top, decenter_bottom, tuberad, rake_overhang) {
      
      if(antall>0){
       bafflespacing=(stop-start)/antall;   
  for(i=[0:(antall-1)]){
      translate([decenter_top*i/antall + decenter_bottom*(antall-i)/antall,0, i*bafflespacing + start])
      baffle( tuberad+ aperture_bottom +  (aperture_top-aperture_bottom)*(i-1)/antall, aperture_bottom +  (aperture_top-aperture_bottom)*i/antall , rake_overhang);
  } }}
  
  
  // straight array of baffles to fit inside a tube, spacing determined by the relative spacing ratio  (smaller baffles, more baffles, capped by antall), baffles start at start pointing at start
  module baffletube( ratio, antall, start, stop, or, ir , rake_overhang){
      if(ir<or && antall>0){
          nbaffles=max(1,min ( antall, abs(floor (stop-start)/((or-ir)*ratio))));
      step= (overmaterial +start-stop)/ nbaffles;
          for(i=[0:(nbaffles-1)]){
              translate([0,0, start-i*step])
              baffle(or, ir, rake_overhang);
              } } }

          } // end baffle modules





{//Funnel tube module and stops for bottom print---------------


  // module for internals of the standard tube
  //zero at top
  module tubeint ( tiprad, tuberad, wallthick, tiplength, totlength , rake_overhang){
      rotate_extrude($fn=divs)
   polygon(
points=[
  [tiprad-wallthick, 0],[tiprad-wallthick,-tiplength ],[tuberad-wallthick, - (tiplength + cone_inner_height_build)],[tuberad-wallthick, -totlength  ], [tuberad+0.1,-totlength  ], [tuberad+0.1, 0],[tiprad-wallthick, 0]
  ]);}  
  
  
 //module for cutting the externals of the tube
   module tubeout ( tiprad, tuberad, wallthick, tiplength, totlength, conelength, rake_overhang){
       
      rotate_extrude($fn=divs)
   polygon(
points=[
  [tiprad, overmaterial],[tiprad,-tiplength ],[tuberad, -tiplength-conelength],[tuberad, -(totlength + 100)], [tuberad+100,-(totlength + 100) ], [tuberad+100, overmaterial], [tiprad,overmaterial]
  ]);}   
  
  
  //standard stop module, only the top baffle internals
    module mainstop(aperture, tuberad, rake_overhang){
      rotate_extrude($fn=divs)
   polygon(
points=[
  [aperture/2, 0],[2*tuberad + aperture/2,0],[2*tuberad + aperture/2,-(rake_overhang)* 2*tuberad ]
  ]);} 
       
  
 // rewritten moon_phase module
  // it is just a wedge
  module halfstop(tuberad){
        translate([0,0,0])
  rotate(90,[1,0,0])
  linear_extrude(height=2*tuberad+1, center=true) 
  polygon(
  points=[
  [-2*tuberad,0],[0,0], 
  [-2*tuberad, -4*tuberad], [-2*tuberad,0]
  ]);}
  
  
   {//center stop modules --------------

//center stop modules, needs radius and thickness 
  //zero is at the top
       // thick is the total height from printing platform
       // width the width of the spider
  module stopg(rad, orad, thick, width, rake_overhang){  
      
   if ((rad-thick/rake_overhang)>0){ 
      // check that the overhang cone is printable from the platform, so gets truncated, overhang build 2 to 1
       translate([0,0,-thick]){
  rotate_extrude($fn=divs)
polygon(
points=[
  [0,-overmaterial],[rad,-overmaterial],[rad,thick],[0, thick],[0,-overmaterial]
  ]);
 
 // builds a spiders cross 
  
        for(i=[0:1]){
            rotate(i*360/4, [ 0,0,1]){
            cube([4*orad,width,thick],true);
        }} }   
    } 
  else{ 
      translate([0,0,-(rad- width/2)*rake_overhang ]){
      //builds a floating cone
        rotate_extrude($fn=divs)
        polygon(
        points=[
            [0,0],[width/2, 0], [rad, (rad- width/2)*rake_overhang], [0,(rad- width/2)*rake_overhang],[0,0]
            ]);
      
      //builds two spider supports, one over the other
      // spiders for supporting center module
      // rewritten to  be made as two "bridges" instead of overhang rack
      // max outer radius, brace width, thickness available, radius of the stop to support
            translate ([orad,0,-wallth/2])
            cube([4*orad,width,3*wallth],true);
      
            rotate(90, [ 0,0,1]){
            translate ([orad,0,wallth/2])
            cube([4*orad,width,wallth],true);
      }}}
  }
  
  



 
  module spiderg(no, orad, width,rad, thick , rake_overhang){
        ht =min(width, thick); // how tall the spider
  for(i=[0:no]){  //makes many spiders
        rotate(i*360/no, [ 0,0,1]){
              if ((rad-rake_overhang*thick)>0){  
            // check that the stop cone is printable from the platform, and spiders too will be printed from the platform   
         
  translate ([orad,0,-ht/2])
 cube([2*orad,ht,ht],true);
  }
  else //makes a raked overhang
  { 
      translate([0,0,- rad*rake_overhang + ht+ 0.5])
      difference(){
      rotate(90, [1,0,0])
     linear_extrude(width, center=true)
      polygon(
      points=[
      [0, -ht], [0,  0],[orad, 0 ], [orad, - 0.9*rake_overhang*orad], [0,-ht]
      ]);
      rotate_extrude($fn=divs)
polygon(
points=[ 
      [0,-thick], [0, - 2*orad +2], [orad+1, -2*orad+2], [orad+1,-thick],  [0,-thick] 
      ] );}}}}}
      
  
//spiders and stop combined
  module centerstopd(no, orad, width,rad, thick, rake_overhang){
      union()
      
      
      stopg(rad,thick,rake_overhang);
      spiderg(no, orad, width,rad, thick ,rake_overhang);
  }
      
// magic stop that removes all aberration
  module magicstop(tiprad){
       rotate_extrude($fn=divs)
polygon(
points=[ 
      [0,0], [tiprad,0],[tiprad,-1], [0,-1],[0,0]
      ]);
      }

  } // end center stop modules
  
 } //end funnel tip modules
  








{//  Flat printed stops and cap modules-------------------
      
      
// zero is end surface, flat, build goes down   
// support ring and external aperture, for bottom-printed flat, shifted and rotated
// fitheigth is the heigth of tube for tabs
module flatring(tiprad, thick, fitheigth, aperture, off, offangle){
    
  intersection(){
    union(){
    // support ring
  rotate_extrude($fn=divs)
polygon(
points=[
   [ tiprad-thick-overmaterial, 0],[tiprad+2*overmaterial,0],
    [tiprad+2*overmaterial,-thick-fitheigth-overmaterial], [tiprad-thick -overmaterial,-thick-fitheigth-overmaterial],
    [ tiprad-thick-overmaterial, 0]
    ]) ;
        
        
      if(  aperture_recess=="Recessed edge" && (Model!="Funnel neck fit" && Model!="Funnel tab flange" && Model!="Funnel flush flange" ))
      {
    
    //aperture, with actual knife-edge stop high 1.5*wallth, total height 2*wallth, to get better profile at the print
    start_rad=min(tiprad-thick, aperture/2+ thick*1.5/rake_overhang);       
    
    rotate(offangle,[0,0,1])  
    translate([off, 0,0])
     rotate_extrude($fn=divs)
polygon(
points=[
   [start_rad,overmaterial], [aperture/2, -thick*1.5],[ aperture/2+ 0.5*thick, -thick*2], [tiprad + thick,- 2*thick], [tiprad+thick,overmaterial], [start_rad,overmaterial]
    ]) ;
      }
    
   else {
    //aperture, standard, knife-edge at the print base
      rotate(offangle,[0,0,1])  
    translate([off, 0,0])
     rotate_extrude($fn=divs)
polygon(
points=[
   [ aperture/2, 0], [aperture/2, -thick/3], [aperture/2 + thick/2, -thick],
    [2*tiprad,-thick], [2*tiprad, 0],
    [ aperture/2, 0]
    ]) ;
   }
    }  
    
    
    //trim outer material by intersection
    rotate_extrude($fn=divs)
polygon(
points=[
   [ 0,0], [0, -thick-fitheigth], [tiprad+overmaterial, -thick-fitheigth],[tiprad + overmaterial, 0], [0,0]
    ]) ;
}
}




// half moon stop
module flatmoon(tiprad, thick, off){
    
    intersection(){
        
    // the half stop
    rotate(90,[1,0,0])
    linear_extrude(2*tiprad, center=true)
    polygon(   points=[
    [off, 0], [off, -thick/3], 
    [off-thick/2, -thick],
    [-2*tiprad, -thick], [-2*tiprad, 0],
    [off,0]
    ]);             
    // outer trimming
    rotate_extrude($fn=divs)
    polygon(  points=[
   [ 0,overmaterial], [0,-thick-overmaterial], [tiprad, -thick-overmaterial],[tiprad, overmaterial], [0,overmaterial]
    ]) ;
    }
    }


// center stop module with curved spiders
module centerstop (tiprad, thick, main_aperture, aperture, spiderwidth, spidernumber){  
    
    intersection(){  
    union(){          
    translate([inner_stop_center_offset,0,0]){ // the center offset
        
 if(  aperture_recess=="Recessed edge" && (Model!="Funnel neck fit" && Model!="Funnel tab flange" && Model!="Funnel flush flange" ))
      {
    //aperture, with actual knife-edge stop high 1.5*wallth, total height 2*wallth, to get better profile at the print 
          
         
    start_rad=max(thick/2, aperture/2- thick*1.5/rake_overhang);
        
    rotate_extrude($fn=divs)
    polygon(
    points=[
   [start_rad,overmaterial], [aperture/2, -thick*1.5],[ max(aperture/2- 0.5*thick,thick/2 ), -thick*2], [0,-2*thick], [0,overmaterial], [start_rad,overmaterial]
    ]) ;      
      } 
      
else{     
    // the central stop
    rotate_extrude($fn=divs)
    polygon(  points=[
    [0,0], [aperture/2, 0], 
    [aperture/2, -thick/3], [aperture/2-thick/2, -thick],
    [0, -thick], [0,0]
    ]);
   }
                

// the curved spiders, with chamfered profile
        if(spider_curve=="Curved"  && main_aperture_off_center==inner_stop_center_offset && angle_stops==0){
     
     spiderlength= ((main_aperture - aperture)/2 + 2*spiderwidth);
     curve_angle= 180/spidernumber;
     curve_radius = spiderlength* 1/(2*sin(curve_angle/2));
      angle_overmaterial= (thick/spiderlength)*curve_angle;    
    
    for (i=[1:spidernumber]){
        
        
    rotate(i *360/spidernumber , [0,0,1])
    
    translate([-cos(curve_angle/2)*curve_radius, sin(curve_angle/2)*curve_radius + aperture/2-spiderwidth,0])
    rotate(-curve_angle/2 -angle_overmaterial,[0,0,1])
    rotate_extrude(angle=curve_angle+ 2*angle_overmaterial, $fn=60)
        translate([curve_radius,0,0])
    polygon(   points=[
    [-spiderwidth/2, 0], [spiderwidth/2,0], [spiderwidth/2, -thick/3],
    [spiderwidth/4, -thick], [-spiderwidth/4, -thick,],[-spiderwidth/2, -thick/3],[-spiderwidth/2,0]
    ]); 
    }}
    else {
            for (i=[0:3]){
    rotate((i +1/2 )*360/3 , [0,0,1])
    rotate(90,[1,0,0])
    linear_extrude(2*tiprad)
    polygon(   points=[
    [-thick/2, 0], [thick/2,0], [thick/2, -thick/3],
    [thick/4, -thick], [-thick/4, -thick,],[-thick/2, -thick/3],[-thick/2,0]
    ]);
    }
    }
    }}


// outer trimming
    rotate_extrude($fn=divs)
    polygon(  points=[
   [ 0,overmaterial], [0,-2*thick-overmaterial], [tiprad, -2*thick-overmaterial],[tiprad, overmaterial], [0,overmaterial]
    ]) ;
}}




module flat_aperture(outer_rad, aperture, off, offangle){
    // combines in one module the different flat apertures
    //makes a thin aperture stop, to fit inside a flange afterwards
    
        flatring(outer_rad, wallth, wallth, aperture, off, offangle);  // the standard aperture
    
    if(tip=="Half Moon"){ flatmoon(outer_rad, wallth, moon_phase);}
    else  if (tip=="Center stop") {centerstop(outer_rad, wallth,aperture, inner_stop_disk_diameter, wspider,spidernumber);}
 else if(tip=="Stop that removes all aberrations"){flatring(outer_rad, wallth, wallth, 0, 0,0);}
    else{   } //adds nothing , leaves the standard aperture
    
}


    


// center stop with spiders
//thick is the main measure, both disk thickness and spiders
// obsolete - substituted by centerstop, with curved spiders
/*
module flatstop (tiprad, thick, aperture, spiderwidth, spidernumber){  
    
intersection(){  
union(){          
    translate([inner_stop_center_offset,0,0]){ // the center offset
        
// the central stop
    rotate_extrude($fn=divs)
    polygon(  points=[
    [0,0], [aperture/2, 0], 
    [aperture/2, -thick/3], [aperture/2-thick/2, -thick],
    [0, -thick], [0,0]
    ]);

// the spiders, with chamfered profile
    
    for (i=[0:3]){
    rotate((i +1/2 )*360/3 , [0,0,1])
    rotate(90,[1,0,0])
    linear_extrude(2*tiprad)
    polygon(   points=[
    [-thick/2, 0], [thick/2,0], [thick/2, -thick/3],
    [thick/4, -thick], [-thick/4, -thick,],[-thick/2, -thick/3],[-thick/2,0]
    ]); 
}}}
// outer trimming
    rotate_extrude($fn=divs)
    polygon(  points=[
   [ 0,overmaterial], [0,-thick-overmaterial], [tiprad, -thick-overmaterial],[tiprad, overmaterial], [0,overmaterial]
    ]) ;
}}

*/
 

} // end flat printed stop and cap modules


{// Assembled tube + tip modules--------------------------


// Assembled tip from modular components, for bottom-printed funnels
  //it may leave things hanging at z<0 still to trim
 module funneltip(totlength,tuberad, tiprad, tipheight,conelength,  hbase,
aperture, off, offangle){    
/*tip construction*/     

     difference(){   //for outer trimming
     union(){        // merges tube, tip, baffles etc
         
         // tube inner structure
     tubeint ( tiprad, tuberad, wallth, tipheight, totlength , rake_overhang);
         
     //standard baffling tip
         stflange_baffle_diametersmax=10;  //cap baffles aModel
    baffletube( 4, stflange_baffle_diametersmax, 0, -tipheight, tiprad-wallth, tiprad-wallth-small_baffles_size, rake_overhang);  
         //standard baffling tube
    baffletube( 4, stflange_baffle_diametersmax, -tipheight, -totlength, tuberad-wallth, tuberad-wallth-small_baffles_size,rake_overhang); 
         
 // choice of tip style 
         
      if(tip_style=="Interchangeable tip"){ 
         // builds its centered extra baffle cone 
         
          bafflecone(baffleantall, -totlength, 0, baffle_aperture_rad_build, baffle_flange_rad_build, 0,0, tuberad, rake_overhang) ;
          
          
          } 
          
    else{  // allother options with fixed tip)
        
          //off centers and rotates the main stop and rotate the conical bafflings (whose are already  built off-center)
         rotate(angle_stops,[0,0,1]){   
             
                   bafflecone(baffleantall, -totlength, 0, baffle_aperture_rad_build,baffle_flange_rad_build, main_aperture_off_center, main_aperture_off_center*totlength/(170),tuberad, rake_overhang) ;     
             
   translate([main_aperture_off_center,0,0]){
    mainstop ( aperture_od, tuberad, rake_overhang);
         }
     }
 
        
       if(tip=="Half Moon"){ halfstop(tuberad);}
 else  if (tip=="Center stop") {stopg(inner_stop_disk_diameter/2, tuberad, tot_height_build+ flange_height_build, wspider, rake_overhang);}
 else if(tip=="Stop that removes all aberrations"){magicstop(tiprad);}
    else{   } //adds nothing , leaves the standard aperture
 
 }}
tubeout ( tiprad, tuberad, wallth, tipheight, totlength, conelength, rake_overhang); //cleans the externals defining outer profile
 
 }}
 


 
 
 // assembled tube with aperture for top-printed funnels, like tip-fit and sleeve-fit, can also be flat disk
 module funneltub(tip_rad, sleeve_rad, tip_height, tot_height, aperture, off, offangle){
     //tuberad is the radius of the tube at the fitting
     
      rake_overhang= rake_overhang;
     
      // overrides if the height are zero to avoid issues
     tot_height= (tot_height==0)?
        2*overmaterial : tot_height;
     tip_height=( tip_height==0)?
     overmaterial : tip_height;
     
intersection(){  
                   
      // outer profiles for cropping
    
      rotate_extrude( $fn=divs)
     polygon(  
     points=[  
       [0, 0] ,[tip_rad,0],
     [tip_rad, tip_height],[sleeve_rad , tip_height+ rake_overhang* (sleeve_rad-tip_rad)], 
     [sleeve_rad , tot_height + overmaterial],
     [0, tot_height],[0,0]   
     ]);  
     
   union(){  //aperture, tube inner, baffles
       
      // main aperture ring
     rotate(180, [0, 1,0])
    flat_aperture(tip_rad, aperture, off, offangle) ;

    //standard baffling 
         stflange_baffle_diametersmax=10;  //cap baffles aModel
    baffletube( 4, stflange_baffle_diametersmax, tip_height, 0, tip_rad-wallth, tip_rad-wallth-small_baffles_size, rake_overhang);  
         //standard baffling tube
    baffletube( 4, stflange_baffle_diametersmax, tot_height, tip_height, sleeve_rad-wallth, sleeve_rad-wallth-small_baffles_size, rake_overhang); 
      
 
     // super baffling  
     rotate(180-offangle,[0,0,1])   //minus because the tip is rotated...
    bafflecone(baffleantall, tot_height, 0,aperture/2-0.2,baffle_flange_rad_build,off*(1-tot_height/170),off, sleeve_rad, rake_overhang) ;     
                         
      // inner tube profile     
    rotate_extrude( $fn=divs)
     polygon(  
     points=[  
       
     [sleeve_rad+2*overmaterial,tot_height+ overmaterial], 
      [sleeve_rad - wallth, tot_height +overmaterial],
     [sleeve_rad-wallth, tip_height+ rake_overhang* (sleeve_rad-tip_rad)],
     [tip_rad-wallth,  tip_height],
     [tip_rad-wallth, -overmaterial],
          [sleeve_rad+2*overmaterial,-overmaterial],
          [sleeve_rad+2*overmaterial,tot_height]
         ]); 
      }}}
    
// the cap for interchangeable tip
module intercap (tip_rad, height, aperture, off, offangle){
    union(){
      rotate(180, [0, 1,0])
    flat_aperture(tip_rad, aperture, off, offangle) ;
    rotate_extrude( $fn=divs)
     polygon(  
     points=[ 
        [tip_rad-wallth,0],[tip_rad,0],[tip_rad, height ], [tip_rad-wallth, height], [tip_rad-wallth,0]
        ]);
    
    }}
      
      
 } // end assembled tip modules         

 

{// Base, flange and fitting ring modules----------------------


// module for standard fitting ring, it is symmetrical up and down
//zero at base, building upwards
  // make a generic fit ring, and may thread it if needed
  module fit_ring_universal(fit_rad, tube_rad, in_rad, fit_height, relief, passo, rake_overhang,    start_z){

      
      difference(){
 
     // generate the ring blank  
    
    rotate_extrude( $fn=divs)
    polygon(  points=[
    [in_rad,-overmaterial ], [tube_rad,-overmaterial ],
    [tube_rad,relief], 
    [fit_rad, relief +rake_overhang*(fit_rad-tube_rad) ],[fit_rad,fit_height -(  relief +rake_overhang*(fit_rad-tube_rad))],
    [tube_rad,fit_height-relief], [tube_rad,fit_height + overmaterial], [in_rad,fit_height+ overmaterial], [in_rad,-overmaterial ]
    ]);  
      
     if(fitting=="Screw thread"){      
    // tap the blank !
         
    // calculation of thread profile, for more or less ISO threads with 60 degrees tooth, notched tip, not notched base
     thread_H = 0.86603 * passo;  // the triangle height
     thread_tipcut = thread_H *(1/8); // as per ISO, cut the tip, for male thread
    thread_diam_tap =2*( fit_rad +thread_tipcut);  // nominal diameter of the tap thread
    diam_tap_out= thread_diam_tap + 2*passo; // some material   
    // moral: to obtain thread with nominal diameter thread_diam_nom, thread a bar with thread_diam_nom with a tap thread_diam_tap
         
    translate([0,0,-overmaterial])
    TapNominal(diam_tap_out, fit_height+2*overmaterial, thread_len=fit_height+2*overmaterial, thread_diam=thread_diam_tap, thread_pitch=passo);}
             
    }
    }
  
  
 
   
    
// base modules---------------------------------
 
   
 // makes a simple flange with an hole, for the neck fit and others, zero at top, with some knurling
module flange_standard(bore_rad, flange_rad, flange_thick){
    // cuts a chamfer to help removing stuck funnel
    pull_relief= min(flange_thick/2,(abs(flange_rad - bore_rad))/3);
    // how many knurling grooves
    notches_antall = floor ( (6* flange_rad) / (3* wallth)); 
    echo(notches_antall);
    difference(){
     
        rotate_extrude( $fn=divs)
        polygon(  points=[
            [bore_rad, -overmaterial],[flange_rad-pull_relief, -overmaterial],
            [flange_rad, -pull_relief], [flange_rad, -flange_thick ],
            [bore_rad, -flange_thick],[bore_rad, -overmaterial]
    ]);
        union(){
        for(i=[1: notches_antall]){
        rotate( i* 360/notches_antall, [0,0,1])
        translate([flange_rad + 0.35*wallth, 0, 0])  
          rotate(90,[0,0,0])  
       cylinder(r=1.1*wallth,h= 2*flange_thick + overmaterial, center=true, $fn=10);
            
    }}
}}

// make a simple flush flange
module flange_flush(bore_rad, flange_rad, flange_thick){
    rotate_extrude( $fn=divs)
        polygon(  points=[
            [bore_rad, +overmaterial],
            [flange_rad, +overmaterial], [flange_rad, -flange_thick - overmaterial ],
            [bore_rad, -flange_thick - overmaterial],[bore_rad, +overmaterial]
    ]);
    }
    
module flange_tub(bore_rad, flange_rad, flange_thick){
    rotate_extrude( $fn=divs)  
        polygon(  points=[
            [bore_rad, -overmaterial],
            [bore_rad+wallth, -overmaterial], [flange_rad, rake_overhang*(flange_rad-bore_rad-wallth)+overmaterial
    ],
            [flange_rad,flange_thick],[bore_rad, flange_thick], [bore_rad, - overmaterial ]
    ]);
}

} // end flange and fitting modules


{// cut modules-----------------------


// makes the cuts for press fit relief, tab flange, three points
// flange with zero at battuta 
module spring_cuts( r_fit, r_max,r_min, r_flange, height_tab, height_funnel, angle_cut ){
    
difference(){children();
      
            union(){               
                
if  (fitting=="Press fit" && Model=="Funnel neck fit" ){
           //r_min= tube  cuts the tube so the neck can shrink
           // cuts up until 1/4 height or 6mm, which is smaller
           // cuts up until 1/2 of the remaining flange or leaving 1.5 min thickness, which is smaller - but enough to cut the fitting tab
           // cuts the press fit too
           // number of cuts, so each sector is about 5*thickness, min 3 max 9
           cut_height=pressfit_cut_size*max( height_tab, min( height_funnel/3, 6));
           cut_rad=max(r_fit+0.35, 0.5*(1 + pressfit_cut_size)*min( (r_min+r_flange)/2, r_flange-2.2*wallth));
           cut_antall= max (9, min(3,floor( (7* r_max)/5*wallth)));
           
           for(i=[0:cut_antall]){
            rotate(i*(360/cut_antall), [0,0,1]){
            rotate(90,[1,0,0])
            translate([0,0,-wallth*pressfit_cut_size/2])
            linear_extrude(height=wallth*pressfit_cut_size, center=false)
            polygon(
            points=[[0, -20],
            [0,cut_height],[cut_rad, cut_height],
            [cut_rad, -20],[0, -20]
            ]);
            }}}
  
  else if(fitting=="Press fit"){
           
  // shaves the press fit rings interference so to leave only three tabs. Works on ring set at z 0   
            for(i=[0:2]){
            rotate(i*120+60, [0,0,1]){
            rotate_extrude(angle=angle_cut, $fn=divs)
            polygon(
            points=[[r_fit + overmaterial, height_tab+ overmaterial],
            [r_fit + overmaterial,overmaterial],
            [r_fit+10, overmaterial],
            [r_fit+10, height_tab+overmaterial],
            [r_fit + overmaterial, height_tab+ overmaterial] 
            ]);
            
            }}    
           
      
      if( (Model=="Funnel tab flange" || Model=="Funnel flush flange" || Model=="Flat tab flange")
            ){  //r_min=tube   cuts for some sophisticate spring reliefs
            for(i=[0:2]){
            rotate(i*120, [0,0,1]){
            rotate_extrude(angle=angle_cut, $fn=divs)
            polygon(
            points=[[r_min + overmaterial, -100],
            [r_min + overmaterial, overmaterial],
            [r_max - overmaterial, overmaterial],
            [r_max - overmaterial, -100]
            ]); }}}
     
            

     }}}}
     
                   /*cuts removed
            rotate(60, [0,0,1])
            rotate_extrude(angle=angle_cut, $fn=divs)
            polygon(
            points=[[r_min + overmaterial, overmaterial],
            [r_min + overmaterial, height_tab + 2*overmaterial],
            [100, height_tab + 2*overmaterial],
            [100, overmaterial],
            [r_min + overmaterial, overmaterial]
            ]);
            }}}
                */  



/*module spring_cuts_tub( r_tube, height, angle_cut ){
    //shaves the tabs for the tub, applies directly over the fit ring alone
difference(){children();
      
            union(){
 
if((Model!="Funnel sleeve fit") && fitting=="Press fit"){
            // shaves the press fit rings interference so to leave only three tabs. Shaves all the way down, will hit flanges in case
            for(i=[0:2]){
            rotate(i*120, [0,0,1]){
            rotate_extrude(angle=angle_cut, $fn=divs)
            polygon(
            points=[[r_fit + overmaterial, height+ overmaterial],
            [r_fit + overmaterial,-50],
            [r_fit+10, -50],
            [r_fit+10, height+overmaterial],
            [r_fit + overmaterial, height+ overmaterial] 
            ]);
            
            }}}}}}
     */
            
            
module screw_notch_cut (out_rad, height){
   //cut  cubic notches to screw the item
    //height the start of cut, size wall thickness, depth 1.5*wall thickness, out_rad the outer radius
    antall_notches=2;
   
        difference(){
            children();
             if(fitting=="Screw thread"){
            for(i=[1, antall_notches]){
                rotate(i*360/antall_notches,[0,0,1])
            translate([out_rad - wallth, 0,height])
            cube([2*wallth+ 2*overmaterial, wallth+2*overmaterial,3*(wallth+ 2*overmaterial)], center=true);
            }           
}}}


// cut for the fitting tabs for interchangeable cap
// interference is to tweak the tabs width
//include also the cuts that go on the funnel tip for spring relief
module captabcut(tiprad, thick, fitheigth, numbertabs, cutdepth, interference){
    if (tip_style=="Interchangeable tip"){
    difference(){
        children();
          
    union(){
    // inner removal    
    rotate_extrude( $fn=divs)
    polygon(  points=[
    [ overmaterial,-thick-fitheigth -overmaterial],
    [ tiprad-thick-overmaterial,-thick-overmaterial],
    [ tiprad-thick -overmaterial,-thick -fitheigth-overmaterial], [ overmaterial,-thick-overmaterial]
    ]);
     
    for(i=[1:numbertabs]){
        rotate((i*360/numbertabs),[0,0,1]){
    // tabs
    rotate_extrude(angle=(360/(numbertabs*2)-interference), $fn=divs)
    polygon(  points=[
   [ overmaterial,-thick -overmaterial], [overmaterial,-thick-fitheigth-overmaterial],
        [tiprad + wallth, -thick-fitheigth-overmaterial],[tiprad + wallth, -thick -overmaterial],
        [overmaterial,-thick-overmaterial]
    ]) ;        
     
      // spring relief cuts
         rotate((360/(4*numbertabs)), [0,0,1])
        rotate(90,[1,0,0])      
        linear_extrude(thick, center=true)
    polygon(   points=[ 
        [0, -thick -overmaterial],[tiprad + 10, -thick+2*overmaterial],[tiprad + 10, -thick-fitheigth-cutdepth],[0, -thick-fitheigth-cutdepth],[0, -thick +2*overmaterial]
        ]); 
     
      // removes top cap      
    rotate_extrude( $fn=divs)
    polygon(  points=[
                [0,overmaterial], [0,-thick-2*overmaterial], [tiprad+1, -thick-2*overmaterial], [tiprad+1, overmaterial],[0,overmaterial]
                ]); 
            
        }}}}}
else{children();}

}





// cuts the fitting tabs of the funnel to accomodate the interchangeable cap
 module intercut(  tiprad, thick, fitheigth, numbertabs, cutdepth, interference) {     
     if(tip_style=="Interchangeable tip"){ 
   
        difference(){
        children();
            union(){
          rotate_extrude( $fn=divs)
    polygon(  points=[
                [0,0], [0,-thick-2*overmaterial], [tiprad+1, -thick-2*overmaterial], [tiprad+1, 0],[0,0]
                ]);
        captabcut(tiprad, thick, fitheigth, numbertabs, cutdepth,interference);}}
            // captabcut(tiprad, thick, fitheigth, numbertabs, cutdepth, interference)

}
else{children();}
}

module capcut2 (  tiprad, thick, fitheigth, numbertabs, cutdepth, interference) { 
    difference(){
        children();
        translate([0,0,4*wallth + 2*overmaterial])         
        union(){
                
                    for(i=[1:numbertabs]){
        rotate((i*360/numbertabs),[0,0,1]){
    // tabs
    rotate_extrude(angle=(360/(numbertabs*2)-interference), $fn=divs)
    polygon(  points=[
   [ overmaterial,-thick -overmaterial], [overmaterial,-thick-fitheigth-overmaterial],
        [tiprad + wallth, -thick-fitheigth-overmaterial],[tiprad + wallth, -thick -overmaterial],
        [overmaterial,-thick-overmaterial]
    ]) ;  
        }}}}}        
            
                
                
    


} // end cut modules

        
     


{// Assembling modules--------------------------------------
    
    
 
 
//put together  all the pieces to form the funnel
    
// littlebit case-sensitive, different builders for different models  
// ideally all choiches should have been sorted out in the calculations, but, not so easy 
  
    
module builder() {
 // builds the funnel, one if for each type)


 
if ((Model=="Funnel neck fit" || Model=="Funnel tab flange" )
    &&(inter_print!= "Tip only")){
    
    clean_negative(){
    translate([0,0, flange_height_build]) {
        
    spring_cuts(fit_ring_rad_out, fit_ring_rad_in, tube_rad_build,flange_rad_build,fit_ring_height_build,tot_height_build,  90*pressfit_cut_size )  
        
    union(){
   
    screw_notch_cut (flange_rad_build-wallth+notch_override, -flange_height_build) 
        
    flange_standard(fit_bore_rad_build, flange_rad_build, flange_height_build);       
            
    translate([0,0,fit_ring_zero])
        {
    //    spring_cuts(fit_ring_rad_out, fit_ring_rad_in, tube_rad_build,flange_rad_build,fit_ring_height_build,tot_height_build,  90*(0.5*(1+pressfit_cut_size) )) 
    
         
            
    fit_ring_universal(fit_rad_out, fit_ring_rad_out, fit_ring_rad_in, fit_ring_height_build, tab_relief, passo_vite, rake_overhang,  tab_height);
        }
        
        
        
    translate([0,0, tot_height_build])
        captabcut(  tip_rad_build, wallth, 2*wallth,3,  2*wallth, 0)
        
    funneltip(tot_height_build, tube_rad_build, tip_rad_build, tip_height_build, cone_height_build, flange_height_build, aperture_od/2, main_aperture_off_center, angle_stops);
    }}}}
    
 
 
    
else if ((Model=="Funnel flush flange")
    &&(inter_print!= "Tip only")){
      
     clean_negative(){
      
     screw_notch_cut (flange_rad_build+notch_override,0)
         {
    translate([0,0, flange_height_build]) {
          
     union(){
          spring_cuts(fit_ring_rad_out, fit_ring_rad_in, tube_rad_build,flange_rad_build,fit_ring_height_build,tot_height_build,  90*pressfit_cut_size )
      
     flange_flush(fit_bore_rad_build, fit_ring_rad_out, flange_height_build);
         }}
          
    translate([0,0,fit_ring_zero])
         {
        spring_cuts(fit_ring_rad_out, fit_ring_rad_in, tube_rad_build,flange_rad_build,fit_ring_height_build,tot_height_build,  90*pressfit_cut_size )
             
    fit_ring_universal(fit_rad_out, fit_ring_rad_out, fit_ring_rad_in, fit_ring_height_build, tab_relief, passo_vite, rake_overhang,  tab_height);
         }
        
    translate([0,0, tot_height_build+flange_height_build])
    captabcut(  tip_rad_build, wallth, 2*wallth,3,  2*wallth, 0)
    funneltip(tot_height_build, tube_rad_build, tip_rad_build, tip_height_build, flange_height_build, aperture_od/2, main_aperture_off_center, angle_stops);
    }}}



else if (Model== "Tub tip fit" || Model=="Tub sleeve fit"){ 
       
    clean_negative(){  
         
     screw_notch_cut (flange_rad_build+notch_override, flange_height_build + tot_height_build) {
        
     translate([0,0,tot_height_build])
        
    flange_tub(tube_rad_build-wallth, flange_rad_build, flange_height_build);     
   
    translate([0,0,fit_ring_zero])
        {        
    fit_ring_universal(fit_rad_out, fit_ring_rad_out, fit_ring_rad_in, fit_ring_height_build, tab_relief, passo_vite, rake_overhang,  tab_height);                        
    }
    
    
    funneltub(tip_rad_build, tube_rad_build, tip_height_build, tot_height_build, aperture_od, main_aperture_off_center, angle_stops);
    }}}
    

     
else if (Model=="Flat disk"){
    clean_negative(){
    
    screw_notch_cut (fit_ring_rad_out+notch_override, tot_height_build)      
    {
        rotate(180, [1,0,0])
    flat_aperture(fit_ring_rad_out, aperture_od, main_aperture_off_center, angle_stops); 
        
       
      translate([0,0,fit_ring_zero])
        {
        spring_cuts(fit_ring_rad_out, fit_ring_rad_in, tube_rad_build,flange_rad_build,fit_ring_height_build,tot_height_build,  90*pressfit_cut_size )
        
    fit_ring_universal(fit_rad_out, fit_ring_rad_out, fit_ring_rad_in, fit_ring_height_build, tab_relief, passo_vite, rake_overhang,  tab_height);  
        }   
          
    translate([0,0, flange_height_build]) {
                      
    flange_flush(fit_ring_rad_in, fit_ring_rad_out, flange_height_build);
    }}}}
  
  
    
else if (Model=="Flat tab flange"){
    clean_negative(){
    
    screw_notch_cut (fit_ring_rad_out,0)  
             
    {  
   rotate(180, [1,0,0])
    flat_aperture(fit_ring_rad_out, aperture_od, main_aperture_off_center, angle_stops);      

        
       translate([0,0, flange_height_build]) {
      translate([0,0,fit_ring_zero])
        {
        spring_cuts(fit_ring_rad_out, fit_ring_rad_in, tube_rad_build,flange_rad_build,fit_ring_height_build,tot_height_build,  90*pressfit_cut_size )
        
    fit_ring_universal(fit_rad_out, fit_ring_rad_out, fit_ring_rad_in, fit_ring_height_build, tab_relief, passo_vite, rake_overhang,  tab_height);  
        }
                            
    flange_standard(fit_bore_rad_build, flange_rad_build, flange_height_build);
    }}}}
    
  


// build caps for interchangeable tip model
if( (Model=="Funnel neck fit" || Model=="Funnel tab flange"  ||Model=="Funnel flush flange")
    &&
    (tip_style== "Interchangeable tip") 
    && 
    (inter_print =="One base and one tip" || inter_print=="Tip only")
    )
    {
        // makes the cap
        translate([ flange_rad_build + tip_rad_build +2, 0,0])
        
        capcut2(tip_rad_build, wallth, 2*wallth,3,  2*wallth,cap_fit_angle )
        
        intercap(tip_rad_build, 3*wallth, aperture_od, main_aperture_off_center, angle_stops);
    }
}
    
 
    
        
 
  }//end final assembly-----------   
  




// builds the funnel

crossection() builder();
  


  
 // enjoy!
