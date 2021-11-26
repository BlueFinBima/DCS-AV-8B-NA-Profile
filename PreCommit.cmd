@Rem Performs the sanitisation of the profile before commit.
@Rem Remember to: 
@Rem   use Helios Profile Utility to make sure there are no duplicate bindings
@Rem   use Helios Profile Utility to remove all unnecessary interfaces.
@rem
@rem This takes no arguments
@rem
@IF NOT EXIST "AV-8BNA.hpf" @ECHO * * * New profile AV-8BNA.hpf not found in current directory &&EXIT /b 1
@echo * * * This program works on file AV-8BNA.hpf in the current directory
rmdir .\temp /s
@mkdir .\temp
@mkdir .\temp\PreCommit
@move ".\AV-8BNA.hpf" ".\temp\Precommit\AV-8BNA.hpf.candidate"
powershell -command "Copy-Item -Path \".\AV-8B\Helios\Profiles\AV-8BNA.hpf\" -Destination (\".\temp\precommit\AV-8BNA \" + (get-Date -format \"yyyyMMddHHmm\") + \".hpf.bak\")"
@echo A backup of original profile saved as ".\temp\Precommit\AV-8BNA yyyyMMddHHmm.hpf.bak"
@type ".\temp\Precommit\AV-8BNA.hpf.candidate" | powershell -command "$input | ForEach-Object{$_ -replace '(<StaticValue>)[\d*]\.[\d*]\.[\d*](<\/StaticValue>)','$1profileversionnumber$2'}" > AV-8B\Helios\Profiles\AV-8BNA.hpf
@Echo * * * .\AV-8B\Helios\Profiles\AV-8BNA.hpf has been created - Check and confirm that all is OK
@goto :eof
:usage
@echo Usage: %0 
@exit /b 1
