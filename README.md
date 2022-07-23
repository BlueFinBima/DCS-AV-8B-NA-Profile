[![CreateHelios16](https://github.com/BlueFinBima/DCS-AV-8B-NA-Profile/actions/workflows/BuildProfilePackage.yml/badge.svg)](https://github.com/BlueFinBima/DCS-AV-8B-NA-Profile/actions/workflows/BuildProfilePackage.yml)
# DCS-AV-8B-NA-Profile

## Download Profile from [Helios latest release](https://github.com/HeliosVirtualCockpit/Helios/releases)

This is a Helios profile for [Razbam's AV-8B N/A Aircraft](https://razbamsimulations.com/index.php/dcs/av8-b) designed for DCS World. 
This profile utilises an aircraft specifc interface which was written into the BlueFinBima fork of Gadroc's Helios.  This can be downloaded from [Helios latest release](https://github.com/HeliosVirtualCockpit/Helios/releases)
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

## Video of the profile in operation
[![Original AV-8B NA Profile](http://img.youtube.com/vi/4kQG0dJMROg/0.jpg)](http://www.youtube.com/watch?v=4kQG0dJMROg)


## Notes
* You must be running Helios **1.6.3045.3**  to **1.6.5101** to run the Version 4 of this profile.  
* For version 5 of this profile, you need **1.6.5102** or above.
* You **MUST** have installed the driver from Helios to allow communication between DCS and Helios.
