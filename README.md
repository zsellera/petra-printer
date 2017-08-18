# petra-printer

My 3d printer called Petra. Main features:

 * prusa-style motion system
 * 2020 alu profiles, Bosch-style (6mm nut)
 * enclosed, designed to print in ABS
 * 200x200mm build area
 * mgn12 linear rails
 * e3d titan extruder
 * everything is easily sourcable from AliExpress (khmm...)

All custom design is in OpenSCAD. This repo contains the .scad files only. Compiled .stl files available on Thingiverse.

## Video

Youtube video here.

## Files

### Things on X axis

 * `xcarriage.scad` is the complete printhead (mgn12 mount, titan + nema17 mount, 12mm inductive probe mount, belt mount)
 * `xblower.scad` has the mount for an axial 40x40mm print cooling fan. I use a 0.6W 4020, and can bridge PLA, PETG and ABS in the air indefinetly. This also acts as the endstop's contact point for X homing.
 * `xbelt.scad` is the belt "tensioner" on X axis. The design use an interresting way to tension X belt, check video for details.
 * `xmotor.scad` nema17 motor mount.
 * `xendstop.scad` is the endstop mount for "RepRap mechanical endstop" (search ali)
 * `xcablemount.scad` contains 2 parts, one for mounting a the cablechain, the other is to fit a flexible wire tubing. See video for mounting.

### Things on Y axis

NOTE: on this axis, the linear motion is guied by delrin rollers found on many other printers as well. It provides smooth motion while keeping things very sturdy. The generally accepted opinion on these rolles is you have to source the matching v-wheel alu extrusions for them. I did not. It works, but I by-design overtensioned them, so the POM wheel had to wear-in to have a perfect fit. You might not get a perfect fit, it depends on what wheel and ali extrusion you have. The provided scad file is modifiable though for exactly this reason. Today I wouldn't design it this way (but use mgn12 here as well).

 * `ytable.scad` is a 2D drawing, which I printed and guided to cut the base acryl sheet by hand.
 * `ymotor.scad` for the nema17 mount for Y
 * `ycarriage.scad` is the belt fixture under the moving bed.
 * `ytensioner.scad` is the belt tensioner
 * `yendstop.scad` reprap mechanical endstop mount
 * `yvwheel.scad` is the actual Y carriage, edit to fit your design

 ### Things on Z axis

  * `zmotor.scad` is the Z motor mount,
  * `zbearing.scad` is the top leadscrew mount/fixture
  * `zmount.scad` is the connector for T8 leadscrew, mgn12 carriage and X axis.

 ### Accessories

  * `mksgen_mount.scad` is a double-mount for MKS Gen 1.4 motherboard and a slightly smaller perfboard. Customize to fit your sizes.
