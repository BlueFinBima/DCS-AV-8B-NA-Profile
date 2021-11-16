@Rem Creates the Helios Installable profile.
@Rem Remember to: 
@Rem   change the release information in the Profile16.json file first
@Rem   change the release number in the profile binding for the UFC Scratchpad
@rem
@rem This takes a single argument which is the file/profile suffix
@rem
@if [%1]==[] goto usage
rmdir .\temp /s
del "AV-8BNA %1.helios16"
mkdir .\temp
xcopy AV-8B ".\temp\AV-8BNA %1\" /e /v /y
ren ".\temp\AV-8BNA %1\helios\profiles\av-8bna.hpf" "AV-8BNA %1.hpf"
copy "AV-8B - About this profile.md" ".\temp\AV-8BNA %1 - About this profile.md"
copy "LICENSE" ".\temp\LICENSE."
copy "README.md" ".\temp\README.md"
copy "Profile16.json" ".\temp\Profile16.json"
cd ".\temp"
"%programfiles%\winrar\winrar.exe" a -afzip -r "..\AV-8BNA %1.zip" *.*
cd ..
ren ".\AV-8BNA %1.zip" "AV-8BNA %1.helios16"
@goto :eof
:usage
@echo Usage: %0 ^[profile suffix^]
@exit /b 1
