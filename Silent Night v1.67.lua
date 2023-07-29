--Developer: SilentSalo--

	require_game_build(2944) -- GTA Online v1.67
	SilentNight = menu.add_submenu("ツ Silent Night v1.67")
	
--Required Stats--		

			PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
			MPX = PI 
		if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end
			FMC = script("fm_mission_controller")
			FMC20 = script("fm_mission_controller_2020") 
			HIP = script("heist_island_planning")
			
--Cayo Perico--

	CayoPerico = SilentNight:add_submenu("♠ Cayo Perico")
	
	CPP = CayoPerico:add_submenu("Preps")

			a4 = 1
	CPP:add_array_item("Primary Target", {"Tequila (900k)", "Necklace (1m)", "Bonds (1,1m)", "Diamond (1,3m)", "Statue (1,9m)"}, function() return a4 end, 
		function(CPpt) if CPpt == 1 then stats.set_int(MPX .. "H4CNF_TARGET", 0) 
		elseif CPpt == 2 then stats.set_int(MPX .. "H4CNF_TARGET", 1) 
		elseif CPpt == 3 then stats.set_int(MPX .. "H4CNF_TARGET", 2) 
		elseif CPpt == 4 then stats.set_int(MPX .. "H4CNF_TARGET", 3) 
		elseif CPpt == 5 then stats.set_int(MPX .. "H4CNF_TARGET", 5) end 
		a4 = CPpt end)
		
			a5 = 1
	CPP:add_array_item("Fill Compound Storages", {"Gold", "Paintings", "Cocaine", "Weed", "Cash"}, function() return a5 end, 
		function(CPfis) if CPfis == 1 then stats.set_int(MPX .. "H4LOOT_GOLD_C", -1) stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", -1) 
		elseif CPfis == 2 then stats.set_int(MPX .. "H4LOOT_PAINT", -1) stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", -1) stats.set_int(MPX .. "H4LOOT_PAINT_V", 403500) 
		elseif CPfis == 3 then stats.set_int(MPX .. "H4LOOT_COKE_C", -1) stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", -1) 
		elseif CPfis == 4 then stats.set_int(MPX .. "H4LOOT_WEED_C", -1) stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", -1) 
		elseif CPfis == 5 then stats.set_int(MPX .. "H4LOOT_CASH_C", -1) stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", -1) end 
		a5 = CPfis end)
		
			a6 = 1
	CPP:add_array_item("Fill Island Storages", {"Gold", "Cocaine", "Weed", "Cash"}, function() return a6 end, 
		function(CPfes) if CPfes == 1 then stats.set_int(MPX .. "H4LOOT_GOLD_I", -1) stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", -1) 
		elseif CPfes == 2 then stats.set_int(MPX .. "H4LOOT_COKE_I", -1) stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", -1) 
		elseif CPfes == 3 then stats.set_int(MPX .. "H4LOOT_WEED_I", -1) stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", -1) 
		elseif CPfes == 4 then stats.set_int(MPX .. "H4LOOT_CASH_I", -1) stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", -1) end 
		a6 = CPfes end)
	
			a1 = 1
	CPP:add_array_item("Difficulty", {"Normal", "Hard"}, function() return a1 end, 
		function(CPd) if CPd == 1 then stats.set_int(MPX .. "H4_PROGRESS", 126823) 
		elseif CPd == 2 then stats.set_int(MPX .. "H4_PROGRESS", 131055) end 
		a1 = CPd end)
		
			a2 = 1
	CPP:add_array_item("Approach", {"Kosatka", "Alkonost", "Velum", "Stealth Annihilator", "Patrol Boat", "Longfin", "All Ways"}, function() return a2 end, 
		function(CPa) if CPa == 1 then stats.set_int(MPX .. "H4_MISSIONS", 65283) 
		elseif CPa == 2 then stats.set_int(MPX .. "H4_MISSIONS", 65413) 
		elseif CPa == 3 then stats.set_int(MPX .. "H4_MISSIONS", 65289) 
		elseif CPa == 4 then stats.set_int(MPX .. "H4_MISSIONS", 65425) 
		elseif CPa == 5 then stats.set_int(MPX .. "H4_MISSIONS", 65313) 
		elseif CPa == 6 then stats.set_int(MPX .. "H4_MISSIONS", 65345)
		elseif CPa == 7 then stats.set_int(MPX .. "H4_MISSIONS", 65535) end 
		a2 = CPa end)	
		
			a3 = 1
	CPP:add_array_item("Weapons", {"Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"}, function() return a3 end, 
		function(CPw) if CPw == 1 then stats.set_int(MPX .. "H4CNF_WEAPONS", 1) 
		elseif CPw == 2 then stats.set_int(MPX .. "H4CNF_WEAPONS", 2) 
		elseif CPw == 3 then stats.set_int(MPX .. "H4CNF_WEAPONS", 3) 
		elseif CPw == 4 then stats.set_int(MPX .. "H4CNF_WEAPONS", 4) 
		elseif CPw == 5 then stats.set_int(MPX .. "H4CNF_WEAPONS", 5) end 
		a3 = CPw end)
		
	CPP:add_action("Complete Preps", function() stats.set_int(MPX .. "H4CNF_UNIFORM", -1) 
												stats.set_int(MPX .. "H4CNF_GRAPPEL", -1) 
												stats.set_int(MPX .. "H4CNF_TROJAN", 5) 
												stats.set_int(MPX .. "H4CNF_WEP_DISRP", 3) 
												stats.set_int(MPX .. "H4CNF_ARM_DISRP", 3) 
												stats.set_int(MPX .. "H4CNF_HEL_DISRP", 3) end)
	
	CPP:add_action("Reset Preps", function() if HIP:is_active() then HIP:set_int(1526, 2) end end) 
	
	CPC = CayoPerico:add_submenu("Cuts") 
	
			a7 = 1
	CPC:add_array_item("Presets", {"85 All", "100 All"}, function() return a7 end, 
		function(CPp) if CPp == 1 then for i = 1978495 + 825 + 56 + 1, 1978495 + 825 + 56 + 4 do globals.set_int(i, 85) end 
		elseif CPp == 2 then for i = 1978495 + 825 + 56 + 1, 1978495 + 825 + 56 + 4 do globals.set_int(i, 100) end end 
		a7 = CPp end)
		
	CPC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 1) end, function(CPc) globals.set_int(1978495 + 825 + 56 + 1, CPc) end) 
	CPC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 2) end, function(CPc) globals.set_int(1978495 + 825 + 56 + 2, CPc) end) 
	CPC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 3) end, function(CPc) globals.set_int(1978495 + 825 + 56 + 3, CPc) end) 
	CPC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 4) end, function(CPc) globals.set_int(1978495 + 825 + 56 + 4, CPc) end) 					   
	
	CPE = CayoPerico:add_submenu("Extra")
	
	CPECL = CPE:add_submenu("Cooldown Killer")
	
	CPECL:add_action("Kill Cooldown (for solo)", function() stats.set_int(MPX .. "H4_TARGET_POSIX", 1659643454)
															stats.set_int(MPX .. "H4_COOLDOWN", 0)
															stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0) end)	
																
	CPECL:add_action("Kill Cooldown (with friends)", function() stats.set_int(MPX .. "H4_TARGET_POSIX", 1659429119)
																stats.set_int(MPX .. "H4_COOLDOWN", 0)
																stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0) end)																
			a8 = 1
	CPECL:add_array_item("Session", {"Go Offline", "Go Online"}, function() return a8 end, 
		function(CPses) if CPses == 1 then menu.disconnect_session() sleep(0.01) menu.send_key_press(13)
		elseif CPses == 2 then globals.set_int(1575020, 8) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) end 
		a8 = CPses end)
		
		a13 = false;
	local function Bag(Toggle) if Toggle then globals.set_int(262145 + 29939, 99999) else globals.set_int(262145 + 29939, 1800) end end
	CPE:add_toggle("Woman's Bag", function() return a13 end, function() a13 = not a13; Bag(a13) end)	
		
	CPE:add_action("Bypass Fingerprint Hack", function() if FMC20:is_active() then if FMC20:get_int(23669) == 4 then FMC20:set_int(23669, 5) end end end)
		
	CPE:add_action("Bypass Plasma Cutter Cut", function() if FMC20:is_active() then FMC20:set_float(29685 + 3, 100) end end)
	
	CPE:add_action("Bypass Sewer Tunnel Cut", function() if FMC20:is_active() then if FMC20:get_int(28446) >= 3 or FMC20:get_int(28446) <= 6 then FMC20:set_int(28446, 6) end end end)
		   
	CPE:add_action("Unlock All POI", function() stats.set_int(MPX .. "H4CNF_BS_GEN", -1) 
												stats.set_int(MPX .. "H4CNF_BS_ENTR", 63) 
												stats.set_int(MPX .. "H4CNF_APPROACH", -1) end)
													
	CPTP = CayoPerico:add_submenu("Teleports")
	local function TP(u, v, w, x, y, z) 
		if localplayer~=nil then localplayer:set_position(u, v, w) localplayer:set_rotation(x, y, z) end end; 
	
	CPCo = CPTP:add_submenu("Compound")
	
	CPCo:add_action("Office", function() TP(5005.557617, -5754.321289, 27.545269, -0.000000, 0.000000, 2.586560) end) 
	
	CPCo:add_action("Primary Target", function() TP(5007.763184, -5756.029785, 14.184443, -0.000000, 0.000000, 2.467127) end) 
	
			a9 = 1
	CPCo:add_array_item("Storage", {"Basement", "North", "West", "South"}, function() return a9 end, 
		function(CPs) if CPs == 1 then TP(4999.613281, -5749.913086, 13.540487, -0.000000, 0.000000, 2.613005) 
		elseif CPs == 2 then TP(5080.862305, -5756.300781, 14.529651, -0.000000, 0.000000, -0.575850)
		elseif CPs == 3 then TP(5030.722168, -5736.470703,  16.565588, -0.000000, 0.000000, 2.439484)
		elseif CPs == 4 then TP(5007.434570, -5787.255859, 16.531698, -0.000000, 0.000000, 0.680315) end
		a9 = CPs end)
		
	CPCo:add_action("Main Exit", function() TP(4990.194824, -5716.448730, 18.580215, -0.000000, 0.000000, 0.946360) end)
	
	CPCo:add_action("Water Escape", function() TP(4639.124023, -6010.004883, -7.475036, 1.930023, -0.000000, -0.000000)	end)
	
	CPIsl = CPTP:add_submenu("Island")
	
			a10 = 1
	CPIsl:add_array_item("Airport", {"Loot #1","Loot #2"}, function() return a10 end, 
		function(CPa) if CPa == 1 then TP(4441.150391, -4459.684082,3.028352, -0.000000, 0.000000, 0.308871) 
		elseif CPa == 2 then TP(4503.571777, -4552.908203, 2.871924, 0.000000, 0.000000, 0.100107) end
		a10 = CPa end)
		
			a11 = 1
	CPIsl:add_array_item("Main Dock", {"Loot #1", "Loot #2", "Loot #3", "Loot #4"}, function() return a11 end, 
		function(CPmd) if CPmd == 1 then TP(4923.965820, -5244.269531, 1.223746,-0.000004, 0.000002, -2.954921)
		elseif CPmd == 2 then TP(4998.924316, -5165.349121, 1.464225, 0.000000,0.000000, 2.033015)
		elseif CPmd == 3 then TP(4962.446777, -5107.580078, 1.682065, 0.000000, 0.000000, 2.606050)
		elseif CPmd == 4 then TP(5194.393066, -5134.665039, 2.047954, 0.000000, 0.000000, -1.815477) end
		a11 = CPmd end)
		
			a12 = 1
	CPIsl:add_array_item("North Dock", {"Loot #1", "Loot #2", "Loot #3"}, function() return a12 end, 
		function(CPnd) if CPnd == 1 then TP(5134.185547, -4611.440430, 1.196429, 0.000000, -0.000000, 0.292134)
		elseif CPnd == 2 then TP(5065.229492, -4591.959473, 1.555425, -0.000000, -0.000000, -0.303813)
		elseif CPnd == 3 then TP(5091.613281, -4682.282715, 1.107359, 0.000000, -0.003459, -1.838643) end
		a12 = CPnd end)
		
	CPIsl:add_action("Cord Field Loot", function() TP(5330.717285, -5270.096191, 31.886055, -0.000000, 0.000000, 1.976751) end)
	
	CPSO = CPTP:add_submenu("Scope Out")
	
	CPSO:add_action("Power Station", function() TP(4478.291992, -4580.129883, 4.258523, -2.885009, -0.000000, 0.000000) end) 
	
		a14 = 1
	CPSO:add_array_item("Towers", {"Communications Tower", "Control Tower", "Water Tower #1", "Water Tower #2"}, function() return a14 end,
		function(CPt) if CPt == 1 then TP(5266.797363, -5427.772461, 139.746445, -0.943473, 0.000000, -0.000000)
		elseif CPt == 2 then TP(4350.219238, -4577.410645, 2.899095, -1.119934, -0.000000, 0.000000)
		elseif CPt == 3 then TP(5108.437012, -4580.132812, 28.417776, 1.720010, -0.000000, 0.000000)
		elseif CPt == 4 then TP(4903.939453, -5337.220703, 34.306366, 0.821753, -0.000000, 0.000000) end
		a14 = CPt end)
		
		a15 = 1
	CPSO:add_array_item("Bolt Cutters", {"#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10", "#11", "#12", "#13", "#14", "#15"}, function() return a15 end,
		function(CPbc) if CPbc == 1 then TP(5097.452637, -4620.177734, 1.193875, -2.592525, -0.000000, 0.000000)
		elseif CPbc == 2 then TP(4880.295898, -5112.941406, 1.053022, 1.313561, -0.000346, 0.000020)
		elseif CPbc == 3 then TP(4537.624512, -4542.424805, 3.546365, 1.941974, 0.000004, -0.000007)
		elseif CPbc == 4 then TP(5466.320801, -5230.169922, 25.993027, 2.763307, -0.000000, 0.000000)
		elseif CPbc == 5 then TP(4075.548828, -4663.984863, 2.994547, -2.552265, -0.000000, 0.000000)
		elseif CPbc == 6 then TP(4522.588867, -4509.868652, 3.188455, -2.631163, -0.000000, 0.000000)
		elseif CPbc == 7 then TP(4506.013672, -4656.211914, 10.579565, -0.049160, -0.000000, 0.000000)
		elseif CPbc == 8 then TP(4803.885742, -4317.895020, 6.201560, -0.422076, -0.000000, 0.000000)
		elseif CPbc == 9 then TP(5071.072266, -4639.869629, 2.112077, 0.523910, 0.000000, -0.000000)
		elseif CPbc == 10 then TP(5179.191895, -4669.967285, 5.832691, -2.465155, -0.000000, 0.000000)
		elseif CPbc == 11 then TP(5214.377441, -5126.496582, 4.925748, -1.519287, -0.000000, 0.000000)
		elseif CPbc == 12 then TP(4954.719727, -5180.171875, 2.966018, -2.558609, -0.000000, 0.000000)
		elseif CPbc == 13 then TP(4903.507812, -5345.524414, 8.850177, 2.197429, -0.000000, 0.000000)
		elseif CPbc == 14 then TP(4756.349609, -5539.995605, 17.625168, 2.077786, -0.000000, 0.000000)
		elseif CPbc == 15 then TP(5365.069336, -5438.819824, 47.831707, 0.996262, -0.000000, 0.000000) end
		a15 = CPbc end)
		
		a16 = 1
	CPSO:add_array_item("Cutting Powders", {"#1", "#2", "#3"}, function() return a16 end,
		function(CPcp) if CPcp == 1 then TP(5404.111328, -5171.486328, 30.132875, -0.749873, -0.000000, 0.000000)
		elseif CPcp == 2 then TP(5214.664551, -5131.837402, 4.938407, -1.654735, -0.000000, 0.000000)
		elseif CPcp == 3 then TP(4924.137695, -5271.690918, 4.351841, -2.826915, -0.000000, 0.000000) end
		a16 = CPcp end)
		
		a17 = 1
	CPSO:add_array_item("Grappling Hooks", {"#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10"}, function() return a17 end,
		function(CPgh) if CPgh == 1 then TP(4901.115723, -5332.090820, 27.841076, -0.469437, -0.000000, 0.000000)
		elseif CPgh == 2 then TP(4882.464355, -4487.831543, 8.713233, 1.552495, -0.000000, 0.000000)
		elseif CPgh == 3 then TP(5609.771484, -5653.084473, 8.651618, -2.502223, -0.000000, 0.000000)
		elseif CPgh == 4 then TP(5125.838379, -5095.626953, 0.893209, 2.800476, -0.000000, 0.000000)
		elseif CPgh == 5 then TP(4529.709961, -4700.855957, 3.120182, 2.906318, -0.000000, 0.000000)
		elseif CPgh == 6 then TP(3901.137451, -4690.617676, 2.826484, 2.661214, -0.000000, 0.000000)
		elseif CPgh == 7 then TP(5404.485840, -5170.345215, 30.130934, -1.991591, -0.000000, 0.000000)
		elseif CPgh == 8 then TP(5333.016602, -5264.369629, 31.446018, 1.854885, -0.000000, 0.000000)
		elseif CPgh == 9 then TP(5110.171387, -4579.133301, 28.417776, 0.901852, -0.000000, 0.000000)
		elseif CPgh == 10 then TP(5267.243164, -5429.493164, 139.747177, 2.378908, -0.000000, 0.000000) end
		a17 = CPgh end)
		
		a18 = 1
	CPSO:add_array_item("Guard Clothes", {"#1", "#2", "#3", "#4", "#5", "#6", "#7"}, function() return a18 end,
		function(CPgc) if CPgc == 1 then TP(5059.213867, -4592.870605, 1.595251, -0.291761, -0.000000, 0.000000)
		elseif CPgc == 2 then TP(4949.736328, -5320.138672, 6.776219, 3.108989, -0.000000, 0.000000)
		elseif CPgc == 3 then TP(4884.802734, -5452.898926, 29.437197, -2.087807, -0.000000, 0.000000)
		elseif CPgc == 4 then TP(4764.295898, -4781.471680, 2.501517, -0.586741, -0.000000, 0.000000)
		elseif CPgc == 5 then TP(5170.228516, -4677.545898, 1.122545, -0.371411, -0.000000, 0.000000)
		elseif CPgc == 6 then TP(5161.595215, -4993.595215, 11.394773, -2.397844, -0.000000, 0.000000)
		elseif CPgc == 7 then TP(5128.021484, -5530.752930, 52.743076, 1.605217, -0.000000, 0.000000) end
		a18 = CPgc end)
		
		a19 = 1
	CPSO:add_array_item("Signal Boxes", {"#1", "#2", "#3"}, function() return a19 end,
		function(CPsb) if CPsb == 1 then TP(5262.136719, -5432.140625, 64.297203, 2.467814, -0.000000, 0.000000)
		elseif CPsb == 2 then TP(5265.863281, -5421.060059, 64.297638, 0.805274, -0.000000, 0.000000)
		elseif CPsb == 3 then TP(5266.750977, -5426.982910, 139.746857, -0.631726, -0.000000, 0.000000) end
		a19 = CPsb end)
		
		a20 = 1
	CPSO:add_array_item("Supply Trucks", {"#1", "#2", "#3", "#4"}, function() return a20 end,
		function(CPst) if CPst == 1 then TP(4517.433105, -4531.979492, 2.820656, -1.275829, -0.000000, 0.000000)
		elseif CPst == 2 then TP(5148.460938, -4620.099121, 1.108461, -1.422905, -0.000000, 0.000000)
		elseif CPst == 3 then TP(4901.324219, -5216.216797, 2.768269, -2.631163, -0.000000, 0.000000)
		elseif CPst == 4 then TP(5152.886719, -5143.897949, 0.997772, -0.205993, -0.000000, 0.000000)
		end a20 = CPst end)
		
	CayoPerico:add_action("Instant Finish (Solo Only)", function() FMC20:set_int(45450, 9) FMC20:set_int(46829, 50) end)	

--Сasino--
	
	DiamondCasino = SilentNight:add_submenu("♣ Diamond Casino")
	
	DCP = DiamondCasino:add_submenu("Preps")
	
			b6 = 1
	DCP:add_array_item("Target", {"Cash", "Arts", "Gold", "Diamonds"}, function() return b6 end, 
		function(DCt) if DCt == 1 then stats.set_int(MPX .. "H3OPT_TARGET", 0) 
		elseif DCt == 2 then stats.set_int(MPX .. "H3OPT_TARGET", 2) 
		elseif DCt == 3 then stats.set_int(MPX .. "H3OPT_TARGET", 1) 
		elseif DCt == 4 then stats.set_int(MPX .. "H3OPT_TARGET", 3) end 
		b6 = DCt end)
	
			b1 = 1
	DCP:add_array_item("Approach", {"Silent n Sneaky (Normal)", "Big Con (Normal)", "Aggressive (Normal)", "Silent n Sneaky (Hard)", "Big Con (Hard)", "Aggressive (Hard)"}, function() return b1 end, 
		function(DCa) if DCa == 1 then stats.set_int(MPX .. "H3_LAST_APPROACH", 3) stats.set_int(MPX .. "H3_HARD_APPROACH", 2) stats.set_int(MPX .. "H3_APPROACH", 1) stats.set_int(MPX .. "H3OPT_APPROACH", 1)
		elseif DCa == 2 then stats.set_int(MPX .. "H3_LAST_APPROACH", 3) stats.set_int(MPX .. "H3_HARD_APPROACH", 1) stats.set_int(MPX .. "H3_APPROACH", 2) stats.set_int(MPX .. "H3OPT_APPROACH", 2)
		elseif DCa == 3 then stats.set_int(MPX .. "H3_LAST_APPROACH", 1) stats.set_int(MPX .. "H3_HARD_APPROACH", 2) stats.set_int(MPX .. "H3_APPROACH", 3) stats.set_int(MPX .. "H3OPT_APPROACH", 3)
		elseif DCa == 4 then stats.set_int(MPX .. "H3_LAST_APPROACH", 2) stats.set_int(MPX .. "H3_HARD_APPROACH", 1) stats.set_int(MPX .. "H3_APPROACH", 3) stats.set_int(MPX .. "H3OPT_APPROACH", 1)
		elseif DCa == 5 then stats.set_int(MPX .. "H3_LAST_APPROACH", 1) stats.set_int(MPX .. "H3_HARD_APPROACH", 2) stats.set_int(MPX .. "H3_APPROACH", 3) stats.set_int(MPX .. "H3OPT_APPROACH", 2)
		elseif DCa == 6 then stats.set_int(MPX .. "H3_LAST_APPROACH", 2) stats.set_int(MPX .. "H3_HARD_APPROACH", 3) stats.set_int(MPX .. "H3_APPROACH", 1) stats.set_int(MPX .. "H3OPT_APPROACH", 3) end 
		b1 = DCa end)
		
			b2 = 1
	DCP:add_array_item("Gunman", {"Karl Abolaji (5%)", "Gustavo Mota (9%)", "Charlie Reed (7%)", "Chester McCoy (10%)", "Patrick McReary (8%)"}, function() return b2 end, 
		function(DCg) if DCg == 1 then stats.set_int(MPX .. "H3OPT_CREWWEAP", 1) 
		elseif DCg == 2 then stats.set_int(MPX .. "H3OPT_CREWWEAP", 2) 
		elseif DCg == 3 then stats.set_int(MPX .. "H3OPT_CREWWEAP", 3) 
		elseif DCg == 4 then stats.set_int(MPX .. "H3OPT_CREWWEAP", 4) 
		elseif DCg == 5 then stats.set_int(MPX .. "H3OPT_CREWWEAP", 5) end 
		b2 = DCg end)
		
			b3 = 1
	DCP:add_array_item("Driver", {"Karim Deniz (5%)", "Taliana Martinez (7%)", "Eddie Toh (9%)", "Zach Nelson (6%)", "Chester McCoy (10%)"}, function() return b3 end, 
		function(DCd) if DCd == 1 then stats.set_int(MPX .. "H3OPT_CREWDRIVER", 1) 
		elseif DCd == 2 then stats.set_int(MPX .. "H3OPT_CREWDRIVER", 2) 
		elseif DCd == 3 then stats.set_int(MPX .. "H3OPT_CREWDRIVER", 3) 
		elseif DCd == 4 then stats.set_int(MPX .. "H3OPT_CREWDRIVER", 4) 
		elseif DCd == 5 then stats.set_int(MPX .. "H3OPT_CREWDRIVER", 5) end 
		b3 = DCd end)
	
			b4 = 1
	DCP:add_array_item("Hacker", {"Rickie Lukens (3%)", "Christian Feltz (7%)", "Yohan Blair (5%)", "Avi Schwartzman (10%)", "Page Harris (9%)"}, function() return b4 end, 
		function(DCh) if DCh == 1 then stats.set_int(MPX .. "H3OPT_CREWHACKER", 1) 
		elseif DCh == 2 then stats.set_int(MPX .. "H3OPT_CREWHACKER", 2) 
		elseif DCh == 3 then stats.set_int(MPX .. "H3OPT_CREWHACKER", 3) 
		elseif DCh == 4 then stats.set_int(MPX .. "H3OPT_CREWHACKER", 5) 
		elseif DCh == 5 then stats.set_int(MPX .. "H3OPT_CREWHACKER", 4) end 
		b4 = DCh end)
	
			b5 = 1
	DCP:add_array_item("Masks", {"Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Guerilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set" }, function() return b5 end, 
		function(DCm) if DCm == 1 then stats.set_int(MPX .. "H3OPT_MASKS", 1) 
		elseif DCm == 2 then stats.set_int(MPX .. "H3OPT_MASKS", 2) 
		elseif DCm == 3 then stats.set_int(MPX .. "H3OPT_MASKS", 3) 
		elseif DCm == 4 then stats.set_int(MPX .. "H3OPT_MASKS", 4) 
		elseif DCm == 5 then stats.set_int(MPX .. "H3OPT_MASKS", 5) 
		elseif DCm == 6 then stats.set_int(MPX .. "H3OPT_MASKS", 6) 
		elseif DCm == 7 then stats.set_int(MPX .. "H3OPT_MASKS", 7) 
		elseif DCm == 8 then stats.set_int(MPX .. "H3OPT_MASKS", 8) 
		elseif DCm == 9 then stats.set_int(MPX .. "H3OPT_MASKS", 9) 
		elseif DCm == 10 then stats.set_int(MPX .. "H3OPT_MASKS", 10)
		elseif DCm == 11 then stats.set_int(MPX .. "H3OPT_MASKS", 11) 
		elseif DCm == 12 then stats.set_int(MPX .. "H3OPT_MASKS", 12) end
		b5 = DCm end)	
	
	DCP:add_action("Complete Preps", function() stats.set_int(MPX .. "H3OPT_DISRUPTSHIP", 3) 
												stats.set_int(MPX .. "H3OPT_KEYLEVELS", 2) 
												stats.set_int(MPX .. "H3OPT_VEHS", 3) 
												stats.set_int(MPX .. "H3OPT_WEAPS", 0) 
												stats.set_int(MPX .. "H3OPT_BITSET0", -1) 
												stats.set_int(MPX .. "H3OPT_BITSET1", -1) 
												stats.set_int(MPX .. "H3OPT_COMPLETEDPOSIX", -1) end)
	
	DCP:add_action("Reset Preps", function() stats.set_int(MPX .. "H3OPT_BITSET1", 0) 
											 stats.set_int(MPX .. "H3OPT_BITSET0", 0) end)
	
	DCC = DiamondCasino:add_submenu("Cuts") 
	
			b6 = 1
	DCC:add_array_item("Presets", {"85 All", "100 All"}, function() return b6 end, 
		function(DCp) if DCp == 1 then for i = 1971696 + 2325 + 1, 1971696 + 2325 + 4 do globals.set_int(i, 85) end 
		elseif DCp == 2 then for i = 1971696 + 2325 + 1, 1971696 + 2325 + 4 do globals.set_int(i, 100) end
		b6 = DCp end end)
		
	DCC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 1) end, function(DCv7) globals.set_int(1971696 + 2325 + 1, DCv7) end) 
	DCC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 2) end, function(DCv7) globals.set_int(1971696 + 2325 + 2, DCv7) end) 
	DCC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 3) end, function(DCv7) globals.set_int(1971696 + 2325 + 3, DCv7) end) 
	DCC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 4) end, function(DCv7) globals.set_int(1971696 + 2325 + 4, DCv7) end) 
	
	DCE = DiamondCasino:add_submenu("Extra")
	
	DCECL = DCE:add_submenu("Cooldown Killer")
	
	DCECL:add_action("Kill Cooldown", function() stats.set_int(MPX .. "H3_COMPLETEDPOSIX", -1) 
											     stats.set_int("MPPLY_H3_COOLDOWN", -1) end)		

		b10 = 1
	DCECL:add_array_item("Session", {"Go Offline", "Go Online"}, function() return b10 end, 
		function(CPses) if CPses == 1 then menu.disconnect_session() sleep(0.01) menu.send_key_press(13)
		elseif CPses == 2 then globals.set_int(1575020, 8) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) end 
		b10 = CPses end)
	
	DCE:add_action("Bypass Fingerprint Hack (Outdated)", function() if FMC and FMC:is_active() then if FMC:get_int(52929) == 4 then FMC:set_int(52929, 5) end end end)
		
	DCE:add_action("Bypass Keypad Hack (Outdated)", function() if FMC and FMC:is_active() then if FMC:get_int(53991) == 4 then FMC:set_int(53991, 5) end end end)
		
	DCE:add_action("Bypass Drill Vault Door (Outdated)", function() if FMC:is_active() then FMC:set_int(10082 + 7, 4) FMC:set_int(10082 + 7, 6) end end)
	
	DCE:add_action("Unlock All POI", function() stats.set_int(MPX .. "H3OPT_POI", -1) 
												stats.set_int(MPX .. "H3OPT_ACCESSPOINTS", -1) end)
	
	DCE:add_action("Unlock Cancellation", function() stats.set_int(MPX .. "CAS_HEIST_NOTS", -1) 
													 stats.set_int(MPX .. "CAS_HEIST_FLOW", -1) end)
												   
	DCTP = DiamondCasino:add_submenu("Teleports")		
	
			b7 = 1
	DCTP:add_array_item("Staff Room", {"Outside", "Inside"}, function() return b7 end, 
		function(DCsr) if DCsr == 1 then TP(960.168335, -14.924523, 78.754761, 0.014492, 0.115226, -0.685550) 
		elseif DCsr == 2 then TP(2549.139893, -267.529999, -60.022987, 0.000000, 0.000000, 0.000000) end
		b7 = DCsr end)
		
			b8 = 1
	DCTP:add_array_item("Vaults", {"Outside Main", "Inside Main", "Daily"}, function() return b8 end, 
		function(DCv) if DCv == 3 then TP(2521.761719, -287.359192, -60.022976, 0.000000, 0.000000, 0.000000)
		elseif DCv == 1 then TP(2500.535889, -239.953308, -72.037086, 0.000000, 0.000000, 0.000000)
		elseif DCv == 2 then TP(2515.317139, -238.673294, -72.037102, 0.000000, 0.000000, 0.000000) end 
		DCTP = DCv end) 
		
			b9 = 1
	DCTP:add_array_item("Mini-Vaults", {"#1", "#2", "#3", "#4", "#5", "#6"}, function() return b9 end, 
		function(DCmv) if DCmv == 1 then TP(2510.261475, -224.366699, -72.037163, 0.000000, 0.000000, 0.000000) 
		elseif DCmv == 2 then TP(2533.521729, -225.209366, -72.037163, 0.000000, 0.000000, 0.000000)
		elseif DCmv == 3 then TP(2537.823486, -237.452118, -72.037163, 0.000000, 0.000000, 0.000000)
		elseif DCmv == 4 then TP(2534.049561, -248.194931, -72.037163, 0.000000, 0.000000, 0.000000)
		elseif DCmv == 5 then TP(2520.342773, -255.425705, -72.037178, 0.000000, 0.000000, 0.000000)
		elseif DCmv == 6 then TP(2509.844238, -250.968552, -72.037170, 0.000000, 0.000000, 0.000000) end
		b9 = DCmv end)
												 
--Doomsday--
	
	Doomsday = SilentNight:add_submenu("♦ Doomsday") 
	
	DP = Doomsday:add_submenu("Preps")
	
			c1 = 1
	DP:add_array_item("Doomsday Act", {"Data Breaches", "Bogdan Problem", "Doomsday Scenario"}, function() return c1 end, 
		function(Da) if Da == 1 then stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 503) stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229383) stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557) 
		elseif Da == 2 then stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240) stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229378) stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557) 
		elseif Da == 3 then stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 16368) stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229380) stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)  end 
		c1 = Da end)
			
	DP:add_action("Complete Preps", function() stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1) end) 
	
	DP:add_action("Reset Preps", function() stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240) 
											stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0) 
											stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557) end) 
													 
	DC = Doomsday:add_submenu("Cuts") 
	
			c2 = 1
	DC:add_array_item("Presets", {"85 All", "100 All"}, function() return c2 end,
		function(Dp) if Dp == 1 then for i = 1967630 + 812 + 50 + 1, 1967630 + 812 + 50 + 4 do globals.set_int(i, 85) end
		elseif Dp == 2 then for i = 1967630 + 812 + 50 + 1, 1967630 + 812 + 50 + 4 do globals.set_int(i, 100) end end
		c2 = Dp end)
		
    DC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 1) end, function(Dc) globals.set_int(1967630 + 812 + 50 + 1, Dc) end) 
	DC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 2) end, function(Dc) globals.set_int(1967630 + 812 + 50 + 2, Dc) end) 
	DC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 3) end, function(Dc) globals.set_int(1967630 + 812 + 50 + 3, Dc) end) 
	DC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 4) end, function(Dc) globals.set_int(1967630 + 812 + 50 + 4, Dc) end)
	
	DE = Doomsday:add_submenu("Extra")
	
	DE:add_action("Bypass Data Breaches Hack (Outdated)", function() FMC:set_int(1537, 2) end)
	
	DE:add_action("Bypass Doomsday Scenario Hack (Outdated)", function() FMC:set_int(1398, 3) end)
	
--Credits--

	Credits = SilentNight:add_submenu("♥ Credits")
	
	Credits:add_action("Developer: Silent", function() end)
	Credits:add_action("Discord: silentsalo", function() end)