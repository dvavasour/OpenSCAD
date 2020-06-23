$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

// Cube Dimensions
xLength = 20;
yLength = 20;
zLength = 20;
cubeVector = [xLength, yLength, zLength];
centerTorF = true;

// Sphere Dimensions
sphereRadius = 14;
sphereColour = [0,0,1];

// Translation
xDisplacement = 6;
yDisplacement = 0;
zDisplacement = 0;
translationVector = [xDisplacement, yDisplacement, zDisplacement];


%translate(translationVector) {
    union() {
        cube(cubeVector, center=centerTorF);

        color(sphereColour) {
            sphere(sphereRadius);
        }
    }
}


  difference()
  {
    cube([20,20,20]); // a 20 mm cube
    translate([10,10,-1]) // start 1 mm below the surface
      #cylinder(r=5,h=20+1+1); // and go 1 mm above
  }
