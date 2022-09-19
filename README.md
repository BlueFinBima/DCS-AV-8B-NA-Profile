[![CreateHelios16](https://github.com/BlueFinBima/DCS-AV-8B-NA-Profile/actions/workflows/BuildProfilePackage.yml/badge.svg)](https://github.com/BlueFinBima/DCS-AV-8B-NA-Profile/actions/workflows/BuildProfilePackage.yml)
# DCS-AV-8B-NA-Profile

## Download Profile from [here](https://github.com/BlueFinBima/DCS-AV-8B-NA-Profile/releases/latest)

This is a Helios profile for [Razbam's AV-8B N/A Aircraft](https://razbamsimulations.com/index.php/dcs/av8-b) designed for DCS World. 
This profile utilises an aircraft specifc interface which was written into the BlueFinBima fork of Gadroc's Helios.  This can be downloaded from [Helios latest release](https://github.com/HeliosVirtualCockpit/Helios/releases/latest)
In addition to the profile, the MFDs and RWR need to have tehir viewports exported.  Since I keep getting caught out by this, there are key bindings for exporting the MFDs which need to be used otherwise the external MFD screens will stay blank.  
### Limited Support
[Discord](https://discord.gg/WK44YUnwnQ)
### Note
[AV-8B MFD Viewport enablement](https://forums.eagle.ru/showpost.php?p=3333803&postcount=47)
```
lctl+lalt+a  (Left MFD)
lctl+lalt+s  (Right MFD)
```
The current profile will toggle the MFD's when the profile is reset in Helios Control Center.

To turn off cockpit MFDs but still have them exported to other monitors:-

Look in the file C:\Program Files\Eagle Dynamics\DCS World\Scripts\Aircrafts\_Common\Cockpit\ViewportHandling.lua for the Line (should be around line 81):-
```
purposes = {render_purpose.GENERAL,
```
And comment it out thus:-
```
purposes = {--render_purpose.GENERAL,
```
The latest version of the profile used Helios 1.6 features including ViewPort management and for people running this profile locally, the information relating to Viewports is no longer relevant as it is handled by Helios.

## Quality of Image on Exported Viewports

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

## Video of the profile in operation
[![Original AV-8B NA Profile](http://img.youtube.com/vi/4kQG0dJMROg/0.jpg)](http://www.youtube.com/watch?v=4kQG0dJMROg)


## Notes
* You must be running Helios **1.6.3045.3**  to **1.6.5101** to run the Version 4 of this profile.  
* For version 5 of this profile, you need **1.6.5102** or above.
* You **MUST** have installed the driver from Helios to allow communication between DCS and Helios.
