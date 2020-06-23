width=40;
height=40;
bottom_thickness=2;
wall_thickness=2;

module mug(width, height, bottom_thickness=2, wall_thickness=5)
{
    difference()
    {
        intersection()
        {
            cube([width,width,height], center=true);
            scale([1,1,height/width])
            sphere(width/2 * sqrt(2));
        }
        translate([0,0,-height/2+bottom_thickness])
        {
            cylinder(r=width/2-wall_thickness,h=height+0.1);
        }
    }
}
  

mug(40,60);