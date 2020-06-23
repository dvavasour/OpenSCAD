module extrusion(length)
{
    translate([length,length,0])
    {
        linear_extrude(height=length,scale=2)
        {
            square(length,center=true);
        }
    }
}

extrusion(10);

hull()
{
    translate([0,0,0]){
        extrusion(10);
    }
    translate([30,0,0]){
        extrusion(10);
    }
    translate([30,30,0]){
        extrusion(10);
    }
    translate([0,30,0]){
        extrusion(10);
    }
}