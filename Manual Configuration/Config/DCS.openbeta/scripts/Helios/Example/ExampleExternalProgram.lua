--
-- This is an example script to start and stop an external program from the Exports process in DCS.
-- MyProgramFile.exe either needs to be pathed or be in the DCS program directory.
-- We also register an export stop routine to terminate the program.
--
-- Care should be taken to ensure that escaping of '\' and use of single and double of quoting is 
-- handled properly as it needs to be correct for both LUA and Windows, both having different needs
-- If errors are made, then they should appear in DCS.log
-- 
local lAircraft = "FA-18C_hornet" --
local PrevExport = {}
if Helios.aircraft == lAircraft then
do
	PrevExport.LuaExportStop = LuaExportStop
	-- Introspect the path for this script
	local thisScript = debug.getinfo(1,'S').short_src:gsub("\\","/"):match('^.*/(.*).[Ll][Uu][Aa]"]$')
	local thisPath = debug.getinfo(1,'S').short_src:gsub("\\","/"):match('^.*%s"(.*/).*.[Ll][Uu][Aa]"]$'):gsub("/","\\")
if Helios.debug then
	Helios.log.write(thisScript,string.format("Local Mod - Running " .. thisScript))
end
	local programPath = "%ProgramFiles(x86)%\\MyProgramFile\\"
	Helios.log.write(thisScript,'About to run MyProgramFile from "'.. programPath ..'MyProgramFile.exe"')
	  -- start the MyProgramFile program only if it is not already running
	os.execute('tasklist /FI "IMAGENAME eq MyProgramFile.exe" 2>nul | FIND /I /N "MyProgramFile.exe" >nul || start "MyProgramFile Title" /b /min "'.. programPath ..'MyProgramFile.exe"')

function LuaExportStop()
    -- A LuaExportStop is added to allow the program to be terminated automatically
	os.execute('taskkill /FI "IMAGENAME eq MyProgramFile.exe"') -- Send Termination signal to the MyProgramFile process
		if PrevExport.LuaExportStop  then
			PrevExport.LuaExportStop()
		end
	end
end
end