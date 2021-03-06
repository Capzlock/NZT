#include "colors.inc" // Required for rendering
#include "textures.inc"
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"

background { color Black } // Black background

camera { location <23,23,100>
         look_at <23,23,23> } // Camera Position and Angle

#declare Lightbulb = union {
  merge {
    sphere { <0,0,0>, 1} // sphere radius 1
    texture {
      pigment {color rgb<1,1,1>} // white light
      finish {ambient .8 diffuse .6}
}}} // Lightsource Properties

light_source {
  <23,23,23> // Source is located at center of cube
  color White // Note - I changed this to Red for renderings of 'center'
  looks_like { Lightbulb }} // NOT a point source!

#declare shinySphere = // declare shinySphere properties
sphere {
  <0,0,0>, 2 // center and radius 
  pigment { White filter 1} // no idea what all this stuff does
  finish { ambient .1 diffuse .1 reflection .2 specular 1 roughness .001   
  irid { 0.35 thickness .5 turbulence .5
    }} // but it makes it look REALLY COOL!!!
  interior { ior 1.5 fade_distance 5 fade_power 1 caustics 1
}} // reduces boilerplate in declarations for faces, corners, and edges

#declare corner = union{ // union of sphere and 3 cylinders

object {shinySphere translate <0,0,0>}
  
cylinder { <0, 3, 0> <0, 9, 0> .5 } 
cylinder { <3, 0, 0> <9, 0, 0> .5 }
cylinder { <0, 0, 3> <0, 0, 9> .5 }} // corner for myCube

#declare face = union{ // union of 4 spheres and 4 cylinders
  
  object {shinySphere translate <8,8,0>}
  object {shinySphere translate <8, -8, 0>}
  object {shinySphere translate <-8, 8, 0>}
  object {shinySphere translate <-8, -8, 0>}
  
  cylinder { <8,5,0> <8,-5,0> .5 }
  cylinder { <-8,5,0> <-8,-5,0> .5 }
  cylinder { <-5,-8,0> <5,-8,0> .5 }
  cylinder { <-5,8,0> <5,8,0> .5 }} // face for myCube

#declare edge = union{ // union of 2 spheres and 5 cylinders
  
  object {shinySphere translate <0,0,8>}
  object {shinySphere translate <0,0,-8>}
  
  cylinder { <3, 0, -8> <9, 0, -8> .5 }
  cylinder { <0, 3, -8> <0, 9, -8> .5 }
  cylinder { <0, 0, -5> <0, 0, 5> .5 }
  cylinder { <3, 0, 8> <9, 0, 8> .5 }
  cylinder { <0, 3, 8> <0, 9, 8> .5 }} // edge for myCube

#declare myCube = union { // this was rather tedeious, however pragmatism prevailed
  
  object {face translate <23, 23, 0> pigment { color rgb <0,255,0>}} // Back 217.png
  object {face translate <23, 23, 46> } // Front  223.png
  object {face translate <23, 23, 0> rotate <90,0,0> } // Down 212.png
  object {face translate <23, 23, 0> rotate <90,0,90> } // Right 122.png
  object {face translate <23, 23, 0> rotate <90,0,90> translate <46, 0, 0> } // Left 322.png
  object {face translate <23, 23, 0> rotate <90,0,0> translate <0,46,0> } // Top 232.png
  
  object {corner translate <0,0,0> } // BackRightDown 111.png
  object {corner rotate <0,0,-90> translate <0,46,0> } // BackRightTop 131.png
  object {corner rotate <0,0,90> translate <46,0,0> } // BackLeftDown 311.png
  object {corner rotate <-90,0,0> translate <0,0,46> } // FrontRightDown 113.png
  object {corner rotate <0,0,180> translate <46,46,0> } // BackLeftTop 331.png
  object {corner rotate <0, -180, 0> translate <46,0,46> } // FrontLeftDown 313.png
  object {corner rotate <-180,0,0> translate <0,46,46> } // FrontRightTop 133.png
  object {corner rotate <0,90,180> translate <46,46,46> } // FrontLeftTop 333.png
  
  object {edge translate <0, 0, 23> } // RightDown 112.png
  object {edge rotate <0, 0, 90> translate <46, 0, 23> } // LeftDown 312.png
  object {edge rotate <0, 0, 180> translate <46, 46, 23> } // LeftTop 332.png
  object {edge rotate <0, 0, -90> translate <0, 46, 23> } // RightTop 132.png
  object {edge rotate <-90, 180, -90> translate <23, 0, 0> } // BackDown 211.png
  object {edge rotate <-90, 180, 180> translate <0, 23, 0> } // BackRight 121.png
  object {edge rotate <-90, -90, 180> translate <46, 23, 0> } // BackLeft 321.png
  object {edge rotate <-90, 180, 90> translate <23, 46, 0> } // BackTop 231.png
  object {edge rotate <0, 90, 180> translate <23, 46, 46> } // FrontTop 233.png
  object {edge rotate <-90, 0, 0> translate <0, 23, 46> } // FrontRight 123.png
  object {edge rotate <0, 90, 0> translate <23, 0, 46> } // FrontDown 213.png
  object {edge rotate <0, 90, 90> translate <46, 23, 46> } // FrontLeft 323.png

  texture {Green_Glass} // personal preference
  finish {reflection {.9} ambient .1 diffuse .1}}

myCube // build myCube structure
