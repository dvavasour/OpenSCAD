//$fa=1;
//$fs=1;
$vpr=[ 78.80, 0.00, 27.80 ];
$vpt=[ 57.00, 39.95, 10.00 ];
$vpd=300;

module flash() {
     flash_body_x=30;
     flash_body_y=20;
     flash_body_z=8;
    
     flash_riser1_x=flash_body_x;
     flash_riser1_y=14;
     flash_riser1_z=5;
     flash_riser1_y_offset = (flash_body_y - flash_riser1_y)/2;
     flash_riser1_z_offset = flash_body_z -1;
    
     flash_riser2_x=flash_body_x;
     flash_riser2_y=18;
     flash_riser2_z=2;
     flash_riser2_y_offset = (flash_body_y - flash_riser2_y)/2;
     flash_riser2_z_offset = flash_body_z + flash_riser1_z - flash_riser2_z;
    
    
    
     union() {
	  cube([flash_body_x, flash_body_y, flash_body_z]);
	  translate([0, flash_riser1_y_offset, flash_riser1_z_offset])
	       cube([flash_riser1_x, flash_riser1_y, flash_riser1_z]);
	  translate([0, flash_riser2_y_offset, flash_riser2_z_offset])
	       cube([flash_riser2_x, flash_riser2_y, flash_riser2_z]);
    
     }
}

// Moved out of the module as a scoping kludge
rail_body_z=8;

module rail() {
     rail_body_x=30;
     rail_body_y=20;
    
    
     rail_slot1_x=rail_body_x + 2;
     rail_slot1_y=12;
     rail_slot1_z=5;
     rail_slot1_y_offset = (rail_body_y - rail_slot1_y) / 2;
    
     rail_slot2_x=rail_body_x + 2;
     rail_slot2_y=14;
     rail_slot2_z=2;
     rail_slot2_y_offset = (rail_body_y - rail_slot2_y) / 2;
     rail_slot2_z_offset=2;
    
     //piece to attach to rail
    
     difference() {
	  difference() {
	       cube([rail_body_x, rail_body_y, rail_body_z]);
	       translate([-1, rail_slot1_y_offset, -1])
		    cube([rail_slot1_x, rail_slot1_y, rail_slot1_z]);
	  }
	  translate([-1, rail_slot2_y_offset, rail_slot2_z_offset])
	       cube([rail_slot2_x, rail_slot2_y, rail_slot2_z]);
     }
}

color("red", 1){
     rail();
}

color("blue", 1){
     translate([0, 0, rail_body_z - 1])
	  //translate([0, 0, 20 - 1])
	  flash();
}




translate([0, 60, 0])
cylinder (h=20, r1=20, r2=10);

translate ([30, 60, 10])
union()
{
     cube([20,20,20], center=true);
     color([1,0,0])
	  sphere(14);
}

translate ([60, 60, 10])
difference()
{
     color([0, 1, 0])
	  cube([20,20,20], center=true);
     sphere(14);
}

translate([80, 50, 0])
difference()
{
     cube([20,20,20]); // a 20 mm cube
     translate([10,10,-1]) // move origin
	  cylinder(r=5,h=22);
}

translate([120, 60, 10])
{
     difference()
     {
	  intersection()
	  {
	       cube([20,20,20], center=true);
	       sphere(14);
	  }
	  translate([0,0,-10+2])
	       cylinder(r=7,h=20+2);
     }
}
