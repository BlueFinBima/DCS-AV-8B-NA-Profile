## This is a Helios profile for the Razbam's AV-8B N/A Harrier _ProfileVersionNumber in DCS World

This profile is maintained on [GitHub](_ProjectURL) and is available under the GNU General Public License v3.0.  It is copyright (c) Neil Larmour 2022, All Rights Reserved.

The latest version of this profile can be found [here](_Repository)

The build for this profile is based on _commit

### Quality of Image on Exported Viewports

There have been a number of issues raised relating to the quality of rendered viewports from the AV-8B module.  In the early days of this
module, it was common to change settings in a file in the module to improve the quality, however the settings in the module today
now incorporate these early changes so that for many, the default settings are acceptable.
Investigation of continuing problem reports have shown that the exact same settings on two different machines can result in differing
quality of the rendered viewport.  Typically the problems are most evident on text.  At this time, there is no verified theory about why this happens.

For those continuing to experience blurred viewport output, some experimentation may prove beneficial.

**Remember to always make a back up of files before making changes**
Reducing the value of `stroke_thickness` and/or `stroke_fuzziness` in `...\Mods\aircraft\AV8BNA\Cockpit\Displays\Display_StrokeDefs.lua` is suggested
as a good starting place.  Next stop might be to change the multipliers used to calculate `DMC_outline_thickness` and `DMC_outline_fuzziness` in the 
same file.

`MPCD_stroke_thickness` and/or `MPCD_stroke_fuzziness` have names which sound positive, however empirically, changing these sees less benefit.

Finally, `...\Mods\aircraft\AV8BNA\Cockpit\MPCD\indicator\Global\MPCD_Parameters.lua` can be evaluated.  Setting `shaderLineDrawAsWire = true` from the 
default value of false will result in a change to the rendered viewport which might help.  

Usually, restarting DCS World completely is needed after making a change to one of these files.