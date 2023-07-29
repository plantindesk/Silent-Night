--Developer: SilentSalo--

	require_game_build(2944) -- GTA Online v1.67
	SilentNightAddOn = menu.add_submenu("ツ Silent Night Add-On v1.67")
	
--Required Stats--		

			PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
			MPX = PI 
		if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end
			ASS = script("appsecuroserv")
			GCS = script("gb_contraband_sell")
			GCB = script("gb_contraband_buy")
			AMW = script("am_mp_warehouse")
			FormatMoney = function(a) a = tostring(a) return a:reverse():gsub("%d%d%d","%1,"):reverse():gsub("^,","") end
			keyboard = {W = 87, S = 83, A = 65, D = 68, E = 69}
		
--Special Cargo VIP--

	SpecialCargoVIP = SilentNightAddOn:add_submenu("Special Cargo VIP")
	
--AFK Mode--

	AFK = SpecialCargoVIP:add_submenu("AFK Mode")

			d1 = 1 
			DefDelay1 = 0.5
	AFK:add_array_item("Delays", {"Default", "Fast", "Medium", "Slow"}, function() return d1 end, 
		function(DelayType1) if DelayType1 == 1 then DefDelay1 = 0.5 
		elseif DelayType1 == 2 then DefDelay1 = 1 
		elseif DelayType1 == 3 then DefDelay1 = 2 
		elseif DelayType1 == 4 then DefDelay1 = 3 end
		d1 = DelayType1 end)
	
			d2 = 1
			DefWarehouse = 1 
	AFK:add_array_item("Warehouse Type", {"None", "Small (16)", "Medium (42)", "Large (111)"}, function() return d2 end,
		function(WarehouseType) if WarehouseType == 1 then DefWarehouse = 0 
		elseif WarehouseType == 2 then DefWarehouse = 1 
		elseif WarehouseType == 3 then DefWarehouse  = 2 
		elseif WarehouseType == 4 then DefWarehouse  = 3 end
		d2 = WarehouseType end)
		
			--d3 = 1
			DefCash = 6000000	
	--AFK:add_array_item("Required Cash", {"Default", "48mil", "96mil", "246mil", "498mil", "996mil"}, function() return d3 end,
		--function(RequiredCash) if RequiredCash == 1 then DefCash = 10000 
		--elseif RequiredCash == 2 then DefCash = 48000000 
		--elseif RequiredCash == 3 then DefCash = 98000000 
		--elseif RequiredCash == 4 then DefCash = 246000000 
		--elseif RequiredCash == 5 then DefCash = 498000000 
		--elseif RequiredCash == 6 then DefCash = 996000000 end 
		--LoopStop = 0
		--d3 = RequiredCash end)
		
			d11 = 0
	AFK:add_int_range("Required Cash", 6000000, 0, 996000000, function() return d11 end,
		function(ReqCash) DefCash = ReqCash
						  d11 = ReqCash end)
		
			InfMode = true
	AFK:add_toggle("Infinity $$$", function() return InfMode end, function() InfMode = not InfMode end)
			
			d4 = false
			LoopStop = 0
		local function AFKMode()
		GetTotalCash = stats.get_int("MPPLY_TOTAL_EVC")
		SaveTotalCash = GetTotalCash 
		ReqTotalCash = SaveTotalCash + DefCash
		if d4 == false then LoopStop = 1 return end
			if DefWarehouse == 1 then while LoopStop == 0 do 
				if AMW:is_active() then globals.set_int(278108, 6000000)
										globals.set_int(277873, 0)
										globals.set_int(277874, 0)
				if AMW:is_active() then menu.send_key_down(keyboard.D) 
										sleep(1.8) 
										menu.send_key_up(keyboard.D) 
										menu.send_key_press(keyboard.E) 
				if ASS:is_active() then ASS:set_int(737, 1) 
										sleep(0.2) 
										ASS:set_int(738, 1) 
										sleep(0.2) 
										ASS:set_int(556, 3012) end
				globals.set_int(4536677, 0)
				globals.set_int(4536678, 0)
				globals.set_int(4536679, 0)
				if GCS:is_active() then 
					if NoRP == false then globals.set_float(262146, 1)
					else globals.set_float(262146, 0) end
					GCS:set_int(1136, 1)
					GCS:set_int(596, 0)
					GCS:set_int(1125, 0)
					GCS:set_int(548, 7)
					sleep(DefDelay1)
					GCS:set_int(542, 99999)
				if NoCrateBack == false then for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end
				sleep(2)
				if not AMW:is_active() then GCS:set_int(542, 99999)
										menu.send_key_down(keyboard.S)
										sleep(1.5)
										menu.send_key_up(keyboard.S)
				if InfMode == false then 
				if stats.get_int("MPPLY_TOTAL_EVC") >= ReqTotalCash then LoopStop = 1 d4 = false 
				else LoopStop = 0 end end end end end end end 
				LoopStop = 0 end
			if DefWarehouse == 2 then while LoopStop == 0 do 
				if AMW:is_active() then globals.set_int(278108, 6000000)
										globals.set_int(277873, 0)
										globals.set_int(277874, 0)
				if AMW:is_active() then menu.send_key_down(keyboard.D)
										sleep(1.6)
										menu.send_key_down(keyboard.W)
										sleep(0.8)
										menu.send_key_up(keyboard.D)
										menu.send_key_up(keyboard.W)
										menu.send_key_press(keyboard.E)
				if ASS:is_active() then ASS:set_int(737, 1)
										sleep(0.2)
										ASS:set_int(738, 1)
										sleep(0.2)
										ASS:set_int(556, 3012) end
				globals.set_int(4536677, 0)
				globals.set_int(4536678, 0)
				globals.set_int(4536679, 0)
				if GCS:is_active() then 
					if NoRP == false then globals.set_float(262146, 1)
					else globals.set_float(262146, 0) end
					GCS:set_int(1136, 1)
					GCS:set_int(596, 0)
					GCS:set_int(1125, 0)
					GCS:set_int(548, 7)
					sleep(DefDelay1)
					GCS:set_int(542, 99999)
				if NoCrateBack == false then for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end
				sleep(2)
				if not AMW:is_active() then GCS:set_int(542, 99999)
											menu.send_key_down(keyboard.S)
											sleep(1.5)
											menu.send_key_up(keyboard.S)
				if InfMode == false then if stats.get_int("MPPLY_TOTAL_EVC") >= ReqTotalCash then LoopStop = 1 d4 = false 
				else LoopStop = 0 end end end end end end end 
				LoopStop = 0 end
			if DefWarehouse == 3 then while LoopStop == 0 do 
				if AMW:is_active() then globals.set_int(278108, 6000000)
										globals.set_int(277873, 0)
										globals.set_int(277874, 0)
				if AMW:is_active() then menu.send_key_down(keyboard.W)
										menu.send_key_down(keyboard.A)
										sleep(0.8)
										menu.send_key_up(keyboard.W)
										menu.send_key_up(keyboard.A)
										menu.send_key_press(keyboard.E)
				if ASS:is_active() then ASS:set_int(737, 1)
										sleep(0.2)
										ASS:set_int(738, 1)
										sleep(0.2)
										ASS:set_int(556, 3012) end 
				globals.set_int(4536677, 0)
				globals.set_int(4536678, 0)
				globals.set_int(4536679, 0)
				if GCS:is_active() then 
					if NoRP == false then globals.set_float(262146, 1)
					else globals.set_float(262146, 0) end
					GCS:set_int(1136, 1)
					GCS:set_int(596, 0)
					GCS:set_int(1125, 0)
					GCS:set_int(548, 7)
					sleep(DefDelay1)
					GCS:set_int(542, 99999)
				if NoCrateBack == false then for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end
				sleep(2)
				if not AMW:is_active() then GCS:set_int(542, 99999)
											menu.send_key_down(keyboard.S)
											sleep(1.5)
											menu.send_key_up(keyboard.S)
				if InfMode == false then if stats.get_int("MPPLY_TOTAL_EVC") >= ReqTotalCash then LoopStop = 1 d4 = false 
				else LoopStop = 0 end end end end end end end end
				LoopStop = 0 end 
	AFK:add_toggle("Toggle AFK Mode", function() return d4 end, function() d4 = not d4 AFKMode(d4) end)
					
			CurrentCash = stats.get_int("MPPLY_TOTAL_EVC")
			SaveCash = CurrentCash
			Lol = 0
	AFK:add_bare_item("", function() return "Money Made: $" .. FormatMoney(stats.get_int("MPPLY_TOTAL_EVC") - SaveCash) end, function() end, function() end, function() end)
	
	AFK:add_action("", function() end)
	
	AFKNote = AFK:add_submenu("Read Me")
	
	AFKNote:add_action("                           Delays:", function() end)
	AFKNote:add_action("  Change this if you aren't getting money", function() end)
	AFKNote:add_action("", function() end)
	AFKNote:add_action("                   Warehouse Type:", function() end)
	AFKNote:add_action("           Select your warehouse type", function() end)
	AFKNote:add_action("", function() end)
	AFKNote:add_action("                     Required Cash:", function() end)
	AFKNote:add_action("     Сhoose amount of money you want", function() end)
	AFKNote:add_action("               to get with AFK mode", function() end)
	AFKNote:add_action("", function() end)
	AFKNote:add_action("                        Infinity $$$:", function() end)
	AFKNote:add_action("           Activates infinite AFK mode;", function() end)
	AFKNote:add_action("  ignores the setting of the option above", function() end)
	AFKNote:add_action("", function() end)
	AFKNote:add_action("                  Toggle AFK Mode:", function()end)
	AFKNote:add_action("     Activate when your character enters", function() end)
	AFKNote:add_action("  and completely stops in the warehouse;", function() end)
	AFKNote:add_action("          don't move the camera before", function() end)
	AFKNote:add_action("               and during activation", function() end)
	AFKNote:add_action("", function() end)
	AFKNote:add_action("                       Money Made:", function() end)
	AFKNote:add_action("     Reselect the option to see the result", function() end)
	AFKNote:add_action("", function() end)

	EasterEgg = AFKNote:add_submenu("Easter Egg")
	EasterEgg:add_action("Woah, you found me! Take this prize then:", function() end)
	EasterEgg:add_action("                   Receive The Prize", function() globals.set_int(1966104,1) sleep(10) menu.suicide_player() end)

--General Settings--

	GenSet = SpecialCargoVIP:add_submenu("General Settings")
	
	GenSet:add_action("Start Solo Session", function() globals.set_int(1575020, 8) globals.set_int(1574589, 1) sleep(1) globals.set_int(1574589, 0) end)

			NoRP = true
	GenSet:add_toggle("Disable RP Gain", function() return NoRP end, function() NoRP = not NoRP end)

			NoCrateBack = false 
	GenSet:add_toggle("Disable CrateBack", function() return NoCrateBack end, function() NoCrateBack = not NoCrateBack end)

	GC = GenSet:add_submenu("Get Crates")
	
	GC:add_action("1-3 per Press", function() for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end)

			d5 = false 
		local function GetCrates() while d5 == true do for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end end
	GC:add_toggle("Crates Loop", function() return d5 end, function() d5 = not d5 GetCrates(d5) end)

			d6 = 1
	GC:add_int_range("Instant Buy", 1, 1, 111, function() return d6 end, 
		function(NumOfCrates) if GCB:is_active() then GCB:set_int(604, 1)
								 GCB:set_int(600, NumOfCrates)
								 GCB:set_int(790, 6)
								 GCB:set_int(791, 4)
								 d6 = NumOfCrates end end)
	
	GC:add_action("", function() end)

	GCNote = GC:add_submenu("Read Me")
	
	GCNote:add_action("                       Crates Loop:", function() end)
	GCNote:add_action("                	 To turn off the loop,", function() end)
	GCNote:add_action("     close the menu via «Menu Settings»", function() end)
	GCNote:add_action("", function() end)
	GCNote:add_action("                       Instant Buy:", function() end)
	GCNote:add_action("       Start the buy mission first, select", function() end)
	GCNote:add_action("      the number of crates and activate", function() end)
	
	GenSet:add_action("Legal Stats", function() stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", 999)
												stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 999)
												stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", 999)
												stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", 999)
												stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", 19990000)
												sleep(2)
												globals.set_int(1575020, 8)
												globals.set_int(1574589, 1)
												sleep(1)
												globals.set_int(1574589, 0) end)
	GenSet:add_action("Clean Office", function() stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", 1)
												 stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 1)
												 stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", 1)
												 stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", 1)
												 stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", 1)
												 sleep(2)
												 globals.set_int(1575020, 8) 
												 globals.set_int(1574589, 1)
												 sleep(1)
												 globals.set_int(1574589, 0) end)
	
	GenSet:add_action("", function() end)

	GenSetNote = GenSet:add_submenu("Read Me")

	GenSetNote:add_action("                   Start Solo Session:", function() end)
	GenSetNote:add_action("       Use if you aren't alone in session", function() end)
	GenSetNote:add_action("", function() end)
	GenSetNote:add_action("                    Disable RP Gain:", function() end)
	GenSetNote:add_action("           Disables earning experience", function() end)
	GenSetNote:add_action("", function() end)
	GenSetNote:add_action("                   Disable CrateBack:", function() end)
	GenSetNote:add_action(" Disables the return of crates after its sale", function() end)
	GenSetNote:add_action("", function() end)
	GenSetNote:add_action("                        Legal Stats:", function() end)
	GenSetNote:add_action("   Changes your sales and earnings stats;", function() end)
	GenSetNote:add_action("         to save the legal statistics, you", function() end)
	GenSetNote:add_action("  need to make one more sale for $10,000", function() end)
	GenSetNote:add_action("", function() end)
	GenSetNote:add_action("                       Clean Office:", function() end)
	GenSetNote:add_action("       Removes money from your office;", function() end)
	GenSetNote:add_action("   to save the result, make one more sale", function() end)

--Manual Mode--

	Manual = SpecialCargoVIP:add_submenu("Manual Mode")
		
			d7 = 1 
			DefDelay2 = 0.5
	Manual:add_array_item("Delays", {"Default", "Fast", "Medium", "Slow"}, function() return d7 end,
		function(DelayType) if DelayType == 1 then DefDelay2 = 0.5
		elseif DelayType == 2 then DefDelay2 = 1 
		elseif DelayType == 3 then DefDelay2 = 2
		elseif DelayType == 4 then DefDelay2 = 3 end
		d7 = DelayType end)
	
			d8 = false
		local function CooldownKiller()
		if not localplayer then return end
		if d8 then globals.set_int(277873, 0) globals.set_int(277874, 0)
		else globals.set_int(277873, 300000)
			 globals.set_int(277874, 1800000) end end
	Manual:add_toggle("Cooldown Killer", function() return d8 end, function() d8 = not d8 CooldownKiller(d8) end)

			PresetNames = {"Min", "Half", "Max", "Max Legal"}
			PresetValues = {10000, 3000000, 6000000, 3330000}
			d9 = 1 
	Manual:add_array_item("Set Price", PresetNames, function() return d9 end,
		function(Price) if PresetNames[Price] == "Min" then for i = 0, 4 do 
				if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 10000) end end end 
			elseif PresetNames[Price] == "Half" then for i = 0, 4 do 
				if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 3000000) end end end 
			elseif PresetNames[Price] == "Max" then for i = 0, 4 do 
				if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 6000000) end end end 
			elseif PresetNames[Price] == "Max Legal" then for i = 0, 4 do 
				if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 3330000) end end end end
			d9 = Price end)
			
	--Manual:add_array_item("Set Price", PresetNames, function() return d9 end,
		--function(Price) if PresetNames[Price] == "Min" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") == 0 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 5000) end end end 
			--elseif PresetNames[Price] == "Min" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") >= 1 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 10000) end end end 
			--elseif PresetNames[Price] == "Half" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") == 0 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 1500000) end end end 
			--elseif PresetNames[Price] == "Half" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") >= 1 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 3000000) end end end 
			--elseif PresetNames[Price] == "Max" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") == 0 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 3000000) end end end 
			--elseif PresetNames[Price] == "Max" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") >= 1 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 6000000) end end end 
			--elseif PresetNames[Price] == "Max Legal" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") == 0 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 1665000) end end end 
			--elseif PresetNames[Price] == "Max Legal" and stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") >= 1 then for i = 0, 4 do 
				--if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1) do globals.set_int(278108, 3330000) end end end end 
			--d9 = Price end)

	Manual:add_bare_item("", function() return "Price per Crate: $" .. FormatMoney(PresetValues[d9]) end, function() return "Price per Crate: $" .. FormatMoney(PresetValues[d9]) end, function() end, function() end)

	Manual:add_action("Instant Sell", function() if NoRP == false then globals.set_float(262146, 1) else globals.set_float(262146, 0) end 
		if NoCrateBack == false then if GCS:is_active() then for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end
	    GCS:set_int(548, 7)
	    sleep(DefDelay2)
	    GCS:set_int(542, 99999) end 
		else if GCS:is_active() then GCS:set_int(548, 7)
									 sleep(DefDelay2)
									 GCS:set_int(542, 99999) end end end)

	Manual:add_action("Bypass Entrance Delay", function() for i = 0, 4 do 
		if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
																   GCS:set_int(542, 99999) end end end)

		local function InsSel()
		if NoRP == false then globals.set_float(262146, 1)
		else globals.set_float(262146, 0) end
		if NoCrateBack == false then 
			if GCS:is_active() then for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end
			GCS:set_int(548, 7)
			sleep(DefDelay2)
			GCS:set_int(542, 99999) end 
		else if GCS:is_active() then GCS:set_int(548, 7)
									 sleep(DefDelay2)
									 GCS:set_int(542, 99999) end end end
		
		local function BypEntDel()
		for i = 0, 4 do if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
																				   sleep(DefDelay2)
																				   GCS:set_int(542, 99999) end end end
		
			d10 = false
		local function xnxxSell(Active)
		if not localplayer then return end
		if Active then instant_sell_hotkey = menu.register_hotkey(88, InsSel)
					   bypass_entrance_delay_hotkey = menu.register_hotkey(78, BypEntDel)
		else menu.remove_hotkey(instant_sell_hotkey)
			 menu.remove_hotkey(bypass_entrance_delay_hotkey) end end
			
	Manual:add_toggle("xnxxSell",function() return d10 end, function() d10 = not d10 xnxxSell(d10) end)

	Manual:add_action("", function() end)

	ManualNote = Manual:add_submenu("Read Me")
	
	ManualNote:add_action("                           Delays:", function() end)
	ManualNote:add_action("  Change this if you aren't getting money", function() end)
	ManualNote:add_action("", function() end)
	ManualNote:add_action("                        Instant Sell:", function() end)
	ManualNote:add_action("        Always choose to sell one crate;", function() end)
	ManualNote:add_action("      Start the sale mission first, activate", function() end)
	ManualNote:add_action("            after leaving the warehouse", function() end) 
	ManualNote:add_action("", function() end)
	ManualNote:add_action("               Bypass Entrance Delay:", function() end)
	ManualNote:add_action("            Skips the delay on entering", function() end)
	ManualNote:add_action("              the warehouse after sale", function() end)
	ManualNote:add_action("", function() end)
	ManualNote:add_action("                          xnxxSell:", function() end)
	ManualNote:add_action("   Pressing «X» will trigger «Instant Sell»;", function() end)
	ManualNote:add_action("  pressing «N» - «Bypass Entrance Delay»", function() end)