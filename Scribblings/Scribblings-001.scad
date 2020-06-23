$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm
// A comment
// Cube Dimensions
xLength = 7;
yLength = 3;
zLength = 4;
cubeVector = [xLength, yLength, zLength];
centerTorF = true;

// Displacement Values
xDisplacement = 0;
yDisplacement = 0;
// zDisplacement = 0;
zDisplacement = zLength/2;
displacementVector = [xDisplacement, yDisplacement, zDisplacement];

red = [1,0,0];
green = [0,1,0];
blue = [0,0,1];


translate(displacementVector) {
        color(blue)
        cube(cubeVector, center=centerTorF);
}

// cylinder(h=5,r=2, r2=0, center=true);