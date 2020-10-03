--
-- This file patches the necessary cockpit files to allow the 
-- exported gauges to be exported.
-- Each patched file is saved away to allow removal
-- We also register an export stop routine to remove the patches.
-- 
local lAircraft = "AV8BNA"
local PrevExport = {}
if Helios.aircraft == lAircraft then
do
	PrevExport.LuaExportStop = LuaExportStop
	local thisScript = debug.getinfo(1,'S').short_src:gsub("\\","/"):match('^.*/(.*).[Ll][Uu][Aa]"]$')
	local thisPath = debug.getinfo(1,'S').short_src:gsub("\\","/"):match('^.*%s"(.*/).*.[Ll][Uu][Aa]"]$'):gsub("/","\\")
	log.write('USERMOD.HELIOS',log.INFO,lAircraft .. ':' .. thisScript .. ' cockpit patching started')

if Helios.debug then
	Helios.log.write(thisScript,string.format("Local Mod - Running " .. thisScript))
	Helios.log.write(thisScript,string.format("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"))
	Helios.log.write(thisScript,string.format("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"))
	Helios.log.write(thisScript,string.format("* * Note:  this mod needs DCS to be started in Administrator Mode for the * *"))
	Helios.log.write(thisScript,string.format("* *        patching to be successful.  Once patched, DCS can be started   * *"))
	Helios.log.write(thisScript,string.format("* *        without elevated authority.                                    * *"))
	Helios.log.write(thisScript,string.format("* * The MFD fuzzy fonts will not look correct until after a DCS restart.  * *"))
	Helios.log.write(thisScript,string.format("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"))
	Helios.log.write(thisScript,string.format("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"))
end
	local fn
	local content
	local MarkerText
	local AddText
	local f
	
--	fn = lfs.currentdir() .. 'Mods\\aircraft\\AV8BNA\\Cockpit\\UFC\\indicator\\UFC_init.lua'
--	Helios.log.write(thisScript,'Checking for patch in file \"' .. fn .. '\"')

--	f = assert(io.open(fn, "r")) -- note: for some reason f:seek had nil problems when r+ was specified so sticking with r and w
--  content = f:read("*a")
--  f:close()
--  if content:find("-- Start of Helios inserted code") == nil then
--		Helios.log.write(thisScript,'Found unpatched UFC.') 
--		-- create backup copy
--		f = assert(io.open(fn .. '.bak', "w"))
--		f:write(content)
--		f:close()
--		-- now modify the file and write it back
--		AddText = string.format(MarkerText .. '\n\n-- Start of Helios inserted code')
--		--AddText = string.format(AddText .. '\ndofile(LockOn_Options.common_script_path..\"ViewportHandling.lua\")')
--		AddText = string.format(AddText .. '\ntry_find_assigned_viewport(\"UFC_base\")')
--		AddText = string.format(AddText .. '\n-- End of Helios inserted code.\n')

--		f = assert(io.open(fn, "w"))
--		f:write(content .. AddText)
--		f:close()
--		Helios.log.write(thisScript,'Patched UFC.') 
--	end

	-- fn = lfs.currentdir() .. 'Mods\\aircraft\\AV8BNA\\Cockpit\\ODU\\indicator\\ODU_init.lua'
	-- Helios.log.write(thisScript,'Checking for patch in file \"' .. fn .. '\"')

	-- f = assert(io.open(fn, "r"))
    -- content = f:read("*a")
    -- f:close()
	-- if content:find("-- Start of Helios inserted code") == nil then
		-- Helios.log.write(thisScript,'Found unpatched ODU.') 
		--  --create backup copy
		-- f = assert(io.open(fn .. '.bak', "w"))
		-- f:write(content)
		-- f:close()
		--  --now modify the file and write it back
		-- AddText = string.format(MarkerText .. '\n\n-- Start of Helios inserted code')
		--AddText = string.format(AddText .. '\ndofile(LockOn_Options.common_script_path..\"ViewportHandling.lua\")')
		-- AddText = string.format(AddText .. '\ntry_find_assigned_viewport(\"ODU_base\")')
		-- AddText = string.format(AddText .. '\n-- End of Helios inserted code.\n')

		-- f = assert(io.open(fn, "w"))
		-- f:write(content:gsub(MarkerText,AddText))
		-- f:close()
		-- Helios.log.write(thisScript,'Patched ODU.') 
	-- end

	-- fn = lfs.currentdir() .. 'Mods\\aircraft\\AV8BNA\\Cockpit\\UVHF\\indicator\\UVHF_init.lua'
	-- Helios.log.write(thisScript,'Checking for patch in file \"' .. fn .. '\"')

	-- f = assert(io.open(fn, "r"))
    -- content = f:read("*a")
    -- f:close()
	-- if content:find("-- Start of Helios inserted code") == nil then
		-- Helios.log.write(thisScript,'Found unpatched U/VHF.') 
		-- -- create backup copy
		-- f = assert(io.open(fn .. '.bak', "w"))
		-- f:write(content)
		-- f:close()
		-- -- now modify the file and write it back
		-- AddText = string.format(MarkerText .. '\n\n-- Start of Helios inserted code')
		-- --AddText = string.format(AddText .. '\ndofile(LockOn_Options.common_script_path..\"ViewportHandling.lua\")')
		-- AddText = string.format(AddText .. '\ntry_find_assigned_viewport(\"UVHF_base\")')
		-- AddText = string.format(AddText .. '\n-- End of Helios inserted code.\n')

		-- f = assert(io.open(fn, "w"))
		-- f:write(content:gsub(MarkerText,AddText))
		-- f:close()
		-- Helios.log.write(thisScript,'Patched U/VHF.') 
	-- end

	-- fn = lfs.currentdir() .. 'Mods\\aircraft\\AV8BNA\\Cockpit\\Scripts\\Multipurpose_Display_Group\\Common\\indicator\\MDG_strokesDefs.lua'
	-- Helios.log.write(thisScript,'Checking for patch in file \"' .. fn .. '\"')

	-- f = assert(io.open(fn, "r"))
    -- content = f:read("*a")
    -- f:close()
	-- if content:find("-- Start of Helios altered code") == nil then
		-- Helios.log.write(thisScript,'Found unpatched MPD strokes file.') 
		-- -- create backup copy
		-- f = assert(io.open(fn .. '.bak', "w"))
		-- f:write(content)
		-- f:close()
		-- -- now modify the file and write it back
		-- f = assert(io.open(fn, "w"))
		-- f:write(string.format("-- Start of Helios altered code\n" .. content:gsub("stroke_thickness  = 0.8","stroke_thickness  = 0.4"):gsub("stroke_fuzziness  = 0.5","stroke_fuzziness  = 0.2")))
		-- f:close()
		-- Helios.log.write(thisScript,'Patched MPD strokes file.') 
	-- end

	
function LuaExportStop()
		-- you could reverse the patching in this section. 
		if PrevExport.LuaExportStop  then
			PrevExport.LuaExportStop()
		end
end
end
end