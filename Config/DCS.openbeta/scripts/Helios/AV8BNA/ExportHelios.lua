--
-- This is the template for the aircraft specific Exports file that previously was installed
-- by the aircraft specific interface in the profile editor.
--
-- The Aircraft specifc Exports file lives in a sub directory of the saved games Scripts directory
-- and the name of the directory is the same as the DCS name for the aircraft.
--
local lAircraft = "AV8BNA"
if Helios.aircraft == lAircraft and not Helios.vr then
do
local lfs = require "lfs"
local PrevExport = {}
PrevExport.LuaExportStart = LuaExportStart
PrevExport.LuaExportStop = LuaExportStop
PrevExport.LuaExportBeforeNextFrame = LuaExportBeforeNextFrame
PrevExport.LuaExportAfterNextFrame = LuaExportAfterNextFrame
PrevExport.LuaExportActivityNextEvent = LuaExportActivityNextEvent

local lHost = "127.0.0.1"
local lPort = 9089
local lInterval = 0.067
local lLowTickInterval = 1
local lConn
		local lEveryFrameArguments = {[196]="%0.1f", [197]="%0.1f", [283]="%0.1f", [285]="%0.1f", [281]="%0.1f", [276]="%0.1f", [277]="%0.1f", [278]="%0.1f", [279]="%0.1f", [326]="%0.1f", [327]="%0.1f", [328]="%0.1f", [329]="%0.1f", [330]="%0.1f", [331]="%0.1f", [334]="%0.1f", [335]="%0.1f", [336]="%0.1f", [337]="%0.1f", [338]="%0.1f", [339]="%0.1f", [340]="%0.1f", [341]="%0.1f", [342]="%0.1f", [343]="%0.1f", [344]="%0.1f", [750]="%0.1f", [751]="%0.1f", [752]="%0.1f", [365]="%0.1f", [560]="%0.1f", [561]="%0.1f", [562]="%0.1f", [563]="%0.1f", [564]="%0.1f", [565]="%0.1f", [566]="%0.1f", [567]="%0.1f", [568]="%0.1f", [569]="%0.1f", [570]="%0.1f", [571]="%0.1f", [572]="%0.1f", [573]="%0.1f", [574]="%0.1f", [575]="%0.1f", [576]="%0.1f", [577]="%0.1f", [578]="%0.1f", [579]="%0.1f", [580]="%0.1f", [581]="%0.1f", [582]="%0.1f", [583]="%0.1f", [584]="%0.1f", [585]="%0.1f", [586]="%0.1f", [587]="%0.1f", [588]="%0.1f", [589]="%0.1f", [590]="%0.1f", [591]="%0.1f", [592]="%0.1f", [593]="%0.1f", [594]="%0.1f", [595]="%0.1f", [596]="%0.1f", [597]="%0.1f", [598]="%0.1f", [599]="%0.1f", [600]="%0.1f", [601]="%0.1f", [602]="%0.1f", [603]="%0.1f", [604]="%0.1f", [605]="%0.1f", [606]="%0.1f", [446]="%0.1f", [462]="%0.1f", [463]="%0.1f", [464]="%0.1f", [465]="%0.1f", [466]="%0.1f", [467]="%0.1f", [469]="%0.1f", [468]="%0.1f", [451]="%0.1f", [452]="%0.1f", [453]="%0.1f", [473]="%.4f", [474]="%.4f", [406]="%0.1f", [408]="%0.1f", [410]="%0.1f", [412]="%0.1f", [414]="%0.1f", [416]="%0.1f", [418]="%0.1f", [385]="%.4f", [386]="%.4f", [387]="%.4f", [271]="%.4f", [266]="%.4f", [177]="%0.1f", [608]="%.4f", [559]="%.4f", [607]="%.4f", [362]="%.4f", [361]="%.4f", [360]="%0.1f", [346]="%.4f", [349]="%.4f", [348]="%.4f", [347]="%0.1f", [363]="%.4f", [652]="%.4f", [654]="%0.1f"}
		local lArguments = {[200]="%1d", [201]="%1d", [202]="%1d", [203]="%1d", [204]="%1d", [205]="%1d", [206]="%1d", [207]="%1d", [208]="%1d", [209]="%1d", [210]="%1d", [211]="%1d", [212]="%1d", [213]="%1d", [214]="%1d", [215]="%1d", [216]="%1d", [217]="%1d", [218]="%1d", [219]="%1d", [194]="%.3f", [220]="%1d", [221]="%1d", [222]="%1d", [223]="%1d", [224]="%.1f", [225]="%.1f", [226]="%.1f", [227]="%.1f", [228]="%.1f", [229]="%.1f", [230]="%.1f", [231]="%.1f", [232]="%.1f", [233]="%.1f", [234]="%.1f", [235]="%.1f", [236]="%.1f", [237]="%.1f", [238]="%.1f", [239]="%.1f", [240]="%.1f", [241]="%.1f", [242]="%.1f", [243]="%.1f", [195]="%.3f", [244]="%1d", [245]="%1d", [246]="%1d", [247]="%1d", [302]="%.1f", [303]="%.1f", [304]="%.1f", [306]="%.1f", [307]="%.1f", [308]="%.1f", [310]="%.1f", [311]="%.1f", [312]="%.1f", [315]="%.1f", [316]="%.1f", [313]="%.1f", [314]="%.1f", [305]="%.1f", [294]="%.1f", [324]="%.1f", [318]="%.1f", [319]="%.1f", [320]="%.1f", [317]="%.1f", [325]="%.1f", [296]="%.1f", [322]="%.1f", [321]="%.1f", [323]="%.1f", [297]="%.1f", [309]="%.1f", [198]="%.1f", [199]="%.1f", [295]="%.3f", [298]="%.3f", [299]="%.3f", [300]="%.3f", [301]="%.3f", [178]="%.1f", [179]="%.1f", [288]="%.1f", [289]="%.3f", [290]="%.1f", [291]="%.3f", [292]="%.3f", [293]="%1d", [282]="%.1f", [284]="%.1f", [280]="%.1f", [250]="%.1f", [251]="%.1f", [252]="%.1f", [248]="%.1f", [249]="%.1f", [380]="%.3f", [3379]="%0.1f", [3273]="%0.1f", [3274]="%0.1f", [3275]="%0.1f", [461]="%1d", [458]="%.1f", [448]="%.1f", [447]="%1d", [470]="%1d", [449]="%.1f", [450]="%.1f", [454]="%.1f", [460]="%.1f", [457]="%.1f", [459]="%.1f", [422]="%1d", [423]="%1d", [424]="%1d", [425]="%.1f", [426]="%1d", [427]="%.1f", [429]="%1d", [3421]="%.1f", [481]="%1d", [482]="%1d", [484]="%1d", [485]="%.3f", [486]="%.3f", [490]="%.3f", [489]="%.3f", [487]="%.3f", [488]="%.3f", [471]="%.1f", [483]="%.1f", [476]="%1d", [477]="%.1f", [475]="%1d", [478]="%1d", [479]="%1d", [480]="%1d", [504]="%1d", [508]="%1d", [509]="%1d", [505]="%.1f", [506]="%.1f", [507]="%.1f", [472]="%.1f", [503]="%.1f", [510]="%.3f", [511]="%.1f", [512]="%1d", [513]="%1d", [514]="%1d", [515]="%1d", [516]="%1d", [517]="%1d", [518]="%1d", [287]="%1d", [396]="%1d", [397]="%1d", [398]="%1d", [399]="%1d", [400]="%1d", [401]="%1d", [402]="%1d", [403]="%1d", [420]="%1d", [407]="%.1f", [409]="%.1f", [411]="%.1f", [413]="%.1f", [415]="%.1f", [417]="%.1f", [419]="%.1f", [286]="%.1f", [3404]="%0.1f", [405]="%.1f", [3395]="%0.2f", [502]="%1d", [519]="%1d", [520]="%1d", [614]="%.3f", [615]="%.3f", [3616]="%0.1f", [617]="%.1f", [618]="%.1f", [3619]="%0.2f", [620]="%.1f", [621]="%1d", [622]="%1d", [623]="%1d", [624]="%1d", [625]="%1d", [626]="%1d", [627]="%1d", [628]="%.1f", [632]="%.1f", [633]="%.1f", [629]="%.3f", [630]="%.3f", [3631]="%0.1f", [634]="%.1f", [635]="%.3f", [636]="%.3f", [637]="%.3f", [638]="%.3f", [150]="%.3f", [151]="%.3f", [152]="%.3f", [153]="%.3f", [154]="%.3f", [155]="%.3f", [156]="%.3f", [157]="%.3f", [158]="%.3f", [159]="%.3f", [801]="%1d", [802]="%1d", [803]="%1d", [800]="%1d", [501]="%1d", [121]="%.1f", [122]="%.1f", [639]="%.3f", [640]="%0.1f", [641]="%0.1f", [642]="%0.1f", [643]="%0.1f", [655]="%.1f", [272]="%.3f", [613]="%.1f", [612]="%.1f", [611]="%1d", [610]="%.1f", [609]="%.1f", [653]="%.3f", [364]="%.3f", [351]="%.3f"}
local parse_indication
local ProcessHighImportance
local ProcessLowImportance
local FlushData
local SendData
local ProcessArguments
local ResetChangeValues
local ProcessInput
local StrSplit
local roundS
local check
local checkTexture
local Heliosdump

LuaExportStart =nil
LuaExportBeforeNextFrame =nil
LuaExportAfterNextFrame =nil
LuaExportStop =nil
LuaExportActivityNextEvent =nil

local scriptDebug = 0
local thisScript = debug.getinfo(1,'S').short_src:gsub("\\","/"):match('^.*/(.*).lua"]$')

if Helios.debug then
    Helios.log.write(thisScript,string.format("intends to communicate on " .. lHost .. ":" .. lPort .. "\n"))
	Helios.log.write(thisScript,string.format("Aircraft: " .. Helios.aircraft))
	Helios.log.write(thisScript,string.format("Local Mods - Running " .. thisScript))
	Helios.log.write(thisScript,string.format("Local Mods - Writedir " .. lfs.writedir()))
end

function Heliosdump(var, depth)
        depth = depth or 0
        if type(var) == "string" then
            return 'string: "' .. var .. '"\n'
        elseif type(var) == "nil" then
            return 'nil\n'
        elseif type(var) == "number" then
            return 'number: "' .. var .. '"\n'
        elseif type(var) == "boolean" then
            return 'boolean: "' .. tostring(var) .. '"\n'
        elseif type(var) == "function" then
            if debug and debug.getinfo then
                fcnname = tostring(var)
                local info = debug.getinfo(var, "S")
                if info.what == "C" then
                    return string.format('%q', fcnname .. ', C function') .. '\n'
                else
                    if (string.sub(info.source, 1, 2) == [[./]]) then
                        return string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')' .. info.source) ..'\n'
                    else
                        return string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')') ..'\n'
                    end
                end
            else
                return 'a function\n'
            end
        elseif type(var) == "thread" then
            return 'thread\n'
        elseif type(var) == "userdata" then
            return tostring(var)..'\n'
        elseif type(var) == "table" then
                depth = depth + 1
                out = "{\n"
                for k,v in pairs(var) do
                        out = out .. (" "):rep(depth*4).. "["..k.."] = " .. Heliosdump(v, depth)
                end
                return out .. (" "):rep((depth-1)*4) .. "}\n"
        else
                return tostring(var) .. "\n"
        end
end

ProcessHighImportance = function(mainPanelDevice)

			-- Send Altimeter Values	
			SendData(2051, string.format("%0.4f;%0.4f;%0.4f", mainPanelDevice:get_argument_value(355), mainPanelDevice:get_argument_value(354), mainPanelDevice:get_argument_value(352)))
			SendData(2059, string.format("%0.2f;%0.2f;%0.2f;%0.3f", mainPanelDevice:get_argument_value(356), mainPanelDevice:get_argument_value(357), mainPanelDevice:get_argument_value(358), mainPanelDevice:get_argument_value(359)))		
end

function ProcessLowImportance(mainPanelDevice)
	--local ii
	--for ii = 1,16,1 do
	--	li = parse_indication(ii)
	--	if li ~= nil then 
	--		Helios.log.write(thisScript,string.format("%s %1.0f ", "Dump ", ii) .. Heliosdump(li))
	--	end
	--end
	li = parse_indication(5)
	if li then
		if scriptDebug > 0 then 
			Helios.log.write(thisScript,string.format("UFC Dump " .. Heliosdump(li)))
			Helios.log.write(thisScript,string.format("UFC Comm 1: " .. check(li.ufc_chnl_1_m) .. check(li.ufc_chnl_1_v)))
        end
		SendData("2092", string.format("%2s",check(li.ufc_left_position)))
        SendData("2094", string.format("%7s",check(li.ufc_right_position)))
        SendData("2095", string.format("%2s",check(li.ufc_chnl_1_m) .. check(li.ufc_chnl_1_v)))
		SendData("2096", string.format("%2s",check(li.ufc_chnl_2_m) .. check(li.ufc_chnl_2_v)))
	--[ufc_left_position]  string: "ON"
    --[ufc_right_position] = string: "16"
	end

 	local li = parse_indication(6)
	if li then
		if scriptDebug > 0 then 
			Helios.log.write(thisScript,string.format("ODU Dump " .. Heliosdump(li)))
			Helios.log.write(thisScript,string.format("ODU 5 Text: " .. check(li.ODU_Option_5_Text)))
		end 
		SendData("2082", string.format("%4s",check(li.ODU_Option_1_Text)))
		SendData("2083", string.format("%4s",check(li.ODU_Option_2_Text)))
		SendData("2084", string.format("%4s",check(li.ODU_Option_3_Text)))
		SendData("2085", string.format("%4s",check(li.ODU_Option_4_Text)))
		SendData("2086", string.format("%4s",check(li.ODU_Option_5_Text)))
		SendData("2087", string.format("%1s",check(li.ODU_Option_1_Slc)):gsub(":","!"))  -- ":" is reserved
		SendData("2088", string.format("%1s",check(li.ODU_Option_2_Slc)):gsub(":","!"))  -- ":" is reserved
		SendData("2089", string.format("%1s",check(li.ODU_Option_3_Slc)):gsub(":","!"))  -- ":" is reserved
		SendData("2090", string.format("%1s",check(li.ODU_Option_4_Slc)):gsub(":","!"))  -- ":" is reserved
		SendData("2091", string.format("%1s",check(li.ODU_Option_5_Slc)):gsub(":","!"))  -- ":" is reserved
		-- -- test command 00000000*2096=20:2095=13:2087=!:2088=!:2089=!:2090=!:2091=!:2082=BLUE:2083=FIN :2084=BIMA:2085=2019:2086=test:2094=123.567:2092=~0:2093=-:326=1:336=1:197=1:365=1:196=1: 
	end
	

 	local li = parse_indication(7)  --V/UHF Radio and ACNIP
	if li then
		if scriptDebug > 0 then 
			Helios.log.write(thisScript,string.format("V/UHF Radio and ACNIP " .. Heliosdump(li)))
        end
		--[UVHF_DISPLAY] = string: ""
		--[uvhf_channel] = string: "01"
		--[uvhf_freq_left] = string: "177.000"
		--[acnip_1_label_mode] = string: "MODE"
		--[acnip_1_mode] = string: "PLN"
		--[acnip_1_label_code] = string: "CODE"
		--[acnip_1_code] = string: "00"
		--[acnip_2_label_mode] = string: "MODE"
		--[acnip_2_mode] = string: "CY"
		--[acnip_2_label_code] = string: "CODE"
		--[acnip_2_code] = string: "03"
		
		SendData("2100", string.format("%2s",check(li.uvhf_channel)))
		SendData("2101", string.format("%7s",check(li.uvhf_freq_left)))
		SendData("2102", string.format("%s",check(li.acnip_1_label_mode)))
		SendData("2103", string.format("%s",check(li.acnip_1_mode)))
		SendData("2104", string.format("%s",check(li.acnip_1_label_code)))
		SendData("2105", string.format("%s",check(li.acnip_1_code)))		
		SendData("2106", string.format("%s",check(li.acnip_2_label_mode)))
		SendData("2107", string.format("%s",check(li.acnip_2_mode)))
		SendData("2108", string.format("%s",check(li.acnip_2_label_code)))
		SendData("2109", string.format("%s",check(li.acnip_2_code)))

	end
	
	
    SendData(2001, string.format("%.0f",mainPanelDevice:get_argument_value(253) * 1000+mainPanelDevice:get_argument_value(254) * 100+mainPanelDevice:get_argument_value(255) * 10))     -- Engine Duct
    SendData(2002, string.format("%.0f",mainPanelDevice:get_argument_value(256) * 10000+mainPanelDevice:get_argument_value(257) * 1000+mainPanelDevice:get_argument_value(258) * 100+mainPanelDevice:get_argument_value(259) * 10))     -- Engine RPM
    SendData(2003, string.format("%.0f",mainPanelDevice:get_argument_value(260) * 1000+mainPanelDevice:get_argument_value(261) * 100+mainPanelDevice:get_argument_value(262) * 10))    -- Engine FF
    SendData(2004, string.format("%.0f",mainPanelDevice:get_argument_value(263) * 1000+mainPanelDevice:get_argument_value(264) * 100+mainPanelDevice:get_argument_value(265) * 10)) -- Engine JPT
    SendData(2005, string.format("%.0f",mainPanelDevice:get_argument_value(267) * 100+mainPanelDevice:get_argument_value(268) * 10)) -- Engine Stab
    SendData(2006, string.format("%.0f",mainPanelDevice:get_argument_value(269) * 100+mainPanelDevice:get_argument_value(270) * 10)) -- Engine H2O
    SendData(2019, string.format("%.4f",mainPanelDevice:get_argument_value(386) * 100+mainPanelDevice:get_argument_value(387) * 10)) -- SMC Fuze
    SendData(2020, string.format("%.0f",mainPanelDevice:get_argument_value(392) * 1000+mainPanelDevice:get_argument_value(393) * 100+mainPanelDevice:get_argument_value(394) * 10))    -- SMC Interval
    SendData(2022, string.format("%.0f",mainPanelDevice:get_argument_value(389) * 100+mainPanelDevice:get_argument_value(390) * 10))    -- SMC Quantity
    SendData(2021, string.format("%.0f",mainPanelDevice:get_argument_value(391) * 10))    -- SMC Mult
    SendData(2010, string.format("%.0f",mainPanelDevice:get_argument_value(367) * 10000+mainPanelDevice:get_argument_value(368) * 1000+mainPanelDevice:get_argument_value(369) * 100+mainPanelDevice:get_argument_value(370) * 10))    -- Fuel Total
    SendData(2011, string.format("%.0f",mainPanelDevice:get_argument_value(371) * 10000+mainPanelDevice:get_argument_value(372) * 1000+mainPanelDevice:get_argument_value(373) * 100+mainPanelDevice:get_argument_value(374) * 10))    -- Fuel Left Tank
    SendData(2012, string.format("%.0f",mainPanelDevice:get_argument_value(375) * 10000+mainPanelDevice:get_argument_value(376) * 1000+mainPanelDevice:get_argument_value(377) * 100+mainPanelDevice:get_argument_value(378) * 10))    -- Fuel Right Tank
    SendData(2013, string.format("%.0f",mainPanelDevice:get_argument_value(381) * 10000+mainPanelDevice:get_argument_value(382) * 1000+mainPanelDevice:get_argument_value(383) * 100+mainPanelDevice:get_argument_value(384) * 10))    -- Fuel Bingo
    SendData(2014, string.format("%.0f",mainPanelDevice:get_argument_value(455) * 100+mainPanelDevice:get_argument_value(456) * 10))    -- Flap Position
    SendData(2015, string.format("%.0f",mainPanelDevice:get_argument_value(550) * 1000+mainPanelDevice:get_argument_value(551) * 100+mainPanelDevice:get_argument_value(552) * 10))    -- Pressure Brake
    SendData(2016, string.format("%.0f",mainPanelDevice:get_argument_value(553) * 1000+mainPanelDevice:get_argument_value(554) * 100+mainPanelDevice:get_argument_value(555) * 10))    -- Pressure Hyd 1
    SendData(2017, string.format("%.0f",mainPanelDevice:get_argument_value(556) * 1000+mainPanelDevice:get_argument_value(557) * 100+mainPanelDevice:get_argument_value(558) * 10))    -- Pressure Hyd 2
end
-- for some reason, this causes a failure on my system so commenting it
-- out in the hope that others don't see a problem with it.
--assert(os.setlocale'en_US.ISO-8859-1')

-- Simulation id
local lID = string.format("%08x*",os.time())

-- State data for export
local lPacketSize = 0
local lSendStrings = {}
local lLastData = {}

-- Frame counter for non important data
local lTickCount = 0

-- DCS Export Functions
LuaExportStart= function()
if scriptDebug > 0 then Helios.log.write(thisScript,"LuaExportStart() invoked.") end
-- Works once just before mission start.

    -- 2) Setup udp sockets to talk to helios
    package.path  = package.path..";.\\LuaSocket\\?.lua"
    package.cpath = package.cpath..";.\\LuaSocket\\?.dll"

    socket = require("socket")

    lConn = socket.udp()
	lConn:setsockname("*", 0)
	lConn:setoption('broadcast', true)
    lConn:settimeout(.001) -- set the timeout for reading the socket
    if lConn~= nil then
		Helios.log.write(thisScript,"LuaExportStart() socket open for communication.")
	else
		Helios.log.write(thisScript,"LuaExportStart() socket failed to open.")
	end
    if PrevExport.LuaExportStart then
        PrevExport.LuaExportStart()
    end
end

LuaExportBeforeNextFrame= function()
if scriptDebug > 0 then Helios.log.write(thisScript,"LuaExportBeforeNextFrame() invoked.") end
	ProcessInput()
    if PrevExport.LuaExportBeforeNextFrame then
       PrevExport.LuaExportBeforeNextFrame()
    end
end

LuaExportAfterNextFrame= function()
if scriptDebug > 0 then Helios.log.write(thisScript,"LuaExportAfterNextFrame() invoked.") end

    if PrevExport.LuaExportAfterNextFrame  then
        PrevExport.LuaExportAfterNextFrame()
    end

end

LuaExportStop= function()
if scriptDebug > 0 then Helios.log.write(thisScript,"LuaExportStop() invoked.") end
-- Works once just after mission stop.
    lConn:close()
    if PrevExport.LuaExportStop  then
        PrevExport.LuaExportStop()
    end

end

LuaExportActivityNextEvent= function(t)
	if scriptDebug > 0 then Helios.log.write(thisScript,"LuaExportActivityNextEvent() invoked.") end
	if scriptDebug > 0 and lConn == nil then Helios.log.write(thisScript,"Connection object is Nil in LuaExportActivityNextEvent().") end

	local lt = t + lInterval
    local lot = lt

	lTickCount = lTickCount + 1
	local lDevice = GetDevice(0)
	if type(lDevice) == "table" then
		lDevice:update_arguments()

		ProcessArguments(lDevice, lEveryFrameArguments)
		ProcessHighImportance(lDevice)

		if lTickCount >= lLowTickInterval then
			ProcessArguments(lDevice, lArguments)
			ProcessLowImportance(lDevice)
			lTickCount = 0
		end

		FlushData()
	end
    if PrevExport.LuaExportActivityNextEvent then
        lot = PrevExport.LuaExportActivityNextEvent(t)  -- if we were given a value then pass it on
    end
    if  lt > lot then
        lt = lot -- take the lesser of the next event times
    end
    return lt

end

-- Network Functions
FlushData = function()
	if #lSendStrings > 0 then
		local packet = lID .. table.concat(lSendStrings, ":") .. "\n"
		socket.try(lConn:sendto(packet, lHost, lPort))
		lSendStrings = {}
		lPacketSize = 0
	end
end

SendData = function(id, value)
    if scriptDebug > 4 then Helios.log.write(thisScript,"Pre SendData: " .. id .. "=" .. value) end


	if string.len(value) > 3 and value == string.sub("-0.00000000",1, string.len(value)) then
		value = value:sub(2)
	end

	if lLastData[id] == nil or lLastData[id] ~= value then
		local data =  id .. "=" .. value:gsub(":","::") -- escape any colons in the command's value
		local dataLen = string.len(data)

		if dataLen + lPacketSize > 576 then
			FlushData()
		end
        --Helios.log.write(thisScript,"SendData: " .. data)

		table.insert(lSendStrings, data)
		lLastData[id] = value
		lPacketSize = lPacketSize + dataLen + 1
	end
end

-- Status Gathering Functions
ProcessArguments = function(device, arguments)
	local lArgument , lFormat , lArgumentValue
	for lArgument, lFormat in pairs(arguments) do
		lArgumentValue = string.format(lFormat,device:get_argument_value(lArgument))
		SendData(lArgument, lArgumentValue)
	end
end

-- Data Processing Functions

parse_indication = function(indicator_id)  -- Thanks to [FSF]Ian code
	local ret = {}
	local li = list_indication(indicator_id)
	if li == "" then return nil end
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
	local name, value = m()
	if not name then break end
		ret[name] = value
	end
	return ret
end

ProcessInput = function()
    local lInput = lConn:receive()
    local lCommand, lCommandArgs, lDevice, lArgument, lLastValue

    if lInput then

        lCommand = string.sub(lInput,1,1)

		if lCommand == "R" then
            Helios.log.write(thisScript,"Reset Received - " .. lInput)
			ResetChangeValues()
		end

		if (lCommand == "C") then
            --Helios.log.write(thisScript,"Command Received - " .. lInput)
			lCommandArgs = StrSplit(string.sub(lInput,2),",")
			lDevice = GetDevice(lCommandArgs[1])
			if type(lDevice) == "table" then
				lDevice:performClickableAction(lCommandArgs[2],lCommandArgs[3])
			end
		end
    end
end

-- Helper Functions
StrSplit = function(str, delim, maxNb)
    -- Eliminate bad cases...
    if string.find(str, delim) == nil then
        return { str }
    end
    if maxNb == nil or maxNb < 1 then
        maxNb = 0    -- No limit
    end
    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local nb = 0
    local lastPos
    for part, pos in string.gfind(str, pat) do
        nb = nb + 1
        result[nb] = part
        lastPos = pos
        if nb == maxNb then break end
    end
    -- Handle the last field
    if nb ~= maxNb then
        result[nb + 1] = string.sub(str, lastPos)
    end
    return result
end

round = function(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

check = function(s)
    if type(s) == "string" then
        print("Variable type is "..type(s))
        return s
    else
	    return ""
    end
end
checkTexture = function(s)
    if s == nil then return "0" else return "1" end
end
ResetChangeValues = function()
	lLastData = {}
	lTickCount = 10
end
end
end
