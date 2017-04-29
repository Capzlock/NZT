module MidiGen where
import Euterpea

right, wrong, delta, empty, x, y, xy, z, zx, zy, xyz :: Music Pitch

right = (line $ map ($en) [a 4, b 4, cs 5, d 5]) :+: e 5 hn 
wrong = (line $ map ($en) [a 4, af 4, g 4, gf 4]) :+: f 4 hn
delta = line $ map ($en) [a 4, b 4, c 5, b 4, a 4, af 4, gf 4, af 4]

empty = a 2 en 
x = b 2 en 
y = c 3 en 
xy = e 3 en 
z = d 3 en 
zx = f 3 en 
zy = g 3 en 
xyz = a 3 en

