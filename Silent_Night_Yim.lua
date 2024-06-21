-- Define MPX as a function that returns the appropriate prefix string
local function MPX()
    local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
    if PI == 0 then
        return "MP0_"
    else
        return "MP1_"
    end
end
-- Global Variables
ASIFl1 = 48513 + 1 -- auto shop instant finish local 1
ASIFl2 = 48513 + 1765 + 1 -- auto shop finish local 2
DDSHl = 1269 + 135 -- doomsday doomsday scenario hack local
FMg = 262145 -- free mode global ("CASH_MULTIPLIER")
APg = FMg + 32071 -- agency payout global ("FIXER_FINALE_LEADER_CASH_REWARD")
ASRBl = 381 -- auto shop reload board local
ASPg1 = FMg + 31323 + 1 -- auto shop payout global 1 ("TUNER_ROBBERY_LEADER_CASH_REWARD0")
ASPg2 = FMg + 31323 + 8 -- auto shop payout global 2 ("TUNER_ROBBERY_LEADER_CASH_REWARD7")
ASFg = FMg + 31319 -- auto shop fee global ("TUNER_ROBBERY_CONTACT_FEE")
SYVVg = FMg + 34092 -- salvage yard vehicle value global ("SALV23_VEHICLE_ROBBERY_VALUE_0")
ASCKg = FMg + 31342 -- auto shop cooldown global ("TUNER_ROBBERY_COOLDOWN_TIME")
DCg1 = 1959865 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1959865 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1959865 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1959865 + 812 + 50 + 4 -- doomsday player 4 cut global
GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)
CPRSl = 1544 -- cayo perico reload screen local
CPCg1 = 1970744 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1970744 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1970744 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1970744 + 831 + 56 + 4 -- cayo perico player 4 cut global
GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)
CPBg = FMg + 30009 -- cayo perico bag global (1859395035)
CPFHl = 24333 -- cayo perico fingerprint hack local
CPPCCl = 30357 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds")
CPSTCl = 29118 -- cayo perico drainage pipe cut local



-- Silent Knight Tab
Silent = gui.get_tab("Silent Night 1.68")
Silent:add_text("Silent Night 1.68 [V2.1]")

-- Heist Editor tab
Heist_Editor = Silent:add_tab("Heist Editor")

-- Agency tab
local contract_id = {3, 4, 12, 28, 60, 124, 252, 508, 2044, 4095, -1}
local Agency = Heist_Editor:add_tab("Agency")

Agency:add_button("Nightclub Leak",
    function()
        local contractIndex = 3  -- Index of "Nightclub Leak" in the array
        stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contractIndex - 1])
        a1 = contractIndex
    end)
Agency:add_sameline()
Agency:add_button("High Society Leak")
Agency:add_sameline()
Agency:add_button("South Central Leak",
    function()
        local contractIndex = 10  -- Index of "South Central Leak" in the array
        stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contractIndex - 1])
        a1 = contractIndex
    end)
Agency:add_sameline()
Agency:add_button("Don't Fuck With Dre",
    function()
        local contractIndex = 11  -- Index of "Don't Fuck With Dre" in the array
        stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contractIndex - 1])
        a1 = contractIndex
    end)
Agency:add_button("Complete Preps",
    function()
        stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
        stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
        stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    end)
Agency:add_separator()
Agency:add_text("Payouts:")
Agency:add_button("Max Payout (after start)", function() globals.set_int(APg, 2500000) end)
Agency:add_separator()
Agency:add_text("After All choices and pressing Complete Preps wait for sometime")

-- Autoshop tab

local Autoshop = Heist_Editor:add_tab("Autoshop")
Autoshop:add_text("Missions")
Autoshop:add_button("Union Repository",
function()
	local contractIndex = 1
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_sameline()
Autoshop:add_button("The Superdollar Deal", 
function()
	local contractIndex = 2
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_sameline()
Autoshop:add_button("The Bank Contract",
function()
	local contractIndex = 3
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_sameline()
Autoshop:add_button("The ECU Job",
function()
	local contractIndex = 4
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_button("The Prison Contract",
    function()
        local contractIndex = 5
        stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
    end)
Autoshop:add_sameline()
Autoshop:add_button("The Agency Deal",
function()
	local contractIndex = 6
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_sameline()
Autoshop:add_button("The Lost Contract",
function()
	local contractIndex = 7
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_sameline()
Autoshop:add_button("The Data Contract",
function()
	local contractIndex = 8
	stats.set_int(MPX() .. "TUNER_CURRENT", contractIndex - 1)
end)
Autoshop:add_button("Complete Preps",
	function()
		current_mission = stats.get_int(MPX() .. "TUNER_CURRENT")
		if current_mission == 1 then
			stats.set_int(MPX() .. "TUNER_GEN_BS", 4351)
		else
			stats.set_int(MPX() .. "TUNER_GEN_BS", 12543)
		end
		sleep(1)
		locals.set_int("tuner_planning", 381, 2)
	end)
Autoshop:add_separator()
Autoshop:add_text("Reload Planning")
Autoshop:add_button("Reload Planning",
function ()
	locals.set_int("tuner_planning", 381, 2)
end
)
Autoshop:add_separator()
Autoshop:add_text("Payouts:")
Autoshop:add_button("Max Payout",
function()
	globals.set_float(ASFg, 0)
	for i = ASPg1, ASPg2 do
		globals.set_int(i, 2000000)
	end
end)
Autoshop:add_separator()
Autoshop:add_text("Instant Finish")
Autoshop:add_button("Instant Finish",
function ()
	locals.set_int("fm_mission_controller_2020", ASIFl1, 51338977)
	locals.set_int("fm_mission_controller_2020", ASIFl2, 101)
end
)

-- Salvage Yard --
local function set_all_vehicles_available()
    for i = 1, 3 do
        -- Set each vehicle's status to 'Available' (index 2 in yard_vehicle_statuses)
        stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. (i - 1), 0) -- Setting to 0 for 'Available'
    end
end
local function YardPrepsSetter(value)
	stats.set_int(MPX() .. "SALV23_GEN_BS", value)
	stats.set_int(MPX() .. "SALV23_SCOPE_BS", value)
	stats.set_int(MPX() .. "SALV23_FM_PROG", value)
	stats.set_int(MPX() .. "SALV23_INST_PROG", value)
end

local Salvage = Heist_Editor:add_tab("Salvage Yard")
Salvage:add_text("Alter Vehicle Cost")
Salvage:add_text("")
Salvage:add_text("Set Vehicle value to $600,000 | Safe")
Salvage:add_button("First Vehicle",
function ()
	globals.set_int(SYVVg + 1, 600000)
end)
Salvage:add_sameline()
Salvage:add_button("Second Vehicle",
function ()
	globals.set_int(SYVVg + 2, 600000)
end)
Salvage:add_sameline()
Salvage:add_button("Third Vehicle",
function ()
	globals.set_int(SYVVg + 3, 600000)
end)

Salvage:add_separator()
Salvage:add_text("Set Vehicle value to $1,000,000 | ⚠️")
Salvage:add_button("First Vehicle",
function ()
	globals.set_int(SYVVg + 1, 1000000)
end)
Salvage:add_sameline()
Salvage:add_button("Second Vehicle",
function ()
	globals.set_int(SYVVg + 2, 1000000)
end)
Salvage:add_sameline()
Salvage:add_button("Third Vehicle",
function ()
	globals.set_int(SYVVg + 3, 1000000)
end)

Salvage:add_separator()
Salvage:add_text("Set All vehicles as available")
Salvage:add_button("Set all vehicles as available", function() set_all_vehicles_available() end)
Salvage:add_text("Complete Preps")
Salvage:add_button("Complete Preps", function() YardPrepsSetter(-1) end)
Salvage:add_separator()
Salvage:add_text("Reset preps")
Salvage:add_button("Reset Preps", function() YardPrepsSetter(0) end)
Salvage:add_separator()
Salvage:add_text("Kill Cooldown")
Salvage:add_button("Kill Cooldown",
function()
	for i = SYCg1, SYCg2 do
		globals.set_int(i, 0)
	end
end)
-- Cut Setter for Heist --

local function CutsPresetter(global_start, global_finish, cut)
	globals.set_int(GCg, cut)
	for i = global_start, global_finish do
		globals.set_int(i, cut)		
	end
end

-- Doomsday --
local function DoomsdayActSetter(progress, status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end

local Doomsday = Heist_Editor:add_tab("Doomsday Heist")
Doomsday:add_text("Doomsday Acts")
Doomsday:add_button("Data Breaches",
function ()
	DoomsdayActSetter(503, 229383)

end)
Doomsday:add_sameline()
Doomsday:add_button("Bogdan Problem",
function ()
	DoomsdayActSetter(240, 229378)
end)
Doomsday:add_sameline()
Doomsday:add_button("Doomsday Scenario",
function ()
	DoomsdayActSetter(16368, 229380)
end)

Doomsday:add_text("Set Doomsday Heist Cuts")
Doomsday:add_button("100",
function ()
	CutsPresetter(DCg1, DCg4, 100)
end
)
Doomsday:add_separator()
Doomsday:add_text("Preps")
Doomsday:add_button("Reset Preps",
function ()
	DoomsdayActSetter(240, 0)
end
)
Doomsday:add_sameline()
Doomsday:add_button("Complete Preps",
function ()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end
)
Doomsday:add_separator()
Doomsday:add_text("By pass Doomsday Scenario hack")
Doomsday:add_button("By Pass hack",
function ()
	locals.set_int("fm_mission_controller_2020", DDSHl, 3)
end
)

-- Cayo Heist --

local Cayo = Heist_Editor:add_tab("Cayo Perico Heist")
Cayo:add_text("Primary Target")
Cayo:add_button("Panther Statue",
function ()
	stats.set_int(MPX() .. "H4CNF_TARGET", 5)
end)
Cayo:add_sameline()
Cayo:add_button("Diamond",
function ()
	stats.set_int(MPX() .. "H4CNF_TARGET", 4)
end)
Cayo:add_sameline()
Cayo:add_button("Bonds",
function ()
	stats.set_int(MPX() .. "H4CNF_TARGET", 3)
end)
Cayo:add_sameline()
Cayo:add_button("Necklace",
function ()
	stats.set_int(MPX() .. "H4CNF_TARGET", 2)
end)
Cayo:add_sameline()
Cayo:add_button("Tequila",
function ()
	stats.set_int(MPX() .. "H4CNF_TARGET", 1)
end)
Cayo:add_separator()
Cayo:add_text("Secondary targets")
local function CayoCompletePreps()
	stats.set_int(MPX() .. "H4CNF_UNIFORM", -1)
	stats.set_int(MPX() .. "H4CNF_GRAPPEL", -1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 10)
end
local function CayoTargetsSetter(cash, weed, coke, gold, where, target, value)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where, cash)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where .. "_SCOPED", cash)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where, weed)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where .. "_SCOPED", weed)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where, coke)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where .. "_SCOPED", coke)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where, gold)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where .. "_SCOPED", gold)
	stats.set_int(MPX() .. "H4LOOT_" .. target .. "_V", value)
end
local function CayoPaintingsToggler(Enabled)
	if Enabled then
		stats.set_int(MPX() .. "H4LOOT_PAINT", 127)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 127)
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
	else
		stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	end
end
local function CutsPresetter(global_start, global_finish, cut)
	globals.set_int(GCg, cut)
	for i = global_start, global_finish do
		globals.set_int(i, cut)
	end
end


Cayo:add_text("Compound:")
Cayo:add_button("Gold",
function ()
	CayoTargetsSetter(0, 0, 0, 255, "C", "GOLD", 330350)
end
)
Cayo:add_sameline()
Cayo:add_button("Cocaine",
function ()
	CayoTargetsSetter(0, 0, 255, 0, "C", "COKE", 200095)
end
)
Cayo:add_sameline()
Cayo:add_button("Meraguina",
function ()
	CayoTargetsSetter(0, 255, 0, 0, "C", "WEED", 147870)
end
)
Cayo:add_sameline()
Cayo:add_button("Cash",
function ()
	CayoTargetsSetter(255, 0, 0, 0, "C", "CASH", 90000)
end
)
Cayo:add_text("")
Cayo:add_text("Island")
Cayo:add_button("Gold",
function ()
	CayoTargetsSetter(0, 0, 0, 16777215, "I", "GOLD", 330350)
end
)
Cayo:add_sameline()
Cayo:add_button("Cocaine",
function ()
	CayoTargetsSetter(0, 0, 16777215, 0, "I", "COKE", 200095)
end
)
Cayo:add_sameline()
Cayo:add_button("Meraguina",
function ()
	CayoTargetsSetter(0, 16777215, 0, 0, "I", "WEED", 147870)
end
)
Cayo:add_sameline()
Cayo:add_button("Cash",
function ()
	CayoTargetsSetter(16777215, 0, 0, 0, "I", "CASH", 90000)
end
)
Cayo:add_text("")
Cayo:add_text("Add Paintings")
local addPaintings = Cayo:add_checkbox("Paintings")
Cayo:add_separator()
Cayo:add_text("Difficulty")
Cayo:add_button("Hard",
function ()
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
end
)
Cayo:add_sameline()
Cayo:add_button("Normal",
function ()
	stats.set_int(MPX() .. "H4_PROGRESS", 126823)
end
)
Cayo:add_separator()
Cayo:add_text("Approach")
Cayo:add_button("Longfin",
function ()
	stats.set_int(MPX() .. "H4_MISSIONS", 65345)
end
)
Cayo:add_sameline()
Cayo:add_button("Patrol Boat",
function ()
	stats.set_int(MPX() .. "H4_MISSIONS", 65313)
end
)
Cayo:add_sameline()
Cayo:add_button("Stealth Annihilator",
function ()
	stats.set_int(MPX() .. "H4_MISSIONS", 65425)
end
)
Cayo:add_sameline()
Cayo:add_button("Velum",
function ()
	stats.set_int(MPX() .. "H4_MISSIONS", 65289)
end
)
Cayo:add_sameline()
Cayo:add_button("Alkonost",
function ()
	stats.set_int(MPX() .. "H4_MISSIONS", 65413)
end
)
Cayo:add_sameline()
Cayo:add_button("Kosatka",
function ()
	stats.set_int(MPX() .. "H4_MISSIONS", 65283)
end
)
Cayo:add_separator()
Cayo:add_text("Weapons")
Cayo:add_button("Aggressor",
function ()
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 1)

end)
Cayo:add_sameline()
Cayo:add_button("Conspirator",
function ()
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 2)

end)
Cayo:add_sameline()
Cayo:add_button("Crackshot",
function ()
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 3)

end)
Cayo:add_sameline()
Cayo:add_button("Saboteur",
function ()
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 4)

end)
Cayo:add_sameline()
Cayo:add_button("Marksman",
function ()
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)

end)
Cayo:add_separator()
Cayo:add_button("Complete Preps",
function ()
	CayoPaintingsToggler(addPaintings:is_enabled())
	CayoCompletePreps()
end
)
Cayo:add_separator()
Cayo:add_text("Cuts to All")
Cayo:add_button("100",
function ()
	CutsPresetter(CPCg1, CPCg4, 100)
end
)

Cayo:add_separator()
Cayo:add_text("Reload Planing Screen")
Cayo:add_button("Reload Planing Screen",
function ()
	locals.set_int("heist_island_planning", CPRSl, 2)
end
)
Cayo:add_separator()
Cayo:add_text("Extras")
Cayo:add_button("Bypass Drainge Cut",
function ()
	locals.set_int("fm_mission_controller_2020", CPSTCl, 6)
end
)
Cayo:add_sameline()
Cayo:add_button("Bypass Fingerprint Scanner",
function ()
	locals.set_int("fm_mission_controller_2020", CPFHl, 5)
end
)
Cayo:add_sameline()
Cayo:add_button("Bypass Plasma Cutter",
function ()
	locals.set_float("fm_mission_controller_2020", CPPCCl, 100.0)
end
)
Cayo:add_sameline()
Cayo:add_button("Remove All CCTV's",
function ()
	for _, ent in pairs(entities.get_all_objects_as_handles()) do
		for __, cam in pairs(CamList) do
			if ENTITY.GET_ENTITY_MODEL(ent) == cam then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
				ENTITY.DELETE_ENTITY(ent)
			end
		end
	end
end
)
