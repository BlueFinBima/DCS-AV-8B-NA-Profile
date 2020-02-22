# DCS-AV-8B-NA-Profile
This is a Helios profile for [Razbam's AV-8B N/A Aircraft](https://razbamsimulations.com/index.php/dcs/av8-b) designed for DCS World. 
This profile utilises an aircraft specifc interface which was written into the BlueFinBima fork of Gadroc's Helios.  This can be downloaded from [Helios on DCS User FIles](https://www.digitalcombatsimulator.com/en/files/3302014/?sphrase_id=22037554)
In addition to the profile, the MFDs and RWR need to have tehir viewports exported.  Since I keep getting caught out by this, there are key bindings for exporting the MFDs which need to be used otherwise the external MFD screens will stay blank.  

[AV-8B MFD Viewport enablement](https://forums.eagle.ru/showpost.php?p=3333803&postcount=47)
```
lctl+lalt+a  (Left MFD)
lctl+lalt+s  (Right MFD)
```
To turn off cockpit MFDs but still have them exported to other monitors:-

Look in the file C:\Program Files\Eagle Dynamics\DCS World\Scripts\Aircrafts\_Common\Cockpit\ViewportHandling.lua for the Line (should be around line 81):-
```
purposes = {render_purpose.GENERAL,
```
And comment it out thus:-
```
purposes = {--render_purpose.GENERAL,
```
## Video of the profile in operation
[![Original AV-8B NA Profile](http://img.youtube.com/vi/4kQG0dJMROg/0.jpg)](http://www.youtube.com/watch?v=4kQG0dJMROg)


## Notes
* You must be running Helios **1.4.2019.1005** or later
* You **MUST** have installed the Exports.lua created by the Helios DCS AV-8B Interface in the Helios Profile Editor because the new components rely on additional information that only the newer Helios releases export.  
