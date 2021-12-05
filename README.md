# Cardano Bank Paper Wallet

1. We generate pairs of unscrambled seed phrases. We keep one, the
   customer keeps the other. ($)
2. We generate scrambled seed phrases scrambled with random
   passwords. We keep one scrambled seed phrase, and the customer can
   choose to give a copy of the password (and presumably keep them in
   separate locations). Thus, the only person with both the scrambled
   seed phrase and the password to unscramble it is the customer. ($$)
3. We offer to generate pairs of scrambled seed phrases with their
   passwords. The customer provides us with a password. We then
   produce the copies of both and provide them to the customer. ($$$)
4. The customer generates a scrambled seed phrase, and we engrave them
   for him or her.

marine orbit clown light muscle skirt find caution alarm barrel gold tumble fatigue frown amused cheap course error guess digital gentle trick razor stool

```OpenSCAD
$fs = 0.1;

difference() {
    translate([0,0,-.5]) linear_extrude(height = 1) {
        square([55,9.5], false)
	;}
    linear_extrude(height = 4) {translate([1,7,1])
        text("marine orbit clown light muscle skirt find", size = 1.5, font = "PT Mono");}
    linear_extrude(height = 4) {translate([1,5,1])
        text("caution alarm barrel gold tumble fatigue", size = 1.5, font = "PT Mono");}
    linear_extrude(height = 4) {translate([1,3,1]) 
        text("frown amused cheap course error guess", size = 1.5, font = "PT Mono");}
    linear_extrude(height = 4) {translate([1,1,1])
        text("digital gentle trick razor stool", size = 1.5, font = "PT Mono");}
    translate([53,2,-2]) cylinder(4, 1, false);
}
```

We can use the following shell script.

```sh
#!/usr/bin/bash

echo "\$fs = 0.1; \n difference() { \n    translate([0,0,-.5]) linear_extrude(height = 1) {\n        square([55,9.5], false)\n	;}\n    linear_extrude(height = 4) {translate([1,7,1])\n        text(\"" >> out.scad
# 42 chars
echo "\", size = 1.5, font = \"PT Mono\");}\n    linear_extrude(height = 4) {translate([1,5,1])\n        text(\"caution alarm barrel gold tumble fatigue\", size = 1.5, font = \"PT Mono\");}\n    linear_extrude(height = 4) {translate([1,3,1]) \n        text(\"" >> out.scad
# 42 chars
echo "\", size = 1.5, font = \"PT Mono\");}\n    linear_extrude(height = 4) {translate([1,1,1])\n        text(\"" >> out.scad
# 38 chars
echo "\", size = 1.5, font = \"PT Mono\");}\n    translate([53,2,-2]) cylinder(4, 1, false);\n}" >> out.scad
```

Another list
1
rival
2
amazing
3
merry
4
filter
5
future
6
tobacco
7
shrimp
8
hard
9
wrestle
10
siege
11
track
12
ski
taxi
13
lobster
14
ball
15
crucial
16
hobby
17
mean
18
when
19
path
20
mom
21
insect
22
soul
23
message
24

### Websites for the base-64 encoding.

[cbor.io](cbor.io) is awesome, and it has a
[tools](http://cbor.io/tools.html) page.

I installed via `sudo gem install cbor-diag`.

```ghci
:m + Codec.CBOR
```

20211204170912NJ Why

Copy the link to the cardano-crypto 

20211204221446NJ I did it

https://hackage.haskell.org/package/random-1.2.1/docs/System-Random.html

```
:module + Data.Int
randomIO :: IO Int32

fst $ genByteString 20 $ mkStdGen 192
```

## Tasks

 - [ ] What is the format for a machining tool supposed to be?

