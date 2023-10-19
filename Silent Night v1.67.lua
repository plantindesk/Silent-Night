--Developer: Silent--

--Required Game Version--

	require_game_build(3028) -- GTA Online v1.67 (build 3028)

	SilentNight = menu.add_submenu("ツ Silent Night")

--Required Stats--

			PI = stats.get_int("MPPLY_LAST_MP_CHAR")
			MPX = "MP0_"
		if PI == 0 then
			MPX = "MP0_"
		else
			MPX = "MP1_"
		end
			ASS = script("appsecuroserv")
			GCS = script("gb_contraband_sell")
			GCB = script("gb_contraband_buy")
			AMW = script("am_mp_warehouse")
			GB = script("gb_gunrunning")
			FMC = script("fm_mission_controller")
			FMC20 = script("fm_mission_controller_2020")
			HIP = script("heist_island_planning")
			AMN = script("am_mp_nightclub")
			FMG = 262145 -- basic global

--Required Functions--

		FormatMoney =
			function(n)
				n = tostring(n)
				return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
			end

		local function TP(x, y, z, yaw, roll, pitch)
			if not localplayer then
				return
			end
			if localplayer ~= nil then
				localplayer:set_position(x, y, z)
				localplayer:set_rotation(yaw, roll, pitch)
			end
		end

		local function null()
		end

---Heist Tool---

	HeistTool = SilentNight:add_submenu("♠ Heist Tool")

--Agency--

	Agency = HeistTool:add_submenu("Agency (Safe)")

			a1 = 1
	Agency:add_array_item("VIP Contract", {"Select", "The Nightclub", "The Marina", "Nightlife Leak", "The Country Club", "Guest List", "High Society Leak", "Davis", "The Ballas",
										   "The South Central Leak", "Studio Time", "Don't Fuck With Dre"},
		function()
			return a1
		end,
		function(VIPCon)
			if VIPCon == 1 then
				a1 = 1
			elseif VIPCon == 2 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 3)
			elseif VIPCon == 3 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 4)
			elseif VIPCon == 4 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 12)
			elseif VIPCon == 5 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 28)
			elseif VIPCon == 6 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 60)
			elseif VIPCon == 7 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 124)
			elseif VIPCon == 8 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 252)
			elseif VIPCon == 9 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 508)
			elseif VIPCon == 10 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 2044)
			elseif VIPCon == 11 then
				stats.set_int(MPX .. "FIXER_STORY_BS", 4095)
			elseif VIPCon == 12 then
				stats.set_int(MPX .. "FIXER_STORY_BS", -1)
				stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
			end
			a1 = VIPCon
		end)

	Agency:add_action("Complete Preps",
		function()
			stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
			stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
		end)

			a2 = false
		local function AgencyMaxPayout(Enabled)
			if not localplayer then
				return
			end
			if Enabled then
				globals.set_int(FMG + 32351, 2500000)
			else
				globals.set_int(FMG + 32351, 1000000)
			end
		end
	Agency:add_toggle("Max Payout (after start)", function() return a2 end, function() a2 = not a2 AgencyMaxPayout(a2) end)

	Agency:add_action("Instant Finish (solo only) [Outdated]",
		function()
			FMC20:set_int(38397, 51338752)
			FMC20:set_int(39772, 50)
		end)

	Agency:add_action("Cooldown Killer", function() globals.set_int(FMG + 32385, 0) end)

	Agency:add_action("", null)

	AgencyNote = Agency:add_submenu("Read Me")

	AgencyNote:add_action("                 After all choices and", null)
	AgencyNote:add_action("            pressing «Complete Preps»", null)
	AgencyNote:add_action("                  just wait some time", null)

--Auto Shop--

	AutoShop = HeistTool:add_submenu("Auto Shop (Safe)")

			a3 = 1
	AutoShop:add_array_item("Auto Shop Mission", {"Select", "Union Depository", "Superdollar Deal", "Bank Contract", "ECU Job", "Prison Contract", "Agency Deal", "Lost Contract", "Data Contract"},
		function()
			return a3
		end,
		function(AutShoMis)
			if AutShoMis == 1 then
				a3 = 1
			elseif AutShoMis == 2 then
				stats.set_int(MPX .. "TUNER_CURRENT", 0)
			elseif AutShoMis == 3 then
				stats.set_int(MPX .. "TUNER_CURRENT", 1)
			elseif AutShoMis == 4 then
				stats.set_int(MPX .. "TUNER_CURRENT", 2)
			elseif AutShoMis == 5 then
				stats.set_int(MPX .. "TUNER_CURRENT", 3)
			elseif AutShoMis == 6 then
				stats.set_int(MPX .. "TUNER_CURRENT", 4)
			elseif AutShoMis == 7 then
				stats.set_int(MPX .. "TUNER_CURRENT", 5)
			elseif AutShoMis == 8 then
				stats.set_int(MPX .. "TUNER_CURRENT", 6)
			elseif AutShoMis == 9 then
				stats.set_int(MPX .. "TUNER_CURRENT", 7)
			end
			a3 = AutShoMis
		end)

	AutoShop:add_action("Complete Preps", function() if stats.get_int(MPX .. "TUNER_CURRENT") == 1 then stats.set_int(MPX .. "TUNER_GEN_BS", 4351) else stats.set_int(MPX .. "TUNER_GEN_BS", 12543) end end)

			a4 = false
		local function AutoShopMaxPayout(Enabled)
			if not localplayer then
			return end
			if Enabled then
				for i = FMG + 31602, FMG + 31610 do globals.set_int(i, 2000000)
				end
			else
				for i = FMG + 31602, FMG + 31610 do globals.set_int(i, 250000)
				end
			end
		end
	AutoShop:add_toggle("Max Payout (after start)", function() return a4 end, function() a4 = not a4 AutoShopMaxPayout(a4) end)

	AutoShop:add_action("Instant Finish (solo only)",
		function()
			FMC20:set_int(45450 + 1, 51338977)
			FMC20:set_int(45450 + 1378 + 1, 101)
		end)

	AutoShop:add_action("Cooldown Killer",
		function()
			for i = 0, 7 do
				stats.set_int(MPX .. "TUNER_CONTRACT" .. i .. "_POSIX", 0)
			end
		end)

	AutoShop:add_action("", null)

	AutoShopNote = AutoShop:add_submenu("Read Me")

	AutoShopNote:add_action("                 After all choices and", null)
	AutoShopNote:add_action("            pressing «Complete Preps»", null)
	AutoShopNote:add_action("       leave autoshop and come back in", null)

--Apartment--

	Apartment = HeistTool:add_submenu("Apartment (Safe)")

	Apartment:add_action("Complete Preps (any heist)", function() stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1) end)

	AC = Apartment:add_submenu("Cuts")

	AC15mil = AC:add_submenu("15mil Payout")

	AC15mil:add_action("Skip Cutscene", function() menu.end_cutscene() end)

			CashReceivers = 1
			a73 = 1
	AC15mil:add_array_item("Cash Receivers", {"All", "Only Crew", "Only Me"},
		function()
			return a73
		end,
		function(WhoRecCas)
			if WhoRecCas == 1 then
				CashReceivers = 1
			elseif WhoRecCas == 2 then
				CashReceivers = 2
			elseif WhoRecCas == 3 then
				CashReceivers = 3
			end
			a73 = WhoRecCas
		end)

			a67 = false
		local function Freeca15mil(Enabled)
			if Enabled then
				if CashReceivers == 1 then
					globals.set_int(1936397 + 1 + 1, 100 - (7453 * 2))
					globals.set_int(1936397 + 1 + 2, 7453)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
					sleep(1)
					globals.set_int(1938365 + 3008 + 1, 7453)
				elseif CashReceivers == 2 then
					globals.set_int(1936397 + 1 + 1, 100 - (7453 * 2))
					globals.set_int(1936397 + 1 + 2, 7453)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
				elseif CashReceivers == 3 then
					globals.set_int(1938365 + 3008 + 1, 7453)
				end
			else
				globals.set_int(1936399, 60)
				globals.set_int(1936400, 40)
				globals.set_int(1938365 + 3008 + 1, 60)
			end
		end
	AC15mil:add_toggle("The Freeca Job (Normal)", function() return a67 end, function() a67 = not a67 Freeca15mil(a67) end)

			a68 = false
		local function PrisonBreak15mil(Enabled)
			if Enabled then
				if CashReceivers == 1 then
					globals.set_int(1936397 + 1 + 1, 100 - (2142 * 4))
					globals.set_int(1936397 + 1 + 2, 2142)
					globals.set_int(1936397 + 1 + 3, 2142)
					globals.set_int(1936397 + 1 + 4, 2142)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
					sleep(1)
					globals.set_int(1938365 + 3008 + 1, 2142)
				elseif CashReceivers == 2 then
					globals.set_int(1936397 + 1 + 1, 100 - (2142 * 4))
					globals.set_int(1936397 + 1 + 2, 2142)
					globals.set_int(1936397 + 1 + 3, 2142)
					globals.set_int(1936397 + 1 + 4, 2142)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
				elseif CashReceivers == 3 then
					globals.set_int(1938365 + 3008 + 1, 2142)
				end
			else
				globals.set_int(1936397 + 1 + 1, 55)
				globals.set_int(1936397 + 1 + 2, 15)
				globals.set_int(1936397 + 1 + 3, 15)
				globals.set_int(1936397 + 1 + 4, 15)
				globals.set_int(1938365 + 3008 + 1, 55)
			end
		end
	AC15mil:add_toggle("The Prison Break (Normal)", function() return a68 end, function() a68 = not a68 PrisonBreak15mil(a68) end)

			a69 = false
		local function HumaneLabs15mil(Enabled)
			if Enabled then
				if CashReceivers == 1 then
					globals.set_int(1936397 + 1 + 1, 100 - (1587 * 4))
					globals.set_int(1936397 + 1 + 2, 1587)
					globals.set_int(1936397 + 1 + 3, 1587)
					globals.set_int(1936397 + 1 + 4, 1587)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
					sleep(1)
					globals.set_int(1938365 + 3008 + 1, 1587)
				elseif CashReceivers == 2 then
					globals.set_int(1936397 + 1 + 1, 100 - (1587 * 4))
					globals.set_int(1936397 + 1 + 2, 1587)
					globals.set_int(1936397 + 1 + 3, 1587)
					globals.set_int(1936397 + 1 + 4, 1587)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
				elseif CashReceivers == 3 then
					globals.set_int(1938365 + 3008 + 1, 1587)
				end
			else
				globals.set_int(1936397 + 1 + 1, 55)
				globals.set_int(1936397 + 1 + 2, 15)
				globals.set_int(1936397 + 1 + 3, 15)
				globals.set_int(1936397 + 1 + 4, 15)
				globals.set_int(1938365 + 3008 + 1, 55)
			end
		end
	AC15mil:add_toggle("The Humane Labs Raid (Normal)", function() return a69 end, function() a69 = not a69 HumaneLabs15mil(a69) end)

			a70 = false
		local function SeriesA15mil(Enabled)
			if Enabled then
				if CashReceivers == 1 then
					globals.set_int(1936397 + 1 + 1, 100 - (2121 * 4))
					globals.set_int(1936397 + 1 + 2, 2121)
					globals.set_int(1936397 + 1 + 3, 2121)
					globals.set_int(1936397 + 1 + 4, 2121)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
					sleep(1)
					globals.set_int(1938365 + 3008 + 1, 2121)
				elseif CashReceivers == 2 then
					globals.set_int(1936397 + 1 + 1, 100 - (2121 * 4))
					globals.set_int(1936397 + 1 + 2, 2121)
					globals.set_int(1936397 + 1 + 3, 2121)
					globals.set_int(1936397 + 1 + 4, 2121)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
				elseif CashReceivers == 3 then
					globals.set_int(1938365 + 3008 + 1, 2121)
				end
			else
				globals.set_int(1936397 + 1 + 1, 55)
				globals.set_int(1936397 + 1 + 2, 15)
				globals.set_int(1936397 + 1 + 3, 15)
				globals.set_int(1936397 + 1 + 4, 15)
				globals.set_int(1938365 + 3008 + 1, 55)
			end
		end
	AC15mil:add_toggle("Series A Funding (Normal)", function() return a70 end, function() a70 = not a70 SeriesA15mil(a70) end)

			a71 = false
		local function PacificStandard15mil(Enabled)
			if Enabled then
				if CashReceivers == 1 then
					globals.set_int(1936397 + 1 + 1, 100 - (1000 * 4))
					globals.set_int(1936397 + 1 + 2, 1000)
					globals.set_int(1936397 + 1 + 3, 1000)
					globals.set_int(1936397 + 1 + 4, 1000)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
					sleep(1)
					globals.set_int(1938365 + 3008 + 1, 1000)
				elseif CashReceivers == 2 then
					globals.set_int(1936397 + 1 + 1, 100 - (1000 * 4))
					globals.set_int(1936397 + 1 + 2, 1000)
					globals.set_int(1936397 + 1 + 3, 1000)
					globals.set_int(1936397 + 1 + 4, 1000)
					sleep(1)
					menu.send_key_press(13)
					sleep(1)
					menu.send_key_press(27)
				elseif CashReceivers == 3 then
					globals.set_int(1938365 + 3008 + 1, 1000)
				end
			else
				globals.set_int(1936397 + 1 + 1, 55)
				globals.set_int(1936397 + 1 + 2, 15)
				globals.set_int(1936397 + 1 + 3, 15)
				globals.set_int(1936397 + 1 + 4, 15)
				globals.set_int(1938365 + 3008 + 1, 55)
			end
		end
	AC15mil:add_toggle("The Pacific Standard Job (Normal)", function() return a71 end, function() a71 = not a71 PacificStandard15mil(a71) end)

	AC15mil:add_action("", null)

	AC15milNote = AC15mil:add_submenu("Read Me")

	AC15milNote:add_action("                     Cash Receivers:", null)
	AC15milNote:add_action("       Choose who'll receive the money", null)
	AC15milNote:add_action("", null)
	AC15milNote:add_action("                          For «All»:", null)
	AC15milNote:add_action("             Activate within 1st 30 secs", null)
	AC15milNote:add_action("   after the cutsene ends (on cuts screen);", null)
	AC15milNote:add_action("   before that select your cut on a board;", null)
	AC15milNote:add_action("     wait till your cut changes to positive", null)
	AC15milNote:add_action("", null)
	AC15milNote:add_action("                    For «Only Crew»:", null)
	AC15milNote:add_action("             Activate within 1st 30 secs", null)
	AC15milNote:add_action("   after the cutsene ends (on cuts screen);", null)
	AC15milNote:add_action("   before that select your cut on a board;", null)
	AC15milNote:add_action("    wait till your cut changes to negative", null)
	AC15milNote:add_action("", null)
	AC15milNote:add_action("                    For «Only Me»:", null)
	AC15milNote:add_action("         Activate option on cuts screen", null)

			a5 = 1
	AC:add_array_item("Presets", {"85 All", "100 All"},
		function()
			return a5
		end,
		function(Pre)
			if Pre == 1 then
				globals.set_int(1936397 + 1 + 1, 100 - (85 * 4))
				globals.set_int(1936397 + 1 + 2, 85)
				globals.set_int(1936397 + 1 + 3, 85)
				globals.set_int(1936397 + 1 + 4, 85)
			elseif Pre == 2 then
				globals.set_int(1936397 + 1 + 1, 100 - (100 * 4))
				globals.set_int(1936397 + 1 + 2, 100)
				globals.set_int(1936397 + 1 + 3, 100)
				globals.set_int(1936397 + 1 + 4, 100)
			end
			a5 = Pre
		end)

	AC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1936397 + 1 + 1) end, function(Cut) globals.set_int(1936397 + 1 + 1, 100 - (Cut * 4)) end)
	AC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1936397 + 1 + 2) end, function(Cut) globals.set_int(1936397 + 1 + 2, Cut) end)
	AC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1936397 + 1 + 3) end, function(Cut) globals.set_int(1936397 + 1 + 3, Cut) end)
	AC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1936397 + 1 + 4) end, function(Cut) globals.set_int(1936397 + 1 + 4, Cut) end)
	AC:add_action("Set Negative to Positive (own)", function() globals.set_int(1938365 + 3008 + 1, -1 * (-100 + globals.get_int(1936397 + 1 + 1)) / 4) end)

	AC:add_action("", null)

	ACNote = AC:add_submenu("Read Me")

	ACNote:add_action("         Choose cuts within 1st 30 secs", null)
	ACNote:add_action("   after the cutsene ends (on cuts screen);", null)
	ACNote:add_action("       after that select your ingame cut,", null)
	ACNote:add_action("      press «Enter» and then press «Esc»", null)
	ACNote:add_action("              to force cuts to change;", null)
	ACNote:add_action("    after this change your cut to positive", null)

	AE = Apartment:add_submenu("Extra")

	AE:add_action("Bypass Fleeca Hack", function() FMC:set_int(11760 + 24, 7) end)

	AE:add_action("Bypass Fleeca Drill", function() FMC:set_float(10061 + 11, 100) end)

	Apartment:add_action("Instant Finish (self only)",
		function()
			FMC:set_int(19710, 12)
			FMC:set_int(28331 + 1, 99999)
			FMC:set_int(31587 + 69, 99999)
		end)

	Apartment:add_action("", null)

	ApartmentNote = Apartment:add_submenu("Read Me")

	ApartmentNote:add_action("           Complete Preps (for fleeca):", null)
	ApartmentNote:add_action("    Pay for the preparation, start the first", null)
	ApartmentNote:add_action("   mission and as soon as you are sent to", null)
	ApartmentNote:add_action("  scout, change the session, come back to", null)
	ApartmentNote:add_action("  planning room, press «Complete Preps»", null)
	ApartmentNote:add_action(" near white board and press «E» and leave", null)
	ApartmentNote:add_action("", null)
	ApartmentNote:add_action("       Complete Preps (for other heists):", null)
	ApartmentNote:add_action("  Start the mission and leave after the 1st", null)
	ApartmentNote:add_action("   cutscene ends, press «Complete Preps»", null)
	ApartmentNote:add_action("         near white board and press «E»", null)

--Cayo Perico--

	CayoPerico = HeistTool:add_submenu("Cayo Perico (Safe)")

	CPDS = CayoPerico:add_submenu("Data Saver")

	CPDS:add_bare_item("",
		function()
			GetPriTar1 = stats.get_int(MPX .. "H4CNF_TARGET")
			CurPriTar1 = ""
			if not CurDif1 == "None" and GetPriTar1 == 0 then
				CurPriTar1 = "Tequila"
			elseif GetPriTar1 == 1 then
				CurPriTar1 = "Necklace"
			elseif GetPriTar1 == 2 then
				CurPriTar1 = "Bonds"
			elseif GetPriTar1 == 3 then
				CurPriTar1 = "Diamond"
			elseif GetPriTar1 == 4 then
				CurPriTar1 = "Statue"
			else
				CurPriTar1 = "None"
			end
			return "Primary Target: " .. CurPriTar1
		end, null, null, null)

	CPDS:add_bare_item("",
		function()
			GetComCash = stats.get_int(MPX .. "H4LOOT_CASH_C")
			GetComWeed = stats.get_int(MPX .. "H4LOOT_WEED_C")
			GetComCoke = stats.get_int(MPX .. "H4LOOT_COKE_C")
			GetComGold = stats.get_int(MPX .. "H4LOOT_GOLD_C")
			GetComArts = stats.get_int(MPX .. "H4LOOT_PAINT")
			CurComCash = ""
			CurComWeed = ""
			CurComCoke = ""
			CurComGold = ""
			CurComArts = ""
			if GetComCash > 0 then
				CurComCash = "Cash; "
			end
			if GetComWeed > 0 then
				CurComWeed = "Weed; "
			end
			if GetComCoke > 0 then
				CurComCoke = "Coke; "
			end
			if GetComGold > 0 then
				CurComGold = "Gold; "
			end
			if GetComArts > 0 then
				CurComArts = "Arts"
			end
			if GetComCash == 0 and GetComWeed == 0 and GetComCoke == 0 and GetComGold == 0 and GetComArts == 0 then
				CurComCash = "N"
				CurComWeed = "o"
				CurComCoke = "n"
				CurComGold = "e"
				CurComArts = ""
			end
			return "Compound: " .. CurComCash .. CurComWeed .. CurComCoke .. CurComGold .. CurComArts
		end, null, null, null)

	CPDS:add_bare_item("",
		function()
			GetIslCash = stats.get_int(MPX .. "H4LOOT_CASH_I")
			GetIslWeed = stats.get_int(MPX .. "H4LOOT_WEED_I")
			GetIslCoke = stats.get_int(MPX .. "H4LOOT_COKE_I")
			GetIslGold = stats.get_int(MPX .. "H4LOOT_GOLD_I")
			CurIslCash = ""
			CurIslWeed = ""
			CurIslCoke = ""
			CurIslGold = ""
			if GetIslCash > 0 then
				CurIslCash = "Cash; "
			end
			if GetIslWeed > 0 then
				CurIslWeed = "Weed; "
			end
			if GetIslCoke > 0 then
				CurIslCoke = "Coke; "
			end
			if GetIslGold > 0 then
				CurIslGold = "Gold"
			end
			if GetIslCash == 0 and GetIslWeed == 0 and GetIslCoke == 0 and GetIslGold == 0 then
				CurIslCash = "N"
				CurIslWeed = "o"
				CurIslCoke = "n"
				CurIslGold = "e"
			end
			return "Island: " .. CurIslCash .. CurIslWeed .. CurIslCoke .. CurIslGold
		end, null, null, null)

	CPDS:add_bare_item("",
		function()
			GetDif1 = stats.get_int(MPX .. "H4_PROGRESS")
			CurDif1 = ""
			if GetDif1 == 126823 then
				CurDif1 = "Normal"
			elseif GetDif1 == 131055 or GetDif1 == 114671 then
				CurDif1 = "Hard"
			else
				CurDif1 = "None"
			end
			return "Difficulty: " .. CurDif1
		end, null, null, null)

	CPDS:add_bare_item("",
		function()
			GetApp1 = stats.get_int(MPX .. "H4_MISSIONS")
			CurApp1 = ""
			if GetApp1 == 65283 then
				CurApp1 = "Kosatka"
			elseif GetApp1 == 65413 then
				CurApp1 = "Alkonost"
			elseif GetApp1 == 65289 then
				CurApp1 = "Velum"
			elseif GetApp1 == 65425 then
				CurApp1 = "Stealth Annihilator"
			elseif GetApp1 == 65313 then
				CurApp1 = "Patrol Boat"
			elseif GetApp1 == 65345 then
				CurApp1 = "Longfin"
			elseif GetApp1 == 65535 then
				CurApp1 = "All Ways"
			else
				CurApp1 = "None"
			end
			return "Approach: " .. CurApp1
		end, null, null, null)

	CPDS:add_bare_item("",
		function()
			GetWea = stats.get_int(MPX .. "H4CNF_WEAPONS")
			CurWea = ""
			if GetWea == 1 then
				CurWea = "Aggressor"
			elseif GetWea == 2 then
				CurWea = "Conspiratort"
			elseif GetWea == 3 then
				CurWea = "Crackshot"
			elseif GetWea == 4 then
				CurWea = "Saboteur"
			elseif GetWea == 5 then
				CurWea = "Marksman"
			else
				CurWea = "None"
			end
			return "Weapons: " .. CurWea
		end, null, null, null)

	CPDS:add_action("Save Heist Preset",
		function()
			CayoPrimary = GetPriTar1
			CayoComCash = GetComCash
			CayoComWeed = GetComWeed
			CayoComCoke = GetComCoke
			CayoComGold = GetComGold
			CayoComArts = GetComArts
			CayoIslCash = GetIslCash
			CayoIslWeed = GetIslWeed
			CayoIslCoke = GetIslCoke
			CayoIslGold = GetIslGold
			CayoDifficulty = GetDif1
			CayoApproach = GetApp1
			CayoWeapons = GetWea
		end)

	CPDS:add_action("Replay Heist Again",
		function()
			stats.set_int(MPX .. "H4CNF_TARGET", CayoPrimary)
			stats.set_int(MPX .. "H4LOOT_CASH_C", CayoComCash)
			stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", CayoComCash)
			stats.set_int(MPX .. "H4LOOT_WEED_C", CayoComWeed)
			stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", CayoComWeed)
			stats.set_int(MPX .. "H4LOOT_COKE_C", CayoComCoke)
			stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", CayoComCoke)
			stats.set_int(MPX .. "H4LOOT_GOLD_C", CayoComGold)
			stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", CayoComGold)
			stats.set_int(MPX .. "H4LOOT_PAINT", CayoComArts)
			stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", CayoComArts)
			stats.set_int(MPX .. "H4LOOT_CASH_I", CayoIslCash)
			stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", CayoIslCash)
			stats.set_int(MPX .. "H4LOOT_WEED_I", CayoIslWeed)
			stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", CayoIslWeed)
			stats.set_int(MPX .. "H4LOOT_COKE_I", CayoIslCoke)
			stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", CayoIslCoke)
			stats.set_int(MPX .. "H4LOOT_GOLD_I", CayoIslGold)
			stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", CayoIslGold)
			stats.set_int(MPX .. "H4LOOT_CASH_V", 90000)
			stats.set_int(MPX .. "H4LOOT_WEED_V", 147870)
			stats.set_int(MPX .. "H4LOOT_COKE_V", 200095)
			stats.set_int(MPX .. "H4LOOT_GOLD_V", 330350)
			stats.set_int(MPX .. "H4LOOT_PAINT_V", 189500)
			stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
			stats.set_int(MPX .. "H4CNF_GRAPPEL", -1)
			stats.set_int(MPX .. "H4CNF_TROJAN", 5)
			stats.set_int(MPX .. "H4CNF_WEP_DISRP", 3)
			stats.set_int(MPX .. "H4CNF_ARM_DISRP", 3)
			stats.set_int(MPX .. "H4CNF_HEL_DISRP", 3)
			stats.set_int(MPX .. "H4_PLAYTHROUGH_STATUS", 10)
		end)

	CPDS:add_action("", null)

	CPDSNote = CPDS:add_submenu("Read Me")

	CPDSNote:add_action("                    Save Heist Preset:", null)
	CPDSNote:add_action("    Use to save your heist planning screen", null)
	CPDSNote:add_action("", null)
	CPDSNote:add_action("                  Replay Heist Again:", null)
	CPDSNote:add_action("   Use to make your heist planning screen", null)
	CPDSNote:add_action("   the same as it was before saving preset", null)

	CPP = CayoPerico:add_submenu("Preps")

			a6 = 1
	CPP:add_array_item("Primary Target", {"Select", "Tequila (630k)", "Necklace (700k)", "Bonds (730k)", "Diamond (1,3m)", "Statue (1,9m)"},
		function()
			return a6
		end,
		function(PriTar)
			if PriTar == 1 then
				a6 = 1
			elseif PriTar == 2 then
				stats.set_int(MPX .. "H4CNF_TARGET", 0)
			elseif PriTar == 3 then
				stats.set_int(MPX .. "H4CNF_TARGET", 1)
			elseif PriTar == 4 then
				stats.set_int(MPX .. "H4CNF_TARGET", 2)
			elseif PriTar == 5 then
				stats.set_int(MPX .. "H4CNF_TARGET", 3)
			elseif PriTar == 6 then
				stats.set_int(MPX .. "H4CNF_TARGET", 5)
			end
			a6 = PriTar
		end)

	CPST = CPP:add_submenu("Secondary Targets")

			a7 = 1
	CPST:add_array_item("Fill Compound Storages", {"None", "Cash", "Weed", "Coke", "Gold"},
		function()
			return a7
		end,
		function(FilComSto)
			if FilComSto == 1 then
				stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
			elseif FilComSto == 2 then
				stats.set_int(MPX .. "H4LOOT_CASH_C", 255)
				stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", 255)
				stats.set_int(MPX .. "H4LOOT_WEED_C", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_V", 90000)
			elseif FilComSto == 3 then
				stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C", 255)
				stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", 255)
				stats.set_int(MPX .. "H4LOOT_COKE_C", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_V", 147870)
			elseif FilComSto == 4 then
				stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C", 255)
				stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", 255)
				stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_V", 200095)
			elseif FilComSto == 5 then
				stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_C", 255)
				stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 255)
				stats.set_int(MPX .. "H4LOOT_GOLD_V", 330350)
			end
			a7 = FilComSto
		end)

			a8 = 1
	CPST:add_array_item("Fill Island Storages", {"None", "Cash", "Weed", "Coke", "Gold"},
		function()
			return a8
		end,
		function(FilIslSto)
			if FilIslSto == 1 then
				stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", 0)
			elseif FilIslSto == 2 then
				stats.set_int(MPX .. "H4LOOT_CASH_I", 16777215)
				stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", 16777215)
				stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_V", 90000)
			elseif FilIslSto == 3 then
				stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I", 16777215)
				stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", 16777215)
				stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_V", 147870)
			elseif FilIslSto == 4 then
				stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I", 16777215)
				stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", 16777215)
				stats.set_int(MPX .. "H4LOOT_GOLD_I", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_V", 200095)
			elseif FilIslSto == 5 then
				stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
				stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
				stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
				stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", 0)
				stats.set_int(MPX .. "H4LOOT_GOLD_I", 16777215)
				stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", 16777215)
				stats.set_int(MPX .. "H4LOOT_GOLD_V", 330350)
			end
			a8 = FilIslSto
		end)

			a65 = false
		local function AddPaintings(Enabled)
			if Enabled then
				stats.set_int(MPX .. "H4LOOT_PAINT", 127)
				stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 127)
				stats.set_int(MPX .. "H4LOOT_PAINT_V", 189500)
			else
				stats.set_int(MPX .. "H4LOOT_PAINT", 0)
			    stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
			end
		end
	CPST:add_toggle("Add Paintings", function() return a65 end, function() a65 = not a65 AddPaintings(a65) end)

	CPDM = CPST:add_submenu("Detailed Method")

	CPCST = CPDM:add_submenu("Compound")

			CayoTarget1 = ""
			a92 = 1
	CPCST:add_array_item("Target (only one)", {"Select", "Cash", "Weed", "Coke", "Gold"},
		function()
			return a92
		end,
		function(Tar)
			if Tar == 1 then
				a92 = 1
			elseif Tar == 2 then
				CayoTarget1 = "CASH"
				stats.set_int(MPX .. "H4LOOT_CASH_V", 90000)
			elseif Tar == 3 then
				CayoTarget1 = "WEED"
				stats.set_int(MPX .. "H4LOOT_WEED_V", 147870)
			elseif Tar == 4 then
				CayoTarget1 = "COKE"
				stats.set_int(MPX .. "H4LOOT_COKE_V", 200095)
			elseif Tar == 5 then
				CayoTarget1	 = "GOLD"
				stats.set_int(MPX .. "H4LOOT_GOLD_V", 330350)
			end
			stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
			stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", 0)
			stats.set_int(MPX .. "H4LOOT_WEED_C", 0)
			stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", 0)
			stats.set_int(MPX .. "H4LOOT_COKE_C", 0)
			stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", 0)
			stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
			stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
			a92 = Tar
		end)

			TarComAmount = 0
			a93 = 1
	CPCST:add_array_item("Target Amount", {"0", "1", "2", "3", "4", "5", "6", "7", "8"},
		function()
			return a93
		end,
		function(TarAmo)
			if TarAmo == 1 then
				TarComAmount = 0
			elseif TarAmo == 2 then
				TarComAmount = 128
			elseif TarAmo == 3 then
				TarComAmount = 64
			elseif TarAmo == 4 then
				TarComAmount = 196
			elseif TarAmo == 5 then
				TarComAmount = 204
			elseif TarAmo == 6 then
				TarComAmount = 220
			elseif TarAmo == 7 then
				TarComAmount = 252
			elseif TarAmo == 8 then
				TarComAmount = 253
			elseif TarAmo == 9 then
				TarComAmount = 255
			end
			stats.set_int(MPX .. "H4LOOT_" .. CayoTarget1 .. "_C", TarComAmount)
			stats.set_int(MPX .. "H4LOOT_" .. CayoTarget1 .. "_C_SCOPED", TarComAmount)
			a93 = TarAmo
		end)

			ArtAmount = 0
			a94 = 1
	CPCST:add_array_item("Arts Amount", {"0", "1", "2", "3", "4", "5", "6", "7"},
		function()
			return a94
		end,
		function(ArtAmo)
			if ArtAmo == 1 then
				ArtAmount = 0
			elseif ArtAmo == 2 then
				ArtAmount = 64
			elseif ArtAmo == 3 then
				ArtAmount = 96
			elseif ArtAmo == 4 then
				ArtAmount = 112
			elseif ArtAmo == 5 then
				ArtAmount = 120
			elseif ArtAmo == 6 then
				ArtAmount = 122
			elseif ArtAmo == 7 then
				ArtAmount = 126
			elseif ArtAmo == 8 then
				ArtAmount = 127
			end
			stats.set_int(MPX .. "H4LOOT_PAINT", ArtAmount)
			stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", ArtAmount)
			stats.set_int(MPX .. "H4LOOT_PAINT_V", 189500)
			a94 = ArtAmo
		end)

	CPIST = CPDM:add_submenu("Island")

			CayoTarget2 = ""
			a95 = 1
	CPIST:add_array_item("Target (only one)", {"Select", "Cash", "Weed", "Coke", "Gold"},
		function()
			return a95
		end,
		function(Tar)
			if Tar == 1 then
				a95 = 1
			elseif Tar == 2 then
				CayoTarget2 = "CASH"
				stats.set_int(MPX .. "H4LOOT_CASH_V", 90000)
			elseif Tar == 3 then
				CayoTarget2 = "WEED"
				stats.set_int(MPX .. "H4LOOT_WEED_V", 147870)
			elseif Tar == 4 then
				CayoTarget2 = "COKE"
				stats.set_int(MPX .. "H4LOOT_COKE_V", 200095)
			elseif Tar == 5 then
				CayoTarget2 = "GOLD"
				stats.set_int(MPX .. "H4LOOT_GOLD_V", 330350)
			end
			stats.set_int(MPX .. "H4LOOT_IASH_I", 0)
			stats.set_int(MPX .. "H4LOOT_IASH_I_SCOPED", 0)
			stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
			stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", 0)
			stats.set_int(MPX .. "H4LOOT_IOKE_I", 0)
			stats.set_int(MPX .. "H4LOOT_IOKE_I_SCOPED", 0)
			stats.set_int(MPX .. "H4LOOT_GOLD_I", 0)
			stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", 0)
			a95 = Tar
		end)

			TarIslAmount = 0
			a96 = 1
	CPIST:add_array_item("Target Amount", {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"},
		function()
			return a96
		end,
		function(TarAmo)
			if TarAmo == 1 then
				TarIslAmount = 0
			elseif TarAmo == 2 then
				TarIslAmount = 8388608
			elseif TarAmo == 3 then
				TarIslAmount = 12582912
			elseif TarAmo == 4 then
				TarIslAmount = 12845056
			elseif TarAmo == 5 then
				TarIslAmount = 12976128
			elseif TarAmo == 6 then
				TarIslAmount = 13500416
			elseif TarAmo == 7 then
				TarIslAmount = 14548992
			elseif TarAmo == 8 then
				TarIslAmount = 16646144
			elseif TarAmo == 9 then
				TarIslAmount = 16711680
			elseif TarAmo == 10 then
				TarIslAmount = 16744448
			elseif TarAmo == 11 then
				TarIslAmount = 16760832
			elseif TarAmo == 12 then
				TarIslAmount = 16769024
			elseif TarAmo == 13 then
				TarIslAmount = 16769536
			elseif TarAmo == 14 then
				TarIslAmount = 16770560
			elseif TarAmo == 15 then
				TarIslAmount = 16770816
			elseif TarAmo == 16 then
				sTarIslAmount = 16770880
			elseif TarAmo == 17 then
				TarIslAmount = 16771008
			elseif TarAmo == 18 then
				TarIslAmount = 16773056
			elseif TarAmo == 19 then
				TarIslAmount = 16777152
			elseif TarAmo == 20 then
				TarIslAmount = 16777184
			elseif TarAmo == 21 then
				TarIslAmount = 16777200
			elseif TarAmo == 22 then
				sTarIslAmount = 16777202
			elseif TarAmo == 23 then
				TarIslAmount = 16777203
			elseif TarAmo == 24 then
				TarIslAmount = 16777211
			elseif TarAmo == 24 then
				TarIslAmount = 16777215
			end
			stats.set_int(MPX .. "H4LOOT_" .. CayoTarget2 .. "_I", TarIslAmount)
			stats.set_int(MPX .. "H4LOOT_" .. CayoTarget2 .. "_I_SCOPED", TarIslAmount)
			a96 = TarAmo
		end)

			a9 = 1
	CPP:add_array_item("Difficulty", {"Select", "Normal", "Hard"},
		function()
			return a9
		end,
		function(Dif)
			if Dif == 1 then
				a9 = 1
			elseif Dif == 2 then
				stats.set_int(MPX .. "H4_PROGRESS", 126823)
			elseif Dif == 3 then
				stats.set_int(MPX .. "H4_PROGRESS", 131055) end
			a9 = Dif
		end)

			a10 = 1
	CPP:add_array_item("Approach", {"Select", "Kosatka", "Alkonost", "Velum", "Stealth Annihilator", "Patrol Boat", "Longfin", "All Ways"},
		function()
			return a10
		end,
		function(Air)
			if Air == 1 then
				a10 = 1
			elseif Air == 2 then
				stats.set_int(MPX .. "H4_MISSIONS", 65283)
			elseif Air == 3 then
				stats.set_int(MPX .. "H4_MISSIONS", 65413)
			elseif Air == 4 then
				stats.set_int(MPX .. "H4_MISSIONS", 65289)
			elseif Air == 5 then
				stats.set_int(MPX .. "H4_MISSIONS", 65425)
			elseif Air == 6 then
				stats.set_int(MPX .. "H4_MISSIONS", 65313)
			elseif Air == 7 then
				stats.set_int(MPX .. "H4_MISSIONS", 65345)
			elseif Air == 8 then
				stats.set_int(MPX .. "H4_MISSIONS", 65535)
			end
			a10 = Air
		end)

			a11 = 1
	CPP:add_array_item("Weapons", {"Select", "Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"},
		function()
			return a11
		end,
		function(Wea)
			if Wea == 1 then
				a11 = 1
			elseif Wea == 2 then
				stats.set_int(MPX .. "H4CNF_WEAPONS", 1)
			elseif Wea == 3 then
				stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
			elseif Wea == 4 then
				stats.set_int(MPX .. "H4CNF_WEAPONS", 3)
			elseif Wea == 5 then
				stats.set_int(MPX .. "H4CNF_WEAPONS", 4)
			elseif Wea == 6 then
				stats.set_int(MPX .. "H4CNF_WEAPONS", 5)
			end
			a11 = Wea
		end)

	CPP:add_action("Complete Preps",
		function()
			stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
			stats.set_int(MPX .. "H4CNF_GRAPPEL", -1)
			stats.set_int(MPX .. "H4CNF_TROJAN", 5)
			stats.set_int(MPX .. "H4CNF_WEP_DISRP", 3)
			stats.set_int(MPX .. "H4CNF_ARM_DISRP", 3)
			stats.set_int(MPX .. "H4CNF_HEL_DISRP", 3)
			stats.set_int(MPX .. "H4_PLAYTHROUGH_STATUS", 10)
		end)

	CPP:add_action("Reset Preps",
		function()
			if HIP:is_active() then
				HIP:set_int(1526, 2)
			end
		end)

	CPP:add_action("", null)

	CPPNote = CPP:add_submenu("Read Me")

	CPPNote:add_action("                 After all choices and", null)
	CPPNote:add_action("            pressing «Complete Preps»", null)
	CPPNote:add_action("      leave submarine and come back in", null)

	CPC = CayoPerico:add_submenu("Cuts")

			a12 = 1
	CPC:add_array_item("Presets", {"85 All", "100 All"},
		function()
			return a12
		end,
		function(Pre)
			if Pre == 1 then
				for i = 1978495 + 825 + 56 + 1, 1978495 + 825 + 56 + 4 do
				globals.set_int(i, 85)
				globals.set_int(2684820 + 6606, 85)
			end
			elseif Pre == 2 then
				for i = 1978495 + 825 + 56 + 1, 1978495 + 825 + 56 + 4 do
				globals.set_int(i, 100)
				globals.set_int(2684820 + 6606, 100)
				end
			end
			a12 = Pre
		end)

	CPC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 1) end, function(Cut) globals.set_int(1978495 + 825 + 56 + 1, Cut) end)
	CPC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 2) end, function(Cut) globals.set_int(1978495 + 825 + 56 + 2, Cut) end)
	CPC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 3) end, function(Cut) globals.set_int(1978495 + 825 + 56 + 3, Cut) end)
	CPC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1978495 + 825 + 56 + 4) end, function(Cut) globals.set_int(1978495 + 825 + 56 + 4, Cut) end)
	CPC:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(2684820 + 6606) end, function(Cut) globals.set_int(2684820 + 6606, Cut) end)

	CPE = CayoPerico:add_submenu("Extra")

	CPCL = CPE:add_submenu("Cooldown Killer")

	CPCL:add_action("Kill Cooldown (for solo)",
		function()
			stats.set_int(MPX .. "H4_TARGET_POSIX", 1659643454)
			stats.set_int(MPX .. "H4_COOLDOWN", 0)
			stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0)
		end)

	CPCL:add_action("Kill Cooldown (with friends)",
		function()
			stats.set_int(MPX .. "H4_TARGET_POSIX", 1659429119)
			stats.set_int(MPX .. "H4_COOLDOWN", 0)
			stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0)
		end)

			a13 = 1
	CPCL:add_array_item("Session", {"Go Offline", "Go Online"},
		function()
			return a13
		end,
		function(Ses)
			if Ses == 1 then
				menu.disconnect_session()
				sleep(0.01)
				menu.send_key_press(13)
			elseif Ses == 2 then
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			end
			a13 = Ses
		end)

	CPCL:add_action("", null)

	CPCLNote = CPCL:add_submenu("Read Me")

	CPCLNote:add_action("         Choose a cooldown, go offline", null)
	CPCLNote:add_action("                and come back online", null)

			a14 = false
		local function WomBag(Enabled)
			if Enabled then
				globals.set_int(FMG + 29939, 99999)
			else
				globals.set_int(FMG + 29939, 1800)
			end
		end
	CPE:add_toggle("Woman's Bag", function() return a14 end, function() a14 = not a14 WomBag(a14) end)

	CPE:add_action("Bypass Fingerprint Hack",
		function()
			if FMC20:get_int(23669) == 4 then
				FMC20:set_int(23669, 5)
			end
		end)

	CPE:add_action("Bypass Plasma Cutter Cut", function() FMC20:set_float(29685 + 3, 100) end)

	CPE:add_action("Bypass Sewer Tunnel Cut",
		function()
			if FMC20:get_int(28446) >= 3 or FMC20:get_int(28446) <= 6 then
				FMC20:set_int(28446, 6)
			end
		end)

	CPE:add_action("Unlock All POI",
		function()
			stats.set_int(MPX .. "H4CNF_BS_GEN", -1)
			stats.set_int(MPX .. "H4CNF_BS_ENTR", 63)
			stats.set_int(MPX .. "H4CNF_BS_ABIL", 63)
			stats.set_int(MPX .. "H4CNF_APPROACH", -1)
		end)

	CPE:add_action("", null)

	CPENote = CPE:add_submenu("Read Me")

	CPENote:add_action("                      Woman's Bag:", null)
	CPENote:add_action("       Changes your bag size to infinity", null)
	CPENote:add_action("", null)
	CPENote:add_action("                For the first robbery:", null)
	CPENote:add_action("           Use «Unlock All POI» option", null)

	CPTP = CayoPerico:add_submenu("Teleports")

	CPCom = CPTP:add_submenu("Compound")

	CPCom:add_action("Office", function() TP(5005.557617, -5754.321289, 27.545269, -0.000000, 0.000000, 2.586560) end)

	CPCom:add_action("Primary Target", function() TP(5007.763184, -5756.029785, 14.184443, -0.000000, 0.000000, 2.467127) end)

			a15 = 1
	CPCom:add_array_item("Storage", {"Basement", "North", "West", "South"},
		function()
			return a15
		end,
		function(Sto)
			if Sto == 1 then
				TP(4999.613281, -5749.913086, 13.540487, -0.000000, 0.000000, 2.613005)
			elseif Sto == 2 then
				TP(5080.862305, -5756.300781, 14.529651, -0.000000, 0.000000, -0.575850)
			elseif Sto == 3 then
				TP(5030.722168, -5736.470703,  16.565588, -0.000000, 0.000000, 2.439484)
			elseif Sto == 4 then
				TP(5007.434570, -5787.255859, 16.531698, -0.000000, 0.000000, 0.680315)
			end
			a15 = Sto
		end)

	CPCom:add_action("Main Exit", function() TP(4990.194824, -5716.448730, 18.580215, -0.000000, 0.000000, 0.946360) end)

	CPCom:add_action("Water Escape", function() TP(4639.124023, -6010.004883, -7.475036, 1.930023, -0.000000, -0.000000) end)

	CPIsl = CPTP:add_submenu("Island")

			a16 = 1
	CPIsl:add_array_item("Airport", {"Loot #1","Loot #2"},
		function()
			return a16
		end,
		function(Air)
			if Air == 1 then
				TP(4441.150391, -4459.684082,3.028352, -0.000000, 0.000000, 0.308871)
			elseif Air == 2 then
				TP(4503.571777, -4552.908203, 2.871924, 0.000000, 0.000000, 0.100107)
			end
			a16 = Air
		end)

			a17 = 1
	CPIsl:add_array_item("Main Dock", {"Loot #1", "Loot #2", "Loot #3", "Loot #4"},
		function()
			return a17
		end,
		function(MaiDoc)
			if MaiDoc == 1 then
				TP(4923.965820, -5244.269531, 1.223746,-0.000004, 0.000002, -2.954921)
			elseif MaiDoc == 2 then
				TP(4998.924316, -5165.349121, 1.464225, 0.000000,0.000000, 2.033015)
			elseif MaiDoc == 3 then
				TP(4962.446777, -5107.580078, 1.682065, 0.000000, 0.000000, 2.606050)
			elseif MaiDoc == 4 then
				TP(5194.393066, -5134.665039, 2.047954, 0.000000, 0.000000, -1.815477)
			end
			a17 = MaiDoc
		end)

			a18 = 1
	CPIsl:add_array_item("North Dock", {"Loot #1", "Loot #2", "Loot #3"},
		function()
			return a18
		end,
		function(NorDoc)
			if NorDoc == 1 then
				TP(5134.185547, -4611.440430, 1.196429, 0.000000, -0.000000, 0.292134)
			elseif NorDoc == 2 then
				TP(5065.229492, -4591.959473, 1.555425, -0.000000, -0.000000, -0.303813)
			elseif NorDoc == 3 then
				TP(5091.613281, -4682.282715, 1.107359, 0.000000, -0.003459, -1.838643)
			end
			a18 = NorDoc
		end)

	CPIsl:add_action("Cord Field Loot", function() TP(5330.717285, -5270.096191, 31.886055, -0.000000, 0.000000, 1.976751) end)

	CPSO = CPTP:add_submenu("Scope Out")

	CPSO:add_action("Power Station", function() TP(4478.291992, -4580.129883, 4.258523, -2.885009, -0.000000, 0.000000) end)

			a19 = 1
	CPSO:add_array_item("Towers", {"Communications Tower", "Control Tower", "Water Tower #1", "Water Tower #2"},
		function()
			return a19
		end,
		function(Tow)
			if Tow == 1 then
				TP(5266.797363, -5427.772461, 139.746445, -0.943473, 0.000000, -0.000000)
			elseif Tow == 2 then
				TP(4350.219238, -4577.410645, 2.899095, -1.119934, -0.000000, 0.000000)
			elseif Tow == 3 then
				TP(5108.437012, -4580.132812, 28.417776, 1.720010, -0.000000, 0.000000)
			elseif Tow == 4 then
				TP(4903.939453, -5337.220703, 34.306366, 0.821753, -0.000000, 0.000000) end
			a19 = Tow
		end)

			a20 = 1
	CPSO:add_array_item("Bolt Cutters", {"#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10", "#11", "#12", "#13", "#14", "#15"},
		function()
			return a20
		end,
		function(BolCut)
			if BolCut == 1 then
				TP(5097.452637, -4620.177734, 1.193875, -2.592525, -0.000000, 0.000000)
			elseif BolCut == 2 then
				TP(4880.295898, -5112.941406, 1.053022, 1.313561, -0.000346, 0.000020)
			elseif BolCut == 3 then
				TP(4537.624512, -4542.424805, 3.546365, 1.941974, 0.000004, -0.000007)
			elseif BolCut == 4 then
				TP(5466.320801, -5230.169922, 25.993027, 2.763307, -0.000000, 0.000000)
			elseif BolCut == 5 then
				TP(4075.548828, -4663.984863, 2.994547, -2.552265, -0.000000, 0.000000)
			elseif BolCut == 6 then
				TP(4522.588867, -4509.868652, 3.188455, -2.631163, -0.000000, 0.000000)
			elseif BolCut == 7 then
				TP(4506.013672, -4656.211914, 10.579565, -0.049160, -0.000000, 0.000000)
			elseif BolCut == 8 then
				TP(4803.885742, -4317.895020, 6.201560, -0.422076, -0.000000, 0.000000)
			elseif BolCut == 9 then
				TP(5071.072266, -4639.869629, 2.112077, 0.523910, 0.000000, -0.000000)
			elseif BolCut == 10 then
				TP(5179.191895, -4669.967285, 5.832691, -2.465155, -0.000000, 0.000000)
			elseif BolCut == 11 then
				TP(5214.377441, -5126.496582, 4.925748, -1.519287, -0.000000, 0.000000)
			elseif BolCut == 12 then
				TP(4954.719727, -5180.171875, 2.966018, -2.558609, -0.000000, 0.000000)
			elseif BolCut == 13 then
				TP(4903.507812, -5345.524414, 8.850177, 2.197429, -0.000000, 0.000000)
			elseif BolCut == 14 then
				TP(4756.349609, -5539.995605, 17.625168, 2.077786, -0.000000, 0.000000)
			elseif BolCut == 15 then
				TP(5365.069336, -5438.819824, 47.831707, 0.996262, -0.000000, 0.000000)
			end
			a20 = BolCut
		end)

			a21 = 1
	CPSO:add_array_item("Cutting Powders", {"#1", "#2", "#3"},
		function()
			return a21
		end,
		function(CutPow)
			if CutPow == 1 then
				TP(5404.111328, -5171.486328, 30.132875, -0.749873, -0.000000, 0.000000)
			elseif CutPow == 2 then
				TP(5214.664551, -5131.837402, 4.938407, -1.654735, -0.000000, 0.000000)
			elseif CutPow == 3 then
				TP(4924.137695, -5271.690918, 4.351841, -2.826915, -0.000000, 0.000000)
			end
			a21 = CutPow
		end)

			a22 = 1
	CPSO:add_array_item("Grappling Hooks", {"#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10"},
		function()
			return a22
		end,
		function(GraHoo)
			if GraHoo == 1 then
				TP(4901.115723, -5332.090820, 27.841076, -0.469437, -0.000000, 0.000000)
			elseif GraHoo == 2 then
				TP(4882.464355, -4487.831543, 8.713233, 1.552495, -0.000000, 0.000000)
			elseif GraHoo == 3 then
				TP(5609.771484, -5653.084473, 8.651618, -2.502223, -0.000000, 0.000000)
			elseif GraHoo == 4 then
				TP(5125.838379, -5095.626953, 0.893209, 2.800476, -0.000000, 0.000000)
			elseif GraHoo == 5 then
				TP(4529.709961, -4700.855957, 3.120182, 2.906318, -0.000000, 0.000000)
			elseif GraHoo == 6 then
				TP(3901.137451, -4690.617676, 2.826484, 2.661214, -0.000000, 0.000000)
			elseif GraHoo == 7 then
				TP(5404.485840, -5170.345215, 30.130934, -1.991591, -0.000000, 0.000000)
			elseif GraHoo == 8 then
				TP(5333.016602, -5264.369629, 31.446018, 1.854885, -0.000000, 0.000000)
			elseif GraHoo == 9 then
				TP(5110.171387, -4579.133301, 28.417776, 0.901852, -0.000000, 0.000000)
			elseif GraHoo == 10 then
				TP(5267.243164, -5429.493164, 139.747177, 2.378908, -0.000000, 0.000000)
			end
			a22 = GraHoo
		end)

			a23 = 1
	CPSO:add_array_item("Guard Clothes", {"#1", "#2", "#3", "#4", "#5", "#6", "#7"},
		function()
			return a23
		end,
		function(GuaClo)
			if GuaClo == 1 then
				TP(5059.213867, -4592.870605, 1.595251, -0.291761, -0.000000, 0.000000)
			elseif GuaClo == 2 then
				TP(4949.736328, -5320.138672, 6.776219, 3.108989, -0.000000, 0.000000)
			elseif GuaClo == 3 then
				TP(4884.802734, -5452.898926, 29.437197, -2.087807, -0.000000, 0.000000)
			elseif GuaClo == 4 then
				TP(4764.295898, -4781.471680, 2.501517, -0.586741, -0.000000, 0.000000)
			elseif GuaClo == 5 then
				TP(5170.228516, -4677.545898, 1.122545, -0.371411, -0.000000, 0.000000)
			elseif GuaClo == 6 then
				TP(5161.595215, -4993.595215, 11.394773, -2.397844, -0.000000, 0.000000)
			elseif GuaClo == 7 then
				TP(5128.021484, -5530.752930, 52.743076, 1.605217, -0.000000, 0.000000)
			end
			a23 = GuaClo
		end)

			a24 = 1
	CPSO:add_array_item("Signal Boxes", {"#1", "#2", "#3"},
		function()
			return a24
		end,
		function(SigBox)
			if SigBox == 1 then
				TP(5262.136719, -5432.140625, 64.297203, 2.467814, -0.000000, 0.000000)
			elseif SigBox == 2 then
				TP(5265.863281, -5421.060059, 64.297638, 0.805274, -0.000000, 0.000000)
			elseif SigBox == 3 then
				TP(5266.750977, -5426.982910, 139.746857, -0.631726, -0.000000, 0.000000)
			end
			a24 = SigBox
		end)

			a25 = 1
	CPSO:add_array_item("Supply Trucks", {"#1", "#2", "#3", "#4"},
		function()
			return a25
		end,
		function(SupTru)
			if SupTru == 1 then
				TP(4517.433105, -4531.979492, 2.820656, -1.275829, -0.000000, 0.000000)
			elseif SupTru == 2 then
				TP(5148.460938, -4620.099121, 1.108461, -1.422905, -0.000000, 0.000000)
			elseif SupTru == 3 then
				TP(4901.324219, -5216.216797, 2.768269, -2.631163, -0.000000, 0.000000)
			elseif SupTru == 4 then
				TP(5152.886719, -5143.897949, 0.997772, -0.205993, -0.000000, 0.000000)
			end
			a25 = SupTru
		end)

	CayoPerico:add_action("Instant Finish (solo only)",
		function()
			FMC20:set_int(45450, 9)
			FMC20:set_int(46829, 50)
		end)

--Diamond Сasino--

	DiamondCasino = HeistTool:add_submenu("Diamond Casino (Safe)")

	DDC = DiamondCasino:add_submenu("Data Saver")

	DDC:add_bare_item("",
		function()
			GetPriTar2 = stats.get_int(MPX .. "H3OPT_TARGET")
			CurPriTar2 = ""
			if not CurApp2 == "None" and GetPriTar2 == 0 then
				CurPriTar2 = "Cash"
			elseif GetPriTar2 == 1 then
				CurPriTar2 = "Gold"
			elseif GetPriTar2 == 2 then
				CurPriTar2 = "Arts"
			elseif GetPriTar2 == 3 then
				CurPriTar2 = "Diamonds"
			else
				CurPriTar2 = "None"
			end
			return "Target: " .. CurPriTar2
		end, null, null, null)

	DDC:add_bare_item("",
		function()
			GetApp2 = stats.get_int(MPX .. "H3OPT_APPROACH")
			GetHardApp = stats.get_int(MPX .. "H3_HARD_APPROACH")
			CurApp2 = ""
			CurHardApp = ""
			if GetApp2 == 1 then
				CurApp2 = "Silent n Sneaky"
			elseif GetApp2 == 2 then
				CurApp2 = "Big Con"
			elseif GetApp2 == 3 then
				CurApp2 = "Aggressive"
			else
				CurApp2 = "None"
			end
			if GetHardApp == GetApp2 then
				CurHardApp = " (Hard)"
			else
				CurHardApp = " (Normal)"
			end
			if CurGun == "None" then
				CurHardApp = ""
			end
			return "Approach: " .. CurApp2 .. CurHardApp
		end, null, null, null)

	DDC:add_bare_item("",
		function()
			GetGun = stats.get_int(MPX .. "H3OPT_CREWWEAP")
			CurGun = ""
			if GetGun == 1 then
				CurGun = "Karl Abolaji (5%)"
			elseif GetGun == 2 then
				CurGun = "Gustavo Mota (9%)"
			elseif GetGun == 3 then
				CurGun = "Charlie Reed (7%)"
			elseif GetGun == 4 then
				CurGun = "Chester McCoy (10%)"
			elseif GetGun == 5 then
				CurGun = "Patrick McReary (8%)"
			else
				CurGun = "None"
			end
			return "Gunman: " .. CurGun
		end, null, null, null)

	DDC:add_bare_item("",
		function()
			GetDri = stats.get_int(MPX .. "H3OPT_CREWDRIVER")
			CurDri = ""
			if GetDri == 1 then
				CurDri = "Karim Denz (5%)"
			elseif GetDri == 2 then
				CurDri = "Taliana Martinez (7%)"
			elseif GetDri == 3 then
				CurDri = "Eddie Toh (9%)"
			elseif GetDri == 4 then
				CurDri = "Zach Nelson (6%)"
			elseif GetDri == 5 then
				CurDri = "Chester McCoy (10%)"
			else
				CurDri = "None"
			end
			return "Driver: " .. CurDri
		end, null, null, null)

	DDC:add_bare_item("",
		function()
			GetHac = stats.get_int(MPX .. "H3OPT_CREWHACKER")
			CurHac = ""
			if GetHac == 1 then
				CurHac = "Rickie Lukens (3%)"
			elseif GetHac == 2 then
				CurHac = "Christian Feltz (7%)"
			elseif GetHac == 3 then
				CurHac = "Yohan Blair (5%)"
			elseif GetHac == 4 then
				CurHac = "Avi Schwartzman (10%)"
			elseif GetHac == 5 then
				CurHac = "Page Harris (9%)"
			else
				CurHac = "None"
			end
			return "Hacker: " .. CurHac
		end, null, null, null)

	DDC:add_bare_item("",
		function()
			GetMas = stats.get_int(MPX .."H3OPT_MASKS")
			CurMas = ""
			if GetMas == 1 then
				CurMas = "Geometic Set"
			elseif GetMas == 2 then
				CurMas = "Hunter Set"
			elseif GetMas == 3 then
				CurMas = "Oni Half Mask Set"
			elseif GetMas == 4 then
				CurMas = "Emoji Set"
			elseif GetMas == 5 then
				CurMas = "Ornate Skull Set"
			elseif GetMas == 6 then
				CurMas = "Lucky Fruit Set"
			elseif GetMas == 7 then
				CurMas = "Guerilla Set"
			elseif GetMas == 8 then
				CurMas = "Clown Set"
			elseif GetMas == 9 then
				CurMas = "Animal Set"
			elseif GetMas == 10 then
				CurMas = "Riot Set"
			elseif GetMas == 11 then
				CurMas = "Oni Full Mask Set"
			elseif GetMas == 12 then
				CurMas = "Hockey Set"
			else
				CurMas = "None"
			end
			return "Masks: " .. CurMas
		end, null, null, null)

	DDC:add_action("Save Heist Preset",
		function()
			CasinoPrimary = GetPriTar2
			CasinoApproach = GetApp2
			CasinoHardApproach = GetHardApp
			CasinoLastApproach = stats.get_int(MPX .. "H3_LAST_APPROACH")
			CasinoGunman = GetGun
			CasinoDriver = GetDri
			CasinoHacker = GetHac
			CasinoMasks = GetMas
		end)

	DDC:add_action("Replay Heist Again",
		function()
			stats.set_int(MPX .. "H3OPT_TARGET", CasinoPrimary)
			stats.set_int(MPX .. "H3OPT_APPROACH", CasinoApproach)
			stats.set_int(MPX .. "H3_HARD_APPROACH", CasinoHardApproach)
			stats.set_int(MPX .. "H3_LAST_APPROACH", CasinoLastApproach)
			stats.set_int(MPX .. "H3OPT_CREWWEAP", CasinoGunman)
			stats.set_int(MPX .. "H3OPT_CREWDRIVER", CasinoDriver)
			stats.set_int(MPX .. "H3OPT_CREWHACKER", CasinoHacker)
			stats.set_int(MPX .. "H3OPT_MASKS", CasinoMasks)
			stats.set_int(MPX .. "H3OPT_DISRUPTSHIP", 3)
			stats.set_int(MPX .. "H3OPT_KEYLEVELS", 2)
			stats.set_int(MPX .. "H3OPT_VEHS", 3)
			stats.set_int(MPX .. "H3OPT_WEAPS", 0)
			stats.set_int(MPX .. "H3OPT_BITSET0", -1)
			stats.set_int(MPX .. "H3OPT_BITSET1", -1)
			stats.set_int(MPX .. "H3OPT_COMPLETEDPOSIX", -1)
		end)

	DDC:add_action("", null)

	DDCNote = DDC:add_submenu("Read Me")

	DDCNote:add_action("                    Save Heist Preset:", null)
	DDCNote:add_action("    Use to save your heist planning screen", null)
	DDCNote:add_action("", null)
	DDCNote:add_action("                  Replay Heist Again:", null)
	DDCNote:add_action("   Use to make your heist planning screen", null)
	DDCNote:add_action("   the same as it was before saving preset", null)


	DCP = DiamondCasino:add_submenu("Preps")

			a26 = 1
	DCP:add_array_item("Target", {"Select", "Cash", "Arts", "Gold", "Diamonds"},
		function()
			return a26
		end,
		function(Tar)
			if Tar == 1 then
				a26 = 1
			elseif Tar == 2 then
				stats.set_int(MPX .. "H3OPT_TARGET", 0)
			elseif Tar == 3 then
				stats.set_int(MPX .. "H3OPT_TARGET", 2)
			elseif Tar == 4 then
				stats.set_int(MPX .. "H3OPT_TARGET", 1)
			elseif Tar == 5 then
				stats.set_int(MPX .. "H3OPT_TARGET", 3)
			end
			a26 = Tar
		end)

			a27 = 1
	DCP:add_array_item("Approach", {"Select", "Silent n Sneaky (Normal)", "Big Con (Normal)", "Aggressive (Normal)", "Silent n Sneaky (Hard)", "Big Con (Hard)", "Aggressive (Hard)"},
		function()
			return a27
		end,
		function(App)
			if App == 1 then
				a27 = 1
			elseif App == 2 then
				stats.set_int(MPX .. "H3_LAST_APPROACH", 3)
				stats.set_int(MPX .. "H3_HARD_APPROACH", 2)
				stats.set_int(MPX .. "H3_APPROACH", 1)
				stats.set_int(MPX .. "H3OPT_APPROACH", 1)
			elseif App == 3 then
				stats.set_int(MPX .. "H3_LAST_APPROACH", 3)
				stats.set_int(MPX .. "H3_HARD_APPROACH", 1)
				stats.set_int(MPX .. "H3_APPROACH", 2)
				stats.set_int(MPX .. "H3OPT_APPROACH", 2)
			elseif App == 4 then
				stats.set_int(MPX .. "H3_LAST_APPROACH", 1)
				stats.set_int(MPX .. "H3_HARD_APPROACH", 2)
				stats.set_int(MPX .. "H3_APPROACH", 3)
				stats.set_int(MPX .. "H3OPT_APPROACH", 3)
			elseif App == 5 then
				stats.set_int(MPX .. "H3_LAST_APPROACH", 2)
				stats.set_int(MPX .. "H3_HARD_APPROACH", 1)
				stats.set_int(MPX .. "H3_APPROACH", 3)
				stats.set_int(MPX .. "H3OPT_APPROACH", 1)
			elseif App == 6 then
				stats.set_int(MPX .. "H3_LAST_APPROACH", 1)
				stats.set_int(MPX .. "H3_HARD_APPROACH", 2)
				stats.set_int(MPX .. "H3_APPROACH", 3)
				stats.set_int(MPX .. "H3OPT_APPROACH", 2)
			elseif App == 7 then
				stats.set_int(MPX .. "H3_LAST_APPROACH", 2)
				stats.set_int(MPX .. "H3_HARD_APPROACH", 3)
				stats.set_int(MPX .. "H3_APPROACH", 1)
				stats.set_int(MPX .. "H3OPT_APPROACH", 3)
			end
			a27 = App
		end)

			a28 = 1
	DCP:add_array_item("Gunman", {"Select", "Karl Abolaji (5%)", "Charlie Reed (7%)", "Patrick McReary (8%)", "Gustavo Mota (9%)", "Chester McCoy (10%)"},
		function()
			return a28
		end,
		function(Gun)
			if Gun == 1 then
				a28 = 1
			elseif Gun == 2 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 1)
			elseif Gun == 3 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 3)
			elseif Gun == 4 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 5)
			elseif Gun == 5 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 2)
			elseif Gun == 6 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 4)
			end
			a28 = Gun
		end)

			a29 = 1
	DCP:add_array_item("Driver", {"Select", "Karim Denz (5%)", "Zach Nelson (6%)", "Taliana Martinez (7%)", "Eddie Toh (9%)", "Chester McCoy (10%)"},
		function()
			return a29
		end,
		function(Dri)
			if Dri == 1 then
				a29 = 1
			elseif Dri == 2 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER", 1)
			elseif Dri == 3 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER", 4)
			elseif Dri == 4 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER", 2)
			elseif Dri == 5 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER", 3)
			elseif Dri == 6 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER", 5)
			end
			a29 = Dri
		end)

			a30 = 1
	DCP:add_array_item("Hacker", {"Select", "Rickie Lukens (3%)", "Yohan Blair (5%)", "Christian Feltz (7%)", "Page Harris (9%)", "Avi Schwartzman (10%)"},
		function()
			return a30
		end,
		function(Hac)
			if Hac == 1 then
				a30 = 1
			elseif Hac == 2 then
				stats.set_int(MPX .. "H3OPT_CREWHACKER", 1)
			elseif Hac == 3 then
				stats.set_int(MPX .. "H3OPT_CREWHACKER", 3)
			elseif Hac == 4 then
				stats.set_int(MPX .. "H3OPT_CREWHACKER", 2)
			elseif Hac == 5 then
				stats.set_int(MPX .. "H3OPT_CREWHACKER", 5)
			elseif Hac == 6 then
				stats.set_int(MPX .. "H3OPT_CREWHACKER", 4)
			end
			a30 = Hac
		end)

			a31 = 1
	DCP:add_array_item("Masks", {"Select", "Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Guerilla Set",
								 "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set"},
		function()
			return a31
		end,
		function(Mas)
			if Mas == 1 then
				a31 = 1
			elseif Mas == 2 then
				stats.set_int(MPX .. "H3OPT_MASKS", 1)
			elseif Mas == 3 then
				stats.set_int(MPX .. "H3OPT_MASKS", 2)
			elseif Mas == 4 then
				stats.set_int(MPX .. "H3OPT_MASKS", 3)
			elseif Mas == 5 then
				stats.set_int(MPX .. "H3OPT_MASKS", 4)
			elseif Mas == 6 then
				stats.set_int(MPX .. "H3OPT_MASKS", 5)
			elseif Mas == 7 then
				stats.set_int(MPX .. "H3OPT_MASKS", 6)
			elseif Mas == 8 then
				stats.set_int(MPX .. "H3OPT_MASKS", 7)
			elseif Mas == 9 then
				stats.set_int(MPX .. "H3OPT_MASKS", 8)
			elseif Mas == 10 then
				stats.set_int(MPX .. "H3OPT_MASKS", 9)
			elseif Mas == 11 then
				stats.set_int(MPX .. "H3OPT_MASKS", 10)
			elseif Mas == 12 then
				stats.set_int(MPX .. "H3OPT_MASKS", 11)
			elseif Mas == 13 then
				stats.set_int(MPX .. "H3OPT_MASKS", 12)
			end
			a31 = Mas
		end)

	DCP:add_action("Complete Preps",
		function()
			stats.set_int(MPX .. "H3OPT_DISRUPTSHIP", 3)
			stats.set_int(MPX .. "H3OPT_KEYLEVELS", 2)
			stats.set_int(MPX .. "H3OPT_VEHS", 3)
			stats.set_int(MPX .. "H3OPT_WEAPS", 0)
			stats.set_int(MPX .. "H3OPT_BITSET0", -1)
			stats.set_int(MPX .. "H3OPT_BITSET1", -1)
			stats.set_int(MPX .. "H3OPT_COMPLETEDPOSIX", -1)
		end)

	DCP:add_action("Reset Preps",
		function()
			stats.set_int(MPX .. "H3OPT_BITSET1", 0)
			stats.set_int(MPX .. "H3OPT_BITSET0", 0)
		end)

	DCP:add_action("", null)

	DCPNote = DCP:add_submenu("Read Me")

	DCPNote:add_action("                 After all choices and", null)
	DCPNote:add_action("            pressing «Complete Preps»", null)
	DCPNote:add_action("                  just wait some time", null)

	DCC = DiamondCasino:add_submenu("Cuts")

			a32 = 1
	DCC:add_array_item("Presets", {"85 All", "100 All"},
		function()
			return a32
		end,
		function(Pre)
			if Pre == 1 then
				for i = 1971696 + 2325 + 1, 1971696 + 2325 + 4 do
					globals.set_int(i, 85)
					globals.set_int(2684820 + 6606, 85)
				end
			elseif Pre == 2 then
				for i = 1971696 + 2325 + 1, 1971696 + 2325 + 4 do
					globals.set_int(i, 100)
					globals.set_int(2684820 + 6606, 100)
				end
			end
			a32 = Pre
		end)

	DCC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 1) end, function(Cut) globals.set_int(1971696 + 2325 + 1, Cut) end)
	DCC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 2) end, function(Cut) globals.set_int(1971696 + 2325 + 2, Cut) end)
	DCC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 3) end, function(Cut) globals.set_int(1971696 + 2325 + 3, Cut) end)
	DCC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1971696 + 2325 + 4) end, function(Cut) globals.set_int(1971696 + 2325 + 4, Cut) end)
	DCC:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(2684820 + 6606) end, function(Cut) globals.set_int(2684820 + 6606, Cut) end)

	DCE = DiamondCasino:add_submenu("Extra")

	DCE:add_action("Cooldown Killer",
		function()
			stats.set_int(MPX .. "H3_COMPLETEDPOSIX", -1)
			stats.set_int("MPPLY_H3_COOLDOWN", -1)
		end)

		local function Pad()
			FMC:set_int(52964, 5)
			FMC:set_int(54026, 5)
		end
			a37 = false
		local function Hecker(Enabled)
			if not localplayer then
				return
			end
			if Enabled then
				hecker_hotkey = menu.register_hotkey(72, Pad)
			else
				menu.remove_hotkey(hecker_hotkey)
			end
		end
	DCE:add_toggle("Hecker", function() return a37 end, function() a37 = not a37 Hecker(a37) end)

	DCE:add_action("Bypass Fingerprint Hack",
		function()
			if FMC:get_int(52964) == 4 then
				FMC:set_int(52964, 5)
			end
		end)

	DCE:add_action("Bypass Keypad Hack",
		function()
			if FMC:get_int(54026) ~= 4 then
				FMC:set_int(54026, 5)
			end
		end)

	DCE:add_action("Bypass Drill Vault Door", function() FMC:set_int(10101 + 7, FMC:get_int(10101 + 37)) end)

	DCE:add_action("Unlock All POI",
		function()
			stats.set_int(MPX .. "H3OPT_POI", -1)
			stats.set_int(MPX .. "H3OPT_ACCESSPOINTS", -1)
		end)

	DCE:add_action("Unlock Cancellation",
		function()
			stats.set_int(MPX .. "CAS_HEIST_NOTS", -1)
			stats.set_int(MPX .. "CAS_HEIST_FLOW", -1)
		end)

	DCE:add_action("", null)

	DCENote = DCE:add_submenu("Read Me")

	DCENote:add_action("                    Cooldown Killer:", null)
	DCENote:add_action("    Use outside arcade, wait up to 5 mins", null)
	DCENote:add_action("", null)
	DCENote:add_action("                           Hecker:", null)
	DCENote:add_action(" Pressing «H» will trigger bypass any hack", null)
	DCENote:add_action("", null)
	DCENote:add_action("                For the first robbery:", null)
	DCENote:add_action("               Use «Unlock» options", null)

	DCTP = DiamondCasino:add_submenu("Teleports")

			a34 = 1
	DCTP:add_array_item("Staff Room", {"Outside", "Inside"},
		function()
			return a34
		end,
		function(StaRoo)
			if StaRoo == 1 then
				TP(960.168335, -14.924523, 78.754761, 0.000000, 0.000000, 0.000000)
			elseif StaRoo == 2 then
				TP(2549.139893, -267.529999, -60.022987, 0.000000, 0.000000, 0.000000)
			end
			a34 = StaRoo
		end)

			a35 = 1
	DCTP:add_array_item("Vaults", {"Outside Main", "Inside Main", "Daily"},
		function()
			return a35
		end,
		function(Vau)
			if Vau == 3 then
				TP(2521.761719, -287.359192, -60.022976, 0.000000, 0.000000, 0.000000)
			elseif Vau == 1 then
				TP(2500.535889, -239.953308, -72.037086, 0.000000, 0.000000, 0.000000)
			elseif Vau == 2 then
				TP(2515.317139, -238.673294, -72.037102, 0.000000, 0.000000, 0.000000)
			end
			a35 = Vau
		end)

			a36 = 1
	DCTP:add_array_item("Mini-Vaults", {"#1", "#2", "#3", "#4", "#5", "#6"},
		function()
			return a36
		end,
		function(MinVau)
			if MinVau == 1 then
				TP(2510.261475, -224.366699, -72.037163, 0.000000, 0.000000, 0.000000)
			elseif MinVau == 2 then
				TP(2533.521729, -225.209366, -72.037163, 0.000000, 0.000000, 0.000000)
			elseif MinVau == 3 then
				TP(2537.823486, -237.452118, -72.037163, 0.000000, 0.000000, 0.000000)
			elseif MinVau == 4 then
				TP(2534.049561, -248.194931, -72.037163, 0.000000, 0.000000, 0.000000)
			elseif MinVau == 5 then
				TP(2520.342773, -255.425705, -72.037178, 0.000000, 0.000000, 0.000000)
			elseif MinVau == 6 then
				TP(2509.844238, -250.968552, -72.037170, 0.000000, 0.000000, 0.000000)
			end
			a36 = MinVau
		end)

--Doomsday--

	Doomsday = HeistTool:add_submenu("Doomsday (Safe)")

	DP = Doomsday:add_submenu("Preps")

			a38 = 1
	DP:add_array_item("Doomsday Act", {"Select", "Data Breaches", "Bogdan Problem", "Doomsday Scenario"},
		function()
			return a38
		end,
		function(DooAct)
			if DooAct == 1 then
				a38 = 1
			elseif DooAct == 2 then
				stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 503)
				stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229383)
				stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
			elseif DooAct == 3 then
				stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240)
				stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229378)
				stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
			elseif DooAct == 4 then
				stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 16368)
				stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229380)
				stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
			end
			a38 = DooAct
		end)

	DP:add_action("Complete Preps", function() stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1) end)

	DP:add_action("Reset Preps",
		function()
			stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
			stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
		end)

	DP:add_action("", null)

	DPNote = DP:add_submenu("Read Me")

	DPNote:add_action("                 After all choices and", null)
	DPNote:add_action("            pressing «Complete Preps»", null)
	DPNote:add_action("      leave your base and come back in", null)

	DC = Doomsday:add_submenu("Cuts")

			a39 = 1
	DC:add_array_item("Presets", {"85 All", "100 All"},
		function()
			return a39
		end,
		function(Pre)
			if Pre == 1 then
				for i = 1967630 + 812 + 50 + 1, 1967630 + 812 + 50 + 4 do
					globals.set_int(i, 85)
					globals.set_int(2684820 + 6606, 85)
				end
			elseif Pre == 2 then
				for i = 1967630 + 812 + 50 + 1, 1967630 + 812 + 50 + 4 do
					globals.set_int(i, 100)
					globals.set_int(2684820 + 6606, 100)
				end
			end
			a39 = Pre
		end)

    DC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 1) end, function(Cut) globals.set_int(1967630 + 812 + 50 + 1, Cut) end)
	DC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 2) end, function(Cut) globals.set_int(1967630 + 812 + 50 + 2, Cut) end)
	DC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 3) end, function(Cut) globals.set_int(1967630 + 812 + 50 + 3, Cut) end)
	DC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(1967630 + 812 + 50 + 4) end, function(Cut) globals.set_int(1967630 + 812 + 50 + 4, Cut) end)
	DC:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(2684820 + 6606) end, function(Cut) globals.set_int(2684820 + 6606, Cut) end)

	DE = Doomsday:add_submenu("Extra")

	DE:add_action("Bypass Data Breaches Hack [Outdated]", function() FMC:set_int(1537, 2) end)

	DE:add_action("Bypass Doomsday Scenario Hack", function() FMC:set_int(1266 + 135, 3) end)

---Money Tool---

	MoneyTool = SilentNight:add_submenu("♣ Money Tool")

--Bunker Crash--

	BunkerCrash = MoneyTool:add_submenu("Bunker Crash (Semi-Detected)")

	BunkerCrash:add_action("Start Solo Session",
		function()
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
		end)

	BunkerCrash:add_action("Teleport to Laptop (use inside bunker)",
		function()
			TP(907.060000, -3207.460000, -98.490000, -1.500000, -0.000000, 0.000000)
			sleep(1)
			menu.send_key_press(69)
			sleep(7.5)
			menu.send_key_press(13)
		end)

	BunkerCrash:add_action("Get Supplies", function() globals.set_int(2764608, 121) end)

	BunkerCrash:add_action("Trigger Production", function() menu.trigger_bunker_production() end)

			a41 = 0
	BunkerCrash:add_int_range("Instant Sell [Outdated]", 100000, 0, 2500000,
		function()
			return a41
		end,
		function(InsSel)
			globals.set_int(FMG + 21689, InsSel)
			a41 = InsSel
			GB:set_int(1206, 15)
			sleep(1)
			GB:set_int(1980, 0)
		end)

	BunkerCrash:add_action("Legal Stats",
		function()
			stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS5", 19995000)
			stats.set_int(MPX .. "LIFETIME_BKR_SEL_COMPLETBC5", 1000)
			stats.set_int(MPX .. "LIFETIME_BKR_SEL_UNDERTABC5", 1000)
			sleep(2)
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
		end)

	BunkerCrash:add_action("", null)

	BunkerCrashNote = BunkerCrash:add_submenu("Read Me")

	BunkerCrashNote:add_action("       Sell all goods for «Default» price", null)
	BunkerCrashNote:add_action("          before selecting higher preset;", null)
	BunkerCrashNote:add_action("   always choose to sell in Blaine County;", null)
	BunkerCrashNote:add_action("", null)
	BunkerCrashNote:add_action("                   Start Solo Session:", null)
	BunkerCrashNote:add_action("        Use if you aren't alone in session", null)
	BunkerCrashNote:add_action("", null)
	BunkerCrashNote:add_action("                  Teleport to Laptop:", null)
	BunkerCrashNote:add_action("   Use to tp to laptop inside your bunker;", null)
	BunkerCrashNote:add_action("              it also automatically sits", null)
	BunkerCrashNote:add_action("            down and opens the menu", null)
	BunkerCrashNote:add_action("", null)
	BunkerCrashNote:add_action("                      Get Supplies:", null)
	BunkerCrashNote:add_action("               Use to refill your stock", null)
	BunkerCrashNote:add_action("", null)
	BunkerCrashNote:add_action("                 Trigger Production:", null)
	BunkerCrashNote:add_action("         Use once you got some stock,", null)
	BunkerCrashNote:add_action("     so you can get a bit goods for sale", null)
	BunkerCrashNote:add_action("", null)
	BunkerCrashNote:add_action("                        Instant Sell:", null)
	BunkerCrashNote:add_action("         Start the sale mission and then", null)
	BunkerCrashNote:add_action("         choose the preset and activate", null)
	BunkerCrashNote:add_action("", null)
	BunkerCrashNote:add_action("                        Legal Stats:", null)
	BunkerCrashNote:add_action("   Changes your sales and earnings stats;", null)
	BunkerCrashNote:add_action("   to save the legal statistics, you need to", null)
	BunkerCrashNote:add_action("   make one more sale for «Default» price", null)

--Money Editor--

	MoneyEditor = MoneyTool:add_submenu("Money Editor (Safe)")

--Cash Remover--

	CashRemover = MoneyEditor:add_submenu("Cash Remover (Real)")

			NumberList = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

			DefNum1 = NumberList[1]
			DefNum1Cur = 1
	CashRemover:add_array_item("Number #1", NumberList,
		function()
			return DefNum1Cur
		end,
		function(NewNum1)
			DefNum1 = NumberList[NewNum1]
			DefNum1Cur = NewNum1
		end)

			DefNum2 = NumberList[1]
			DefNum2Cur = 1
	CashRemover:add_array_item("Number #2", NumberList,
		function()
			return DefNum2Cur
		end,
		function(NewNum2)
			DefNum2 = NumberList[NewNum2]
			DefNum2Cur = NewNum2
		end)

			DefNum3 = NumberList[1]
			DefNum3Cur = 1
	CashRemover:add_array_item("Number #3", NumberList,
		function()
			return DefNum3Cur
		end,
		function(NewNum3)
			DefNum3 = NumberList[NewNum3]
			DefNum3Cur = NewNum3
		end)

			DefNum4 = NumberList[1]
			DefNum4Cur = 1
	CashRemover:add_array_item("Number #4", NumberList,
		function()
			return DefNum4Cur
		end,
		function(NewNum4)
			DefNum4 = NumberList[NewNum4]
			DefNum4Cur = NewNum4
		end)

			DefNum5 = NumberList[1]
			DefNum5Cur = 1
	CashRemover:add_array_item("Number #5", NumberList,
		function()
			return DefNum5Cur
		end,
		function(NewNum5)
			DefNum5 = NumberList[NewNum5]
			DefNum5Cur = NewNum5
		end)

			DefNum6 = NumberList[1]
			DefNum6Cur = 1
	CashRemover:add_array_item("Number #6", NumberList,
		function()
			return DefNum6Cur
		end,
		function(NewNum6)
			DefNum6 = NumberList[NewNum6]
			DefNum6Cur = NewNum6
		end)

			DefNum7 = NumberList[1]
			DefNum7Cur = 1
	CashRemover:add_array_item("Number #7", NumberList,
		function()
			return DefNum7Cur
		end,
		function(NewNum7)
			DefNum7 = NumberList[NewNum7]
			DefNum7Cur = NewNum7
		end)

			DefNum8 = NumberList[1]
			DefNum8Cur = 1
	CashRemover:add_array_item("Number #8", NumberList,
		function()
			return DefNum8Cur
		end,
		function(NewNum8)
			DefNum8 = NumberList[NewNum8]
			DefNum8Cur = NewNum8
		end)

			DefNum9 = NumberList[1]
			DefNum9Cur = 1
	CashRemover:add_array_item("Number #9", NumberList,
		function()
			return DefNum9Cur
		end,
		function(NewNum9)
			DefNum9 = NumberList[NewNum9]
			DefNum9Cur = NewNum9
		end)

			DefNum10 = NumberList[1]
			DefNum10Cur = 1
	CashRemover:add_array_item("Number #10", NumberList,
		function()
			return DefNum10Cur
		end,
		function(NewNum10)
			DefNum10 = NumberList[NewNum10]
			DefNum10Cur = NewNum10
		end)

	CashRemover:add_bare_item("",
		function()
			CashToRemove = tonumber(DefNum1 .. DefNum2 .. DefNum3 .. DefNum4 .. DefNum5 .. DefNum6 .. DefNum7 .. DefNum8 .. DefNum9 .. DefNum10)
			if CashToRemove == 0 then
				CashToRemove = "0"
			elseif CashToRemove > 2147483646 then
				CashToRemove = 2147483646
			end
			return "Remove Cash: $" ..  FormatMoney(CashToRemove)
		end,
		function()
			globals.set_int(2764426 + 36, CashToRemove)
			if a80 == true then
				sleep(1)
				DefNum1Cur = 1
				DefNum2Cur = 1
				DefNum3Cur = 1
				DefNum4Cur = 1
				DefNum5Cur = 1
				DefNum6Cur = 1
				DefNum7Cur = 1
				DefNum8Cur = 1
				DefNum9Cur = 1
				DefNum10Cur = 1
				DefNum1 = NumberList[1]
				DefNum2 = NumberList[1]
				DefNum3 = NumberList[1]
				DefNum4 = NumberList[1]
				DefNum5 = NumberList[1]
				DefNum6 = NumberList[1]
				DefNum7 = NumberList[1]
				DefNum8 = NumberList[1]
				DefNum9 = NumberList[1]
				DefNum10 = NumberList[1]
			end
		end, null, null)

			a80 = true
	CashRemover:add_toggle("Reset Value", function() return a80 end, function() a80 = not a80 end)

	CashRemover:add_action("", null)

	CashRemoverNote = CashRemover:add_submenu("Read Me")

	CashRemoverNote:add_action("                        Reset Value:", null)
	CashRemoverNote:add_action("  Resets «Remove Cash» value after using", null)

--Story Characters--

	StoryCharacters = MoneyEditor:add_submenu("Story Characters (Real)")

	StoryCharacters:add_int_range("Michael's Cash", 1000000, 0, 2147483646,
		function()
			return stats.get_int("SP0_TOTAL_CASH")
		end,
		function(MicCas)
			stats.set_int("SP0_TOTAL_CASH", MicCas)
		end)

	StoryCharacters:add_int_range("Franklin's Cash", 1000000, 0, 2147483646,
		function()
			return stats.get_int("SP1_TOTAL_CASH")
		end,
		function(MicCas)
			stats.set_int("SP1_TOTAL_CASH", MicCas)
		end)

	StoryCharacters:add_int_range("Trevor's Cash", 1000000, 0, 2147483646,
		function()
			return stats.get_int("SP2_TOTAL_CASH")
		end,
		function(MicCas)
			stats.set_int("SP2_TOTAL_CASH", MicCas)
		end)

--Earned n Spent--

	Totals = MoneyEditor:add_submenu("Earned n Spent (Stats)")

			TotalEarnedFrom = "Not Selected"
			a102 = 1
	Totals:add_array_item("Earned From", {"Select", "Total", "Jobs", "Selling Vehicles", "Betting", "Good Sport", "Picked Up"},
		function()
			return a102
		end,
		function(TotAct)
			if TotAct == 1 then
				TotalEarnedFrom = "Not Selected"
			elseif TotAct == 2 then
				TotalEarnedFrom = "MPPLY_TOTAL_EVC"
			elseif TotAct == 3 then
				TotalEarnedFrom = "MONEY_EARN_JOBS"
			elseif TotAct == 4 then
				TotalEarnedFrom = "MONEY_EARN_SELLING_VEH"
			elseif TotAct == 5 then
				TotalEarnedFrom = "MONEY_EARN_BETTING"
			elseif TotAct == 6 then
				TotalEarnedFrom = "MONEY_EARN_GOOD_SPORT"
			elseif TotAct == 7 then
				TotalEarnedFrom = "MONEY_EARN_PICKED_UP"
			end
			a102 = TotAct
			TotalSpentOn = "Not Selected"
			a103 = 1
		end)

			TotalSpentOn = "Not Selected"
			a103 = 1
	Totals:add_array_item("Spent On", {"Select", "Total", "Weapons n Armor", "Vehicles n Maintenance", "Style n Entertainment", "Property n Utilities", "Job n Activity Entry Fees", "Betting",
									   "Contact Services", "Healthcare n Bail", "Dropped or Stolen"},
		function()
			return a103
		end,
		function(TotAct)
			if TotAct == 1 then
				TotalSpentOn = "Not Selected"
			elseif TotAct == 2 then
				TotalSpentOn = "MPPLY_TOTAL_SVC"
			elseif TotAct == 3 then
				TotalSpentOn = "MONEY_SPENT_WEAPON_ARMOR"
			elseif TotAct == 4 then
				TotalSpentOn = "MONEY_SPENT_VEH_MAINTENANCE"
			elseif TotAct == 5 then
				TotalSpentOn = "MONEY_SPENT_STYLE_ENT"
			elseif TotAct == 6 then
				TotalSpentOn = "MONEY_SPENT_PROPERTY_UTIL"
			elseif TotAct == 7 then
				TotalSpentOn = "MONEY_SPENT_JOB_ACTIVITY"
			elseif TotAct == 8 then
				TotalSpentOn = "MONEY_SPENT_BETTING"
			elseif TotAct == 9 then
				TotalSpentOn = "MONEY_SPENT_CONTACT_SERVICE"
			elseif TotAct == 10 then
				TotalSpentOn = "MONEY_SPENT_DROPPED_STOLEN"
			end
			a103 = TotAct
			TotalEarnedFrom = "Not Selected"
			a102 = 1
		end)

	Totals:add_bare_item("",
		function()
			if a102 == 1 then
				return "Current Earned: " .. TotalEarnedFrom
			elseif a102 == 2 then
				return "Current Total Earned: $" .. FormatMoney(stats.get_int(TotalEarnedFrom))
			else
				return "Current Earned: $" .. FormatMoney(stats.get_int(MPX .. TotalEarnedFrom))
			end
		end, null, null, null)

	Totals:add_bare_item("",
		function()
			if a103 == 1 then
				return "Current Spent: " .. TotalSpentOn
			elseif a103 == 2 then
				return "Current Total Spent: $" .. FormatMoney(stats.get_int(TotalSpentOn))
			else
				return "Current Spent: $" .. FormatMoney(stats.get_int(MPX .. TotalSpentOn))
			end
		end, null, null, null)

			DefNum11 = NumberList[1]
			DefNum11Cur = 1
	Totals:add_array_item("Number #1", NumberList,
		function()
			return DefNum11Cur
		end,
		function(NewNum11)
			DefNum11 = NumberList[NewNum11]
			DefNum11Cur = NewNum11
		end)

			DefNum12 = NumberList[1]
			DefNum12Cur = 1
	Totals:add_array_item("Number #2", NumberList,
		function()
			return DefNum12Cur
		end,
		function(NewNum12)
			DefNum12 = NumberList[NewNum12]
			DefNum12Cur = NewNum12
		end)

			DefNum13 = NumberList[1]
			DefNum13Cur = 1
	Totals:add_array_item("Number #3", NumberList,
		function()
			return DefNum13Cur
		end,
		function(NewNum13)
			DefNum13 = NumberList[NewNum13]
			DefNum13Cur = NewNum13
		end)

			DefNum14 = NumberList[1]
			DefNum14Cur = 1
	Totals:add_array_item("Number #4", NumberList,
		function()
			return DefNum14Cur
		end,
		function(NewNum14)
			DefNum14 = NumberList[NewNum14]
			DefNum14Cur = NewNum14
		end)

			DefNum15 = NumberList[1]
			DefNum15Cur = 1
	Totals:add_array_item("Number #5", NumberList,
		function()
			return DefNum15Cur
		end,
		function(NewNum15)
			DefNum15 = NumberList[NewNum15]
			DefNum15Cur = NewNum15
		end)

			DefNum16 = NumberList[1]
			DefNum16Cur = 1
	Totals:add_array_item("Number #6", NumberList,
		function()
			return DefNum16Cur
		end,
			function(NewNum16)
		DefNum16 = NumberList[NewNum16]
			DefNum16Cur = NewNum16
		end)

			DefNum17 = NumberList[1]
			DefNum17Cur = 1
	Totals:add_array_item("Number #7", NumberList,
		function()
			return DefNum17Cur
		end,
		function(NewNum17)
			DefNum17 = NumberList[NewNum17]
			DefNum17Cur = NewNum17
		end)

			DefNum18 = NumberList[1]
			DefNum18Cur = 1
	Totals:add_array_item("Number #8", NumberList,
		function()
			return DefNum18Cur
		end,
		function(NewNum18)
			DefNum18 = NumberList[NewNum18]
			DefNum18Cur = NewNum18
		end)

			DefNum19 = NumberList[1]
			DefNum19Cur = 1
	Totals:add_array_item("Number #9", NumberList,
		function()
			return DefNum19Cur
		end,
		function(NewNum19)
			DefNum19 = NumberList[NewNum19]
			DefNum19Cur = NewNum19
		end)

			DefNum20 = NumberList[1]
			DefNum20Cur = 1
	Totals:add_array_item("Number #10", NumberList,
		function() return DefNum20Cur end, function(NewNum20)
			DefNum20 = NumberList[NewNum20]
			DefNum20Cur = NewNum20
		end)

	Totals:add_bare_item("",
		function()
			CashToChange = tonumber(DefNum11 .. DefNum12 .. DefNum13 .. DefNum14 .. DefNum15 .. DefNum16 .. DefNum17 .. DefNum18 .. DefNum19 .. DefNum20)
			if CashToChange == 0 then
				CashToChange = "0"
			elseif CashToChange > 2147483646 then
				CashToChange = 2147483646
			end
			return "Change Value: $" .. FormatMoney(CashToChange)
		end,
		function()
			if a102 == 1 then
				if a103 == 2 then
					stats.set_int(TotalSpentOn, CashToChange)
				else
					stats.set_int(MPX .. TotalSpentOn, CashToChange)
				end
			elseif a103 == 1 then
				if a102 == 2 then
					stats.set_int(TotalEarnedFrom, CashToChange)
				else
					stats.set_int(MPX .. TotalEarnedFrom, CashToChange)
				end
			end
			if a81 == true then
				sleep(1)
				DefNum11Cur = 1
				DefNum12Cur = 1
				DefNum13Cur = 1
				DefNum14Cur = 1
				DefNum15Cur = 1
				DefNum16Cur = 1
				DefNum17Cur = 1
				DefNum18Cur = 1
				DefNum19Cur = 1
				DefNum20Cur = 1
				DefNum11 = NumberList[1]
				DefNum12 = NumberList[1]
				DefNum13 = NumberList[1]
				DefNum14 = NumberList[1]
				DefNum15 = NumberList[1]
				DefNum16 = NumberList[1]
				DefNum17 = NumberList[1]
				DefNum18 = NumberList[1]
				DefNum19 = NumberList[1]
				DefNum20 = NumberList[1]
			end
		end, null, null)

			a81 = true
	Totals:add_toggle("Reset Value", function() return a81 end, function() a81 = not a81 end)

	Totals:add_action("Make Total Earned n Spent The Same", function() stats.set_int("MPPLY_TOTAL_EVC", stats.get_int("MPPLY_TOTAL_SVC")) end)

	Totals:add_action("Make Total Spent n Earned The Same", function() stats.set_int("MPPLY_TOTAL_SVC", stats.get_int("MPPLY_TOTAL_EVC")) end)

	Totals:add_action("", null)

	TotalsNote = Totals:add_submenu("Read Me")

	TotalsNote:add_action("   To save the new statistics, you need to", null)
	TotalsNote:add_action("    earn or spend somehow some money", null)
	TotalsNote:add_action("", null)
	TotalsNote:add_action("                        Reset Value:", null)
	TotalsNote:add_action("  Resets «Change Value» value after using", null)

--Nightclub Helper--

	NightclubHelper = MoneyTool:add_submenu("Nightclub Helper (Semi-Detected)")

	NightclubHelperInfo = NightclubHelper:add_submenu("Data Collector")

	NightclubHelperInfo:add_bare_item("",
		function()
			return "Popularity: " .. math.floor(stats.get_int(MPX .. "CLUB_POPULARITY") / 10) .. "%"
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			return "Safe: $" .. FormatMoney(stats.get_int(MPX .. "CLUB_SAFE_CASH_VALUE"))
		end, null, null, null)

			CNS = 24569
			SG = 24563
			SAI = 24564
			PR = 24565
			OP = 24566
			PNC = 24567
			CC = 24568
	NightclubHelperInfo:add_bare_item("",
		function()
			CargoAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_0")
			if CargoAmount == 0 then
				return "Cargo n Shipments: $0 (0/50)"
			else
				return "Cargo n Shipments: $" .. FormatMoney(globals.get_int(FMG + CNS) * CargoAmount) .. " (" .. CargoAmount .. "/50)"
			end
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			SportingAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_1")
			if SportingAmount == 0 then
				return "Sporting Goods: $0 (0/100)"
			else
				return "Sporting Goods: $" .. FormatMoney(globals.get_int(FMG + SG) * SportingAmount) .. " (" .. SportingAmount .. "/100)"
			end
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			ImportsAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_2")
			if ImportsAmount == 0 then
				return "S.A. Imports: $0 (0/10)"
			else
				return "S.A. Imports: $" .. FormatMoney(globals.get_int(FMG + SAI) * ImportsAmount) .. " (" .. ImportsAmount .. "/10)"
			end
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			PharmaceutAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_3")
			if PharmaceutAmount == 0 then
				return "Pharmaceut. Research: $0 (0/20)"
			else
				return "Pharmaceut. Research: $" .. FormatMoney(globals.get_int(FMG + PR) * PharmaceutAmount).. " (" .. PharmaceutAmount .. "/20)"
			end
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			OrganicAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_4")
			if OrganicAmount == 0 then
				return "Organic Produce: $0 (0/80)"
			else
				return "Organic Produce: $" .. FormatMoney(globals.get_int(FMG + OP) * OrganicAmount) .. " (" .. OrganicAmount .. "/80)"
			end
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			PrintingAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_5")
			if PrintingAmount == 0 then
				return "Printing n Copying: $0 (0/60)"
			else
				return "Printing n Copying: $" .. FormatMoney(globals.get_int(FMG + PNC) * PrintingAmount) .. " (" .. PrintingAmount .. "/60)"
			end
		end, null, null, null)

	NightclubHelperInfo:add_bare_item("",
		function()
			CashAmount = stats.get_int(MPX .. "HUB_PROD_TOTAL_6")
			if CashAmount == 0 then
				return "Cash Creation: $0 (0/40)"
			else
				return "Cash Creation: $" .. FormatMoney(globals.get_int(FMG + CC) * CashAmount) .. " (" .. CashAmount .. "/40)"
			end
		end, null, null, null)

	NightclubHelper:add_action("Start Solo Session",
		function()
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
		end)

			a85 = false
		local function NigCooKil(Enabled)
			if not localplayer then
				return
			end
			if Enabled then
				globals.set_int(FMG + 24629, 0)
				globals.set_int(FMG + 24671, 0)
				globals.set_int(FMG + 24672, 0)
			else
				globals.set_int(FMG + 24629, 300000)
				globals.set_int(FMG + 24671, 300000)
				globals.set_int(FMG + 24672, 300000)
			end
		end
	NightclubHelper:add_toggle("Cooldown Killer", function() return a85 end, function() a85 = not a85 NigCooKil(a85) end)

			a86 = false
		local function TurkishSupplier()
			while a86 do
				menu.trigger_nightclub_production()
				sleep(10)
			end
		end
	NightclubHelper:add_toggle("Turkish Supplier", function() return a86 end, function() a86 = not a86 TurkishSupplier() end)

			a84 = 1
	NightclubHelper:add_array_item("Popularity", {"Select", "Max", "Min"},
		function()
			return a84
		end,
		function(Pop)
			if Pop == 1 then
				a84 = 1
			elseif Pop == 2 then
				stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
			elseif Pop == 3 then
				stats.set_int(MPX .. "CLUB_POPULARITY", 0)
			end
		end)

			a83 = 1
	NightclubHelper:add_array_item("Safe", {"Select", "Fill", "Collect (inside only)"},
		function()
			return a83
		end,
		function(Saf)
			if Saf == 1 then
				a83 = 1
			elseif Saf == 2 then
				stats.set_int(MPX .. "CLUB_POPULARITY", 0)
				sleep(0.2)
				globals.set_int(FMG + IncomeStart, SafeAmount)
				globals.set_int(FMG + SafeCapacity, SafeAmount)
				stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
			elseif Saf == 3 then
				AMN:set_int(SafeCollection, 1)
				a83 = 1
				return a83
			end
			a83 = Saf
		end)

			a82 = 1
	NightclubHelper:add_array_item("Max Payout", {"Select", "Cargo n Shipments", "Sporting Goods", "S.A. Imports", "Pharmaceut. Research", "Organic Produce", "Printing n Copying", "Cash Creation"},
		function()
			return a82
		end,
		function(MaxGoo)
			if MaxGoo == 1 then
				a82 = 1
			elseif MaxGoo == 2 then
				globals.set_int(FMG + CNS, math.floor(8000000 / CargoAmount))
			elseif MaxGoo == 3 then
				globals.set_int(FMG + SG, math.floor(8000000 / SportingAmount))
			elseif MaxGoo == 4 then
				globals.set_int(FMG + SAI, math.floor(8000000 / ImportsAmount))
			elseif MaxGoo == 5 then
				globals.set_int(FMG + PR, math.floor(8000000 / PharmaceutAmount))
			elseif MaxGoo == 6 then
				globals.set_int(FMG + OP, math.floor(8000000 / OrganicAmount))
			elseif MaxGoo == 7 then
				globals.set_int(FMG + PNC, math.floor(8000000 / PrintingAmount))
			elseif MaxGoo == 8 then
				globals.set_int(FMG + CC, math.floor(8000000 / CashAmount))
			end
			a82 = MaxGoo
		end)

	NightclubHelper:add_action("Default Payout",
		function()
			globals.set_int(FMG + CNS, 10000)
			globals.set_int(FMG + SG, 5000)
			globals.set_int(FMG + SAI, 27000)
			globals.set_int(FMG + PR, 11475)
			globals.set_int(FMG + OP, 2025)
			globals.set_int(FMG + PNC, 10000)
			globals.set_int(FMG + CC, 4725)
		end)

	NightclubHelper:add_action("", null)

	NightclubHelperNote = NightclubHelper:add_submenu("Read Me")

	NightclubHelperNote:add_action("                   Start Solo Session:", null)
	NightclubHelperNote:add_action("        Use if you aren't alone in session", null)
	NightclubHelperNote:add_action("", null)
	NightclubHelperNote:add_action("                    Turkish Supplier:", null)
	NightclubHelperNote:add_action("         Use this to get goods; ≈1p/10s", null)

--Special Cargo VIP--

	SpecialCargoVIP = MoneyTool:add_submenu("Special Cargo VIP (Semi-Detected)")

	AFKMode = SpecialCargoVIP:add_submenu("AFK Mode")

			DefDelay1 = 0.5
			a46 = 1
	AFKMode:add_array_item("Delay", {"Default", "Fast", "Medium", "Slow"},
		function()
			return a46
		end,
		function(Del)
			if Del == 1 then
				DefDelay1 = 0.5
			elseif Del == 2 then
				DefDelay1 = 1
			elseif Del == 3 then
				DefDelay1 = 2
			elseif Del == 4 then
				DefDelay1 = 3 end
			a46 = Del
		end)

			DefWarehouse = 1
			a47 = 1
	AFKMode:add_array_item("Warehouse Type", {"Select", "Small (16)", "Medium (42)", "Large (111)"},
		function()
			return a47
		end,
		function(WarehouseType)
			if WarehouseType == 1 then
				DefWarehouse = 0
			elseif WarehouseType == 2 then
				DefWarehouse = 1
			elseif WarehouseType == 3 then
				DefWarehouse = 2
			elseif WarehouseType == 4 then
				DefWarehouse = 3
			end
			a47 = WarehouseType
		end)

			DefCash1 = 0
			a49 = 0
	AFKMode:add_int_range("Required Cash", 6000000, 0, 996000000,
		function()
			return a49
		end,
		function(ReqCash)
			DefCash1 = ReqCash
			a49 = ReqCash
		end)

			InfMode = true
	AFKMode:add_toggle("Infinity $$$", function() return InfMode end, function() InfMode = not InfMode end)

			keyboard = {W = 87, S = 83, A = 65, D = 68, E = 69}
			LoopStop = 0
			a50 = false
		local function AfkMode()
			GetTotalCash1 = stats.get_int("MPPLY_TOTAL_EVC")
			SaveTotalCash1 = GetTotalCash1
			ReqTotalCash11 = SaveTotalCash1 + DefCash1
			if a50 == false then
				LoopStop = 1
				return
			end
			if DefWarehouse == 1 then
				while LoopStop == 0 do
					if AMW:is_active() then
						globals.set_int(FMG + 15963, 6000000)
						globals.set_int(FMG + 15728, 0)
						globals.set_int(FMG + 15729, 0)
						globals.set_int(4536677, 0)
						globals.set_int(4536678, 0)
						globals.set_int(4536679, 0)
						if AMW:is_active() then menu.send_key_down(keyboard.D)
							sleep(1.8)
							menu.send_key_up(keyboard.D)
							menu.send_key_press(keyboard.E)
							if ASS:is_active() then ASS:set_int(737, 1)
								sleep(0.2)
								ASS:set_int(738, 1)
								sleep(0.2)
								ASS:set_int(556, 3012)
							end
							if GCS:is_active() then
								if NoRP == false then
									globals.set_float(FMG + 1, 1)
								else
									globals.set_float(FMG + 1, 0)
								end
								GCS:set_int(1136, 1)
								GCS:set_int(596, 0)
								GCS:set_int(1125, 0)
								GCS:set_int(548, 7)
								sleep(DefDelay1)
								GCS:set_int(542, 99999)
								if NoCrateBack == false then
									for i = 12, 16 do
										stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
									end
								end
								sleep(2)
								if not AMW:is_active() then
									GCS:set_int(542, 99999)
									menu.send_key_down(keyboard.S)
									sleep(1.5)
									menu.send_key_up(keyboard.S)
									if InfMode == false then
										if stats.get_int("MPPLY_TOTAL_EVC") >= ReqTotalCash1 then
											LoopStop = 1
											a9 = false
										else
											LoopStop = 0
										end
									end
								end
							end
						end
					end
				end
				LoopStop = 0
			end
			if DefWarehouse == 2 then
				while LoopStop == 0 do
					if AMW:is_active() then globals.set_int(FMG + 15963, 6000000)
											globals.set_int(FMG + 15728, 0)
											globals.set_int(FMG + 15729, 0)
											globals.set_int(4536677, 0)
											globals.set_int(4536678, 0)
											globals.set_int(4536679, 0)
						if AMW:is_active() then
							menu.send_key_down(keyboard.D)
							sleep(1.6)
							menu.send_key_down(keyboard.W)
							sleep(0.8)
							menu.send_key_up(keyboard.D)
							menu.send_key_up(keyboard.W)
							menu.send_key_press(keyboard.E)
							if ASS:is_active() then
								ASS:set_int(737, 1)
								sleep(0.2)
								ASS:set_int(738, 1)
								sleep(0.2)
								ASS:set_int(556, 3012)
							end
							if GCS:is_active() then
								if NoRP == false then
									globals.set_float(FMG + 1, 1)
								else
									globals.set_float(FMG + 1, 0)
								end
								GCS:set_int(1136, 1)
								GCS:set_int(596, 0)
								GCS:set_int(1125, 0)
								GCS:set_int(548, 7)
								sleep(DefDelay1)
								GCS:set_int(542, 99999)
								if NoCrateBack == false then
									for i = 12, 16 do
										stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
									end
								end
								sleep(2)
								if not AMW:is_active() then
									GCS:set_int(542, 99999)
									menu.send_key_down(keyboard.S)
									sleep(1.5)
									menu.send_key_up(keyboard.S)
									if InfMode == false then
										if stats.get_int("MPPLY_TOTAL_EVC") >= ReqTotalCash1 then
											LoopStop = 1
											a9 = false
										else
											LoopStop = 0
										end
									end
								end
							end
						end
					end
				end
				LoopStop = 0
			end
			if DefWarehouse == 3 then
				while LoopStop == 0 do
					if AMW:is_active() then
						globals.set_int(FMG + 15963, 6000000)
						globals.set_int(FMG + 15728, 0)
						globals.set_int(FMG + 15729, 0)
						globals.set_int(4536677, 0)
						globals.set_int(4536678, 0)
						globals.set_int(4536679, 0)
						if AMW:is_active() then
							menu.send_key_down(keyboard.W)
							menu.send_key_down(keyboard.A)
							sleep(0.8)
							menu.send_key_up(keyboard.W)
							menu.send_key_up(keyboard.A)
							menu.send_key_press(keyboard.E)
							if ASS:is_active() then
								ASS:set_int(737, 1)
								sleep(0.2)
								ASS:set_int(738, 1)
								sleep(0.2)
								ASS:set_int(556, 3012)
							end
							if GCS:is_active() then
								if NoRP == false then
									globals.set_float(FMG + 1, 1)
								else
									globals.set_float(FMG + 1, 0)
								end
								GCS:set_int(1136, 1)
								GCS:set_int(596, 0)
								GCS:set_int(1125, 0)
								GCS:set_int(548, 7)
								sleep(DefDelay1)
								GCS:set_int(542, 99999)
								if NoCrateBack == false then
									for i = 12, 16 do
										stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
									end
								end
								sleep(2)
								if not AMW:is_active() then
									GCS:set_int(542, 99999)
									menu.send_key_down(keyboard.S)
									sleep(1.5)
									menu.send_key_up(keyboard.S)
									if InfMode == false then
										if stats.get_int("MPPLY_TOTAL_EVC") >= ReqTotalCash1 then
											LoopStop = 1
											a50 = false
										else
											LoopStop = 0
										end
									end
								end
							end
						end
					end
				end
			end
			LoopStop = 0
		end
	AFKMode:add_toggle("Toggle AFK Mode", function() return a50 end, function() a50 = not a50 AfkMode(a50) end)

	AFKMode:add_bare_item("",
		function()
			CurrentCash = stats.get_int(MPX .. "LIFETIME_CONTRA_EARNINGS")
			SaveCash = CurrentCash
			return "Money Made: $" .. FormatMoney(stats.get_int(MPX .. "LIFETIME_CONTRA_EARNINGS") - SaveCash)
		end, null, null, null)

	AFKMode:add_action("", null)

	AFKModeNote = AFKMode:add_submenu("Read Me")

	AFKModeNote:add_action("                            Delay:", null)
	AFKModeNote:add_action("  Change this if you aren't getting money", null)
	AFKModeNote:add_action("", null)
	AFKModeNote:add_action("                   Warehouse Type:", null)
	AFKModeNote:add_action("           Select your warehouse type", null)
	AFKModeNote:add_action("", null)
	AFKModeNote:add_action("                     Required Cash:", null)
	AFKModeNote:add_action("     Сhoose amount of money you want", null)
	AFKModeNote:add_action("               to get with AFK mode", null)
	AFKModeNote:add_action("", null)
	AFKModeNote:add_action("                        Infinity $$$:", null)
	AFKModeNote:add_action("           Activates infinite AFK mode;", null)
	AFKModeNote:add_action("  ignores the setting of the option above", null)
	AFKModeNote:add_action("", null)
	AFKModeNote:add_action("                  Toggle AFK Mode:", function()end)
	AFKModeNote:add_action("     Activate when your character enters", null)
	AFKModeNote:add_action("  and completely stops in the warehouse;", null)
	AFKModeNote:add_action("          don't move the camera before", null)
	AFKModeNote:add_action("               and during activation", null)
	AFKModeNote:add_action("", null)
	AFKModeNote:add_action("                       Money Made:", null)
	AFKModeNote:add_action("     Reselect the option to see the result", null)
	AFKModeNote:add_action("", null)

	EasterEgg = AFKModeNote:add_submenu("Easter Egg")
	EasterEgg:add_action(" Woah, you found me! Take this prize then:", null)
	EasterEgg:add_action("                   Receive The Prize", function() menu.suicide_player() end)

	Settings = SpecialCargoVIP:add_submenu("Settings")

	Settings:add_action("Start Solo Session",
		function()
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
		end)

			NoRP = true
	Settings:add_toggle("Disable RP Gain", function() return NoRP end, function() NoRP = not NoRP end)

			NoCrateBack = false
	Settings:add_toggle("Disable CrateBack", function() return NoCrateBack end, function() NoCrateBack = not NoCrateBack end)

	GetCrates = Settings:add_submenu("Get Crates")

	GetCrates:add_action("1-3 per Press",
		function()
			for i = 12, 16 do
				stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
			end
		end)

			a51 = false
		local function CratesLoop()
			while a51 do
				for i = 12, 16 do
					stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
				end
			end
		end
	GetCrates:add_toggle("Crates Loop", function() return a51 end, function() a51 = not a51 CratesLoop() end)

			a52 = 1
	GetCrates:add_int_range("Instant Buy", 1, 1, 111,
		function()
			return a52
		end,
		function(NumOfCra)
			if GCB:is_active() then
				GCB:set_int(604, 1)
				GCB:set_int(600, NumOfCra)
				GCB:set_int(790, 6)
				GCB:set_int(791, 4)
				a52 = NumOfCra
			end
		end)

	GetCrates:add_action("", null)

	GetCratesNote = GetCrates:add_submenu("Read Me")

	GetCratesNote:add_action("                       Crates Loop:", null)
	GetCratesNote:add_action("                	 To turn off the loop,", null)
	GetCratesNote:add_action("     close the menu via «Menu Settings»", null)
	GetCratesNote:add_action("", null)
	GetCratesNote:add_action("                       Instant Buy:", null)
	GetCratesNote:add_action("       Start the buy mission first, select", null)
	GetCratesNote:add_action("      the number of crates and activate", null)

	Settings:add_action("Legal Stats",
		function()
			stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", 999)
			stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 999)
			stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", 999)
			stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", 999)
			stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", 19990000)
			sleep(1)
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
		end)

	Settings:add_action("Clean Office",
		function()
			stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", 1)
			stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 1)
			stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", 1)
			stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", 1)
			stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", 1)
			sleep(1)
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
		end)

	Settings:add_action("", null)

	SettingsNote = Settings:add_submenu("Read Me")

	SettingsNote:add_action("                   Start Solo Session:", null)
	SettingsNote:add_action("        Use if you aren't alone in session", null)
	SettingsNote:add_action("", null)
	SettingsNote:add_action("                    Disable RP Gain:", null)
	SettingsNote:add_action("           Disables earning experience", null)
	SettingsNote:add_action("", null)
	SettingsNote:add_action("                   Disable CrateBack:", null)
	SettingsNote:add_action(" Disables the return of crates after its sale", null)
	SettingsNote:add_action("", null)
	SettingsNote:add_action("                        Legal Stats:", null)
	SettingsNote:add_action("   Changes your sales and earnings stats;", null)
	SettingsNote:add_action("         to save the legal statistics, you", null)
	SettingsNote:add_action("  need to make one more sale for $10,000", null)
	SettingsNote:add_action("", null)
	SettingsNote:add_action("                       Clean Office:", null)
	SettingsNote:add_action("       Removes money from your office;", null)
	SettingsNote:add_action("   to save the result, make one more sale", null)

	ManualMode = SpecialCargoVIP:add_submenu("Manual Mode")

			DefDelay2 = 0.5
			a53 = 1
	ManualMode:add_array_item("Delays", {"Default", "Fast", "Medium", "Slow"},
		function()
			return a53
		end,
		function(DelayType2)
			if DelayType2 == 1 then
				DefDelay2 = 0.5
			elseif DelayType2 == 2 then
				DefDelay2 = 1
			elseif DelayType2 == 3 then
				DefDelay2 = 2
			elseif DelayType2 == 4 then
				DefDelay2 = 3
			end
			a53 = DelayType2
		end)

			a54 = false
		local function CarCooKil(Enabled)
			if not localplayer then
				return
			end
			if Enabled then
				globals.set_int(FMG + 15728, 0)
				globals.set_int(FMG + 15729, 0)
			else
				globals.set_int(FMG + 15728, 300000)
				globals.set_int(FMG + 15729, 1800000)
			end
		end
	ManualMode:add_toggle("Cooldown Killer", function() return a54 end, function() a54 = not a54 CarCooKil(a54) end)

			CargoPrices = {"Select", "Min", "Half", "Max", "Max Legal"}
			CargoValues = {0, 10000, 3000000, 6000000, 3330000}
			a55 = 1
	ManualMode:add_array_item("Set Price", CargoPrices, function() return a55 end,
		function(SetPri)
			if CargoPrices[SetPri] == "Select" then
				a55 = 1
			elseif CargoPrices[SetPri] == "Min" then
				for i = 0, 4 do
					if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then
						stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
						globals.set_int(FMG + 15963, 10000)
					end
				end
			elseif CargoPrices[SetPri] == "Half" then
				for i = 0, 4 do
					if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then
						stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
						globals.set_int(FMG + 15963, 3000000)
					end
				end
			elseif CargoPrices[SetPri] == "Max" then
				for i = 0, 4 do
					if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then
						stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
						globals.set_int(FMG + 15963, 6000000)
					end
				end
			elseif CargoPrices[SetPri] == "Max Legal" then
				for i = 0, 4 do
					if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then
						stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
						globals.set_int(FMG + 15963, 3330000) end
					end
				end
			a55 = SetPri
		end)

	ManualMode:add_bare_item("",
		function()
			if CargoValues[a55] == 0 then
				return "Price per Crate:"
			else
				return "Price per Crate: $" .. FormatMoney(CargoValues[a55])
			end
		end, null, null, null)

	ManualMode:add_action("Instant Sell",
		function()
			if NoRP == false then
				globals.set_float(FMG + 1, 1)
			else
				globals.set_float(FMG + 1, 0)
			end
			if NoCrateBack == false then
				if GCS:is_active() then
					for i = 12, 16 do
						stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
					end
					GCS:set_int(548, 7)
					sleep(DefDelay2)
					GCS:set_int(542, 99999)
				end
			else
				if GCS:is_active() then
					GCS:set_int(548, 7)
					sleep(DefDelay2)
					GCS:set_int(542, 99999)
				end
			end
		end)

	ManualMode:add_action("Bypass Entrance Delay",
		function()
			for i = 0, 4 do
				if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then
					stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
					GCS:set_int(542, 99999)
				end
			end
		end)

		local function InsSel()
			if NoRP == false then
				globals.set_float(FMG + 1, 1)
			else globals.set_float(FMG + 1, 0)
			end
			if NoCrateBack == false then
				if GCS:is_active() then
					for i = 12, 16 do
						stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
					end
					GCS:set_int(548, 7)
					sleep(DefDelay2)
					GCS:set_int(542, 99999)
				end
			else
				if GCS:is_active() then
					GCS:set_int(548, 7)
					sleep(DefDelay2)
					GCS:set_int(542, 99999)
				end
			end
		end
		local function BypEntDel()
			for i = 0, 4 do
				if stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) > 0 then
					stats.set_int(MPX .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX .. "CONTOTALFORWHOUSE" .. i) - 1)
					sleep(DefDelay2)
					GCS:set_int(542, 99999)
				end
			end
		end
			a56 = false
		local function xnxxSell(Enabled)
			if not localplayer then
				return
			end
			if Enabled then
				instant_sell_hotkey = menu.register_hotkey(88, InsSel)
				bypass_entrance_delay_hotkey = menu.register_hotkey(78, BypEntDel)
			else
				menu.remove_hotkey(instant_sell_hotkey)
				menu.remove_hotkey(bypass_entrance_delay_hotkey)
			end
		end
	ManualMode:add_toggle("xnxxSell", function() return a56 end, function() a56 = not a56 xnxxSell(a56) end)

	ManualMode:add_action("", null)

	ManualModeNote = ManualMode:add_submenu("Read Me")

	ManualModeNote:add_action("                           Delays:", null)
	ManualModeNote:add_action("  Change this if you aren't getting money", null)
	ManualModeNote:add_action("", null)
	ManualModeNote:add_action("                        Instant Sell:", null)
	ManualModeNote:add_action("        Always choose to sell one crate;", null)
	ManualModeNote:add_action("      start the sale mission first, activate", null)
	ManualModeNote:add_action("            after leaving the warehouse", null)
	ManualModeNote:add_action("", null)
	ManualModeNote:add_action("               Bypass Entrance Delay:", null)
	ManualModeNote:add_action("            Skips the delay on entering", null)
	ManualModeNote:add_action("              the warehouse after sale", null)
	ManualModeNote:add_action("", null)
	ManualModeNote:add_action("                          xnxxSell:", null)
	ManualModeNote:add_action("   Pressing «X» will trigger «Instant Sell»;", null)
	ManualModeNote:add_action("  pressing «N» - «Bypass Entrance Delay»", null)

--Death Loop--

	DeathLoop = MoneyTool:add_submenu("Death Loop (Safe)")

		DefDelay3 = 1
		a88 = 1
	DeathLoop:add_array_item("Delay", {"Default", "Faster", "Flash"},
		function()
			return a88
		end,
		function(Del)
			if Del == 1 then
				DefDelay3 = 1
			elseif Del == 2 then
				DefDelay3 = 0.5
			elseif Del == 3 then
				DefDelay3 = 0.1
			end
			a88 = Del
		end)

			MoneyCount1 = 0
			DefCash1 = 0
			a89 = 0
	DeathLoop:add_int_range("Required Cash (0 - inf)", 50000, 0, 2147483646,
		function()
			return a89
		end,
		function(ReqCash)
			DefCash1 = ReqCash
			a89 = ReqCash
			MoneyCount1 = 0
		end)

			MoneyMade1 = 0
			a76 = false
		local function DeathLoop1()
			while a76 do
				globals.set_int(4536533 + 1, 2147483646)
				globals.set_int(4536533 + 7, 2147483647)
				globals.set_int(4536533 + 6, 0)
				globals.set_int(4536533 + 5, 0)
				globals.set_int(4536533 + 3, 0x610F9AB4)
				globals.set_int(4536533 + 2, 50000)
				if DefCash1 > 0 then
					if MoneyCount1 >= DefCash1 then
						a76 = false
						a89 = 0
						DefCash1 = 0
						break
					end
				end
				globals.set_int(4536533, 1)
				MoneyMade1 = MoneyMade1 + 50000
				MoneyCount1 = MoneyCount1 + 50000
				sleep(DefDelay3)
			end
		end
	DeathLoop:add_toggle("$50k/1s (AFK)", function() return a76 end, function() a76 = not a76 DeathLoop1() end)

	DeathLoop:add_bare_item("",
		function()
			return "Money Made: $" .. FormatMoney(MoneyMade1)
		end, null, null, null)

	DeathLoop:add_action("", null)

	DeathLoopNote = DeathLoop:add_submenu("Read Me")

	DeathLoopNote:add_action("                     Required Cash:", null)
	DeathLoopNote:add_action("     Сhoose amount of money you want", null)
	DeathLoopNote:add_action("               to get with AFK mode", null)
	DeathLoopNote:add_action("", null)
	DeathLoopNote:add_action("                       Money Made:", null)
	DeathLoopNote:add_action("     Reselect the option to see the result;", null)
	DeathLoopNote:add_action("       works better with «Default» delay", null)

--Easy Loop--

	EasyLoop = MoneyTool:add_submenu("Easy Loop (Safe) [Outdated]")

			a42 = false
		local function EzLoop()
			while a42 do
				globals.set_int(1966104, 1)
				sleep(1)
			end
		end
	EasyLoop:add_toggle("$5k/1s (AFK)", function() return a42 end, function() a42 = not a42 EzLoop() end)

--Night Loop--

	NightLoop = MoneyTool:add_submenu("Night Loop (Safe)")

			DefDelay4 = 0.6
			a64 = 1
	NightLoop:add_array_item("Delay", {"Default", "Fast", "Medium", "Slow"},
		function()
			return a64
		end,
		function(Del)
			if Del == 1 then
				DefDelay4 = 0.6
			elseif Del == 2 then
				DefDelay4 = 0.9
			elseif Del == 3 then
				DefDelay4 = 1.2
			elseif Del == 4 then
				DefDelay4 = 1.5
			end
			a64 = Del
		end)

			BypassTransError = false
	NightLoop:add_toggle("Bypass Transaction Error", function()	return BypassTransError end, function() BypassTransError = not BypassTransError end)

			MoneyCount2 = 0
			DefCash2 = 0
			a91 = 0
	NightLoop:add_int_range("Required Cash (0 - inf)", 300000, 0, 2147483646,
		function()
			return a91
		end,
		function(ReqCash)
			DefCash2 = ReqCash
			a91 = ReqCash
			MoneyCount2 = 0
		end)

			SafeAmount = 300000
			SafeCollection = 199 + 532 + 1
			SafeCapacity = 24227
			IncomeStart = 24204
			IncomeEnd = 24223
			MoneyMade2 = 0
			a44 = false
		local function NightLoop1()
			if not localplayer then return end
			while a44 do
				PlayerID = localplayer:get_player_id()
				SafeValue = 1853988 + 1 + (PlayerID * 867) + 267 + 354 + 5
				for i = IncomeStart, IncomeEnd do
					globals.set_int(FMG + i, SafeAmount)
				end
				globals.set_int(FMG + SafeCapacity, SafeAmount)
				stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
				sleep(DefDelay4)
				if globals.get_int(SafeValue) ~= 0 then
					if BypassTransError == true then
						globals.set_int(4536677, 0)
						globals.set_int(4536678, 0)
						globals.set_int(4536679, 0)
					end
					if DefCash2 > 0 then
						if MoneyCount2 >= DefCash2 then
							a44 = false
							a91 = 0
							DefCash2 = 0
							break
						end
					end
					AMN:set_int(SafeCollection, 1)
					MoneyMade2 = MoneyMade2 + 300000
					MoneyCount2 = MoneyCount2 + 300000
					sleep(DefDelay4)
				end
			end
		end
	NightLoop:add_toggle("$300k/2s (AFK)", function() return a44 end, function() a44 = not a44 NightLoop1() end)

	NightLoop:add_bare_item("",
		function()
			return "Money Made: $" .. FormatMoney(MoneyMade2)
		end, null, null, null)

	NightLoop:add_action("", null)

	NightLoopNote = NightLoop:add_submenu("Read Me")

	NightLoopNote:add_action("  Come inside your nightclub and activate", null)
	NightLoopNote:add_action("", null)
	NightLoopNote:add_action("                            Delay:", null)
	NightLoopNote:add_action("  Change this if you aren't getting money", null)
	NightLoopNote:add_action("", null)
	NightLoopNote:add_action("              Bypass Transaction Error:", null)
	NightLoopNote:add_action(" Toggle this if you're still getting an error", null)
	NightLoopNote:add_action("", null)
	NightLoopNote:add_action("                     Required Cash:", null)
	NightLoopNote:add_action("     Сhoose amount of money you want", null)
	NightLoopNote:add_action("               to get with AFK mode", null)
	NightLoopNote:add_action("", null)
	NightLoopNote:add_action("                       Money Made:", null)
	NightLoopNote:add_action("     Reselect the option to see the result;", null)
	NightLoopNote:add_action("       works better with «Default» delay", null)

--OP Loop--

	OPLoop = MoneyTool:add_submenu("OP Loop (Safe)")

			DefDelay5 = 1
			a87 = 1
	OPLoop:add_array_item("Delay", {"Default", "Faster", "Flash"},
		function()
			return a87
		end,
		function(Del)
			if Del == 1 then
				DefDelay5 = 1
			elseif Del == 2 then
				DefDelay5 = 0.5
			elseif Del == 3 then
				DefDelay5 = 0.1
			end
			a87 = Del
		end)

			MoneyCount3 = 0
			DefCash3 = 0
			a90 = 0
	OPLoop:add_int_range("Required Cash (0 - inf)", 1000000, 0, 2147483646,
		function()
			return a90
		end,
		function(ReqCash)
			DefCash3 = ReqCash
			a90 = ReqCash
			MoneyCount3 = 0
		end)

			MoneyMade3 = 0
			a75 = false
		local function OPLoop1()
			while a75 do
				globals.set_int(4536533 + 1, 2147483646)
				globals.set_int(4536533 + 7, 2147483647)
				globals.set_int(4536533 + 6, 0)
				globals.set_int(4536533 + 5, 0)
				globals.set_int(4536533 + 3, 0x615762F1)
				globals.set_int(4536533 + 2, 1000000)
				if DefCash3 > 0 then
					if MoneyCount3 >= DefCash3 then
						a75 = false
						a90 = 0
						DefCash3 = 0
						break
					end
				end
				globals.set_int(4536533, 1)
				MoneyMade3 = MoneyMade3 + 1000000
				MoneyCount3 = MoneyCount3 + 1000000
				sleep(DefDelay5)
			end
		end
	OPLoop:add_toggle("$1m/1s (AFK)", function() return a75 end, function() a75 = not a75 OPLoop1() end)

	OPLoop:add_bare_item("",
		function()
			return "Money Made: $" .. FormatMoney(MoneyMade3)
		end, null, null, null)

	OPLoop:add_action("", null)

	OPLoopNote = OPLoop:add_submenu("Read Me")

	OPLoopNote:add_action("                     Required Cash:", null)
	OPLoopNote:add_action("     Сhoose amount of money you want", null)
	OPLoopNote:add_action("               to get with AFK mode", null)
	OPLoopNote:add_action("", null)
	OPLoopNote:add_action("                       Money Made:", null)
	OPLoopNote:add_action("     Reselect the option to see the result;", null)
	OPLoopNote:add_action("       works better with «Default» delay", null)

--Orbital Loop--

	OrbitalRefund = MoneyTool:add_submenu("Orbital Loop (Detected)")

			a45 = false
		local function OrbitalLoop1()
			while a45 do
				globals.set_int(1969112, 2)
				sleep(3)
				globals.set_int(1969112, 0)
				sleep(30)
			end
		end
	OrbitalRefund:add_toggle("$500k/30s (AFK)", function() return a45 end, function() a45 = not a45 OrbitalLoop1() end)

---Unlock Tool---

	UnlockTool = SilentNight:add_submenu("♦ Unlock Tool")

--Character's Stats--

	CharactersStats = UnlockTool:add_submenu("Character's Stats (Safe)")

--Achievements--

	Achievements = CharactersStats:add_submenu("Achievements")

			AchievementController = 4542602 + 1
			a57 = false
		local function AchievementUnlocker()
			while a57 do
				for i = 1, 78 do
					globals.set_int(AchievementController, i)
				end
			end
		end
	Achievements:add_toggle("Unlock All", function() return a57 end, function() a57 = not a57 AchievementUnlocker() end)

	Achievements1b1 = Achievements:add_submenu("Unlock One By One")

	Achievements1b1:add_action("Welcome to Los Santos", function() globals.set_int(AchievementController, 1) end)
	Achievements1b1:add_action("A Friendship Resurrected", function() globals.set_int(AchievementController, 2) end)
	Achievements1b1:add_action("A Fair Day's Pay", function() globals.set_int(AchievementController, 3) end)
	Achievements1b1:add_action("The Moment of Truth", function() globals.set_int(AchievementController, 4) end)
	Achievements1b1:add_action("To Live or Die in Los Santos", function() globals.set_int(AchievementController, 5) end)
	Achievements1b1:add_action("Diamond Hard", function() globals.set_int(AchievementController, 6) end)
	Achievements1b1:add_action("Subversive", function() globals.set_int(AchievementController, 7) end)
	Achievements1b1:add_action("Blitzed", function() globals.set_int(AchievementController, 8) end)
	Achievements1b1:add_action("Small Town, Big Job", function() globals.set_int(AchievementController, 9) end)
	Achievements1b1:add_action("The Government Gimps", function() globals.set_int(AchievementController, 10) end)
	Achievements1b1:add_action("The Big One!", function() globals.set_int(AchievementController, 11) end)
	Achievements1b1:add_action("Solid Gold, Baby!", function() globals.set_int(AchievementController, 12) end)
	Achievements1b1:add_action("Career Criminal", function() globals.set_int(AchievementController, 13) end)
	Achievements1b1:add_action("San Andreas Sightseer", function() globals.set_int(AchievementController, 14) end)
	Achievements1b1:add_action("All's Fare in Love and War", function() globals.set_int(AchievementController, 15) end)
	Achievements1b1:add_action("TP Industries Arms Race", function() globals.set_int(AchievementController, 16) end)
	Achievements1b1:add_action("Multi-Disciplined", function() globals.set_int(AchievementController, 17) end)
	Achievements1b1:add_action("From Beyond the Stars", function() globals.set_int(AchievementController, 18) end)
	Achievements1b1:add_action("A Mystery, Solved", function() globals.set_int(AchievementController, 19) end)
	Achievements1b1:add_action("Waste Management", function() globals.set_int(AchievementController, 20) end)
	Achievements1b1:add_action("Red Mist", function() globals.set_int(AchievementController, 21) end)
	Achievements1b1:add_action("Show Off", function() globals.set_int(AchievementController, 22) end)
	Achievements1b1:add_action("Kifflom!", function() globals.set_int(AchievementController, 23) end)
	Achievements1b1:add_action("Three Man Army", function() globals.set_int(AchievementController, 24) end)
	Achievements1b1:add_action("Out of Your Depth", function() globals.set_int(AchievementController, 25) end)
	Achievements1b1:add_action("Altruist Acolyte", function() globals.set_int(AchievementController, 26) end)
	Achievements1b1:add_action("A Lot of Cheddar", function() globals.set_int(AchievementController, 27) end)
	Achievements1b1:add_action("Trading Pure Alpha", function() globals.set_int(AchievementController, 28) end)
	Achievements1b1:add_action("Pimp My Sidearm", function() globals.set_int(AchievementController, 29) end)
	Achievements1b1:add_action("Wanted: Alive Or Alive", function() globals.set_int(AchievementController, 30) end)
	Achievements1b1:add_action("Los Santos Customs", function() globals.set_int(AchievementController, 31) end)
	Achievements1b1:add_action("Close Shave", function() globals.set_int(AchievementController, 32) end)
	Achievements1b1:add_action("Off the Plane", function() globals.set_int(AchievementController, 33) end)
	Achievements1b1:add_action("Three-Bit Gangster", function() globals.set_int(AchievementController, 34) end)
	Achievements1b1:add_action("Making Moves", function() globals.set_int(AchievementController, 35) end)
	Achievements1b1:add_action("Above the Law", function() globals.set_int(AchievementController, 36) end)
	Achievements1b1:add_action("Numero Uno", function() globals.set_int(AchievementController, 37) end)
	Achievements1b1:add_action("The Midnight Club", function() globals.set_int(AchievementController, 38) end)
	Achievements1b1:add_action("Unnatural Selection", function() globals.set_int(AchievementController, 39) end)
	Achievements1b1:add_action("Backseat Driver", function() globals.set_int(AchievementController, 40) end)
	Achievements1b1:add_action("Run Like The Wind", function() globals.set_int(AchievementController, 41) end)
	Achievements1b1:add_action("Clean Sweep", function() globals.set_int(AchievementController, 42) end)
	Achievements1b1:add_action("Decorated", function() globals.set_int(AchievementController, 43) end)
	Achievements1b1:add_action("Stick Up Kid", function() globals.set_int(AchievementController, 44) end)
	Achievements1b1:add_action("Enjoy Your Stay", function() globals.set_int(AchievementController, 45) end)
	Achievements1b1:add_action("Crew Cut", function() globals.set_int(AchievementController, 46) end)
	Achievements1b1:add_action("Full Refund", function() globals.set_int(AchievementController, 47) end)
	Achievements1b1:add_action("Dialling Digits", function() globals.set_int(AchievementController, 48) end)
	Achievements1b1:add_action("American Dream", function() globals.set_int(AchievementController, 49) end)
	Achievements1b1:add_action("A New Perspective", function() globals.set_int(AchievementController, 50) end)
	Achievements1b1:add_action("Be Prepared", function() globals.set_int(AchievementController, 51) end)
	Achievements1b1:add_action("In the Name of Science", function() globals.set_int(AchievementController, 52) end)
	Achievements1b1:add_action("Dead Presidents", function() globals.set_int(AchievementController, 53) end)
	Achievements1b1:add_action("Parole Day", function() globals.set_int(AchievementController, 54) end)
	Achievements1b1:add_action("Shot Caller", function() globals.set_int(AchievementController, 55) end)
	Achievements1b1:add_action("Four Way", function() globals.set_int(AchievementController, 56) end)
	Achievements1b1:add_action("Live a Little", function() globals.set_int(AchievementController, 57) end)
	Achievements1b1:add_action("Can't Touch This", function() globals.set_int(AchievementController, 58) end)
	Achievements1b1:add_action("Mastermind", function() globals.set_int(AchievementController, 59) end)
	Achievements1b1:add_action("Vinewood Visionary", function() globals.set_int(AchievementController, 60) end)
	Achievements1b1:add_action("Majestic", function() globals.set_int(AchievementController, 61) end)
	Achievements1b1:add_action("Humans of Los Santos", function() globals.set_int(AchievementController, 62) end)
	Achievements1b1:add_action("First Time Director", function() globals.set_int(AchievementController, 63) end)
	Achievements1b1:add_action("Animal Lover", function() globals.set_int(AchievementController, 64) end)
	Achievements1b1:add_action("Ensemble Piece", function() globals.set_int(AchievementController, 65) end)
	Achievements1b1:add_action("Cult Movie", function() globals.set_int(AchievementController, 66) end)
	Achievements1b1:add_action("Location Scout", function() globals.set_int(AchievementController, 67) end)
	Achievements1b1:add_action("Method Actor", function() globals.set_int(AchievementController, 68) end)
	Achievements1b1:add_action("Cryptozoologist", function() globals.set_int(AchievementController, 69) end)
	Achievements1b1:add_action("Getting Started", function() globals.set_int(AchievementController, 70) end)
	Achievements1b1:add_action("The Data Breaches", function() globals.set_int(AchievementController, 71) end)
	Achievements1b1:add_action("The Bogdan Problem", function() globals.set_int(AchievementController, 72) end)
	Achievements1b1:add_action("The Doomsday Scenario", function() globals.set_int(AchievementController, 73) end)
	Achievements1b1:add_action("A World Worth Saving", function() globals.set_int(AchievementController, 74) end)
	Achievements1b1:add_action("Orbital Obliteration", function() globals.set_int(AchievementController, 75) end)
	Achievements1b1:add_action("Elitist", function() globals.set_int(AchievementController, 76) end)
	Achievements1b1:add_action("Masterminds", function() globals.set_int(AchievementController, 77) end)

	Achievements:add_action("", null)

	AchievementsNote = Achievements:add_submenu("Read Me")

	AchievementsNote:add_action("                         Unlock All:", null)
	AchievementsNote:add_action(" Unlocks all achievements auto; ≈10 mins;", null)
	AchievementsNote:add_action("               to turn off the option,", null)
	AchievementsNote:add_action("     close the menu via «Menu Settings»", null)

--Awards--

	Awards = CharactersStats:add_submenu("Awards")

	Awards:add_action("Unlock All",
		function()
			stats.set_int(MPX .. "AWD_FM_DM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_MVP", 50)
			stats.set_int(MPX .. "AWD_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
			stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", true)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
			stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", true)
			stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 25)
			stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", true)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
			stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", true)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
			stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", true)
			stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 10)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
			stats.set_int(MPX .. "AWD_NO_ARMWRESTLING_WINS", 25)
			stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 25)
			stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 25)
			stats.set_int(MPX .. "AWD_FM_GOLF_WON", 25)
			stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", true)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_STASETWIN", true)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
			stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", true)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
			stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
			stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
			stats.set_int(MPX .. "AIR_LAUNCHES_OVER_40M", 25)
			stats.set_int(MPX .. "AWD_CARS_EXPORTED", 50)
			stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 25)
			stats.set_int(MPX .. "TOTAL_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_RACES_LOST", 250)
			stats.set_int(MPX .. "TOTAL_CUSTOM_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_WON", 500)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_WON", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_WINS", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_LOSSES", 250)
			stats.set_int(MPX .. "TENNIS_MATCHES_WON", 500)
			stats.set_int(MPX .. "TENNIS_MATCHES_LOST", 250)
			stats.set_int(MPX .. "GOLF_WINS", 500)
			stats.set_int(MPX .. "GOLF_LOSSES", 250)
			stats.set_int(MPX .. "DARTS_TOTAL_WINS", 500)
			stats.set_int(MPX .. "DARTS_TOTAL_MATCHES", 750)
			stats.set_int(MPX .. "SHOOTINGRANGE_TOTAL_MATCH", 800)
			stats.set_int(MPX .. "BJ_WINS", 500)
			stats.set_int(MPX .. "BJ_LOST", 250)
			stats.set_int(MPX .. "RACE_2_POINT_WINS", 500)
			stats.set_int(MPX .. "RACE_2_POINT_LOST", 250)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "MISSIONS_CREATED", 500)
			stats.set_int(MPX .. "LTS_CREATED", 500)
			stats.set_int(MPX .. "FM_MISSION_LIKES", 1500)
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTDM", true)
			stats.set_int(MPX .. "CR_DIFFERENT_DM", 25)
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTRACES", true)
			stats.set_int(MPX .. "CR_DIFFERENT_RACES", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_20M", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_50M", 25)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
			stats.set_bool(MPX .. "AWD_FMATTGANGHQ", true)
			stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", true)
			stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 25)
			stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", true)
			stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 25)
			stats.set_int(MPX .. "AWD_FMBBETWIN", 50000)
			stats.set_int(MPX .. "AWD_LAPDANCES", 25)
			stats.set_int(MPX .. "AWD_FMCRATEDROPS", 25)
			stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", true)
			stats.set_bool(MPX .. "AWD_FM25DIFITEMSCLOTHES", true)
			stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 25)
			stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", true)
			stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", true)
			stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", true)
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 50)
			stats.set_bool(MPX .. "AWD_STORE_20_CAR_IN_GARAGES", true)
			stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
			stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", true)
			stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", true)
			stats.set_int(MPX .. "AWD_FM_CR_DM_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_RACES_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_PLAYED_BY_PEEP", 1598)
			stats.set_int(MPX .. "AWD_FM_CR_MISSION_SCORE", 100)
			stats.set_bool(MPX .. "CL_DRIVE_RALLY", true)
			stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", true)
			stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", true)
			stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", true)
			stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", true)
			stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", true)
			stats.set_bool(MPX .. "CL_CALL_MERCENARIES", true)
			stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", true)
			stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", true)
			stats.set_bool(MPX .. "CL_FILL_TITAN", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_BUY_INSURANCE", true)
			stats.set_bool(MPX .. "CL_BUY_GARAGE", true)
			stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_FRIEND", true)
			stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", true)
			stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", true)
			stats.set_bool(MPX .. "FM_INTRO_CUT_DONE", true)
			stats.set_bool(MPX .. "FM_INTRO_MISS_DONE", true)
			stats.set_bool(MPX .. "SHOOTINGRANGE_SEEN_TUT", true)
			stats.set_bool(MPX .. "TENNIS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "DARTS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "ARMWRESTLING_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "HAS_WATCHED_BENNY_CUTSCE", true)
			stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 100)
			stats.set_int(MPX .. "BOUNTSONU", 200)
			stats.set_int(MPX .. "BOUNTPLACED", 500)
			stats.set_int(MPX .. "BETAMOUNT", 500)
			stats.set_int(MPX .. "CRARMWREST", 500)
			stats.set_int(MPX .. "CRBASEJUMP", 500)
			stats.set_int(MPX .. "CRDARTS", 500)
			stats.set_int(MPX .. "CRDM", 500)
			stats.set_int(MPX .. "CRGANGHIDE", 500)
			stats.set_int(MPX .. "CRGOLF", 500)
			stats.set_int(MPX .. "CRHORDE", 500)
			stats.set_int(MPX .. "CRMISSION", 500)
			stats.set_int(MPX .. "CRSHOOTRNG", 500)
			stats.set_int(MPX .. "CRTENNIS", 500)
			stats.set_int(MPX .. "NO_TIMES_CINEMA", 500)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_4_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_10_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE4", -1)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_BLUE", 1000)
			stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", -1)
			for i = 2, 19 do
				stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, -1)
			end
			for j = 1, 19 do
				stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", -1)
			end
			for m = 1, 41 do
				stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", -1)
			end
			for l = 2, 41 do
				stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, -1)
			end
			stats.set_int(MPX .. "AWD_FMTIME5STARWANTED", 120)
			stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
			stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 25)
			stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 500)
			stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 25)
			stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 20)
			stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 25)
			stats.set_int(MPX .. "AWD_ENEMYDRIVEBYKILLS", 100)
			stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", 18000000)
			stats.set_int(MPX .. "CARS_COPS_EXPLODED", 300)
			stats.set_int(MPX .. "BIKES_EXPLODED", 100)
			stats.set_int(MPX .. "BOATS_EXPLODED", 168)
			stats.set_int(MPX .. "HELIS_EXPLODED", 98)
			stats.set_int(MPX .. "PLANES_EXPLODED", 138)
			stats.set_int(MPX .. "QUADBIKE_EXPLODED", 50)
			stats.set_int(MPX .. "BICYCLE_EXPLODED", 48)
			stats.set_int(MPX .. "SUBMARINE_EXPLODED", 28)
			stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 500)
			stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 300)
			stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 300)
			stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 1000)
			stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 700)
			stats.set_int(MPX .. "MCKILLS", 500)
			stats.set_int(MPX .. "MCDEATHS", 700)
			stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 700)
			stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
			stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "GHKILLS", 500)
			stats.set_int(MPX .. "HORDELVL", 10)
			stats.set_int(MPX .. "HORDKILLS", 500)
			stats.set_int(MPX .. "UNIQUECRATES", 500)
			stats.set_int(MPX .. "BJWINS", 500)
			stats.set_int(MPX .. "HORDEWINS", 500)
			stats.set_int(MPX .. "MCMWINS", 500)
			stats.set_int(MPX .. "GANGHIDWINS", 500)
			stats.set_int(MPX .. "KILLS", 800)
			stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 100)
			stats.set_int(MPX .. "SHOTS", 1000)
			stats.set_int(MPX .. "HEADSHOTS", 100)
			stats.set_int(MPX .. "KILLS_ARMED", 650)
			stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 100)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "KILLS_STEALTH", 100)
			stats.set_int(MPX .. "KILLS_INNOCENTS", 500)
			stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_BY_OTHERS", 100)
			stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 500)
			stats.set_int(MPX .. "ARCHENEMY_KILLS", 500)
			stats.set_int(MPX .. "KILLS_COP", 4500)
			stats.set_int(MPX .. "KILLS_SWAT", 500)
			stats.set_int(MPX .. "STARS_ATTAINED", 5000)
			stats.set_int(MPX .. "STARS_EVADED", 4000)
			stats.set_int(MPX .. "VEHEXPORTED", 500)
			stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 100)
			stats.set_int(MPX .. "CR_GANGATTACK_CITY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_LOST", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 1000)
			stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 500)
			stats.set_int(MPX .. "DIED_IN_DROWNING", 833)
			stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 833)
			stats.set_int(MPX .. "DIED_IN_EXPLOSION", 833)
			stats.set_int(MPX .. "DIED_IN_FALL", 833)
			stats.set_int(MPX .. "DIED_IN_FIRE", 833)
			stats.set_int(MPX .. "DIED_IN_ROAD", 833)
			stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "SMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "RPG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PLAYER_HEADSHOTS", 500)
			stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_50_VEHICLES_BLOWNUP", 500)
			stats.set_int(MPX .. "CARS_EXPLODED", 500)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 30)
			stats.set_int(MPX .. "AWD_PASSENGERTIME", 4)
			stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 4)
			stats.set_int(MPX .. "AWD_VEHICLE_JUMP_OVER_40M", 25)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
			stats.set_int(MPX .. "NO_CARS_REPAIR", 1000)
			stats.set_int(MPX .. "VEHICLES_SPRAYED", 500)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 500)
			stats.set_int(MPX .. "USJS_FOUND", 50)
			stats.set_int(MPX .. "USJS_COMPLETED", 50)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
			stats.set_int(MPX .. "CRDEADLINE", 5)
			stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 2069146067)
			stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 1000)
			stats.set_int(MPX .. "RACES_WON", 50)
			stats.set_int(MPX .. "COUNT_HOTRING_RACE", 20)
			stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", true)
			stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", true)
			stats.set_int(MPX .. "AWD_100_HEADSHOTS", 500)
			stats.set_int(MPX .. "AWD_FMOVERALLKILLS", 1000)
			stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 25)
			stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 50)
			stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 100)
			stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 50)
			stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 500)
			stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", true)
			stats.set_int(MPX .. "AWD_FMREVENGEKILLSDM", 50)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
			stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 100)
			stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 50)
			stats.set_int(MPX .. "AWD_100_KILLS_PISTOL", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SMG", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SHOTGUN", 500)
			stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SNIPER", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_25_KILLS_STICKYBOMBS", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_GRENADES", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_ROCKETLAUNCH", 50)
			stats.set_int(MPX .. "AWD_20_KILLS_MELEE", 50)
			stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
			stats.set_int(MPX .. "MELEEKILLS", 700)
			stats.set_int(MPX .. "HITS", 10000)
			stats.set_int(MPX .. "DEATHS", 499)
			stats.set_int(MPX .. "HIGHEST_SKITTLES", 900)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS", 1000)
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
			stats.set_int(MPX .. "AWD_COMPLETE_HEIST_NOT_DIE", -1)
			stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
			stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
			stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
			stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", true)
			stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 25)
			stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", true)
			stats.set_int(MPX .. "HEIST_COMPLETION", 25)
			stats.set_int(MPX .. "HEISTS_ORGANISED", -1)
			stats.set_int(MPX .. "HEIST_START", -1)
			stats.set_int(MPX .. "HEIST_END", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_PRISON", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_HUMANE", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_NARC", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_ORNATE", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_1", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_2", -1)
			stats.set_int(MPX .. "CR_FLEECA_FINALE", -1)
			stats.set_int(MPX .. "CR_PRISON_PLANE", -1)
			stats.set_int(MPX .. "CR_PRISON_BUS", -1)
			stats.set_int(MPX .. "CR_PRISON_STATION", -1)
			stats.set_int(MPX .. "CR_PRISON_UNFINISHED_BIZ", -1)
			stats.set_int(MPX .. "CR_PRISON_FINALE", -1)
			stats.set_int(MPX .. "CR_HUMANE_KEY_CODES", -1)
			stats.set_int(MPX .. "CR_HUMANE_ARMORDILLOS", -1)
			stats.set_int(MPX .. "CR_HUMANE_EMP", -1)
			stats.set_int(MPX .. "CR_HUMANE_VALKYRIE", -1)
			stats.set_int(MPX .. "CR_HUMANE_FINALE", -1)
			stats.set_int(MPX .. "CR_NARC_COKE", -1)
			stats.set_int(MPX .. "CR_NARC_TRASH_TRUCK", -1)
			stats.set_int(MPX .. "CR_NARC_BIKERS", -1)
			stats.set_int(MPX .. "CR_NARC_WEED", -1)
			stats.set_int(MPX .. "CR_NARC_STEAL_METH", -1)
			stats.set_int(MPX .. "CR_NARC_FINALE", -1)
			stats.set_int(MPX .. "CR_PACIFIC_TRUCKS", -1)
			stats.set_int(MPX .. "CR_PACIFIC_WITSEC", -1)
			stats.set_int(MPX .. "CR_PACIFIC_HACK", -1)
			stats.set_int(MPX .. "CR_PACIFIC_BIKES", -1)
			stats.set_int(MPX .. "CR_PACIFIC_CONVOY", -1)
			stats.set_int(MPX .. "CR_PACIFIC_FINALE", -1)
			stats.set_int(MPX .. "HEIST_ACH_TRACKER", -1)
			stats.set_int(MPX .. "WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_bool(MPX .. "AWD_FLEECA_FIN", true)
			stats.set_bool(MPX .. "AWD_PRISON_FIN", true)
			stats.set_bool(MPX .. "AWD_HUMANE_FIN", true)
			stats.set_bool(MPX .. "AWD_SERIESA_FIN", true)
			stats.set_bool(MPX .. "AWD_PACIFIC_FIN", true)
			stats.set_bool(MPX .. "AWD_HST_ORDER", true)
			stats.set_bool(MPX .. "AWD_COMPLET_HEIST_MEM", true)
			stats.set_bool(MPX .. "AWD_COMPLET_HEIST_1STPER", true)
			stats.set_bool(MPX .. "AWD_HST_SAME_TEAM", true)
			stats.set_bool(MPX .. "AWD_HST_ULT_CHAL", true)
			stats.set_bool(MPX .. "AWD_MATCHING_OUTFIT_HEIST", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_PRINT", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_1", true)
			stats.set_bool(MPX .. "HEIST_PRE_PLAN_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_FINALE", true)
			stats.set_bool(MPX .. "HEIST_IS_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_STRAND_INTRO_DONE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_ORNATE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_PRISON", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_BIOLAB", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_NARCOTIC", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_AWARD_DONE_PREP", true)
			stats.set_bool(MPX .. "HEIST_AWARD_BOUGHT_IN", true)
			stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -1)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -229384)
			stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1)
			stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", -1)
			stats.set_int(MPX .. "GANGOPS_ALLINORDER", 100)
			stats.set_int(MPX .. "GANGOPS_LOYALTY", 100)
			stats.set_int(MPX .. "GANGOPS_CRIMMASMD", 100)
			stats.set_int(MPX .. "GANGOPS_LOYALTY2", 100)
			stats.set_int(MPX .. "GANGOPS_LOYALTY3", 100)
			stats.set_int(MPX .. "GANGOPS_CRIMMASMD2", 100)
			stats.set_int(MPX .. "GANGOPS_CRIMMASMD3", 100)
			stats.set_int(MPX .. "GANGOPS_SUPPORT", 100)
			stats.set_int(MPX .. "CR_GANGOP_MORGUE", 10)
			stats.set_int(MPX .. "CR_GANGOP_DELUXO", 10)
			stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 10)
			stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 10)
			stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 10)
			stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 10)
			stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 10)
			stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 10)
			stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 10)
			stats.set_bool(MPX .. "AWD_GANGOPS_IAA", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_SUBMARINE", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_MISSILE", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_ALLINORDER", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_LOYALTY", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_LOYALTY2", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_LOYALTY3", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_CRIMMASMD", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_CRIMMASMD2", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_CRIMMASMD3", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_SUPPORT", true)
			for j = 0, 63 do
				stats.set_bool_masked(MPX .. "GANGOPSPSTAT_BOOL0", true, j, MPX)
			end
			stats.set_masked_int(MPX.."DLCSMUGCHARPSTAT_INT260", 3, 16, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT260", 3, 24, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT260", 3, 32, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT260", 3, 40, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT260", 3, 48, 8)
			stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 120)
			stats.set_int(MPX .. "AWD_CLUB_DRUNK", 200)
			stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 700)
			stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 700)
			stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 5721002)
			stats.set_int(MPX .. "HUB_SALES_COMPLETED", 1001)
			stats.set_int(MPX .. "HUB_EARNINGS", 20721002)
			stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 100)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 784672)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 507822)
			stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 120)
			stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 120)
			stats.set_int(MPX .. "DANCETODIFFDJS", 4)
			stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_TOTAL", 20)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_MISSION", -1)
			stats.set_int(MPX .. "CLUB_CONTRABAND_MISSION", 1000)
			stats.set_int(MPX .. "HUB_CONTRABAND_MISSION", 1000)
			stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", true)
			stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", true)
			stats.set_bool(MPX .. "AWD_CLUB_COORD", true)
			for j = 0, 63 do
				stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL0", true, j, MPX)
				stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL1", true, j, MPX)
			end
			if stats.get_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
				stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
			end
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 50, 8, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 100, 16, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 20, 24, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 80, 32, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 60, 40, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 40, 48, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 10, 56, 8)
			stats.set_int(MPX .. "ARN_BS_TRINKET_TICKERS", -1)
			stats.set_int(MPX .. "ARN_BS_TRINKET_SAVED", -1)
			stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 50)
			stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 50)
			stats.set_int(MPX .. "AWD_READY_FOR_WAR", 50)
			stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 50)
			stats.set_int(MPX .. "AWD_SPINNER", 50)
			stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 50)
			stats.set_int(MPX .. "AWD_MASTER_BANDITO", 50)
			stats.set_int(MPX .. "AWD_SITTING_DUCK", 50)
			stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 50)
			stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 50)
			stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 50)
			stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 200)
			stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 50)
			stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 1000000)
			stats.set_int(MPX .. "AWD_TIME_SERVED", 1000)
			stats.set_int(MPX .. "AWD_TOP_SCORE", 55000)
			stats.set_int(MPX .. "AWD_CAREER_WINNER", 1000)
			stats.set_int(MPX .. "ARENAWARS_SP", 0)
			stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 20)
			stats.set_int(MPX .. "ARENAWARS_SP_LIFETIME", 100)
			stats.set_int(MPX .. "ARENAWARS_AP", 0)
			stats.set_int(MPX .. "ARENAWARS_AP_TIER", 1000)
			stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 5055000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_UNLK", -1)
			stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_APOC", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_CONS", 1000)
			stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 1000)
			stats.set_int(MPX .. "ARN_W_DETONATION", 1000)
			stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 1000)
			stats.set_int(MPX .. "ARN_W_CTF", 1000)
			stats.set_int(MPX .. "ARN_W_TAG_TEAM", 1000)
			stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 1000)
			stats.set_int(MPX .. "ARN_W_CARNAGE", 1000)
			stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 1000)
			stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 1000)
			stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 500)
			stats.set_int(MPX .. "ARN_L_DETONATION", 500)
			stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 500)
			stats.set_int(MPX .. "ARN_L_CTF", 500)
			stats.set_int(MPX .. "ARN_L_TAG_TEAM", 500)
			stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 500)
			stats.set_int(MPX .. "ARN_L_CARNAGE", 500)
			stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 500)
			stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 500)
			stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 500)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 1000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 1000)
			stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 86400000)
			stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 1000)
			stats.set_int(MPX .. "ARN_SMOKE", 1000)
			stats.set_int(MPX .. "ARN_DRINK", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN4", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB2", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB3", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR4", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI5", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI", 61000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR380", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3802", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3803", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 1000)
			stats.set_bool(MPX .. "AWD_BEGINNER", true)
			stats.set_bool(MPX .. "AWD_FIELD_FILLER", true)
			stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", true)
			stats.set_bool(MPX .. "AWD_LEARNER", true)
			stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", true)
			stats.set_bool(MPX .. "AWD_THE_ROOKIE", true)
			stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", true)
			stats.set_bool(MPX .. "AWD_GEAR_HEAD", true)
			stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", true)
			stats.set_bool(MPX .. "AWD_HOT_LAP", true)
			stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", true)
			stats.set_bool(MPX .. "AWD_PAINT_TRADER", true)
			stats.set_bool(MPX .. "AWD_SHUNTER", true)
			stats.set_bool(MPX .. "AWD_JOCK", true)
			stats.set_bool(MPX .. "AWD_WARRIOR", true)
			stats.set_bool(MPX .. "AWD_T_BONE", true)
			stats.set_bool(MPX .. "AWD_MAYHEM", true)
			stats.set_bool(MPX .. "AWD_WRECKER", true)
			stats.set_bool(MPX .. "AWD_CRASH_COURSE", true)
			stats.set_bool(MPX .. "AWD_ARENA_LEGEND", true)
			stats.set_bool(MPX .. "AWD_PEGASUS", true)
			stats.set_bool(MPX .. "AWD_UNSTOPPABLE", true)
			stats.set_bool(MPX .. "AWD_CONTACT_SPORT", true)
			stats.set_masked_int(MPX.."ARENAWARSPSTAT_INT", 1, 35, 8)
			for i = 0, 8 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_int(MPX .. "AWD_ODD_JOBS", 50)
			stats.set_int(MPX .. "VCM_FLOW_PROGRESS", -1)
			stats.set_int(MPX .. "VCM_STORY_PROGRESS", 5)
			stats.set_bool(MPX .. "AWD_FIRST_TIME1", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME2", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME3", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME4", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME5", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME6", true)
			stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", true)
			stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", true)
			stats.set_bool(MPX .. "AWD_LEADER", true)
			stats.set_bool(MPX .. "AWD_SURVIVALIST", true)
			Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD")
			if Paragon == true then
				stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", true)
			else
				stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
			end
			for i = 0, 6 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_int(MPX .. "CAS_HEIST_NOTS", -1)
			stats.set_int(MPX .. "CAS_HEIST_FLOW", -1)
			stats.set_int(MPX .. "SIGNAL_JAMMERS_COLLECTED", 50)
			stats.set_int(MPX .. "AWD_PREPARATION", 40)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE0", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE1", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE2", -1)
			stats.set_int(MPX .. "H3_VEHICLESUSED", -1)
			stats.set_int(MPX .. "H3_CR_STEALTH_1A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2B_RAPP", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2C_SIDE", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_3A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_4A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_5A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_1A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_4A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_5A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_1A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A1", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A2", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2BP", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2C", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_3A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_4A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_5A", 100)
			stats.set_int(MPX .. "CR_ORDER", 100)
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAPE", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", true)
			stats.set_bool(MPX .. "HELP_FURIA", true)
			stats.set_bool(MPX .. "HELP_MINITAN", true)
			stats.set_bool(MPX .. "HELP_YOSEMITE2", true)
			stats.set_bool(MPX .. "HELP_ZHABA", true)
			stats.set_bool(MPX .. "HELP_IMORGEN", true)
			stats.set_bool(MPX .. "HELP_SULTAN2", true)
			stats.set_bool(MPX .. "HELP_VAGRANT", true)
			stats.set_bool(MPX .. "HELP_VSTR", true)
			stats.set_bool(MPX .. "HELP_STRYDER", true)
			stats.set_bool(MPX .. "HELP_SUGOI", true)
			stats.set_bool(MPX .. "HELP_KANJO", true)
			stats.set_bool(MPX .. "HELP_FORMULA", true)
			stats.set_bool(MPX .. "HELP_FORMULA2", true)
			stats.set_bool(MPX .. "HELP_JB7002", true)
			for i = 0, 4 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_int(MPX .. "AWD_PREPARATION", 50)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 50)
			stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", -1)
			stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", -1)
			stats.set_int(MPX .. "IAP_MAX_MOON_DIST", 2147483647)
			stats.set_int(MPX .. "SCGW_INITIALS_0", 69644)
			stats.set_int(MPX .. "SCGW_INITIALS_1", 50333)
			stats.set_int(MPX .. "SCGW_INITIALS_2", 63512)
			stats.set_int(MPX .. "SCGW_INITIALS_3", 46136)
			stats.set_int(MPX .. "SCGW_INITIALS_4", 21638)
			stats.set_int(MPX .. "SCGW_INITIALS_5", 2133)
			stats.set_int(MPX .. "SCGW_INITIALS_6", 1215)
			stats.set_int(MPX .. "SCGW_INITIALS_7", 2444)
			stats.set_int(MPX .. "SCGW_INITIALS_8", 38023)
			stats.set_int(MPX .. "SCGW_INITIALS_9", 2233)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_0",0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_1", 64)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_2", 8457)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_3", 91275)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_4", 53260)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_5", 78663)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_6", 25103)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_7", 102401)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_8", 12672)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_9", 74380)
			stats.set_int(MPX .. "FOOTAGE_SCORE_0", 284544)
			stats.set_int(MPX .. "FOOTAGE_SCORE_1", 275758)
			stats.set_int(MPX .. "FOOTAGE_SCORE_2", 100000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_3", 90000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_4", 80000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_5", 70000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_6", 60000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_7", 50000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_8", 40000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_9", 30000)
			for i = 0, 9 do
				stats.set_int(MPX .. "IAP_INITIALS_" .. i, 50)
				stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
				stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
				stats.set_int(MPX .. "SCGW_SCORE_" .. i, 50)
				stats.set_int(MPX .. "DG_DEFENDER_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "DG_DEFENDER_SCORE_" .. i, 50)
				stats.set_int(MPX .. "DG_MONKEY_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "DG_MONKEY_SCORE_" .. i, 50)
				stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "DG_PENETRATOR_SCORE_" .. i, 50)
				stats.set_int(MPX .. "GGSM_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "GGSM_SCORE_" .. i, 50)
				stats.set_int(MPX .. "TWR_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "TWR_SCORE_" .. i, 50)
			end
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAP", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_0", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_1", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_2", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_3", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_4", true)
			stats.set_bool(MPX .. "IAP_GOLD_TANK", true)
			stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", true)
			for j = 290449, 290468 do
				globals.set_int(j, 1)
			end
			for i = 0, 4 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			for i = 0, 6 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_QUBISM", true)
			stats.set_bool(MPX .. "AWD_QUIBITS", true)
			stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "AWD_GOFOR11TH", true)
			stats.set_masked_int(MPX.."SU20PSTAT_INT", 1, 35, 8)
			for i = 0, 1 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "SU20PSTAT_BOOL" .. i, true, j, MPX)
					stats.set_bool_masked(MPX.."SU20TATTOOSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_bool(MPX .. "AWD_INTELGATHER", true)
			stats.set_bool(MPX .. "AWD_COMPOUNDINFILT", true)
			stats.set_bool(MPX .. "AWD_LOOT_FINDER", true)
			stats.set_bool(MPX .. "AWD_MAX_DISRUPT", true)
			stats.set_bool(MPX .. "AWD_THE_ISLAND_HEIST", true)
			stats.set_bool(MPX .. "AWD_GOING_ALONE", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_PRO_THIEF", true)
			stats.set_bool(MPX .. "AWD_CAT_BURGLAR", true)
			stats.set_bool(MPX .. "AWD_ONE_OF_THEM", true)
			stats.set_bool(MPX .. "AWD_GOLDEN_GUN", true)
			stats.set_bool(MPX .. "AWD_ELITE_THIEF", true)
			stats.set_bool(MPX .. "AWD_PROFESSIONAL", true)
			stats.set_bool(MPX .. "AWD_HELPING_OUT", true)
			stats.set_bool(MPX .. "AWD_COURIER", true)
			stats.set_bool(MPX .. "AWD_PARTY_VIBES", true)
			stats.set_bool(MPX .. "AWD_HELPING_HAND", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_VETIR", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_LONGFIN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ANNIH", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ALKONOS", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_PATROLB", true)
			stats.set_int(MPX .. "AWD_LOSTANDFOUND", 500000)
			stats.set_int(MPX .. "AWD_SUNSET", 1800000)
			stats.set_int(MPX .. "AWD_TREASURE_HUNTER", 1000000)
			stats.set_int(MPX .. "AWD_WRECK_DIVING", 1000000)
			stats.set_int(MPX .. "AWD_KEINEMUSIK", 1800000)
			stats.set_int(MPX .. "AWD_PALMS_TRAX", 1800000)
			stats.set_int(MPX .. "AWD_MOODYMANN", 1800000)
			stats.set_int(MPX .. "AWD_FILL_YOUR_BAGS", 1000000000)
			stats.set_int(MPX .. "AWD_WELL_PREPARED", 80)
			stats.set_int(MPX .. "H4_H4_DJ_MISSIONS", -1)
			stats.set_int(MPX .. "H4CNF_APPROACH", -1)
			stats.set_int(MPX .. "H4_MISSIONS", -1)
			stats.set_int(MPX .. "H4_PLAYTHROUGH_STATUS", 100)
			for i = 0, 2 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "HISLANDPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 100)
			stats.set_int(MPX .. "AWD_SPRINTRACER", 50)
			stats.set_int(MPX .. "AWD_STREETRACER", 50)
			stats.set_int(MPX .. "AWD_PURSUITRACER", 50)
			stats.set_int(MPX .. "AWD_TEST_CAR", 240)
			stats.set_int(MPX .. "AWD_AUTO_SHOP", 50)
			stats.set_int(MPX .. "AWD_GROUNDWORK", 40)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 100)
			stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 100)
			stats.set_bool(MPX .. "AWD_CAR_CLUB", true)
			stats.set_bool(MPX .. "AWD_PRO_CAR_EXPORT", true)
			stats.set_bool(MPX .. "AWD_UNION_DEPOSITORY", true)
			stats.set_bool(MPX .. "AWD_MILITARY_CONVOY", true)
			stats.set_bool(MPX .. "AWD_FLEECA_BANK", true)
			stats.set_bool(MPX .. "AWD_FREIGHT_TRAIN", true)
			stats.set_bool(MPX .. "AWD_BOLINGBROKE_ASS", true)
			stats.set_bool(MPX .. "AWD_IAA_RAID", true)
			stats.set_bool(MPX .. "AWD_METH_JOB", true)
			stats.set_bool(MPX .. "AWD_BUNKER_RAID", true)
			stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", true)
			stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", true)
			stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", true)
			stats.set_bool(MPX .. "AWD_DIRECTOR", true)
			for i = 0, 8 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "TUNERPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			stats.set_int(MPX .. "AWD_CONTRACTOR", 50)
			stats.set_int(MPX .. "AWD_COLD_CALLER", 50)
			stats.set_int(MPX .. "AWD_PRODUCER", 60)
			stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", -1)
			stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
			stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
			stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
			stats.set_int(MPX .. "FIXER_COUNT", 510)
			stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", 85)
			stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", 85)
			stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", 85)
			stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", 85)
			stats.set_int(MPX .. "FIXER_EARNINGS", 19734860)
			stats.set_bool(MPX .. "AWD_TEEING_OFF", true)
			stats.set_bool(MPX .. "AWD_PARTY_NIGHT", true)
			stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", true)
			stats.set_bool(MPX .. "AWD_HOOD_PASS", true)
			stats.set_bool(MPX .. "AWD_STUDIO_TOUR", true)
			stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", true)
			stats.set_bool(MPX .. "AWD_BACKUP", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_1", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_2", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_3", true)
			stats.set_bool(MPX .. "AWD_CONTR_KILLER", true)
			stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", true)
			stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", true)
			stats.set_bool(MPX .. "AWD_ACELIQUOR", true)
			stats.set_bool(MPX .. "AWD_TRUCKAMBUSH", true)
			stats.set_bool(MPX .. "AWD_LOSTCAMPREV", true)
			stats.set_bool(MPX .. "AWD_ACIDTRIP", true)
			stats.set_bool(MPX .. "AWD_HIPPYRIVALS", true)
			stats.set_bool(MPX .. "AWD_TRAINCRASH", true)
			stats.set_bool(MPX .. "AWD_BACKUPB", true)
			stats.set_bool(MPX .. "AWD_GETSTARTED", true)
			stats.set_bool(MPX .. "AWD_CHEMREACTION", true)
			stats.set_bool(MPX .. "AAWD_WAREHODEFEND", true)
			stats.set_bool(MPX .. "AWD_ATTACKINVEST", true)
			stats.set_bool(MPX .. "AWD_RESCUECOOK", true)
			stats.set_bool(MPX .. "AWD_DRUGTRIPREHAB", true)
			stats.set_bool(MPX .. "AWD_CARGOPLANE", true)
			stats.set_bool(MPX .. "AWD_BACKUPB2", true)
			stats.set_bool(MPX .. "AWD_TAXISTAR", true)
			stats.set_int(MPX .. "AWD_RUNRABBITRUN", 5)
			stats.set_int(MPX .. "AWD_CALLME", 50)
			stats.set_int(MPX .. "AWD_CHEMCOMPOUNDS", 50)
			for j = 0, 63 do
				stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL0", true, j, MPX)
				stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, j, MPX)
				stats.set_bool_masked(MPX .. "FIXERTATTOOSTAT_BOOL0", true, j, MPX)
			end
		end)

	Awards1b1 = Awards:add_submenu("Unlock One By One")

	Awards1b1:add_action("Victory",
		function()
			stats.set_int(MPX .. "AWD_FM_DM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_MVP", 50)
			stats.set_int(MPX .. "AWD_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
			stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", true)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
			stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", true)
			stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 25)
			stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", true)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
			stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", true)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
			stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", true)
			stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 10)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
			stats.set_int(MPX .. "AWD_NO_ARMWRESTLING_WINS", 25)
			stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 25)
			stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 25)
			stats.set_int(MPX .. "AWD_FM_GOLF_WON", 25)
			stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", true)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_STASETWIN", true)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
			stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", true)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
			stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
			stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
			stats.set_int(MPX .. "AIR_LAUNCHES_OVER_40M", 25)
			stats.set_int(MPX .. "AWD_CARS_EXPORTED", 50)
			stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 25)
			stats.set_int(MPX .. "TOTAL_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_RACES_LOST", 250)
			stats.set_int(MPX .. "TOTAL_CUSTOM_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_WON", 500)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_WON", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_WINS", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_LOSSES", 250)
			stats.set_int(MPX .. "TENNIS_MATCHES_WON", 500)
			stats.set_int(MPX .. "TENNIS_MATCHES_LOST", 250)
			stats.set_int(MPX .. "GOLF_WINS", 500)
			stats.set_int(MPX .. "GOLF_LOSSES", 250)
			stats.set_int(MPX .. "DARTS_TOTAL_WINS", 500)
			stats.set_int(MPX .. "DARTS_TOTAL_MATCHES", 750)
			stats.set_int(MPX .. "SHOOTINGRANGE_TOTAL_MATCH", 800)
			stats.set_int(MPX .. "BJ_WINS", 500)
			stats.set_int(MPX .. "BJ_LOST", 250)
			stats.set_int(MPX .. "RACE_2_POINT_WINS", 500)
			stats.set_int(MPX .. "RACE_2_POINT_LOST", 250)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "MISSIONS_CREATED", 500)
			stats.set_int(MPX .. "LTS_CREATED", 500)
			stats.set_int(MPX .. "FM_MISSION_LIKES", 1500)
		end)

	Awards1b1:add_action("General",
		function()
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTDM", true)
			stats.set_int(MPX .. "CR_DIFFERENT_DM", 25)
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTRACES", true)
			stats.set_int(MPX .. "CR_DIFFERENT_RACES", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_20M", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_50M", 25)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
			stats.set_bool(MPX .. "AWD_FMATTGANGHQ", true)
			stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", true)
			stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 25)
			stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", true)
			stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 25)
			stats.set_int(MPX .. "AWD_FMBBETWIN", 50000)
			stats.set_int(MPX .. "AWD_LAPDANCES", 25)
			stats.set_int(MPX .. "AWD_FMCRATEDROPS", 25)
			stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", true)
			stats.set_bool(MPX .. "AWD_FM25DIFITEMSCLOTHES", true)
			stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 25)
			stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", true)
			stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", true)
			stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", true)
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 50)
			stats.set_bool(MPX .. "AWD_STORE_20_CAR_IN_GARAGES", true)
			stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
			stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", true)
			stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", true)
			stats.set_int(MPX .. "AWD_FM_CR_DM_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_RACES_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_PLAYED_BY_PEEP", 1598)
			stats.set_int(MPX .. "AWD_FM_CR_MISSION_SCORE", 100)
			stats.set_bool(MPX .. "CL_DRIVE_RALLY", true)
			stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", true)
			stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", true)
			stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", true)
			stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", true)
			stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", true)
			stats.set_bool(MPX .. "CL_CALL_MERCENARIES", true)
			stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", true)
			stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", true)
			stats.set_bool(MPX .. "CL_FILL_TITAN", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_BUY_INSURANCE", true)
			stats.set_bool(MPX .. "CL_BUY_GARAGE", true)
			stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_FRIEND", true)
			stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", true)
			stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", true)
			stats.set_bool(MPX .. "FM_INTRO_CUT_DONE", true)
			stats.set_bool(MPX .. "FM_INTRO_MISS_DONE", true)
			stats.set_bool(MPX .. "SHOOTINGRANGE_SEEN_TUT", true)
			stats.set_bool(MPX .. "TENNIS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "DARTS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "ARMWRESTLING_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "HAS_WATCHED_BENNY_CUTSCE", true)
			stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 100)
			stats.set_int(MPX .. "BOUNTSONU", 200)
			stats.set_int(MPX .. "BOUNTPLACED", 500)
			stats.set_int(MPX .. "BETAMOUNT", 500)
			stats.set_int(MPX .. "CRARMWREST", 500)
			stats.set_int(MPX .. "CRBASEJUMP", 500)
			stats.set_int(MPX .. "CRDARTS", 500)
			stats.set_int(MPX .. "CRDM", 500)
			stats.set_int(MPX .. "CRGANGHIDE", 500)
			stats.set_int(MPX .. "CRGOLF", 500)
			stats.set_int(MPX .. "CRHORDE", 500)
			stats.set_int(MPX .. "CRMISSION", 500)
			stats.set_int(MPX .. "CRSHOOTRNG", 500)
			stats.set_int(MPX .. "CRTENNIS", 500)
			stats.set_int(MPX .. "NO_TIMES_CINEMA", 500)
		end)

	Awards1b1:add_action("Weapons",
		function()
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_4_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_10_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE4", -1)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_BLUE", 1000)
			stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", -1)
			for i = 2, 19 do
				stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, -1)
			end
			for j = 1, 19 do
				stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", -1)
			end
			for m = 1, 41 do
				stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", -1)
			end
			for l = 2, 41 do
				stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, -1)
			end
		end)

	Awards1b1:add_action("Crimes",
		function()
			stats.set_int(MPX .. "AWD_FMTIME5STARWANTED", 120)
			stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
			stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 25)
			stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 500)
			stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 25)
			stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 20)
			stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 25)
			stats.set_int(MPX .. "AWD_ENEMYDRIVEBYKILLS", 100)
			stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", 18000000)
			stats.set_int(MPX .. "CARS_COPS_EXPLODED", 300)
			stats.set_int(MPX .. "BIKES_EXPLODED", 100)
			stats.set_int(MPX .. "BOATS_EXPLODED", 168)
			stats.set_int(MPX .. "HELIS_EXPLODED", 98)
			stats.set_int(MPX .. "PLANES_EXPLODED", 138)
			stats.set_int(MPX .. "QUADBIKE_EXPLODED", 50)
			stats.set_int(MPX .. "BICYCLE_EXPLODED", 48)
			stats.set_int(MPX .. "SUBMARINE_EXPLODED", 28)
			stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 500)
			stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 300)
			stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 300)
			stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 1000)
			stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 700)
			stats.set_int(MPX .. "MCKILLS", 500)
			stats.set_int(MPX .. "MCDEATHS", 700)
			stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 700)
			stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
			stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "GHKILLS", 500)
			stats.set_int(MPX .. "HORDELVL", 10)
			stats.set_int(MPX .. "HORDKILLS", 500)
			stats.set_int(MPX .. "UNIQUECRATES", 500)
			stats.set_int(MPX .. "BJWINS", 500)
			stats.set_int(MPX .. "HORDEWINS", 500)
			stats.set_int(MPX .. "MCMWINS", 500)
			stats.set_int(MPX .. "GANGHIDWINS", 500)
			stats.set_int(MPX .. "KILLS", 800)
			stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 100)
			stats.set_int(MPX .. "SHOTS", 1000)
			stats.set_int(MPX .. "HEADSHOTS", 100)
			stats.set_int(MPX .. "KILLS_ARMED", 650)
			stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 100)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "KILLS_STEALTH", 100)
			stats.set_int(MPX .. "KILLS_INNOCENTS", 500)
			stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_BY_OTHERS", 100)
			stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 500)
			stats.set_int(MPX .. "ARCHENEMY_KILLS", 500)
			stats.set_int(MPX .. "KILLS_COP", 4500)
			stats.set_int(MPX .. "KILLS_SWAT", 500)
			stats.set_int(MPX .. "STARS_ATTAINED", 5000)
			stats.set_int(MPX .. "STARS_EVADED", 4000)
			stats.set_int(MPX .. "VEHEXPORTED", 500)
			stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 100)
			stats.set_int(MPX .. "CR_GANGATTACK_CITY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_LOST", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 1000)
			stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 500)
			stats.set_int(MPX .. "DIED_IN_DROWNING", 833)
			stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 833)
			stats.set_int(MPX .. "DIED_IN_EXPLOSION", 833)
			stats.set_int(MPX .. "DIED_IN_FALL", 833)
			stats.set_int(MPX .. "DIED_IN_FIRE", 833)
			stats.set_int(MPX .. "DIED_IN_ROAD", 833)
			stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "SMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "RPG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PLAYER_HEADSHOTS", 500)
			stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 500)
		end)

	Awards1b1:add_action("Vehicles",
		function()
			stats.set_int(MPX .. "AWD_50_VEHICLES_BLOWNUP", 500)
			stats.set_int(MPX .. "CARS_EXPLODED", 500)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 30)
			stats.set_int(MPX .. "AWD_PASSENGERTIME", 4)
			stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 4)
			stats.set_int(MPX .. "AWD_VEHICLE_JUMP_OVER_40M", 25)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
			stats.set_int(MPX .. "NO_CARS_REPAIR", 1000)
			stats.set_int(MPX .. "VEHICLES_SPRAYED", 500)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 500)
			stats.set_int(MPX .. "USJS_FOUND", 50)
			stats.set_int(MPX .. "USJS_COMPLETED", 50)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
			stats.set_int(MPX .. "CRDEADLINE", 5)
			stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 2069146067)
			stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 1000)
			stats.set_int(MPX .. "RACES_WON", 50)
			stats.set_int(MPX .. "COUNT_HOTRING_RACE", 20)
			stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", true)
			stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", true)
		end)

	Awards1b1:add_action("Combat",
		function()
			stats.set_int(MPX .. "AWD_100_HEADSHOTS", 500)
			stats.set_int(MPX .. "AWD_FMOVERALLKILLS", 1000)
			stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 25)
			stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 50)
			stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 100)
			stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 50)
			stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 500)
			stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", true)
			stats.set_int(MPX .. "AWD_FMREVENGEKILLSDM", 50)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
			stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 100)
			stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 50)
			stats.set_int(MPX .. "AWD_100_KILLS_PISTOL", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SMG", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SHOTGUN", 500)
			stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SNIPER", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_25_KILLS_STICKYBOMBS", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_GRENADES", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_ROCKETLAUNCH", 50)
			stats.set_int(MPX .. "AWD_20_KILLS_MELEE", 50)
			stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
			stats.set_int(MPX .. "MELEEKILLS", 700)
			stats.set_int(MPX .. "HITS", 10000)
			stats.set_int(MPX .. "DEATHS", 499)
			stats.set_int(MPX .. "HIGHEST_SKITTLES", 900)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS", 1000)
		end)

	Awards1b1:add_action("Heists",
		function()
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
			stats.set_int(MPX .. "AWD_COMPLETE_HEIST_NOT_DIE", -1)
			stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
			stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
			stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
			stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", true)
			stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 25)
			stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", true)
			stats.set_int(MPX .. "HEIST_COMPLETION", 25)
			stats.set_int(MPX .. "HEISTS_ORGANISED", -1)
			stats.set_int(MPX .. "HEIST_START", -1)
			stats.set_int(MPX .. "HEIST_END", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_PRISON", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_HUMANE", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_NARC", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_ORNATE", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_1", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_2", -1)
			stats.set_int(MPX .. "CR_FLEECA_FINALE", -1)
			stats.set_int(MPX .. "CR_PRISON_PLANE", -1)
			stats.set_int(MPX .. "CR_PRISON_BUS", -1)
			stats.set_int(MPX .. "CR_PRISON_STATION", -1)
			stats.set_int(MPX .. "CR_PRISON_UNFINISHED_BIZ", -1)
			stats.set_int(MPX .. "CR_PRISON_FINALE", -1)
			stats.set_int(MPX .. "CR_HUMANE_KEY_CODES", -1)
			stats.set_int(MPX .. "CR_HUMANE_ARMORDILLOS", -1)
			stats.set_int(MPX .. "CR_HUMANE_EMP", -1)
			stats.set_int(MPX .. "CR_HUMANE_VALKYRIE", -1)
			stats.set_int(MPX .. "CR_HUMANE_FINALE", -1)
			stats.set_int(MPX .. "CR_NARC_COKE", -1)
			stats.set_int(MPX .. "CR_NARC_TRASH_TRUCK", -1)
			stats.set_int(MPX .. "CR_NARC_BIKERS", -1)
			stats.set_int(MPX .. "CR_NARC_WEED", -1)
			stats.set_int(MPX .. "CR_NARC_STEAL_METH", -1)
			stats.set_int(MPX .. "CR_NARC_FINALE", -1)
			stats.set_int(MPX .. "CR_PACIFIC_TRUCKS", -1)
			stats.set_int(MPX .. "CR_PACIFIC_WITSEC", -1)
			stats.set_int(MPX .. "CR_PACIFIC_HACK", -1)
			stats.set_int(MPX .. "CR_PACIFIC_BIKES", -1)
			stats.set_int(MPX .. "CR_PACIFIC_CONVOY", -1)
			stats.set_int(MPX .. "CR_PACIFIC_FINALE", -1)
			stats.set_int("MPPLY_HEIST_ACH_TRACKER", -1)
			stats.set_int("MPPLY_WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_bool("MPPLY_AWD_FLEECA_FIN", true)
			stats.set_bool("MPPLY_AWD_PRISON_FIN", true)
			stats.set_bool("MPPLY_AWD_HUMANE_FIN", true)
			stats.set_bool("MPPLY_AWD_SERIESA_FIN", true)
			stats.set_bool("MPPLY_AWD_PACIFIC_FIN", true)
			stats.set_bool("MPPLY_AWD_HST_ORDER", true)
			stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", true)
			stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", true)
			stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", true)
			stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", true)
			stats.set_bool(MPX .. "AWD_MATCHING_OUTFIT_HEIST", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_PRINT", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_1", true)
			stats.set_bool(MPX .. "HEIST_PRE_PLAN_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_FINALE", true)
			stats.set_bool(MPX .. "HEIST_IS_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_STRAND_INTRO_DONE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_ORNATE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_PRISON", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_BIOLAB", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_NARCOTIC", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_AWARD_DONE_PREP", true)
			stats.set_bool(MPX .. "HEIST_AWARD_BOUGHT_IN", true)
			stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1)
		end)

	Awards1b1:add_action("Doomsday",
		function()
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -1)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -229384)
			stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1)
			stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", -1)
			stats.set_int("MPPLY_GANGOPS_ALLINORDER", 100)
			stats.set_int("MPPLY_GANGOPS_LOYALTY", 100)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD", 100)
			stats.set_int("MPPLY_GANGOPS_LOYALTY2", 100)
			stats.set_int("MPPLY_GANGOPS_LOYALTY3", 100)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", 100)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", 100)
			stats.set_int("MPPLY_GANGOPS_SUPPORT", 100)
			stats.set_int(MPX .. "CR_GANGOP_MORGUE", 10)
			stats.set_int(MPX .. "CR_GANGOP_DELUXO", 10)
			stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 10)
			stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 10)
			stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 10)
			stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 10)
			stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 10)
			stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 10)
			stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 10)
			stats.set_bool("MPPLY_AWD_GANGOPS_IAA", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", true)
			stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", true)
			for j = 0, 63 do
				stats.set_bool_masked(MPX .. "GANGOPSPSTAT_BOOL0", true, j, MPX)
			end
			stats.set_masked_int(MPX .. "DLCSMUGCHARPSTAT_INT260", 3, 16, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 24, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 32, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 40, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 48, 8)
		end)

	Awards1b1:add_action("After Hours",
		function()
			stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 120)
			stats.set_int(MPX .. "AWD_CLUB_DRUNK", 200)
			stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 700)
			stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 700)
			stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 5721002)
			stats.set_int(MPX .. "HUB_SALES_COMPLETED", 1001)
			stats.set_int(MPX .. "HUB_EARNINGS", 20721002)
			stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 100)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 784672)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 507822)
			stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 120)
			stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 120)
			stats.set_int(MPX .. "DANCETODIFFDJS", 4)
			stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_TOTAL", 20)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_MISSION", -1)
			stats.set_int(MPX .. "CLUB_CONTRABAND_MISSION", 1000)
			stats.set_int(MPX .. "HUB_CONTRABAND_MISSION", 1000)
			stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", true)
			stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", true)
			stats.set_bool(MPX .. "AWD_CLUB_COORD", true)
			for j = 0, 63 do
				stats.set_bool_masked(MPX.."BUSINESSBATPSTAT_BOOL0", true, j, MPX)
				stats.set_bool_masked(MPX.."BUSINESSBATPSTAT_BOOL1", true, j, MPX)
			end
			if stats.get_masked_int(MPX.."BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
				stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT380", 20, 0, 8)
			end
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 50, 8, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 100, 16, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 20, 24, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 80, 32, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 60, 40, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 40, 48, 8)
			stats.set_masked_int(MPX.."BUSINESSBATPSTAT_INT379", 10, 56, 8)
		end)

	Awards1b1:add_action("Arena War",
		function()
			stats.set_int(MPX .. "ARN_BS_TRINKET_TICKERS", -1)
			stats.set_int(MPX .. "ARN_BS_TRINKET_SAVED", -1)
			stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 50)
			stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 50)
			stats.set_int(MPX .. "AWD_READY_FOR_WAR", 50)
			stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 50)
			stats.set_int(MPX .. "AWD_SPINNER", 50)
			stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 50)
			stats.set_int(MPX .. "AWD_MASTER_BANDITO", 50)
			stats.set_int(MPX .. "AWD_SITTING_DUCK", 50)
			stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 50)
			stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 50)
			stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 50)
			stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 200)
			stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 50)
			stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 1000000)
			stats.set_int(MPX .. "AWD_TIME_SERVED", 1000)
			stats.set_int(MPX .. "AWD_TOP_SCORE", 55000)
			stats.set_int(MPX .. "AWD_CAREER_WINNER", 1000)
			stats.set_int(MPX .. "ARENAWARS_SP", 0)
			stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 20)
			stats.set_int(MPX .. "ARENAWARS_SP_LIFETIME", 100)
			stats.set_int(MPX .. "ARENAWARS_AP", 0)
			stats.set_int(MPX .. "ARENAWARS_AP_TIER", 1000)
			stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 5055000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_UNLK", -1)
			stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_APOC", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_CONS", 1000)
			stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 1000)
			stats.set_int(MPX .. "ARN_W_DETONATION", 1000)
			stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 1000)
			stats.set_int(MPX .. "ARN_W_CTF", 1000)
			stats.set_int(MPX .. "ARN_W_TAG_TEAM", 1000)
			stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 1000)
			stats.set_int(MPX .. "ARN_W_CARNAGE", 1000)
			stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 1000)
			stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 1000)
			stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 500)
			stats.set_int(MPX .. "ARN_L_DETONATION", 500)
			stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 500)
			stats.set_int(MPX .. "ARN_L_CTF", 500)
			stats.set_int(MPX .. "ARN_L_TAG_TEAM", 500)
			stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 500)
			stats.set_int(MPX .. "ARN_L_CARNAGE", 500)
			stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 500)
			stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 500)
			stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 500)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 1000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 1000)
			stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 86400000)
			stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 1000)
			stats.set_int(MPX .. "ARN_SMOKE", 1000)
			stats.set_int(MPX .. "ARN_DRINK", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN4", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB2", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB3", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR4", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI5", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI", 61000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR380", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3802", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3803", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 1000)
			stats.set_bool(MPX .. "AWD_BEGINNER", true)
			stats.set_bool(MPX .. "AWD_FIELD_FILLER", true)
			stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", true)
			stats.set_bool(MPX .. "AWD_LEARNER", true)
			stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", true)
			stats.set_bool(MPX .. "AWD_THE_ROOKIE", true)
			stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", true)
			stats.set_bool(MPX .. "AWD_GEAR_HEAD", true)
			stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", true)
			stats.set_bool(MPX .. "AWD_HOT_LAP", true)
			stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", true)
			stats.set_bool(MPX .. "AWD_PAINT_TRADER", true)
			stats.set_bool(MPX .. "AWD_SHUNTER", true)
			stats.set_bool(MPX .. "AWD_JOCK", true)
			stats.set_bool(MPX .. "AWD_WARRIOR", true)
			stats.set_bool(MPX .. "AWD_T_BONE", true)
			stats.set_bool(MPX .. "AWD_MAYHEM", true)
			stats.set_bool(MPX .. "AWD_WRECKER", true)
			stats.set_bool(MPX .. "AWD_CRASH_COURSE", true)
			stats.set_bool(MPX .. "AWD_ARENA_LEGEND", true)
			stats.set_bool(MPX .. "AWD_PEGASUS", true)
			stats.set_bool(MPX .. "AWD_UNSTOPPABLE", true)
			stats.set_bool(MPX .. "AWD_CONTACT_SPORT", true)
			stats.set_masked_int(MPX.."ARENAWARSPSTAT_INT", 1, 35, 8)
			for i = 0, 8 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("Diamond Casino n Resort",
		function()
			stats.set_int(MPX .. "AWD_ODD_JOBS", 50)
			stats.set_int(MPX .. "VCM_FLOW_PROGRESS", -1)
			stats.set_int(MPX .. "VCM_STORY_PROGRESS", 5)
			stats.set_bool(MPX .. "AWD_FIRST_TIME1", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME2", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME3", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME4", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME5", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME6", true)
			stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", true)
			stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", true)
			stats.set_bool(MPX .. "AWD_LEADER", true)
			stats.set_bool(MPX .. "AWD_SURVIVALIST", true)
			Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD")
			if Paragon == true then
				stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", true)
			else
				stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
			end
			for i = 0, 6 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX.."CASINOPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("Diamond Casino Heist",
		function()
			stats.set_int(MPX .. "CAS_HEIST_NOTS", -1)
			stats.set_int(MPX .. "CAS_HEIST_FLOW", -1)
			stats.set_int(MPX .. "SIGNAL_JAMMERS_COLLECTED", 50)
			stats.set_int(MPX .. "AWD_PREPARATION", 40)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE0", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE1", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE2", -1)
			stats.set_int(MPX .. "H3_VEHICLESUSED", -1)
			stats.set_int(MPX .. "H3_CR_STEALTH_1A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2B_RAPP", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2C_SIDE", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_3A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_4A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_5A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_1A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_4A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_5A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_1A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A1", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A2", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2BP", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2C", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_3A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_4A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_5A", 100)
			stats.set_int(MPX .. "CR_ORDER", 100)
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAPE", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", true)
			stats.set_bool(MPX .. "HELP_FURIA", true)
			stats.set_bool(MPX .. "HELP_MINITAN", true)
			stats.set_bool(MPX .. "HELP_YOSEMITE2", true)
			stats.set_bool(MPX .. "HELP_ZHABA", true)
			stats.set_bool(MPX .. "HELP_IMORGEN", true)
			stats.set_bool(MPX .. "HELP_SULTAN2", true)
			stats.set_bool(MPX .. "HELP_VAGRANT", true)
			stats.set_bool(MPX .. "HELP_VSTR", true)
			stats.set_bool(MPX .. "HELP_STRYDER", true)
			stats.set_bool(MPX .. "HELP_SUGOI", true)
			stats.set_bool(MPX .. "HELP_KANJO", true)
			stats.set_bool(MPX .. "HELP_FORMULA", true)
			stats.set_bool(MPX .. "HELP_FORMULA2", true)
			stats.set_bool(MPX .. "HELP_JB7002", true)
			for i = 0, 4 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX.."CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("Arcade",
		function()
			stats.set_int(MPX .. "AWD_PREPARATION", 50)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 50)
			stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", -1)
			stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", -1)
			stats.set_int(MPX .. "IAP_MAX_MOON_DIST", 2147483647)
			stats.set_int(MPX .. "SCGW_INITIALS_0", 69644)
			stats.set_int(MPX .. "SCGW_INITIALS_1", 50333)
			stats.set_int(MPX .. "SCGW_INITIALS_2", 63512)
			stats.set_int(MPX .. "SCGW_INITIALS_3", 46136)
			stats.set_int(MPX .. "SCGW_INITIALS_4", 21638)
			stats.set_int(MPX .. "SCGW_INITIALS_5", 2133)
			stats.set_int(MPX .. "SCGW_INITIALS_6", 1215)
			stats.set_int(MPX .. "SCGW_INITIALS_7", 2444)
			stats.set_int(MPX .. "SCGW_INITIALS_8", 38023)
			stats.set_int(MPX .. "SCGW_INITIALS_9", 2233)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_0",0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_1", 64)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_2", 8457)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_3", 91275)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_4", 53260)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_5", 78663)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_6", 25103)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_7", 102401)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_8", 12672)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_9", 74380)
			stats.set_int(MPX .. "FOOTAGE_SCORE_0", 284544)
			stats.set_int(MPX .. "FOOTAGE_SCORE_1", 275758)
			stats.set_int(MPX .. "FOOTAGE_SCORE_2", 100000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_3", 90000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_4", 80000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_5", 70000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_6", 60000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_7", 50000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_8", 40000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_9", 30000)
			for i = 0, 9 do
				stats.set_int(MPX .. "IAP_INITIALS_" .. i, 50)
				stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
				stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
				stats.set_int(MPX .. "SCGW_SCORE_" .. i, 50)
				stats.set_int(MPX .. "DG_DEFENDER_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "DG_DEFENDER_SCORE_" .. i, 50)
				stats.set_int(MPX .. "DG_MONKEY_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "DG_MONKEY_SCORE_" .. i, 50)
				stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "DG_PENETRATOR_SCORE_" .. i, 50)
				stats.set_int(MPX .. "GGSM_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "GGSM_SCORE_" .. i, 50)
				stats.set_int(MPX .. "TWR_INITIALS_" .. i, 69644)
				stats.set_int(MPX .. "TWR_SCORE_" .. i, 50)
			end
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAP", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_0", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_1", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_2", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_3", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_4", true)
			stats.set_bool(MPX .. "IAP_GOLD_TANK", true)
			stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", true)
			for j = 290449, 290468 do
				globals.set_int(j, 1)
			end
			for i = 0, 4 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX.."CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
			for i = 0, 6 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX.."CASINOPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("LS Summer Special",
		function()
			stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_QUBISM", true)
			stats.set_bool(MPX .. "AWD_QUIBITS", true)
			stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "AWD_GOFOR11TH", true)
			stats.set_masked_int(MPX.."SU20PSTAT_INT", 1, 35, 8)
			for i = 0, 1 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "SU20PSTAT_BOOL" .. i, true, j, MPX)
					stats.set_bool_masked(MPX.."SU20TATTOOSTAT_BOOL"..i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("Cayo Perico",
		function()
			stats.set_bool(MPX .. "AWD_INTELGATHER", true)
			stats.set_bool(MPX .. "AWD_COMPOUNDINFILT", true)
			stats.set_bool(MPX .. "AWD_LOOT_FINDER", true)
			stats.set_bool(MPX .. "AWD_MAX_DISRUPT", true)
			stats.set_bool(MPX .. "AWD_THE_ISLAND_HEIST", true)
			stats.set_bool(MPX .. "AWD_GOING_ALONE", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_PRO_THIEF", true)
			stats.set_bool(MPX .. "AWD_CAT_BURGLAR", true)
			stats.set_bool(MPX .. "AWD_ONE_OF_THEM", true)
			stats.set_bool(MPX .. "AWD_GOLDEN_GUN", true)
			stats.set_bool(MPX .. "AWD_ELITE_THIEF", true)
			stats.set_bool(MPX .. "AWD_PROFESSIONAL", true)
			stats.set_bool(MPX .. "AWD_HELPING_OUT", true)
			stats.set_bool(MPX .. "AWD_COURIER", true)
			stats.set_bool(MPX .. "AWD_PARTY_VIBES", true)
			stats.set_bool(MPX .. "AWD_HELPING_HAND", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_VETIR", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_LONGFIN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ANNIH", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ALKONOS", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_PATROLB", true)
			stats.set_int(MPX .. "AWD_LOSTANDFOUND", 500000)
			stats.set_int(MPX .. "AWD_SUNSET", 1800000)
			stats.set_int(MPX .. "AWD_TREASURE_HUNTER", 1000000)
			stats.set_int(MPX .. "AWD_WRECK_DIVING", 1000000)
			stats.set_int(MPX .. "AWD_KEINEMUSIK", 1800000)
			stats.set_int(MPX .. "AWD_PALMS_TRAX", 1800000)
			stats.set_int(MPX .. "AWD_MOODYMANN", 1800000)
			stats.set_int(MPX .. "AWD_FILL_YOUR_BAGS", 1000000000)
			stats.set_int(MPX .. "AWD_WELL_PREPARED", 80)
			stats.set_int(MPX .. "H4_H4_DJ_MISSIONS", -1)
			stats.set_int(MPX .. "H4CNF_APPROACH", -1)
			stats.set_int(MPX .. "H4_MISSIONS", -1)
			stats.set_int(MPX .. "H4_PLAYTHROUGH_STATUS", 100)
			for i = 0, 2 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "HISLANDPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("LS Tuners",
		function()
			stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 100)
			stats.set_int(MPX .. "AWD_SPRINTRACER", 50)
			stats.set_int(MPX .. "AWD_STREETRACER", 50)
			stats.set_int(MPX .. "AWD_PURSUITRACER", 50)
			stats.set_int(MPX .. "AWD_TEST_CAR", 240)
			stats.set_int(MPX .. "AWD_AUTO_SHOP", 50)
			stats.set_int(MPX .. "AWD_GROUNDWORK", 40)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 100)
			stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 100)
			stats.set_bool(MPX .. "AWD_CAR_CLUB", true)
			stats.set_bool(MPX .. "AWD_PRO_CAR_EXPORT", true)
			stats.set_bool(MPX .. "AWD_UNION_DEPOSITORY", true)
			stats.set_bool(MPX .. "AWD_MILITARY_CONVOY", true)
			stats.set_bool(MPX .. "AWD_FLEECA_BANK", true)
			stats.set_bool(MPX .. "AWD_FREIGHT_TRAIN", true)
			stats.set_bool(MPX .. "AWD_BOLINGBROKE_ASS", true)
			stats.set_bool(MPX .. "AWD_IAA_RAID", true)
			stats.set_bool(MPX .. "AWD_METH_JOB", true)
			stats.set_bool(MPX .. "AWD_BUNKER_RAID", true)
			stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", true)
			stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", true)
			stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", true)
			stats.set_bool(MPX .. "AWD_DIRECTOR", true)
			for i = 0, 8 do
				for j = 0, 63 do
					stats.set_bool_masked(MPX .. "TUNERPSTAT_BOOL" .. i, true, j, MPX)
				end
			end
		end)

	Awards1b1:add_action("Contract",
		function()
			stats.set_int(MPX .. "AWD_CONTRACTOR", 50)
			stats.set_int(MPX .. "AWD_COLD_CALLER", 50)
			stats.set_int(MPX .. "AWD_PRODUCER", 60)
			stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", -1)
			stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
			stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
			stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
			stats.set_int(MPX .. "FIXER_COUNT", 510)
			stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", 85)
			stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", 85)
			stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", 85)
			stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", 85)
			stats.set_int(MPX .. "FIXER_EARNINGS", 19734860)
			stats.set_bool(MPX .. "AWD_TEEING_OFF", true)
			stats.set_bool(MPX .. "AWD_PARTY_NIGHT", true)
			stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", true)
			stats.set_bool(MPX .. "AWD_HOOD_PASS", true)
			stats.set_bool(MPX .. "AWD_STUDIO_TOUR", true)
			stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", true)
			stats.set_bool(MPX .. "AWD_BACKUP", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_1", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_2", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_3", true)
			stats.set_bool(MPX .. "AWD_CONTR_KILLER", true)
			stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", true)
			stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", true)
			for j = 0, 63 do
				stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL0", true, j, MPX)
				stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, j, MPX)
				stats.set_bool_masked(MPX .. "FIXERTATTOOSTAT_BOOL0", true, j, MPX)
			end
		end)

	Awards1b1:add_action("Drug Wars",
		function()
			stats.set_bool(MPX .. "AWD_ACELIQUOR", true)
			stats.set_bool(MPX .. "AWD_TRUCKAMBUSH", true)
			stats.set_bool(MPX .. "AWD_LOSTCAMPREV", true)
			stats.set_bool(MPX .. "AWD_ACIDTRIP", true)
			stats.set_bool(MPX .. "AWD_HIPPYRIVALS", true)
			stats.set_bool(MPX .. "AWD_TRAINCRASH", true)
			stats.set_bool(MPX .. "AWD_BACKUPB", true)
			stats.set_bool(MPX .. "AWD_GETSTARTED", true)
			stats.set_bool(MPX .. "AWD_CHEMREACTION", true)
			stats.set_bool(MPX .. "AAWD_WAREHODEFEND", true)
			stats.set_bool(MPX .. "AWD_ATTACKINVEST", true)
			stats.set_bool(MPX .. "AWD_RESCUECOOK", true)
			stats.set_bool(MPX .. "AWD_DRUGTRIPREHAB", true)
			stats.set_bool(MPX .. "AWD_CARGOPLANE", true)
			stats.set_bool(MPX .. "AWD_BACKUPB2", true)
			stats.set_bool(MPX .. "AWD_TAXISTAR", true)
			stats.set_int(MPX .. "AWD_RUNRABBITRUN", 5)
			stats.set_int(MPX .. "AWD_CALLME", 50)
			stats.set_int(MPX .. "AWD_CHEMCOMPOUNDS", 50)
		end)

	Awards:add_action("Reset All",
		function()
			stats.set_int(MPX .. "AWD_FM_DM_WINS", 0)
			stats.set_int(MPX .. "AWD_FM_TDM_WINS", 0)
			stats.set_int(MPX .. "AWD_FM_TDM_MVP", 0)
			stats.set_int(MPX .. "AWD_RACES_WON", 0)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 0)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 0)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 0)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 0)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 0)
			stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 0)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 0)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 0)
			stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 0)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 0)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 0)
			stats.set_int(MPX .. "AWD_NO_ARMWRESTLING_WINS", 0)
			stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 0)
			stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 0)
			stats.set_int(MPX .. "AWD_FM_GOLF_WON", 0)
			stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 0)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 0)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 0)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 0)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 0)
			stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 0)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 0)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 0)
			stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 0)
			stats.set_int(MPX .. "AIR_LAUNCHES_OVER_0M", 0)
			stats.set_int(MPX .. "AWD_CARS_EXPORTED", 0)
			stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 0)
			stats.set_int(MPX .. "CR_DIFFERENT_DM", 0)
			stats.set_int(MPX .. "CR_DIFFERENT_RACES", 0)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_0M", 0)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_0M", 0)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 0)
			stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 0)
			stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 0)
			stats.set_int(MPX .. "AWD_FMBBETWIN", 0)
			stats.set_int(MPX .. "AWD_LAPDANCES", 0)
			stats.set_int(MPX .. "AWD_FMCRATEDROPS", 0)
			stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 0)
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 0)
			stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 0)
			stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 0)
			stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 0)
			stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 0)
			stats.set_int(MPX .. "BOUNTSONU", 0)
			stats.set_int(MPX .. "BOUNTPLACED", 0)
			stats.set_int(MPX .. "BETAMOUNT", 0)
			stats.set_int(MPX .. "CRARMWREST", 0)
			stats.set_int(MPX .. "CRBASEJUMP", 0)
			stats.set_int(MPX .. "CRDARTS", 0)
			stats.set_int(MPX .. "CRDM", 0)
			stats.set_int(MPX .. "CRGANGHIDE", 0)
			stats.set_int(MPX .. "CRGOLF", 0)
			stats.set_int(MPX .. "CRHORDE", 0)
			stats.set_int(MPX .. "CRMISSION", 0)
			stats.set_int(MPX .. "CRSHOOTRNG", 0)
			stats.set_int(MPX .. "CRTENNIS", 0)
			stats.set_int(MPX .. "NO_TIMES_CINEMA", 0)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", 0)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", 0)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", 0)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED0", 0)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_0_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_WEAP_FREE", 0)
			stats.set_int(MPX .. "CHAR_WEAP_FREE2", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE0", 0)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", 0)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", 0)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", 0)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", 0)
			stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", 0)
			stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", 0)
			stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", 0)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED0", 0)
			stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_0_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_0_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", 0)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", 0)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", 0)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", 0)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE0", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_0_WHITE", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_0_RED", 0)
			stats.set_int(MPX .. "FIREWORK_TYPE_0_BLUE", 0)
			stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", 0)
			stats.set_int(MPX .. "AWD_FMTIME5STARWANTED", 0)
			stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 0)
			stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 0)
			stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 0)
			stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 0)
			stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 0)
			stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 0)
			stats.set_int(MPX .. "AWD_ENEMYDRIVEBYKILLS", 0)
			stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", 0)
			stats.set_int(MPX .. "CARS_COPS_EXPLODED", 0)
			stats.set_int(MPX .. "BIKES_EXPLODED", 0)
			stats.set_int(MPX .. "BOATS_EXPLODED", 0)
			stats.set_int(MPX .. "HELIS_EXPLODED", 0)
			stats.set_int(MPX .. "PLANES_EXPLODED", 0)
			stats.set_int(MPX .. "QUADBIKE_EXPLODED", 0)
			stats.set_int(MPX .. "BICYCLE_EXPLODED", 0)
			stats.set_int(MPX .. "SUBMARINE_EXPLODED", 0)
			stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 0)
			stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 0)
			stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 0)
			stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 0)
			stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 0)
			stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 0)
			stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 0)
			stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 0)
			stats.set_int(MPX .. "MCKILLS", 0)
			stats.set_int(MPX .. "MCDEATHS", 0)
			stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 0)
			stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 0)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 0)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 0)
			stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 0)
			stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 0)
			stats.set_int(MPX .. "GHKILLS", 0)
			stats.set_int(MPX .. "HORDELVL", 0)
			stats.set_int(MPX .. "HORDKILLS", 0)
			stats.set_int(MPX .. "UNIQUECRATES", 0)
			stats.set_int(MPX .. "BJWINS", 0)
			stats.set_int(MPX .. "HORDEWINS", 0)
			stats.set_int(MPX .. "MCMWINS", 0)
			stats.set_int(MPX .. "GANGHIDWINS", 0)
			stats.set_int(MPX .. "KILLS", 0)
			stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 0)
			stats.set_int(MPX .. "SHOTS", 0)
			stats.set_int(MPX .. "HEADSHOTS", 0)
			stats.set_int(MPX .. "KILLS_ARMED", 0)
			stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 0)
			stats.set_int(MPX .. "KILLS_PLAYERS", 0)
			stats.set_int(MPX .. "DEATHS_PLAYER", 0)
			stats.set_int(MPX .. "KILLS_STEALTH", 0)
			stats.set_int(MPX .. "KILLS_INNOCENTS", 0)
			stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 0)
			stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 0)
			stats.set_int(MPX .. "KILLS_BY_OTHERS", 0)
			stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 0)
			stats.set_int(MPX .. "ARCHENEMY_KILLS", 0)
			stats.set_int(MPX .. "KILLS_COP", 0)
			stats.set_int(MPX .. "KILLS_SWAT", 0)
			stats.set_int(MPX .. "STARS_ATTAINED", 0)
			stats.set_int(MPX .. "STARS_EVADED", 0)
			stats.set_int(MPX .. "VEHEXPORTED", 0)
			stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 0)
			stats.set_int(MPX .. "CR_GANGATTACK_CITY", 0)
			stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 0)
			stats.set_int(MPX .. "CR_GANGATTACK_LOST", 0)
			stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 0)
			stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 0)
			stats.set_int(MPX .. "DIED_IN_DROWNING", 0)
			stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 0)
			stats.set_int(MPX .. "DIED_IN_EXPLOSION", 0)
			stats.set_int(MPX .. "DIED_IN_FALL", 0)
			stats.set_int(MPX .. "DIED_IN_FIRE", 0)
			stats.set_int(MPX .. "DIED_IN_ROAD", 0)
			stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "SMG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "RPG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "PLAYER_HEADSHOTS", 0)
			stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "AWD_0_VEHICLES_BLOWNUP", 0)
			stats.set_int(MPX .. "CARS_EXPLODED", 0)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 0)
			stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 0)
			stats.set_int(MPX .. "AWD_PASSENGERTIME", 0)
			stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 0)
			stats.set_int(MPX .. "AWD_VEHICLE_JUMP_OVER_0M", 0)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", 0)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", 0)
			stats.set_int(MPX .. "NO_CARS_REPAIR", 0)
			stats.set_int(MPX .. "VEHICLES_SPRAYED", 0)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 0)
			stats.set_int(MPX .. "USJS_FOUND", 0)
			stats.set_int(MPX .. "USJS_COMPLETED", 0)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 0)
			stats.set_int(MPX .. "CRDEADLINE", 0)
			stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 0)
			stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 0)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 0)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 0)
			stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 0)
			stats.set_int(MPX .. "RACES_WON", 0)
			stats.set_int(MPX .. "COUNT_HOTRING_RACE", 0)
			stats.set_int(MPX .. "AWD_0_HEADSHOTS", 0)
			stats.set_int(MPX .. "AWD_FMOVERALLKILLS", 0)
			stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 0)
			stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 0)
			stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 0)
			stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 0)
			stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 0)
			stats.set_int(MPX .. "AWD_FMREVENGEKILLSDM", 0)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 0)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 0)
			stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 0)
			stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_PISTOL", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_SMG", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_SHOTGUN", 0)
			stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_SNIPER", 0)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_STICKYBOMBS", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_GRENADES", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_ROCKETLAUNCH", 0)
			stats.set_int(MPX .. "AWD_0_KILLS_MELEE", 0)
			stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 0)
			stats.set_int(MPX .. "MELEEKILLS", 0)
			stats.set_int(MPX .. "HITS", 0)
			stats.set_int(MPX .. "DEATHS", 0)
			stats.set_int(MPX .. "HIGHEST_SKITTLES", 0)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS", 0)
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 0)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 0)
			stats.set_int(MPX .. "AWD_COMPLETE_HEIST_NOT_DIE", 0)
			stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 0)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 0)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 0)
			stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 0)
			stats.set_int(MPX .. "HEIST_COMPLETION", 0)
			stats.set_int(MPX .. "HEISTS_ORGANISED", 0)
			stats.set_int(MPX .. "HEIST_START", 0)
			stats.set_int(MPX .. "HEIST_END", 0)
			stats.set_int(MPX .. "CUTSCENE_MID_PRISON", 0)
			stats.set_int(MPX .. "CUTSCENE_MID_HUMANE", 0)
			stats.set_int(MPX .. "CUTSCENE_MID_NARC", 0)
			stats.set_int(MPX .. "CUTSCENE_MID_ORNATE", 0)
			stats.set_int(MPX .. "CR_FLEECA_PREP_1", 0)
			stats.set_int(MPX .. "CR_FLEECA_PREP_2", 0)
			stats.set_int(MPX .. "CR_FLEECA_FINALE", 0)
			stats.set_int(MPX .. "CR_PRISON_PLANE", 0)
			stats.set_int(MPX .. "CR_PRISON_BUS", 0)
			stats.set_int(MPX .. "CR_PRISON_STATION", 0)
			stats.set_int(MPX .. "CR_PRISON_UNFINISHED_BIZ", 0)
			stats.set_int(MPX .. "CR_PRISON_FINALE", 0)
			stats.set_int(MPX .. "CR_HUMANE_KEY_CODES", 0)
			stats.set_int(MPX .. "CR_HUMANE_ARMORDILLOS", 0)
			stats.set_int(MPX .. "CR_HUMANE_EMP", 0)
			stats.set_int(MPX .. "CR_HUMANE_VALKYRIE", 0)
			stats.set_int(MPX .. "CR_HUMANE_FINALE", 0)
			stats.set_int(MPX .. "CR_NARC_COKE", 0)
			stats.set_int(MPX .. "CR_NARC_TRASH_TRUCK", 0)
			stats.set_int(MPX .. "CR_NARC_BIKERS", 0)
			stats.set_int(MPX .. "CR_NARC_WEED", 0)
			stats.set_int(MPX .. "CR_NARC_STEAL_METH", 0)
			stats.set_int(MPX .. "CR_NARC_FINALE", 0)
			stats.set_int(MPX .. "CR_PACIFIC_TRUCKS", 0)
			stats.set_int(MPX .. "CR_PACIFIC_WITSEC", 0)
			stats.set_int(MPX .. "CR_PACIFIC_HACK", 0)
			stats.set_int(MPX .. "CR_PACIFIC_BIKES", 0)
			stats.set_int(MPX .. "CR_PACIFIC_CONVOY", 0)
			stats.set_int(MPX .. "CR_PACIFIC_FINALE", 0)
			stats.set_int(MPX .. "HEIST_PLANNING_STAGE", 0)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
			stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", 0)
			stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 0)
			stats.set_int(MPX .. "CR_GANGOP_MORGUE", 0)
			stats.set_int(MPX .. "CR_GANGOP_DELUXO", 0)
			stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 0)
			stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 0)
			stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 0)
			stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 0)
			stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 0)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 0)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 0)
			stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 0)
			stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 0)
			stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 0)
			stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 0)
			stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 0)
			stats.set_int(MPX .. "CR_GANGOP_FINALE", 0)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 0)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 0)
			stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 0)
			stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 0)
			stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 0)
			stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 0)
			stats.set_int(MPX .. "AWD_CLUB_DRUNK", 0)
			stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 0)
			stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 0)
			stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 0)
			stats.set_int(MPX .. "HUB_SALES_COMPLETED", 0)
			stats.set_int(MPX .. "HUB_EARNINGS", 0)
			stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 0)
			stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 0)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 0)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 0)
			stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 0)
			stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 0)
			stats.set_int(MPX .. "DANCETODIFFDJS", 0)
			stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 0)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_TOTAL", 0)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_MISSION", 0)
			stats.set_int(MPX .. "CLUB_CONTRABAND_MISSION", 0)
			stats.set_int(MPX .. "HUB_CONTRABAND_MISSION", 0)
			stats.set_int(MPX .. "ARN_BS_TRINKET_TICKERS", 0)
			stats.set_int(MPX .. "ARN_BS_TRINKET_SAVED", 0)
			stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 0)
			stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 0)
			stats.set_int(MPX .. "AWD_READY_FOR_WAR", 0)
			stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 0)
			stats.set_int(MPX .. "AWD_SPINNER", 0)
			stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 0)
			stats.set_int(MPX .. "AWD_MASTER_BANDITO", 0)
			stats.set_int(MPX .. "AWD_SITTING_DUCK", 0)
			stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 0)
			stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 0)
			stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 0)
			stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 0)
			stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 0)
			stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 0)
			stats.set_int(MPX .. "AWD_TIME_SERVED", 0)
			stats.set_int(MPX .. "AWD_TOP_SCORE", 0)
			stats.set_int(MPX .. "AWD_CAREER_WINNER", 0)
			stats.set_int(MPX .. "ARENAWARS_SP", 0)
			stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 0)
			stats.set_int(MPX .. "ARENAWARS_SP_LIFETIME", 0)
			stats.set_int(MPX .. "ARENAWARS_AP", 0)
			stats.set_int(MPX .. "ARENAWARS_AP_TIER", 0)
			stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 0)
			stats.set_int(MPX .. "ARENAWARS_CARRER_UNLK", 0)
			stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 0)
			stats.set_int(MPX .. "ARN_W_THEME_APOC", 0)
			stats.set_int(MPX .. "ARN_W_THEME_CONS", 0)
			stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 0)
			stats.set_int(MPX .. "ARN_W_DETONATION", 0)
			stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 0)
			stats.set_int(MPX .. "ARN_W_CTF", 0)
			stats.set_int(MPX .. "ARN_W_TAG_TEAM", 0)
			stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 0)
			stats.set_int(MPX .. "ARN_W_CARNAGE", 0)
			stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 0)
			stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 0)
			stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 0)
			stats.set_int(MPX .. "ARN_L_DETONATION", 0)
			stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 0)
			stats.set_int(MPX .. "ARN_L_CTF", 0)
			stats.set_int(MPX .. "ARN_L_TAG_TEAM", 0)
			stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 0)
			stats.set_int(MPX .. "ARN_L_CARNAGE", 0)
			stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 0)
			stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 0)
			stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 0)
			stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 0)
			stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 0)
			stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 0)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 0)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 0)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 0)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 0)
			stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 0)
			stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 0)
			stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 0)
			stats.set_int(MPX .. "ARN_SMOKE", 0)
			stats.set_int(MPX .. "ARN_DRINK", 0)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 0)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 0)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 0)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS", 0)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 0)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 0)
			stats.set_int(MPX .. "ARN_VEH_BRUISER", 0)
			stats.set_int(MPX .. "ARN_VEH_BRUISER2", 0)
			stats.set_int(MPX .. "ARN_VEH_BRUISER3", 0)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN0", 0)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 0)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 0)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS", 0)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 0)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 0)
			stats.set_int(MPX .. "ARN_VEH_SCARAB", 0)
			stats.set_int(MPX .. "ARN_VEH_SCARAB2", 0)
			stats.set_int(MPX .. "ARN_VEH_SCARAB3", 0)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR0", 0)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 0)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 0)
			stats.set_int(MPX .. "ARN_VEH_IMPALER2", 0)
			stats.set_int(MPX .. "ARN_VEH_IMPALER3", 0)
			stats.set_int(MPX .. "ARN_VEH_IMPALER0", 0)
			stats.set_int(MPX .. "ARN_VEH_ISSI0", 0)
			stats.set_int(MPX .. "ARN_VEH_ISSI5", 0)
			stats.set_int(MPX .. "ARN_VEH_ISSI", 0)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 0)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 0)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 0)
			stats.set_int(MPX .. "ARN_VEH_ZR30", 0)
			stats.set_int(MPX .. "ARN_VEH_ZR30", 0)
			stats.set_int(MPX .. "ARN_VEH_ZR0", 0)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 0)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 0)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 0)
			stats.set_int(MPX .. "AWD_ODD_JOBS", 0)
			stats.set_int(MPX .. "VCM_FLOW_PROGRESS", 0)
			stats.set_int(MPX .. "VCM_STORY_PROGRESS", 5)
			stats.set_int(MPX .. "CAS_HEIST_NOTS", 0)
			stats.set_int(MPX .. "CAS_HEIST_FLOW", 0)
			stats.set_int(MPX .. "SIGNAL_JAMMERS_COLLECTED", 0)
			stats.set_int(MPX .. "AWD_PREPARATION", 0)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 0)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 0)
			stats.set_int(MPX .. "AWD_BIGBRO", 0)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 0)
			stats.set_int(MPX .. "AWD_RACECHAMP", 0)
			stats.set_int(MPX .. "AWD_BATSWORD", 0)
			stats.set_int(MPX .. "AWD_COINPURSE", 0)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 0)
			stats.set_int(MPX .. "AWD_MASTERFUL", 0)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE0", 0)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE1", 0)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE2", 0)
			stats.set_int(MPX .. "H3_VEHICLESUSED", 0)
			stats.set_int(MPX .. "H3_CR_STEALTH_1A", 0)
			stats.set_int(MPX .. "H3_CR_STEALTH_2B_RAPP", 0)
			stats.set_int(MPX .. "H3_CR_STEALTH_2C_SIDE", 0)
			stats.set_int(MPX .. "H3_CR_STEALTH_3A", 0)
			stats.set_int(MPX .. "H3_CR_STEALTH_0A", 0)
			stats.set_int(MPX .. "H3_CR_STEALTH_5A", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_1A", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2A", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2B", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3A", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3B", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_0A", 0)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_5A", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_1A", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A1", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A2", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_2BP", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_2C", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_3A", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_0A", 0)
			stats.set_int(MPX .. "H3_CR_DIRECT_5A", 0)
			stats.set_int(MPX .. "CR_ORDER", 0)
			stats.set_int(MPX .. "AWD_PREPARATION", 0)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 0)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 0)
			stats.set_int(MPX .. "AWD_BIGBRO", 0)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 0)
			stats.set_int(MPX .. "AWD_RACECHAMP", 0)
			stats.set_int(MPX .. "AWD_BATSWORD", 0)
			stats.set_int(MPX .. "AWD_COINPURSE", 0)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 0)
			stats.set_int(MPX .. "AWD_MASTERFUL", 0)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 0)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 0)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 0)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 0)
			stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", 0)
			stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", 0)
			stats.set_int(MPX .. "IAP_MAX_MOON_DIST", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_0", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_1", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_2", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_3", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_0", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_5", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_6", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_7", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_8", 0)
			stats.set_int(MPX .. "SCGW_INITIALS_9", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_0",0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_1", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_2", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_3", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_4", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_5", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_6", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_7", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_8", 0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_9", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_0", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_1", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_2", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_3", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_0", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_5", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_6", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_7", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_8", 0)
			stats.set_int(MPX .. "FOOTAGE_SCORE_9", 0)
			stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 0)
			stats.set_int(MPX .. "AWD_SPRINTRACER", 0)
			stats.set_int(MPX .. "AWD_STREETRACER", 0)
			stats.set_int(MPX .. "AWD_PURSUITRACER", 0)
			stats.set_int(MPX .. "AWD_TEST_CAR", 0)
			stats.set_int(MPX .. "AWD_AUTO_SHOP", 0)
			stats.set_int(MPX .. "AWD_GROUNDWORK", 0)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 0)
			stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 0)
			stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 0)
			stats.set_int(MPX .. "AWD_CONTRACTOR", 0)
			stats.set_int(MPX .. "AWD_COLD_CALLER", 0)
			stats.set_int(MPX .. "AWD_PRODUCER", 0)
			stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 0)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 0)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 0)
			stats.set_int(MPX .. "FIXER_GENERAL_BS", 0)
			stats.set_int(MPX .. "FIXER_COMPLETED_BS", 0)
			stats.set_int(MPX .. "FIXER_STORY_BS", 0)
			stats.set_int(MPX .. "FIXER_STORY_STRAND", 0)
			stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", 0)
			stats.set_int(MPX .. "FIXER_COUNT", 0)
			stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", 0)
			stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", 0)
			stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", 0)
			stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", 0)
			stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", 0)
			stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", 0)
			stats.set_int(MPX .. "FIXER_EARNINGS", 0)
			stats.set_int(MPX .. "AWD_LOSTANDFOUND", 0)
			stats.set_int(MPX .. "AWD_SUNSET", 0)
			stats.set_int(MPX .. "AWD_TREASURE_HUNTER", 0)
			stats.set_int(MPX .. "AWD_WRECK_DIVING", 0)
			stats.set_int(MPX .. "AWD_KEINEMUSIK", 0)
			stats.set_int(MPX .. "AWD_PALMS_TRAX", 0)
			stats.set_int(MPX .. "AWD_MOODYMANN", 0)
			stats.set_int(MPX .. "AWD_FILL_YOUR_BAGS", 0)
			stats.set_int(MPX .. "AWD_WELL_PREPARED", 0)
			stats.set_int(MPX .. "H0_H0_DJ_MISSIONS", 0)
			stats.set_int(MPX .. "H0CNF_APPROACH", 0)
			stats.set_int(MPX .. "H0_MISSIONS", 0)
			stats.set_int(MPX .. "H0_PLAYTHROUGH_STATUS", 0)
			stats.set_int("MPPLY_TOTAL_RACES_WON", 0)
			stats.set_int("MPPLY_TOTAL_RACES_LOST", 0)
			stats.set_int("MPPLY_TOTAL_CUSTOM_RACES_WON", 0)
			stats.set_int("MPPLY_TOTAL_DEATHMATCH_LOST", 0)
			stats.set_int("MPPLY_TOTAL_DEATHMATCH_WON", 0)
			stats.set_int("MPPLY_TOTAL_TDEATHMATCH_LOST", 0)
			stats.set_int("MPPLY_TOTAL_TDEATHMATCH_WON", 0)
			stats.set_int("MPPLY_SHOOTINGRANGE_WINS", 0)
			stats.set_int("MPPLY_SHOOTINGRANGE_LOSSES", 0)
			stats.set_int("MPPLY_TENNIS_MATCHES_WON", 0)
			stats.set_int("MPPLY_TENNIS_MATCHES_LOST", 0)
			stats.set_int("MPPLY_GOLF_WINS", 0)
			stats.set_int("MPPLY_GOLF_LOSSES", 0)
			stats.set_int("MPPLY_DARTS_TOTAL_WINS", 0)
			stats.set_int("MPPLY_DARTS_TOTAL_MATCHES", 0)
			stats.set_int("MPPLY_SHOOTINGRANGE_TOTAL_MATCH", 0)
			stats.set_int("MPPLY_BJ_WINS", 0)
			stats.set_int("MPPLY_BJ_LOST", 0)
			stats.set_int("MPPLY_RACE_2_POINT_WINS", 0)
			stats.set_int("MPPLY_RACE_2_POINT_LOST", 0)
			stats.set_int("MPPLY_KILLS_PLAYERS", 0)
			stats.set_int("MPPLY_DEATHS_PLAYER", 0)
			stats.set_int("MPPLY_MISSIONS_CREATED", 0)
			stats.set_int("MPPLY_LTS_CREATED", 0)
			stats.set_int("MPPLY_FM_MISSION_LIKES", 0)
			stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", 0)
			stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", 0)
			stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", 0)
			stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", 0)
			stats.set_int("MPPLY_HEIST_ACH_TRACKER", 0)
			stats.set_int("MPPLY_WIN_GOLD_MEDAL_HEISTS", 0)
			stats.set_int("MPPLY_GANGOPS_ALLINORDER", 0)
			stats.set_int("MPPLY_GANGOPS_LOYALTY", 0)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD", 0)
			stats.set_int("MPPLY_GANGOPS_LOYALTY2", 0)
			stats.set_int("MPPLY_GANGOPS_LOYALTY3", 0)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", 0)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", 0)
			stats.set_int("MPPLY_GANGOPS_SUPPORT", 0)
			for i = 2, 19 do
				stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, 0)
			end
			for j = 1, 19 do
				stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", 0)
			end
			for m = 1, 01 do
				stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", 0)
			end
			for l = 2, 01 do
				stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, 0)
			end
			for i = 0, 9 do
				stats.set_int(MPX .. "IAP_INITIALS_"..i, 0)
				stats.set_int(MPX .. "IAP_SCORE_"..i, 0)
				stats.set_int(MPX .. "IAP_SCORE_"..i, 0)
				stats.set_int(MPX .. "SCGW_SCORE_"..i, 0)
				stats.set_int(MPX .. "DG_DEFENDER_INITIALS_"..i, 0)
				stats.set_int(MPX .. "DG_DEFENDER_SCORE_"..i, 0)
				stats.set_int(MPX .. "DG_MONKEY_INITIALS_"..i, 0)
				stats.set_int(MPX .. "DG_MONKEY_SCORE_"..i, 0)
				stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_"..i, 0)
				stats.set_int(MPX .. "DG_PENETRATOR_SCORE_"..i, 0)
				stats.set_int(MPX .. "GGSM_INITIALS_"..i, 0)
				stats.set_int(MPX .. "GGSM_SCORE_"..i, 0)
				stats.set_int(MPX .. "TWR_INITIALS_"..i, 0)
				stats.set_int(MPX .. "TWR_SCORE_"..i, 0)
			end
			stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", false)
			stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", false)
			stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", false)
			stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", false)
			stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", false)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", false)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_STASETWIN", false)
			stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", false)
			stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", false)
			stats.set_bool(MPX .. "AWD_FM0DIFFERENTDM", false)
			stats.set_bool(MPX .. "AWD_FM0DIFFERENTRACES", false)
			stats.set_bool(MPX .. "AWD_FMATTGANGHQ", false)
			stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", false)
			stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", false)
			stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", false)
			stats.set_bool(MPX .. "AWD_FM0DIFITEMSCLOTHES", false)
			stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", false)
			stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", false)
			stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", false)
			stats.set_bool(MPX .. "AWD_STORE_0_CAR_IN_GARAGES", false)
			stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", false)
			stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", false)
			stats.set_bool(MPX .. "CL_DRIVE_RALLY", false)
			stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", false)
			stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", false)
			stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", false)
			stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", false)
			stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", false)
			stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", false)
			stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", false)
			stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", false)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", false)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", false)
			stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", false)
			stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", false)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", false)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", false)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", false)
			stats.set_bool(MPX .. "CL_CALL_MERCENARIES", false)
			stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", false)
			stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", false)
			stats.set_bool(MPX .. "CL_FILL_TITAN", false)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", false)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", false)
			stats.set_bool(MPX .. "CL_BUY_INSURANCE", false)
			stats.set_bool(MPX .. "CL_BUY_GARAGE", false)
			stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", false)
			stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", false)
			stats.set_bool(MPX .. "CL_CALL_FRIEND", false)
			stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", false)
			stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", false)
			stats.set_bool(MPX .. "FM_INTRO_CUT_DONE", false)
			stats.set_bool(MPX .. "FM_INTRO_MISS_DONE", false)
			stats.set_bool(MPX .. "SHOOTINGRANGE_SEEN_TUT", false)
			stats.set_bool(MPX .. "TENNIS_SEEN_TUTORIAL", false)
			stats.set_bool(MPX .. "DARTS_SEEN_TUTORIAL", false)
			stats.set_bool(MPX .. "ARMWRESTLING_SEEN_TUTORIAL", false)
			stats.set_bool(MPX .. "HAS_WATCHED_BENNY_CUTSCE", false)
			stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", false)
			stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", false)
			stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", false)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", false)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", false)
			stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", false)
			stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", false)
			stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", false)
			stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", false)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_PRINT", false)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_0", false)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_1", false)
			stats.set_bool(MPX .. "HEIST_PRE_PLAN_DONE_HELP_0", false)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_FINALE", false)
			stats.set_bool(MPX .. "HEIST_IS_TUTORIAL", false)
			stats.set_bool(MPX .. "HEIST_STRAND_INTRO_DONE", false)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_ORNATE", false)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_PRISON", false)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_BIOLAB", false)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_NARCOTIC", false)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_TUTORIAL", false)
			stats.set_bool(MPX .. "HEIST_AWARD_DONE_PREP", false)
			stats.set_bool(MPX .. "HEIST_AWARD_BOUGHT_IN", false)
			stats.set_bool(MPX .. "AWD_MATCHING_OUTFIT_HEIST", false)
			stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", false)
			stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", false)
			stats.set_bool(MPX .. "AWD_CLUB_COORD", false)
			stats.set_bool(MPX .. "AWD_BEGINNER", false)
			stats.set_bool(MPX .. "AWD_FIELD_FILLER", false)
			stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", false)
			stats.set_bool(MPX .. "AWD_LEARNER", false)
			stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", false)
			stats.set_bool(MPX .. "AWD_THE_ROOKIE", false)
			stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", false)
			stats.set_bool(MPX .. "AWD_GEAR_HEAD", false)
			stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", false)
			stats.set_bool(MPX .. "AWD_HOT_LAP", false)
			stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", false)
			stats.set_bool(MPX .. "AWD_PAINT_TRADER", false)
			stats.set_bool(MPX .. "AWD_SHUNTER", false)
			stats.set_bool(MPX .. "AWD_JOCK", false)
			stats.set_bool(MPX .. "AWD_WARRIOR", false)
			stats.set_bool(MPX .. "AWD_T_BONE", false)
			stats.set_bool(MPX .. "AWD_MAYHEM", false)
			stats.set_bool(MPX .. "AWD_WRECKER", false)
			stats.set_bool(MPX .. "AWD_CRASH_COURSE", false)
			stats.set_bool(MPX .. "AWD_ARENA_LEGEND", false)
			stats.set_bool(MPX .. "AWD_PEGASUS", false)
			stats.set_bool(MPX .. "AWD_UNSTOPPABLE", false)
			stats.set_bool(MPX .. "AWD_CONTACT_SPORT", false)
			stats.set_bool(MPX .. "AWD_FIRST_TIME1", false)
			stats.set_bool(MPX .. "AWD_FIRST_TIME2", false)
			stats.set_bool(MPX .. "AWD_FIRST_TIME3", false)
			stats.set_bool(MPX .. "AWD_FIRST_TIME0", false)
			stats.set_bool(MPX .. "AWD_FIRST_TIME5", false)
			stats.set_bool(MPX .. "AWD_FIRST_TIME6", false)
			stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", false)
			stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", false)
			stats.set_bool(MPX .. "AWD_LEADER", false)
			stats.set_bool(MPX .. "AWD_SURVIVALIST", false)
			Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD")
			if Paragon == true then
				stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
			else
				stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
			end
			stats.set_bool(MPX .. "AWD_SCOPEOUT", false)
			stats.set_bool(MPX .. "AWD_CREWEDUP", false)
			stats.set_bool(MPX .. "AWD_MOVINGON", false)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", false)
			stats.set_bool(MPX .. "AWD_GUNMAN", false)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", false)
			stats.set_bool(MPX .. "AWD_INPLAINSI", false)
			stats.set_bool(MPX .. "AWD_UNDETECTED", false)
			stats.set_bool(MPX .. "AWD_ALLROUND", false)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", false)
			stats.set_bool(MPX .. "AWD_PRO", false)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", false)
			stats.set_bool(MPX .. "AWD_SHAFTED", false)
			stats.set_bool(MPX .. "AWD_COLLECTOR", false)
			stats.set_bool(MPX .. "AWD_DEADEYE", false)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", false)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", false)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", false)
			stats.set_bool(MPX .. "AWD_WIZHARD", false)
			stats.set_bool(MPX .. "AWD_APEESCAPE", false)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", false)
			stats.set_bool(MPX .. "AWD_AQUAAPE", false)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", false)
			stats.set_bool(MPX .. "AWD_falseLOVE", false)
			stats.set_bool(MPX .. "AWD_NEMESIS", false)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", false)
			stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", false)
			stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", false)
			stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", false)
			stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", false)
			stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", false)
			stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", false)
			stats.set_bool(MPX .. "HELP_FURIA", false)
			stats.set_bool(MPX .. "HELP_MINITAN", false)
			stats.set_bool(MPX .. "HELP_YOSEMITE2", false)
			stats.set_bool(MPX .. "HELP_ZHABA", false)
			stats.set_bool(MPX .. "HELP_IMORGEN", false)
			stats.set_bool(MPX .. "HELP_SULTAN2", false)
			stats.set_bool(MPX .. "HELP_VAGRANT", false)
			stats.set_bool(MPX .. "HELP_VSTR", false)
			stats.set_bool(MPX .. "HELP_STRYDER", false)
			stats.set_bool(MPX .. "HELP_SUGOI", false)
			stats.set_bool(MPX .. "HELP_KANJO", false)
			stats.set_bool(MPX .. "HELP_FORMULA", false)
			stats.set_bool(MPX .. "HELP_FORMULA2", false)
			stats.set_bool(MPX .. "HELP_JB0", false)
			stats.set_bool(MPX .. "AWD_SCOPEOUT", false)
			stats.set_bool(MPX .. "AWD_CREWEDUP", false)
			stats.set_bool(MPX .. "AWD_MOVINGON", false)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", false)
			stats.set_bool(MPX .. "AWD_GUNMAN", false)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", false)
			stats.set_bool(MPX .. "AWD_INPLAINSI", false)
			stats.set_bool(MPX .. "AWD_UNDETECTED", false)
			stats.set_bool(MPX .. "AWD_ALLROUND", false)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", false)
			stats.set_bool(MPX .. "AWD_PRO", false)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", false)
			stats.set_bool(MPX .. "AWD_SHAFTED", false)
			stats.set_bool(MPX .. "AWD_COLLECTOR", false)
			stats.set_bool(MPX .. "AWD_DEADEYE", false)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", false)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", false)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", false)
			stats.set_bool(MPX .. "AWD_WIZHARD", false)
			stats.set_bool(MPX .. "AWD_APEESCAP", false)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", false)
			stats.set_bool(MPX .. "AWD_AQUAAPE", false)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", false)
			stats.set_bool(MPX .. "AWD_falseLOVE", false)
			stats.set_bool(MPX .. "AWD_NEMESIS", false)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", false)
			stats.set_bool(MPX .. "IAP_CHALLENGE_0", false)
			stats.set_bool(MPX .. "IAP_CHALLENGE_1", false)
			stats.set_bool(MPX .. "IAP_CHALLENGE_2", false)
			stats.set_bool(MPX .. "IAP_CHALLENGE_3", false)
			stats.set_bool(MPX .. "IAP_CHALLENGE_0", false)
			stats.set_bool(MPX .. "IAP_GOLD_TANK", false)
			stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", false)
			stats.set_bool(MPX .. "AWD_KINGOFQUB3D", false)
			stats.set_bool(MPX .. "AWD_QUBISM", false)
			stats.set_bool(MPX .. "AWD_QUIBITS", false)
			stats.set_bool(MPX .. "AWD_GODOFQUB3D", false)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", false)
			stats.set_bool(MPX .. "AWD_GOFOR11TH", false)
			stats.set_bool(MPX .. "AWD_INTELGATHER", false)
			stats.set_bool(MPX .. "AWD_COMPOUNDINFILT", false)
			stats.set_bool(MPX .. "AWD_LOOT_FINDER", false)
			stats.set_bool(MPX .. "AWD_MAX_DISRUPT", false)
			stats.set_bool(MPX .. "AWD_THE_ISLAND_HEIST", false)
			stats.set_bool(MPX .. "AWD_GOING_ALONE", false)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", false)
			stats.set_bool(MPX .. "AWD_MIXING_UP", false)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", false)
			stats.set_bool(MPX .. "AWD_MIXING_UP", false)
			stats.set_bool(MPX .. "AWD_PRO_THIEF", false)
			stats.set_bool(MPX .. "AWD_CAT_BURGLAR", false)
			stats.set_bool(MPX .. "AWD_ONE_OF_THEM", false)
			stats.set_bool(MPX .. "AWD_GOLDEN_GUN", false)
			stats.set_bool(MPX .. "AWD_ELITE_THIEF", false)
			stats.set_bool(MPX .. "AWD_PROFESSIONAL", false)
			stats.set_bool(MPX .. "AWD_HELPING_OUT", false)
			stats.set_bool(MPX .. "AWD_COURIER", false)
			stats.set_bool(MPX .. "AWD_PARTY_VIBES", false)
			stats.set_bool(MPX .. "AWD_HELPING_HAND", false)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", false)
			stats.set_bool(MPX .. "COMPLETE_H0_F_USING_VETIR", false)
			stats.set_bool(MPX .. "COMPLETE_H0_F_USING_LONGFIN", false)
			stats.set_bool(MPX .. "COMPLETE_H0_F_USING_ANNIH", false)
			stats.set_bool(MPX .. "COMPLETE_H0_F_USING_ALKONOS", false)
			stats.set_bool(MPX .. "COMPLETE_H0_F_USING_PATROLB", false)
			stats.set_bool(MPX .. "AWD_CAR_CLUB", false)
			stats.set_bool(MPX .. "AWD_PRO_CAR_EXPORT", false)
			stats.set_bool(MPX .. "AWD_UNION_DEPOSITORY", false)
			stats.set_bool(MPX .. "AWD_MILITARY_CONVOY", false)
			stats.set_bool(MPX .. "AWD_FLEECA_BANK", false)
			stats.set_bool(MPX .. "AWD_FREIGHT_TRAIN", false)
			stats.set_bool(MPX .. "AWD_BOLINGBROKE_ASS", false)
			stats.set_bool(MPX .. "AWD_IAA_RAID", false)
			stats.set_bool(MPX .. "AWD_METH_JOB", false)
			stats.set_bool(MPX .. "AWD_BUNKER_RAID", false)
			stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", false)
			stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", false)
			stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", false)
			stats.set_bool(MPX .. "AWD_DIRECTOR", false)
			stats.set_bool(MPX .. "AWD_TEEING_OFF", false)
			stats.set_bool(MPX .. "AWD_PARTY_NIGHT", false)
			stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", false)
			stats.set_bool(MPX .. "AWD_HOOD_PASS", false)
			stats.set_bool(MPX .. "AWD_STUDIO_TOUR", false)
			stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", false)
			stats.set_bool(MPX .. "AWD_BACKUP", false)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_1", false)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_2", false)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_3", false)
			stats.set_bool(MPX .. "AWD_CONTR_KILLER", false)
			stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", false)
			stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", false)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", false)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", false)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", false)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", false)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", false)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", false)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", false)
			stats.set_bool("MPPLY_AWD_FLEECA_FIN", false)
			stats.set_bool("MPPLY_AWD_PRISON_FIN", false)
			stats.set_bool("MPPLY_AWD_HUMANE_FIN", false)
			stats.set_bool("MPPLY_AWD_SERIESA_FIN", false)
			stats.set_bool("MPPLY_AWD_PACIFIC_FIN", false)
			stats.set_bool("MPPLY_AWD_HST_ORDER", false)
			stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", false)
			stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", false)
			stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", false)
			stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_IAA", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", false)
			stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", false)
			stats.set_bool(MPX .. "AWD_ACELIQUOR", false)
			stats.set_bool(MPX .. "AWD_TRUCKAMBUSH", false)
			stats.set_bool(MPX .. "AWD_LOSTCAMPREV", false)
			stats.set_bool(MPX .. "AWD_ACIDTRIP", false)
			stats.set_bool(MPX .. "AWD_HIPPYRIVALS", false)
			stats.set_bool(MPX .. "AWD_TRAINCRASH", false)
			stats.set_bool(MPX .. "AWD_BACKUPB", false)
			stats.set_bool(MPX .. "AWD_GETSTARTED", false)
			stats.set_bool(MPX .. "AWD_CHEMREACTION", false)
			stats.set_bool(MPX .. "AAWD_WAREHODEFEND", false)
			stats.set_bool(MPX .. "AWD_ATTACKINVEST", false)
			stats.set_bool(MPX .. "AWD_RESCUECOOK", false)
			stats.set_bool(MPX .. "AWD_DRUGTRIPREHAB", false)
			stats.set_bool(MPX .. "AWD_CARGOPLANE", false)
			stats.set_bool(MPX .. "AWD_BACKUPB2", false)
			stats.set_bool(MPX .. "AWD_TAXISTAR", false)
			stats.set_int(MPX .. "AWD_RUNRABBITRUN", 0)
			stats.set_int(MPX .. "AWD_CALLME", 0)
			stats.set_int(MPX .. "AWD_CHEMCOMPOUNDS", 0)
		end)

	Awards:add_action("", null)

	AwardsNote = Awards:add_submenu("Read Me")

	AwardsNote:add_action("    	 Unlocking «After Hours» awards will ", null)
	AwardsNote:add_action("  cause a transaction error multiple times;", null)
	AwardsNote:add_action("        some awards can be temporarily", null)

--Characteristics--

	Characteristics = CharactersStats:add_submenu("Characteristics")

	Characteristics:add_toggle("Max Stats",
		function()
			Get = stats.get_int
			if Get(MPX .. "STAMINA") == 100 and Get(MPX .. "SHOOTING_ABILITY") == 100 and Get(MPX .. "SHOOTING_ABILITY") and Get(MPX .. "STRENGTH") == 100
				and Get(MPX .. "STEALTH_ABILITY") == 100 and Get(MPX .. "FLYING_ABILITY") == 100 and Get(MPX .. "WHEELIE_ABILITY") == 100 and Get(MPX .. "LUNG_CAPACITY") == 100 then
				return true
			else
				return false
			end
		end,
		function()
			stats.set_int(MPX .. "SCRIPT_INCREASE_DRIV", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_FLY", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_LUNG", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_SHO", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_STAM", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_STL", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_STRN", 100)
		end)

			a58 = false
		local function FastRunNReload(Enabled)
			if Enabled then
				for i = 1, 3 do
					stats.set_int(MPX .. "CHAR_FM_ABILITY_" .. i .. "_UNLCK", -1)
					stats.set_int(MPX .. "CHAR_ABILITY_" .. i .. "_UNLCK", -1)
				end
			else
				for i = 1, 3 do
					stats.set_int(MPX .. "CHAR_FM_ABILITY_" .. i .. "_UNLCK", 0)
					stats.set_int(MPX .. "CHAR_ABILITY_" .. i .. "_UNLCK", 0)
				end
			end
		end
	Characteristics:add_toggle("Fast Run n Reload", function() return a58 end, function() a58 = not a58 FastRunNReload(a58) end)

	Characteristics:add_bare_item("",
		function()
			stamina = stats.get_int(MPX .. "STAMINA")
			if stamina <= 25 then
				status = "(lung cancer)"
			elseif stamina > 25 and stamina <= 50 then
				status = "(fat ass)"
			elseif stamina > 50 and stamina <= 75 then
				status = "(athlete)"
			elseif stamina > 75 and stamina <= 99
				then status = "(pro)"
			else status = "(Usain Bolt)"
			end
			return "Stamina: " .. stamina .. "/100 " .. status
		end, null, null, null)
	Characteristics:add_bare_item("",
		function()
			shooting = stats.get_int(MPX .. "SHOOTING_ABILITY")
			if shooting <= 25 then
				status = "(cataract)"
			elseif shooting > 25 and shooting <= 50 then
				status = "(american)"
			elseif shooting > 50 and shooting <= 75 then
				status = "(policeman)"
			elseif shooting > 75 and shooting <= 99
				then status = "(pvp kid)"
			else status = "(John Wick)"
			end
			return "Shooting: " .. shooting .. "/100 " .. status
		end, null, null, null)
	Characteristics:add_bare_item("",
		function()
			strength = stats.get_int(MPX .. "STRENGTH")
			if strength <= 25 then
				status = "(anorexia)"
			elseif strength > 25 and strength <= 50 then
				status = "(weak af)"
			elseif strength > 50 and strength <= 75 then
				status = "(boxer)"
			elseif strength > 75 and strength <= 99
				then status = "(builder)"
			else status = "(Gym Rat)"
			end
			return "Strength: " .. strength .. "/100 " .. status
			end, null, null, null)
	Characteristics:add_bare_item("",
		function()
			stealth = stats.get_int(MPX .. "STEALTH_ABILITY")
			if stealth <= 25 then
				status = "(gorlock the destroyer)"
			elseif stealth > 25 and stealth <= 50 then
				status = "(drunk teenager)"
			elseif stealth > 50 and stealth <= 75 then
				status = "(thief)"
			elseif stealth > 75 and stealth <= 99
				then status = "(assassin)"
			else status = "(Agent 47)"
			end
			return "Stealth: " .. stealth .. "/100 " .. status
		end, null, null, null)
	Characteristics:add_bare_item("",
		function()
			flying = stats.get_int(MPX .. "FLYING_ABILITY")
			if flying <= 25 then
				status = "(kamikaze)"
			elseif flying > 25 and flying <= 50 then
				status = "(german)"
			elseif flying > 50 and flying <= 75 then
				status = "(pilot)"
			elseif flying > 75 and flying <= 99
				then status = "(war thunder enjoyer)"
			else status = "(«Maverick» Mitchell)"
			end
			return "Flying: " .. flying .. "/100 " .. status
		end, null, null, null)
	Characteristics:add_bare_item("",
		function()
			driving = stats.get_int(MPX .. "WHEELIE_ABILITY")
			if driving <= 25 then
				status = "(grandma)"
			elseif driving > 25 and driving <= 50 then
				status = "(amateur)"
			elseif driving > 50 and driving <= 75 then
				status = "(taxi driver)"
			elseif driving > 75 and driving <= 99
				then status = "(drifter)"
			else status = "(Ken Block)"
			end
			return "Driving: " .. driving .. "/100 " .. status
		end, null, null, null)
	Characteristics:add_bare_item("",
		function()
			swimming = stats.get_int(MPX .. "LUNG_CAPACITY")
			if swimming <= 25 then
				status = "(rock)"
			elseif swimming > 25 and swimming <= 50 then
				status = "(wood)"
			elseif swimming > 50 and swimming <= 75 then
				status = "(fisherman)"
			elseif swimming > 75 and swimming <= 99
				then status = "(dolphine)"
			else status = "(Poseidon)"
			end
			return "Swimming: " .. swimming .. "/100 " .. status
		end, null, null, null)
	Characteristics:add_float_range("Mental State", 0.1, 0, 100,
		function()
			return stats.get_float(MPX .. "PLAYER_MENTAL_STATE")
		end,
		function(Men)
			stats.set_float(MPX .. "PLAYER_MENTAL_STATE", Men)
		end)

	Characteristics:add_action("", null)

	CharacteristicsNote = Characteristics:add_submenu("Read Me")

	CharacteristicsNote:add_action("                  Fast Run n Reload:", null)
	CharacteristicsNote:add_action("      Change session to apply the result", null)

--Collectibles--

	Collectibles = CharactersStats:add_submenu("Collectibles")

	TCollectibles = Collectibles:add_submenu("Unlock All (Temporarily)")

	TCollectibles:add_bare_item("", function() return "Action Figures (" .. globals.get_int(2765084 + 209) .. "/100)" end, function() globals.set_int(2765084 + 209, 100) end, null, null)
	TCollectibles:add_bare_item("", function() return "LD Organics (" .. globals.get_int(2765084 + 593) .. "/100)" end, function() globals.set_int(2765084 + 593, 100) end, null, null)
	TCollectibles:add_bare_item("", function() return "Playing Cards (" .. globals.get_int(2765084 + 210) .. "/54)" end, function() globals.set_int(2765084 + 210, 54) end, null, null)
	TCollectibles:add_bare_item("", function() return "Signal Jammers (" .. globals.get_int(2765084 + 211) .. "/50)" end, function() globals.set_int(2765084 + 211, 50) end, null, null)
	TCollectibles:add_bare_item("", function() return "Treasure Chests (" .. globals.get_int(2765084 + 506) .. "/30)" end, function() globals.set_int(2765084 + 506, 30) end, null, null)
	TCollectibles:add_bare_item("", function() return "Snowmen (" .. globals.get_int(2765084 + 600) .. "/25)" end, function() globals.set_int(2765084 + 600, 25) end, null, null)
	TCollectibles:add_bare_item("", function() return "Buried Stashes (" .. globals.get_int(2765084 + 553) .. "/10)" end, function() globals.set_int(2765084 + 553, 10) end, null, null)
	TCollectibles:add_bare_item("", function() return "Hidden Caches (" .. globals.get_int(2765084 + 504) .. "/10)" end, function() globals.set_int(2765084 + 504, 10) end, null, null)
	TCollectibles:add_bare_item("", function() return "Jack o Lantern (" .. globals.get_int(2765084 + 591) .. "/10)" end, function() globals.set_int(2765084 + 591, 10) end, null, null)
	TCollectibles:add_bare_item("", function() return "Movie Props (" .. globals.get_int(2765084 + 494) .. "/10)" end, function() globals.set_int(2765084 + 494, 10) end, null, null)

	PCollectibles = Collectibles:add_submenu("Unlock All (Permanently)")

	PCollectibles:add_bare_item("", function() return "Action Figures (" .. globals.get_int(2765084 + 209) .. "/100)" end, function() globals.set_int(2765084 + 209, 99) end, null, null)
	PCollectibles:add_bare_item("", function() return "LD Organics (" .. globals.get_int(2765084 + 593) .. "/100)" end, function() globals.set_int(2765084 + 593, 99) end, null, null)
	PCollectibles:add_bare_item("", function() return "Playing Cards (" .. globals.get_int(2765084 + 210) .. "/54)" end, function() globals.set_int(2765084 + 210, 53) end, null, null)
	PCollectibles:add_bare_item("", function() return "Signal Jammers (" .. globals.get_int(2765084 + 211) .. "/50)" end, function() globals.set_int(2765084 + 211, 49) end, null, null)
	PCollectibles:add_bare_item("", function() return "Treasure Chests (" .. globals.get_int(2765084 + 506) .. "/30)" end, function() globals.set_int(2765084 + 506, 29) end, null, null)
	PCollectibles:add_bare_item("", function() return "Snowmen (" .. globals.get_int(2765084 + 600) .. "/25)" end, function() globals.set_int(2765084 + 600, 24) end, null, null)
	PCollectibles:add_bare_item("", function() return "Buried Stashes (" .. globals.get_int(2765084 + 553) .. "/10)" end, function() globals.set_int(2765084 + 553, 9) end, null, null)
	PCollectibles:add_bare_item("", function() return "Hidden Caches (" .. globals.get_int(2765084 + 504) .. "/10)" end, function() globals.set_int(2765084 + 504, 9) end, null, null)
	PCollectibles:add_bare_item("", function() return "Jack o Lantern (" .. globals.get_int(2765084 + 591) .. "/10)" end, function() globals.set_int(2765084 + 591, 9) end, null, null)
	PCollectibles:add_bare_item("", function() return "Movie Props (" .. globals.get_int(2765084 + 494) .. "/10)" end, function() globals.set_int(2765084 + 494, 9) end, null, null)

	PCollectibles:add_action("", null)

	PCollectiblesNote = PCollectibles:add_submenu("Read Me")

	PCollectiblesNote:add_action("     First, find the item you want, select", null)
	PCollectiblesNote:add_action("    an option, and then pick up the item", null)

--Crew Rank--

	CrewRank = CharactersStats:add_submenu("Crew Rank")

			a77 = 0
	CrewRank:add_int_range("Crew", 1, 0, 4,
		function()
			return a77
		end,
		function(Cre)
			a77 = Cre
		end)

			RPtoRank = {0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000, 28500, 33400, 38700, 44200, 50200, 56400, 63000, 69900, 77100, 84700, 92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100, 188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000, 312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800, 465200, 482000, 499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400, 644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900, 849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700, 1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100, 1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300, 1555800, 1584350, 1612950, 1641600, 1670300, 1699050, 1727850, 1756700, 1785600, 1814550, 1843550, 1872600, 1901700, 1930850, 1960050, 1989300, 2018600, 2047950, 2077350, 2106800, 2136300, 2165850, 2195450, 2225100, 2254800, 2284550, 2314350, 2344200, 2374100, 2404050, 2434050, 2464100, 2494200, 2524350, 2554550, 2584800, 2615100, 2645450, 2675850, 2706300, 2736800, 2767350, 2797950, 2828600, 2859300, 2890050, 2920850, 2951700, 2982600, 3013550, 3044550, 3075600, 3106700, 3137850, 3169050, 3200300, 3231600, 3262950, 3294350, 3325800, 3357300, 3388850, 3420450, 3452100, 3483800, 3515550, 3547350, 3579200, 3611100, 3643050, 3675050, 3707100, 3739200, 3771350, 3803550, 3835800, 3868100, 3900450, 3932850, 3965300, 3997800, 4030350, 4062950, 4095600, 4128300, 4161050, 4193850, 4226700, 4259600, 4292550, 4325550, 4358600, 4391700, 4424850, 4458050, 4491300, 4524600, 4557950, 4591350, 4624800, 4658300, 4691850, 4725450, 4759100, 4792800, 4826550, 4860350, 4894200, 4928100, 4962050, 4996050, 5030100, 5064200, 5098350, 5132550, 5166800, 5201100, 5235450, 5269850, 5304300, 5338800, 5373350, 5407950, 5442600, 5477300, 5512050, 5546850, 5581700, 5616600, 5651550, 5686550, 5721600, 5756700, 5791850, 5827050, 5862300, 5897600, 5932950, 5968350, 6003800, 6039300, 6074850, 6110450, 6146100, 6181800, 6217550, 6253350, 6289200, 6325100, 6361050, 6397050, 6433100, 6469200, 6505350, 6541550, 6577800, 6614100, 6650450, 6686850, 6723300, 6759800, 6796350, 6832950, 6869600, 6906300, 6943050, 6979850, 7016700, 7053600, 7090550, 7127550, 7164600, 7201700, 7238850, 7276050, 7313300, 7350600, 7387950, 7425350, 7462800, 7500300, 7537850, 7575450, 7613100, 7650800, 7688550, 7726350, 7764200, 7802100, 7840050, 7878050, 7916100, 7954200, 7992350, 8030550, 8068800, 8107100, 8145450, 8183850, 8222300, 8260800, 8299350, 8337950, 8376600, 8415300, 8454050, 8492850, 8531700, 8570600, 8609550, 8648550, 8687600, 8726700, 8765850, 8805050, 8844300, 8883600, 8922950, 8962350, 9001800, 9041300, 9080850, 9120450, 9160100, 9199800, 9239550, 9279350, 9319200, 9359100, 9399050, 9439050, 9479100, 9519200, 9559350, 9599550, 9639800, 9680100, 9720450, 9760850, 9801300, 9841800, 9882350, 9922950, 9963600, 10004300, 10045050, 10085850, 10126700, 10167600, 10208550, 10249550, 10290600, 10331700, 10372850, 10414050, 10455300, 10496600, 10537950, 10579350, 10620800, 10662300, 10703850, 10745450, 10787100, 10828800, 10870550, 10912350, 10954200, 10996100, 11038050, 11080050, 11122100, 11164200, 11206350, 11248550, 11290800, 11333100, 11375450, 11417850, 11460300, 11502800, 11545350, 11587950, 11630600, 11673300, 11716050, 11758850, 11801700, 11844600, 11887550, 11930550, 11973600, 12016700, 12059850, 12103050, 12146300, 12189600, 12232950, 12276350, 12319800, 12363300, 12406850, 12450450, 12494100, 12537800, 12581550, 12625350, 12669200, 12713100, 12757050, 12801050, 12845100, 12889200, 12933350, 12977550, 13021800, 13066100, 13110450, 13154850, 13199300, 13243800, 13288350, 13332950, 13377600, 13422300, 13467050, 13511850, 13556700, 13601600, 13646550, 13691550, 13736600, 13781700, 13826850, 13872050, 13917300, 13962600, 14007950, 14053350, 14098800, 14144300, 14189850, 14235450, 14281100, 14326800, 14372550, 14418350, 14464200, 14510100, 14556050, 14602050, 14648100, 14694200, 14740350, 14786550, 14832800, 14879100, 14925450, 14971850, 15018300, 15064800, 15111350, 15157950, 15204600, 15251300, 15298050, 15344850, 15391700, 15438600, 15485550, 15532550, 15579600, 15626700, 15673850, 15721050, 15768300, 15815600, 15862950, 15910350, 15957800, 16005300, 16052850, 16100450, 16148100, 16195800, 16243550, 16291350, 16339200, 16387100, 16435050, 16483050, 16531100, 16579200, 16627350, 16675550, 16723800, 16772100, 16820450, 16868850, 16917300, 16965800, 17014350, 17062950, 17111600, 17160300, 17209050, 17257850, 17306700, 17355600, 17404550, 17453550, 17502600, 17551700, 17600850, 17650050, 17699300, 17748600, 17797950, 17847350, 17896800, 17946300, 17995850, 18045450, 18095100, 18144800, 18194550, 18244350, 18294200, 18344100, 18394050, 18444050, 18494100, 18544200, 18594350, 18644550, 18694800, 18745100, 18795450, 18845850, 18896300, 18946800, 18997350, 19047950, 19098600, 19149300, 19200050, 19250850, 19301700, 19352600, 19403550, 19454550, 19505600, 19556700, 19607850, 19659050, 19710300, 19761600, 19812950, 19864350, 19915800, 19967300, 20018850, 20070450, 20122100, 20173800, 20225550, 20277350, 20329200, 20381100, 20433050, 20485050, 20537100, 20589200, 20641350, 20693550, 20745800, 20798100, 20850450, 20902850, 20955300, 21007800, 21060350, 21112950, 21165600, 21218300, 21271050, 21323850, 21376700, 21429600, 21482550, 21535550, 21588600, 21641700, 21694850, 21748050, 21801300, 21854600, 21907950, 21961350, 22014800, 22068300, 22121850, 22175450, 22229100, 22282800, 22336550, 22390350, 22444200, 22498100, 22552050, 22606050, 22660100, 22714200, 22768350, 22822550, 22876800, 22931100, 22985450, 23039850, 23094300, 23148800, 23203350, 23257950, 23312600, 23367300, 23422050, 23476850, 23531700, 23586600, 23641550, 23696550, 23751600, 23806700, 23861850, 23917050, 23972300, 24027600, 24082950, 24138350, 24193800, 24249300, 24304850, 24360450, 24416100, 24471800, 24527550, 24583350, 24639200, 24695100, 24751050, 24807050, 24863100, 24919200, 24975350, 25031550, 25087800, 25144100, 25200450, 25256850, 25313300, 25369800, 25426350, 25482950, 25539600, 25596300, 25653050, 25709850, 25766700, 25823600, 25880550, 25937550, 25994600, 26051700, 26108850, 26166050, 26223300, 26280600, 26337950, 26395350, 26452800, 26510300, 26567850, 26625450, 26683100, 26740800, 26798550, 26856350, 26914200, 26972100, 27030050, 27088050, 27146100, 27204200, 27262350, 27320550, 27378800, 27437100, 27495450, 27553850, 27612300, 27670800, 27729350, 27787950, 27846600, 27905300, 27964050, 28022850, 28081700, 28140600, 28199550, 28258550, 28317600, 28376700, 28435850, 28495050, 28554300, 28613600, 28672950, 28732350, 28791800, 28851300, 28910850, 28970450, 29030100, 29089800, 29149550, 29209350, 29269200, 29329100, 29389050, 29449050, 29509100, 29569200, 29629350, 29689550, 29749800, 29810100, 29870450, 29930850, 29991300, 30051800, 30112350, 30172950, 30233600, 30294300, 30355050, 30415850, 30476700, 30537600, 30598550, 30659550, 30720600, 30781700, 30842850, 30904050, 30965300, 31026600, 31087950, 31149350, 31210800, 31272300, 31333850, 31395450, 31457100, 31518800, 31580550, 31642350, 31704200, 31766100, 31828050, 31890050, 31952100, 32014200, 32076350, 32138550, 32200800, 32263100, 32325450, 32387850, 32450300, 32512800, 32575350, 32637950, 32700600, 32763300, 32826050, 32888850, 32951700, 33014600, 33077550, 33140550, 33203600, 33266700, 33329850, 33393050, 33456300, 33519600, 33582950, 33646350, 33709800, 33773300, 33836850, 33900450, 33964100, 34027800, 34091550, 34155350, 34219200, 34283100, 34347050, 34411050, 34475100, 34539200, 34603350, 34667550, 34731800, 34796100, 34860450, 34924850, 34989300, 35053800, 35118350, 35182950, 35247600, 35312300, 35377050, 35441850, 35506700, 35571600, 35636550, 35701550, 35766600, 35831700, 35896850, 35962050, 36027300, 36092600, 36157950, 36223350, 36288800, 36354300, 36419850, 36485450, 36551100, 36616800, 36682550, 36748350, 36814200, 36880100, 36946050, 37012050, 37078100, 37144200, 37210350, 37276550, 37342800, 37409100, 37475450, 37541850, 37608300, 37674800, 37741350, 37807950, 37874600, 37941300, 38008050, 38074850, 38141700, 38208600, 38275550, 38342550, 38409600, 38476700, 38543850, 38611050, 38678300, 38745600, 38812950, 38880350, 38947800, 39015300, 39082850, 39150450, 39218100, 39285800, 39353550, 39421350, 39489200, 39557100, 39625050, 39693050, 39761100, 39829200, 39897350, 39965550, 40033800, 40102100, 40170450, 40238850, 40307300, 40375800, 40444350, 40512950, 40581600, 40650300, 40719050, 40787850, 40856700, 40925600, 40994550, 41063550, 41132600, 41201700, 41270850, 41340050, 41409300, 41478600, 41547950, 41617350, 41686800, 41756300, 41825850, 41895450, 41965100, 42034800, 42104550, 42174350, 42244200, 42314100, 42384050, 42454050, 42524100, 42594200, 42664350, 42734550, 42804800, 42875100, 42945450, 43015850, 43086300, 43156800, 43227350, 43297950, 43368600, 43439300, 43510050, 43580850, 43651700, 43722600, 43793550, 43864550, 43935600, 44006700, 44077850, 44149050, 44220300, 44291600, 44362950, 44434350, 44505800, 44577300, 44648850, 44720450, 44792100, 44863800, 44935550, 45007350, 45079200, 45151100, 45223050, 45295050, 45367100, 45439200, 45511350, 45583550, 45655800, 45728100, 45800450, 45872850, 45945300, 46017800, 46090350, 46162950, 46235600, 46308300, 46381050, 46453850, 46526700, 46599600, 46672550, 46745550, 46818600, 46891700, 46964850, 47038050, 47111300, 47184600, 47257950, 47331350, 47404800, 47478300, 47551850, 47625450, 47699100, 47772800, 47846550, 47920350, 47994200, 48068100, 48142050, 48216050, 48290100, 48364200, 48438350, 48512550, 48586800, 48661100, 48735450, 48809850, 48884300, 48958800, 49033350, 49107950, 49182600, 49257300, 49332050, 49406850, 49481700, 49556600, 49631550, 49706550, 49781600, 49856700, 49931850, 50007050, 50082300, 50157600, 50232950, 50308350, 50383800, 50459300, 50534850, 50610450, 50686100, 50761800, 50837550, 50913350, 50989200, 51065100, 51141050, 51217050, 51293100, 51369200, 51445350, 51521550, 51597800, 51674100, 51750450, 51826850, 51903300, 51979800, 52056350, 52132950, 52209600, 52286300, 52363050, 52439850, 52516700, 52593600, 52670550, 52747550, 52824600, 52901700, 52978850, 53056050, 53133300, 53210600, 53287950, 53365350, 53442800, 53520300, 53597850, 53675450, 53753100, 53830800, 53908550, 53986350, 54064200, 54142100, 54220050, 54298050, 54376100, 54454200, 54532350, 54610550, 54688800, 54767100, 54845450, 54923850, 55002300, 55080800, 55159350, 55237950, 55316600, 55395300, 55474050, 55552850, 55631700, 55710600, 55789550, 55868550, 55947600, 56026700, 56105850, 56185050, 56264300, 56343600, 56422950, 56502350, 56581800, 56661300, 56740850, 56820450, 56900100, 56979800, 57059550, 57139350, 57219200, 57299100, 57379050, 57459050, 57539100, 57619200, 57699350, 57779550, 57859800, 57940100, 58020450, 58100850, 58181300, 58261800, 58342350, 58422950, 58503600, 58584300, 58665050, 58745850, 58826700, 58907600, 58988550, 59069550, 59150600, 59231700, 59312850, 59394050, 59475300, 59556600, 59637950, 59719350, 59800800, 59882300, 59963850, 60045450, 60127100, 60208800, 60290550, 60372350, 60454200, 60536100, 60618050, 60700050, 60782100, 60864200, 60946350, 61028550, 61110800, 61193100, 61275450, 61357850, 61440300, 61522800, 61605350, 61687950, 61770600, 61853300, 61936050, 62018850, 62101700, 62184600, 62267550, 62350550, 62433600, 62516700, 62599850, 62683050, 62766300, 62849600, 62932950, 63016350, 63099800, 63183300, 63266850, 63350450, 63434100, 63517800, 63601550, 63685350, 63769200, 63853100, 63937050, 64021050, 64105100, 64189200, 64273350, 64357550, 64441800, 64526100, 64610450, 64694850, 64779300, 64863800, 64948350, 65032950, 65117600, 65202300, 65287050, 65371850, 65456700, 65541600, 65626550, 65711550, 65796600, 65881700, 65966850, 66052050, 66137300, 66222600, 66307950, 66393350, 66478800, 66564300, 66649850, 66735450, 66821100, 66906800, 66992550, 67078350, 67164200, 67250100, 67336050, 67422050, 67508100, 67594200, 67680350, 67766550, 67852800, 67939100, 68025450, 68111850, 68198300, 68284800, 68371350, 68457950, 68544600, 68631300, 68718050, 68804850, 68891700, 68978600, 69065550, 69152550, 69239600, 69326700, 69413850, 69501050, 69588300, 69675600, 69762950, 69850350, 69937800, 70025300, 70112850, 70200450, 70288100, 70375800, 70463550, 70551350, 70639200, 70727100, 70815050, 70903050, 70991100, 71079200, 71167350, 71255550, 71343800, 71432100, 71520450, 71608850, 71697300, 71785800, 71874350, 71962950, 72051600, 72140300, 72229050, 72317850, 72406700, 72495600, 72584550, 72673550, 72762600, 72851700, 72940850, 73030050, 73119300, 73208600, 73297950, 73387350, 73476800, 73566300, 73655850, 73745450, 73835100, 73924800, 74014550, 74104350, 74194200, 74284100, 74374050, 74464050, 74554100, 74644200, 74734350, 74824550, 74914800, 75005100, 75095450, 75185850, 75276300, 75366800, 75457350, 75547950, 75638600, 75729300, 75820050, 75910850, 76001700, 76092600, 76183550, 76274550, 76365600, 76456700, 76547850, 76639050, 76730300, 76821600, 76912950, 77004350, 77095800, 77187300, 77278850, 77370450, 77462100, 77553800, 77645550, 77737350, 77829200, 77921100, 78013050, 78105050, 78197100, 78289200, 78381350, 78473550, 78565800, 78658100, 78750450, 78842850, 78935300, 79027800, 79120350, 79212950, 79305600, 79398300, 79491050, 79583850, 79676700, 79769600, 79862550, 79955550, 80048600, 80141700, 80234850, 80328050, 80421300, 80514600, 80607950, 80701350, 80794800, 80888300, 80981850, 81075450, 81169100, 81262800, 81356550, 81450350, 81544200, 81638100, 81732050, 81826050, 81920100, 82014200, 82108350, 82202550, 82296800, 82391100, 82485450, 82579850, 82674300, 82768800, 82863350, 82957950, 83052600, 83147300, 83242050, 83336850, 83431700, 83526600, 83621550, 83716550, 83811600, 83906700, 84001850, 84097050, 84192300, 84287600, 84382950, 84478350, 84573800, 84669300, 84764850, 84860450, 84956100, 85051800, 85147550, 85243350, 85339200, 85435100, 85531050, 85627050, 85723100, 85819200, 85915350, 86011550, 86107800, 86204100, 86300450, 86396850, 86493300, 86589800, 86686350, 86782950, 86879600, 86976300, 87073050, 87169850, 87266700, 87363600, 87460550, 87557550, 87654600, 87751700, 87848850, 87946050, 88043300, 88140600, 88237950, 88335350, 88432800, 88530300, 88627850, 88725450, 88823100, 88920800, 89018550, 89116350, 89214200, 89312100, 89410050, 89508050, 89606100, 89704200, 89802350, 89900550, 89998800, 90097100, 90195450, 90293850, 90392300, 90490800, 90589350, 90687950, 90786600, 90885300, 90984050, 91082850, 91181700, 91280600, 91379550, 91478550, 91577600, 91676700, 91775850, 91875050, 91974300, 92073600, 92172950, 92272350, 92371800, 92471300, 92570850, 92670450, 92770100, 92869800, 92969550, 93069350, 93169200, 93269100, 93369050, 93469050, 93569100, 93669200, 93769350, 93869550, 93969800, 94070100, 94170450, 94270850, 94371300, 94471800, 94572350, 94672950, 94773600, 94874300, 94975050, 95075850, 95176700, 95277600, 95378550, 95479550, 95580600, 95681700, 95782850, 95884050, 95985300, 96086600, 96187950, 96289350, 96390800, 96492300, 96593850, 96695450, 96797100, 96898800, 97000550, 97102350, 97204200, 97306100, 97408050, 97510050, 97612100, 97714200, 97816350, 97918550, 98020800, 98123100, 98225450, 98327850, 98430300, 98532800, 98635350, 98737950, 98840600, 98943300, 99046050, 99148850, 99251700, 99354600, 99457550, 99560550, 99663600, 99766700, 99869850, 99973050, 100076300, 100179600, 100282950, 100386350, 100489800, 100593300, 100696850, 100800450, 100904100, 101007800, 101111550, 101215350, 101319200, 101423100, 101527050, 101631050, 101735100, 101839200, 101943350, 102047550, 102151800, 102256100, 102360450, 102464850, 102569300, 102673800, 102778350, 102882950, 102987600, 103092300, 103197050, 103301850, 103406700, 103511600, 103616550, 103721550, 103826600, 103931700, 104036850, 104142050, 104247300, 104352600, 104457950, 104563350, 104668800, 104774300, 104879850, 104985450, 105091100, 105196800, 105302550, 105408350, 105514200, 105620100, 105726050, 105832050, 105938100, 106044200, 106150350, 106256550, 106362800, 106469100, 106575450, 106681850, 106788300, 106894800, 107001350, 107107950, 107214600, 107321300, 107428050, 107534850, 107641700, 107748600, 107855550, 107962550, 108069600, 108176700, 108283850, 108391050, 108498300, 108605600, 108712950, 108820350, 108927800, 109035300, 109142850, 109250450, 109358100, 109465800, 109573550, 109681350, 109789200, 109897100, 110005050, 110113050, 110221100, 110329200, 110437350, 110545550, 110653800, 110762100, 110870450, 110978850, 111087300, 111195800, 111304350, 111412950, 111521600, 111630300, 111739050, 111847850, 111956700, 112065600, 112174550, 112283550, 112392600, 112501700, 112610850, 112720050, 112829300, 112938600, 113047950, 113157350, 113266800, 113376300, 113485850, 113595450, 113705100, 113814800, 113924550, 114034350, 114144200, 114254100, 114364050, 114474050, 114584100, 114694200, 114804350, 114914550, 115024800, 115135100, 115245450, 115355850, 115466300, 115576800, 115687350, 115797950, 115908600, 116019300, 116130050, 116240850, 116351700, 116462600, 116573550, 116684550, 116795600, 116906700, 117017850, 117129050, 117240300, 117351600, 117462950, 117574350, 117685800, 117797300, 117908850, 118020450, 118132100, 118243800, 118355550, 118467350, 118579200, 118691100, 118803050, 118915050, 119027100, 119139200, 119251350, 119363550, 119475800, 119588100, 119700450, 119812850, 119925300, 120037800, 120150350, 120262950, 120375600, 120488300, 120601050, 120713850, 120826700, 120939600, 121052550, 121165550, 121278600, 121391700, 121504850, 121618050, 121731300, 121844600, 121957950, 122071350, 122184800, 122298300, 122411850, 122525450, 122639100, 122752800, 122866550, 122980350, 123094200, 123208100, 123322050, 123436050, 123550100, 123664200, 123778350, 123892550, 124006800, 124121100, 124235450, 124349850, 124464300, 124578800, 124693350, 124807950, 124922600, 125037300, 125152050, 125266850, 125381700, 125496600, 125611550, 125726550, 125841600, 125956700, 126071850, 126187050, 126302300, 126417600, 126532950, 126648350, 126763800, 126879300, 126994850, 127110450, 127226100, 127341800, 127457550, 127573350, 127689200, 127805100, 127921050, 128037050, 128153100, 128269200, 128385350, 128501550, 128617800, 128734100, 128850450, 128966850, 129083300, 129199800, 129316350, 129432950, 129549600, 129666300, 129783050, 129899850, 130016700, 130133600, 130250550, 130367550, 130484600, 130601700, 130718850, 130836050, 130953300, 131070600, 131187950, 131305350, 131422800, 131540300, 131657850, 131775450, 131893100, 132010800, 132128550, 132246350, 132364200, 132482100, 132600050, 132718050, 132836100, 132954200, 133072350, 133190550, 133308800, 133427100, 133545450, 133663850, 133782300, 133900800, 134019350, 134137950, 134256600, 134375300, 134494050, 134612850, 134731700, 134850600, 134969550, 135088550, 135207600, 135326700, 135445850, 135565050, 135684300, 135803600, 135922950, 136042350, 136161800, 136281300, 136400850, 136520450, 136640100, 136759800, 136879550, 136999350, 137119200, 137239100, 137359050, 137479050, 137599100, 137719200, 137839350, 137959550, 138079800, 138200100, 138320450, 138440850, 138561300, 138681800, 138802350, 138922950, 139043600, 139164300, 139285050, 139405850, 139526700, 139647600, 139768550, 139889550, 140010600, 140131700, 140252850, 140374050, 140495300, 140616600, 140737950, 140859350, 140980800, 141102300, 141223850, 141345450, 141467100, 141588800, 141710550, 141832350, 141954200, 142076100, 142198050, 142320050, 142442100, 142564200, 142686350, 142808550, 142930800, 143053100, 143175450, 143297850, 143420300, 143542800, 143665350, 143787950, 143910600, 144033300, 144156050, 144278850, 144401700, 144524600, 144647550, 144770550, 144893600, 145016700, 145139850, 145263050, 145386300, 145509600, 145632950, 145756350, 145879800, 146003300, 146126850, 146250450, 146374100, 146497800, 146621550, 146745350, 146869200, 146993100, 147117050, 147241050, 147365100, 147489200, 147613350, 147737550, 147861800, 147986100, 148110450, 148234850, 148359300, 148483800, 148608350, 148732950, 148857600, 148982300, 149107050, 149231850, 149356700, 149481600, 149606550, 149731550, 149856600, 149981700, 150106850, 150232050, 150357300, 150482600, 150607950, 150733350, 150858800, 150984300, 151109850, 151235450, 151361100, 151486800, 151612550, 151738350, 151864200, 151990100, 152116050, 152242050, 152368100, 152494200, 152620350, 152746550, 152872800, 152999100, 153125450, 153251850, 153378300, 153504800, 153631350, 153757950, 153884600, 154011300, 154138050, 154264850, 154391700, 154518600, 154645550, 154772550, 154899600, 155026700, 155153850, 155281050, 155408300, 155535600, 155662950, 155790350, 155917800, 156045300, 156172850, 156300450, 156428100, 156555800, 156683550, 156811350, 156939200, 157067100, 157195050, 157323050, 157451100, 157579200, 157707350, 157835550, 157963800, 158092100, 158220450, 158348850, 158477300, 158605800, 158734350, 158862950, 158991600, 159120300, 159249050, 159377850, 159506700, 159635600, 159764550, 159893550, 160022600, 160151700, 160280850, 160410050, 160539300, 160668600, 160797950, 160927350, 161056800, 161186300, 161315850, 161445450, 161575100, 161704800, 161834550, 161964350, 162094200, 162224100, 162354050, 162484050, 162614100, 162744200, 162874350, 163004550, 163134800, 163265100, 163395450, 163525850, 163656300, 163786800, 163917350, 164047950, 164178600, 164309300, 164440050, 164570850, 164701700, 164832600, 164963550, 165094550, 165225600, 165356700, 165487850, 165619050, 165750300, 165881600, 166012950, 166144350, 166275800, 166407300, 166538850, 166670450, 166802100, 166933800, 167065550, 167197350, 167329200, 167461100, 167593050, 167725050, 167857100, 167989200, 168121350, 168253550, 168385800, 168518100, 168650450, 168782850, 168915300, 169047800, 169180350, 169312950, 169445600, 169578300, 169711050, 169843850, 169976700, 170109600, 170242550, 170375550, 170508600, 170641700, 170774850, 170908050, 171041300, 171174600, 171307950, 171441350, 171574800, 171708300, 171841850, 171975450, 172109100, 172242800, 172376550, 172510350, 172644200, 172778100, 172912050, 173046050, 173180100, 173314200, 173448350, 173582550, 173716800, 173851100, 173985450, 174119850, 174254300, 174388800, 174523350, 174657950, 174792600, 174927300, 175062050, 175196850, 175331700, 175466600, 175601550, 175736550, 175871600, 176006700, 176141850, 176277050, 176412300, 176547600, 176682950, 176818350, 176953800, 177089300, 177224850, 177360450, 177496100, 177631800, 177767550, 177903350, 178039200, 178175100, 178311050, 178447050, 178583100, 178719200, 178855350, 178991550, 179127800, 179264100, 179400450, 179536850, 179673300, 179809800, 179946350, 180082950, 180219600, 180356300, 180493050, 180629850, 180766700, 180903600, 181040550, 181177550, 181314600, 181451700, 181588850, 181726050, 181863300, 182000600, 182137950, 182275350, 182412800, 182550300, 182687850, 182825450, 182963100, 183100800, 183238550, 183376350, 183514200, 183652100, 183790050, 183928050, 184066100, 184204200, 184342350, 184480550, 184618800, 184757100, 184895450, 185033850, 185172300, 185310800, 185449350, 185587950, 185726600, 185865300, 186004050, 186142850, 186281700, 186420600, 186559550, 186698550, 186837600, 186976700, 187115850, 187255050, 187394300, 187533600, 187672950, 187812350, 187951800, 188091300, 188230850, 188370450, 188510100, 188649800, 188789550, 188929350, 189069200, 189209100, 189349050, 189489050, 189629100, 189769200, 189909350, 190049550, 190189800, 190330100, 190470450, 190610850, 190751300, 190891800, 191032350, 191172950, 191313600, 191454300, 191595050, 191735850, 191876700, 192017600, 192158550, 192299550, 192440600, 192581700, 192722850, 192864050, 193005300, 193146600, 193287950, 193429350, 193570800, 193712300, 193853850, 193995450, 194137100, 194278800, 194420550, 194562350, 194704200, 194846100, 194988050, 195130050, 195272100, 195414200, 195556350, 195698550, 195840800, 195983100, 196125450, 196267850, 196410300, 196552800, 196695350, 196837950, 196980600, 197123300, 197266050, 197408850, 197551700, 197694600, 197837550, 197980550, 198123600, 198266700, 198409850, 198553050, 198696300, 198839600, 198982950, 199126350, 199269800, 199413300, 199556850, 199700450, 199844100, 199987800, 200131550, 200275350, 200419200, 200563100, 200707050, 200851050, 200995100, 201139200, 201283350, 201427550, 201571800, 201716100, 201860450, 202004850, 202149300, 202293800, 202438350, 202582950, 202727600, 202872300, 203017050, 203161850, 203306700, 203451600, 203596550, 203741550, 203886600, 204031700, 204176850, 204322050, 204467300, 204612600, 204757950, 204903350, 205048800, 205194300, 205339850, 205485450, 205631100, 205776800, 205922550, 206068350, 206214200, 206360100, 206506050, 206652050, 206798100, 206944200, 207090350, 207236550, 207382800, 207529100, 207675450, 207821850, 207968300, 208114800, 208261350, 208407950, 208554600, 208701300, 208848050, 208994850, 209141700, 209288600, 209435550, 209582550, 209729600, 209876700, 210023850, 210171050, 210318300, 210465600, 210612950, 210760350, 210907800, 211055300, 211202850, 211350450, 211498100, 211645800, 211793550, 211941350, 212089200, 212237100, 212385050, 212533050, 212681100, 212829200, 212977350, 213125550, 213273800, 213422100, 213570450, 213718850, 213867300, 214015800, 214164350, 214312950, 214461600, 214610300, 214759050, 214907850, 215056700, 215205600, 215354550, 215503550, 215652600, 215801700, 215950850, 216100050, 216249300, 216398600, 216547950, 216697350, 216846800, 216996300, 217145850, 217295450, 217445100, 217594800, 217744550, 217894350, 218044200, 218194100, 218344050, 218494050, 218644100, 218794200, 218944350, 219094550, 219244800, 219395100, 219545450, 219695850, 219846300, 219996800, 220147350, 220297950, 220448600, 220599300, 220750050, 220900850, 221051700, 221202600, 221353550, 221504550, 221655600, 221806700, 221957850, 222109050, 222260300, 222411600, 222562950, 222714350, 222865800, 223017300, 223168850, 223320450, 223472100, 223623800, 223775550, 223927350, 224079200, 224231100, 224383050, 224535050, 224687100, 224839200, 224991350, 225143550, 225295800, 225448100, 225600450, 225752850, 225905300, 226057800, 226210350, 226362950, 226515600, 226668300, 226821050, 226973850, 227126700, 227279600, 227432550, 227585550, 227738600, 227891700, 228044850, 228198050, 228351300, 228504600, 228657950, 228811350, 228964800, 229118300, 229271850, 229425450, 229579100, 229732800, 229886550, 230040350, 230194200, 230348100, 230502050, 230656050, 230810100, 230964200, 231118350, 231272550, 231426800, 231581100, 231735450, 231889850, 232044300, 232198800, 232353350, 232507950, 232662600, 232817300, 232972050, 233126850, 233281700, 233436600, 233591550, 233746550, 233901600, 234056700, 234211850, 234367050, 234522300, 234677600, 234832950, 234988350, 235143800, 235299300, 235454850, 235610450, 235766100, 235921800, 236077550, 236233350, 236389200, 236545100, 236701050, 236857050, 237013100, 237169200, 237325350, 237481550, 237637800, 237794100, 237950450, 238106850, 238263300, 238419800, 238576350, 238732950, 238889600, 239046300, 239203050, 239359850, 239516700, 239673600, 239830550, 239987550, 240144600, 240301700, 240458850, 240616050, 240773300, 240930600, 241087950, 241245350, 241402800, 241560300, 241717850, 241875450, 242033100, 242190800, 242348550, 242506350, 242664200, 242822100, 242980050, 243138050, 243296100, 243454200, 243612350, 243770550, 243928800, 244087100, 244245450, 244403850, 244562300, 244720800, 244879350, 245037950, 245196600, 245355300, 245514050, 245672850, 245831700, 245990600, 246149550, 246308550, 246467600, 246626700, 246785850, 246945050, 247104300, 247263600, 247422950, 247582350, 247741800, 247901300, 248060850, 248220450, 248380100, 248539800, 248699550, 248859350, 249019200, 249179100, 249339050, 249499050, 249659100, 249819200, 249979350, 250139550, 250299800, 250460100, 250620450, 250780850, 250941300, 251101800, 251262350, 251422950, 251583600, 251744300, 251905050, 252065850, 252226700, 252387600, 252548550, 252709550, 252870600, 253031700, 253192850, 253354050, 253515300, 253676600, 253837950, 253999350, 254160800, 254322300, 254483850, 254645450, 254807100, 254968800, 255130550, 255292350, 255454200, 255616100, 255778050, 255940050, 256102100, 256264200, 256426350, 256588550, 256750800, 256913100, 257075450, 257237850, 257400300, 257562800, 257725350, 257887950, 258050600, 258213300, 258376050, 258538850, 258701700, 258864600, 259027550, 259190550, 259353600, 259516700, 259679850, 259843050, 260006300, 260169600, 260332950, 260496350, 260659800, 260823300, 260986850, 261150450, 261314100, 261477800, 261641550, 261805350, 261969200, 262133100, 262297050, 262461050, 262625100, 262789200, 262953350, 263117550, 263281800, 263446100, 263610450, 263774850, 263939300, 264103800, 264268350, 264432950, 264597600, 264762300, 264927050, 265091850, 265256700, 265421600, 265586550, 265751550, 265916600, 266081700, 266246850, 266412050, 266577300, 266742600, 266907950, 267073350, 267238800, 267404300, 267569850, 267735450, 267901100, 268066800, 268232550, 268398350, 268564200, 268730100, 268896050, 269062050, 269228100, 269394200, 269560350, 269726550, 269892800, 270059100, 270225450, 270391850, 270558300, 270724800, 270891350, 271057950, 271224600, 271391300, 271558050, 271724850, 271891700, 272058600, 272225550, 272392550, 272559600, 272726700, 272893850, 273061050, 273228300, 273395600, 273562950, 273730350, 273897800, 274065300, 274232850, 274400450, 274568100, 274735800, 274903550, 275071350, 275239200, 275407100, 275575050, 275743050, 275911100, 276079200, 276247350, 276415550, 276583800, 276752100, 276920450, 277088850, 277257300, 277425800, 277594350, 277762950, 277931600, 278100300, 278269050, 278437850, 278606700, 278775600, 278944550, 279113550, 279282600, 279451700, 279620850, 279790050, 279959300, 280128600, 280297950, 280467350, 280636800, 280806300, 280975850, 281145450, 281315100, 281484800, 281654550, 281824350, 281994200, 282164100, 282334050, 282504050, 282674100, 282844200, 283014350, 283184550, 283354800, 283525100, 283695450, 283865850, 284036300, 284206800, 284377350, 284547950, 284718600, 284889300, 285060050, 285230850, 285401700, 285572600, 285743550, 285914550, 286085600, 286256700, 286427850, 286599050, 286770300, 286941600, 287112950, 287284350, 287455800, 287627300, 287798850, 287970450, 288142100, 288313800, 288485550, 288657350, 288829200, 289001100, 289173050, 289345050, 289517100, 289689200, 289861350, 290033550, 290205800, 290378100, 290550450, 290722850, 290895300, 291067800, 291240350, 291412950, 291585600, 291758300, 291931050, 292103850, 292276700, 292449600, 292622550, 292795550, 292968600, 293141700, 293314850, 293488050, 293661300, 293834600, 294007950, 294181350, 294354800, 294528300, 294701850, 294875450, 295049100, 295222800, 295396550, 295570350, 295744200, 295918100, 296092050, 296266050, 296440100, 296614200, 296788350, 296962550, 297136800, 297311100, 297485450, 297659850, 297834300, 298008800, 298183350, 298357950, 298532600, 298707300, 298882050, 299056850, 299231700, 299406600, 299581550, 299756550, 299931600, 300106700, 300281850, 300457050, 300632300, 300807600, 300982950, 301158350, 301333800, 301509300, 301684850, 301860450, 302036100, 302211800, 302387550, 302563350, 302739200, 302915100, 303091050, 303267050, 303443100, 303619200, 303795350, 303971550, 304147800, 304324100, 304500450, 304676850, 304853300, 305029800, 305206350, 305382950, 305559600, 305736300, 305913050, 306089850, 306266700, 306443600, 306620550, 306797550, 306974600, 307151700, 307328850, 307506050, 307683300, 307860600, 308037950, 308215350, 308392800, 308570300, 308747850, 308925450, 309103100, 309280800, 309458550, 309636350, 309814200, 309992100, 310170050, 310348050, 310526100, 310704200, 310882350, 311060550, 311238800, 311417100, 311595450, 311773850, 311952300, 312130800, 312309350, 312487950, 312666600, 312845300, 313024050, 313202850, 313381700, 313560600, 313739550, 313918550, 314097600, 314276700, 314455850, 314635050, 314814300, 314993600, 315172950, 315352350, 315531800, 315711300, 315890850, 316070450, 316250100, 316429800, 316609550, 316789350, 316969200, 317149100, 317329050, 317509050, 317689100, 317869200, 318049350, 318229550, 318409800, 318590100, 318770450, 318950850, 319131300, 319311800, 319492350, 319672950, 319853600, 320034300, 320215050, 320395850, 320576700, 320757600, 320938550, 321119550, 321300600, 321481700, 321662850, 321844050, 322025300, 322206600, 322387950, 322569350, 322750800, 322932300, 323113850, 323295450, 323477100, 323658800, 323840550, 324022350, 324204200, 324386100, 324568050, 324750050, 324932100, 325114200, 325296350, 325478550, 325660800, 325843100, 326025450, 326207850, 326390300, 326572800, 326755350, 326937950, 327120600, 327303300, 327486050, 327668850, 327851700, 328034600, 328217550, 328400550, 328583600, 328766700, 328949850, 329133050, 329316300, 329499600, 329682950, 329866350, 330049800, 330233300, 330416850, 330600450, 330784100, 330967800, 331151550, 331335350, 331519200, 331703100, 331887050, 332071050, 332255100, 332439200, 332623350, 332807550, 332991800, 333176100, 333360450, 333544850, 333729300, 333913800, 334098350, 334282950, 334467600, 334652300, 334837050, 335021850, 335206700, 335391600, 335576550, 335761550, 335946600, 336131700, 336316850, 336502050, 336687300, 336872600, 337057950, 337243350, 337428800, 337614300, 337799850, 337985450, 338171100, 338356800, 338542550, 338728350, 338914200,339100100, 339286050, 339472050, 339658100, 339844200, 340030350, 340216550, 340402800, 340589100, 340775450, 340961850, 341148300, 341334800, 341521350, 341707950, 341894600, 342081300, 342268050, 342454850, 342641700, 342828600, 343015550, 343202550, 343389600, 343576700, 343763850, 343951050, 344138300, 344325600, 344512950, 344700350, 344887800, 345075300, 345262850, 345450450, 345638100, 345825800, 346013550, 346201350, 346389200, 346577100, 346765050, 346953050, 347141100, 347329200, 347517350, 347705550, 347893800, 348082100, 348270450, 348458850, 348647300, 348835800, 349024350, 349212950, 349401600, 349590300, 349779050, 349967850, 350156700, 350345600, 350534550, 350723550, 350912600, 351101700, 351290850, 351480050, 351669300, 351858600, 352047950, 352237350, 352426800, 352616300, 352805850, 352995450, 353185100, 353374800, 353564550, 353754350, 353944200, 354134100, 354324050, 354514050, 354704100, 354894200, 355084350, 355274550, 355464800, 355655100, 355845450, 356035850, 356226300, 356416800, 356607350, 356797950, 356988600, 357179300, 357370050, 357560850, 357751700, 357942600, 358133550, 358324550, 358515600, 358706700, 358897850, 359089050, 359280300, 359471600, 359662950, 359854350, 360045800, 360237300, 360428850, 360620450, 360812100, 361003800, 361195550, 361387350, 361579200, 361771100, 361963050, 362155050, 362347100, 362539200, 362731350, 362923550, 363115800, 363308100, 363500450, 363692850, 363885300, 364077800, 364270350, 364462950, 364655600, 364848300, 365041050, 365233850, 365426700, 365619600, 365812550, 366005550, 366198600, 366391700, 366584850, 366778050, 366971300, 367164600, 367357950, 367551350, 367744800, 367938300, 368131850, 368325450, 368519100, 368712800, 368906550, 369100350, 369294200, 369488100, 369682050, 369876050, 370070100, 370264200, 370458350, 370652550, 370846800, 371041100, 371235450, 371429850, 371624300, 371818800, 372013350, 372207950, 372402600, 372597300, 372792050, 372986850, 373181700, 373376600, 373571550, 373766550, 373961600, 374156700, 374351850, 374547050, 374742300, 374937600, 375132950, 375328350, 375523800, 375719300, 375914850, 376110450, 376306100, 376501800, 376697550, 376893350, 377089200, 377285100, 377481050, 377677050, 377873100, 378069200, 378265350, 378461550, 378657800, 378854100, 379050450, 379246850, 379443300, 379639800, 379836350, 380032950, 380229600, 380426300, 380623050, 380819850, 381016700, 381213600, 381410550, 381607550, 381804600, 382001700, 382198850, 382396050, 382593300, 382790600, 382987950, 383185350, 383382800, 383580300, 383777850, 383975450, 384173100, 384370800, 384568550, 384766350, 384964200, 385162100, 385360050, 385558050, 385756100, 385954200, 386152350, 386350550, 386548800, 386747100, 386945450, 387143850, 387342300, 387540800, 387739350, 387937950, 388136600, 388335300, 388534050, 388732850, 388931700, 389130600, 389329550, 389528550, 389727600, 389926700, 390125850, 390325050, 390524300, 390723600, 390922950, 391122350, 391321800, 391521300, 391720850, 391920450, 392120100, 392319800, 392519550, 392719350, 392919200, 393119100, 393319050, 393519050, 393719100, 393919200, 394119350, 394319550, 394519800, 394720100, 394920450, 395120850, 395321300, 395521800, 395722350, 395922950, 396123600, 396324300, 396525050, 396725850, 396926700, 397127600, 397328550, 397529550, 397730600, 397931700, 398132850, 398334050, 398535300, 398736600, 398937950, 399139350, 399340800, 399542300, 399743850, 399945450, 400147100, 400348800, 400550550, 400752350, 400954200, 401156100, 401358050, 401560050, 401762100, 401964200, 402166350, 402368550, 402570800, 402773100, 402975450, 403177850, 403380300, 403582800, 403785350, 403987950, 404190600, 404393300, 404596050, 404798850, 405001700, 405204600, 405407550, 405610550, 405813600, 406016700, 406219850, 406423050, 406626300, 406829600, 407032950, 407236350, 407439800, 407643300, 407846850, 408050450, 408254100, 408457800, 408661550, 408865350, 409069200, 409273100, 409477050, 409681050, 409885100, 410089200, 410293350, 410497550, 410701800, 410906100, 411110450, 411314850, 411519300, 411723800, 411928350, 412132950, 412337600, 412542300, 412747050, 412951850, 413156700, 413361600, 413566550, 413771550, 413976600, 414181700, 414386850, 414592050, 414797300, 415002600, 415207950, 415413350, 415618800, 415824300, 416029850, 416235450, 416441100, 416646800, 416852550, 417058350, 417264200, 417470100, 417676050, 417882050, 418088100, 418294200, 418500350, 418706550, 418912800, 419119100, 419325450, 419531850, 419738300, 419944800, 420151350, 420357950, 420564600, 420771300, 420978050, 421184850, 421391700, 421598600, 421805550, 422012550, 422219600, 422426700, 422633850, 422841050, 423048300, 423255600, 423462950, 423670350, 423877800, 424085300, 424292850, 424500450, 424708100, 424915800, 425123550, 425331350, 425539200, 425747100, 425955050, 426163050, 426371100, 426579200, 426787350, 426995550, 427203800, 427412100, 427620450, 427828850, 428037300, 428245800, 428454350, 428662950, 428871600, 429080300, 429289050, 429497850, 429706700, 429915600, 430124550, 430333550, 430542600, 430751700, 430960850, 431170050, 431379300, 431588600, 431797950, 432007350, 432216800, 432426300, 432635850, 432845450, 433055100, 433264800, 433474550, 433684350, 433894200, 434104100, 434314050, 434524050, 434734100, 434944200, 435154350, 435364550, 435574800, 435785100, 435995450, 436205850, 436416300, 436626800, 436837350, 437047950, 437258600, 437469300, 437680050, 437890850, 438101700, 438312600, 438523550, 438734550, 438945600, 439156700, 439367850, 439579050, 439790300, 440001600, 440212950, 440424350, 440635800, 440847300, 441058850, 441270450, 441482100, 441693800, 441905550, 442117350, 442329200, 442541100, 442753050, 442965050, 443177100, 443389200, 443601350, 443813550, 444025800, 444238100, 444450450, 444662850, 444875300, 445087800, 445300350, 445512950, 445725600, 445938300, 446151050, 446363850, 446576700, 446789600, 447002550, 447215550, 447428600, 447641700, 447854850, 448068050, 448281300, 448494600, 448707950, 448921350, 449134800, 449348300, 449561850, 449775450, 449989100, 450202800, 450416550, 450630350, 450844200, 451058100, 451272050, 451486050, 451700100, 451914200, 452128350, 452342550, 452556800, 452771100, 452985450, 453199850, 453414300, 453628800, 453843350, 454057950, 454272600, 454487300, 454702050, 454916850, 455131700, 455346600, 455561550, 455776550, 455991600, 456206700, 456421850, 456637050, 456852300, 457067600, 457282950, 457498350, 457713800, 457929300, 458144850, 458360450, 458576100, 458791800, 459007550, 459223350, 459439200, 459655100, 459871050, 460087050, 460303100, 460519200, 460735350, 460951550, 461167800, 461384100, 461600450, 461816850, 462033300, 462249800, 462466350, 462682950, 462899600, 463116300, 463333050, 463549850, 463766700, 463983600, 464200550, 464417550, 464634600, 464851700, 465068850, 465286050, 465503300, 465720600, 465937950, 466155350, 466372800, 466590300, 466807850, 467025450, 467243100, 467460800, 467678550, 467896350, 468114200, 468332100, 468550050, 468768050, 468986100, 469204200, 469422350, 469640550, 469858800, 470077100, 470295450, 470513850, 470732300, 470950800, 471169350, 471387950, 471606600, 471825300, 472044050, 472262850, 472481700, 472700600, 472919550, 473138550, 473357600, 473576700, 473795850, 474015050, 474234300, 474453600, 474672950, 474892350, 475111800, 475331300, 475550850, 475770450, 475990100, 476209800, 476429550, 476649350, 476869200, 477089100, 477309050, 477529050, 477749100, 477969200, 478189350, 478409550, 478629800, 478850100, 479070450, 479290850, 479511300, 479731800, 479952350, 480172950, 480393600, 480614300, 480835050, 481055850, 481276700, 481497600, 481718550, 481939550, 482160600, 482381700, 482602850, 482824050, 483045300, 483266600, 483487950, 483709350, 483930800, 484152300, 484373850, 484595450, 484817100, 485038800, 485260550, 485482350, 485704200, 485926100, 486148050, 486370050, 486592100, 486814200, 487036350, 487258550, 487480800, 487703100, 487925450, 488147850, 488370300, 488592800, 488815350, 489037950, 489260600, 489483300, 489706050, 489928850, 490151700, 490374600, 490597550, 490820550, 491043600, 491266700, 491489850, 491713050, 491936300, 492159600, 492382950, 492606350, 492829800, 493053300, 493276850, 493500450, 493724100, 493947800, 494171550, 494395350, 494619200, 494843100, 495067050, 495291050, 495515100, 495739200, 495963350, 496187550, 496411800, 496636100, 496860450, 497084850, 497309300, 497533800, 497758350, 497982950, 498207600, 498432300, 498657050, 498881850, 499106700, 499331600, 499556550, 499781550, 500006600, 500231700, 500456850, 500682050, 500907300, 501132600, 501357950, 501583350, 501808800, 502034300, 502259850, 502485450, 502711100, 502936800, 503162550, 503388350, 503614200, 503840100, 504066050, 504292050, 504518100, 504744200, 504970350, 505196550, 505422800, 505649100, 505875450, 506101850, 506328300, 506554800, 506781350, 507007950, 507234600, 507461300, 507688050, 507914850, 508141700, 508368600, 508595550, 508822550, 509049600, 509276700, 509503850, 509731050, 509958300, 510185600, 510412950, 510640350, 510867800, 511095300, 511322850, 511550450, 511778100, 512005800, 512233550, 512461350, 512689200, 512917100, 513145050, 513373050, 513601100, 513829200, 514057350, 514285550, 514513800, 514742100, 514970450, 515198850, 515427300, 515655800, 515884350, 516112950, 516341600, 516570300, 516799050, 517027850, 517256700, 517485600, 517714550, 517943550, 518172600, 518401700, 518630850, 518860050, 519089300, 519318600, 519547950, 519777350, 520006800, 520236300, 520465850, 520695450, 520925100, 521154800, 521384550, 521614350, 521844200, 522074100, 522304050, 522534050, 522764100, 522994200, 523224350, 523454550, 523684800, 523915100, 524145450, 524375850, 524606300, 524836800, 525067350, 525297950, 525528600, 525759300, 525990050, 526220850, 526451700, 526682600, 526913550, 527144550, 527375600, 527606700, 527837850, 528069050, 528300300, 528531600, 528762950, 528994350, 529225800, 529457300, 529688850, 529920450, 530152100, 530383800, 530615550, 530847350, 531079200, 531311100, 531543050, 531775050, 532007100, 532239200, 532471350, 532703550, 532935800, 533168100, 533400450, 533632850, 533865300, 534097800, 534330350, 534562950, 534795600, 535028300, 535261050, 535493850, 535726700, 535959600, 536192550, 536425550, 536658600, 536891700, 537124850, 537358050, 537591300, 537824600, 538057950, 538291350, 538524800, 538758300, 538991850, 539225450, 539459100, 539692800, 539926550, 540160350, 540394200, 540628100, 540862050, 541096050, 541330100, 541564200, 541798350, 542032550, 542266800, 542501100, 542735450, 542969850, 543204300, 543438800, 543673350, 543907950, 544142600, 544377300, 544612050, 544846850, 545081700, 545316600, 545551550, 545786550, 546021600, 546256700, 546491850, 546727050, 546962300, 547197600, 547432950, 547668350, 547903800, 548139300, 548374850, 548610450, 548846100, 549081800, 549317550, 549553350, 549789200, 550025100, 550261050, 550497050, 550733100, 550969200, 551205350, 551441550, 551677800, 551914100, 552150450, 552386850, 552623300, 552859800, 553096350, 553332950, 553569600, 553806300, 554043050, 554279850, 554516700, 554753600, 554990550, 555227550, 555464600, 555701700, 555938850, 556176050, 556413300, 556650600, 556887950, 557125350, 557362800, 557600300, 557837850, 558075450, 558313100, 558550800, 558788550, 559026350, 559264200, 559502100, 559740050, 559978050, 560216100, 560454200, 560692350, 560930550, 561168800, 561407100, 561645450, 561883850, 562122300, 562360800, 562599350, 562837950, 563076600, 563315300, 563554050, 563792850, 564031700, 564270600, 564509550, 564748550, 564987600, 565226700, 565465850, 565705050, 565944300, 566183600, 566422950, 566662350, 566901800, 567141300, 567380850, 567620450, 567860100, 568099800, 568339550, 568579350, 568819200, 569059100, 569299050, 569539050, 569779100, 570019200, 570259350, 570499550, 570739800, 570980100, 571220450, 571460850, 571701300, 571941800, 572182350, 572422950, 572663600, 572904300, 573145050, 573385850, 573626700, 573867600, 574108550, 574349550, 574590600, 574831700, 575072850, 575314050, 575555300, 575796600, 576037950, 576279350, 576520800, 576762300, 577003850, 577245450, 577487100, 577728800, 577970550, 578212350, 578454200, 578696100, 578938050, 579180050, 579422100, 579664200, 579906350, 580148550, 580390800, 580633100, 580875450, 581117850, 581360300, 581602800, 581845350, 582087950, 582330600, 582573300, 582816050, 583058850, 583301700, 583544600, 583787550, 584030550, 584273600, 584516700, 584759850, 585003050, 585246300, 585489600, 585732950, 585976350, 586219800, 586463300, 586706850, 586950450, 587194100, 587437800, 587681550, 587925350, 588169200, 588413100, 588657050, 588901050, 589145100, 589389200, 589633350, 589877550, 590121800, 590366100, 590610450, 590854850, 591099300, 591343800, 591588350, 591832950, 592077600, 592322300, 592567050, 592811850, 593056700, 593301600, 593546550, 593791550, 594036600, 594281700, 594526850, 594772050, 595017300, 595262600, 595507950, 595753350, 595998800, 596244300, 596489850, 596735450, 596981100, 597226800, 597472550, 597718350, 597964200, 598210100, 598456050, 598702050, 598948100, 599194200, 599440350, 599686550, 599932800, 600179100, 600425450, 600671850, 600918300, 601164800, 601411350, 601657950, 601904600, 602151300, 602398050, 602644850, 602891700, 603138600, 603385550, 603632550, 603879600, 604126700, 604373850, 604621050, 604868300, 605115600, 605362950, 605610350, 605857800, 606105300, 606352850, 606600450, 606848100, 607095800, 607343550, 607591350, 607839200, 608087100, 608335050, 608583050, 608831100, 609079200, 609327350, 609575550, 609823800, 610072100, 610320450, 610568850, 610817300, 611065800, 611314350, 611562950, 611811600, 612060300, 612309050, 612557850, 612806700, 613055600, 613304550, 613553550, 613802600, 614051700, 614300850, 614550050, 614799300, 615048600, 615297950, 615547350, 615796800, 616046300, 616295850, 616545450, 616795100, 617044800, 617294550, 617544350, 617794200, 618044100, 618294050, 618544050, 618794100, 619044200, 619294350, 619544550, 619794800, 620045100, 620295450, 620545850, 620796300, 621046800, 621297350, 621547950, 621798600, 622049300, 622300050, 622550850, 622801700, 623052600, 623303550, 623554550, 623805600, 624056700, 624307850, 624559050, 624810300, 625061600, 625312950, 625564350, 625815800, 626067300, 626318850, 626570450, 626822100, 627073800, 627325550, 627577350, 627829200, 628081100, 628333050, 628585050, 628837100, 629089200, 629341350, 629593550, 629845800, 630098100, 630350450, 630602850, 630855300, 631107800, 631360350, 631612950, 631865600, 632118300, 632371050, 632623850, 632876700, 633129600, 633382550, 633635550, 633888600, 634141700, 634394850, 634648050, 634901300, 635154600, 635407950, 635661350, 635914800, 636168300, 636421850, 636675450, 636929100, 637182800, 637436550, 637690350, 637944200, 638198100, 638452050, 638706050, 638960100, 639214200, 639468350, 639722550, 639976800, 640231100, 640485450, 640739850, 640994300, 641248800, 641503350, 641757950, 642012600, 642267300, 642522050, 642776850, 643031700, 643286600, 643541550, 643796550, 644051600, 644306700, 644561850, 644817050, 645072300, 645327600, 645582950, 645838350, 646093800, 646349300, 646604850, 646860450, 647116100, 647371800, 647627550, 647883350, 648139200, 648395100, 648651050, 648907050, 649163100, 649419200, 649675350, 649931550, 650187800, 650444100, 650700450, 650956850, 651213300, 651469800, 651726350, 651982950, 652239600, 652496300, 652753050, 653009850, 653266700, 653523600, 653780550, 654037550, 654294600, 654551700, 654808850, 655066050, 655323300, 655580600, 655837950, 656095350, 656352800, 656610300, 656867850, 657125450, 657383100, 657640800, 657898550, 658156350, 658414200, 658672100, 658930050, 659188050, 659446100, 659704200, 659962350, 660220550, 660478800, 660737100, 660995450, 661253850, 661512300, 661770800, 662029350, 662287950, 662546600, 662805300, 663064050, 663322850, 663581700, 663840600, 664099550, 664358550, 664617600, 664876700, 665135850, 665395050, 665654300, 665913600, 666172950, 666432350, 666691800, 666951300, 667210850, 667470450, 667730100, 667989800, 668249550, 668509350, 668769200, 669029100, 669289050, 669549050, 669809100, 670069200, 670329350, 670589550, 670849800, 671110100, 671370450, 671630850, 671891300, 672151800, 672412350, 672672950, 672933600, 673194300, 673455050, 673715850, 673976700, 674237600, 674498550, 674759550, 675020600, 675281700, 675542850, 675804050, 676065300, 676326600, 676587950, 676849350, 677110800, 677372300, 677633850, 677895450, 678157100, 678418800, 678680550, 678942350, 679204200, 679466100, 679728050, 679990050, 680252100, 680514200, 680776350, 681038550, 681300800, 681563100, 681825450, 682087850, 682350300, 682612800, 682875350, 683137950, 683400600, 683663300, 683926050, 684188850, 684451700, 684714600, 684977550, 685240550, 685503600, 685766700, 686029850, 686293050, 686556300, 686819600, 687082950, 687346350, 687609800, 687873300, 688136850, 688400450, 688664100, 688927800, 689191550, 689455350, 689719200, 689983100, 690247050, 690511050, 690775100, 691039200, 691303350, 691567550, 691831800, 692096100, 692360450, 692624850, 692889300, 693153800, 693418350, 693682950, 693947600, 694212300, 694477050, 694741850, 695006700, 695271600, 695536550, 695801550, 696066600, 696331700, 696596850, 696862050, 697127300, 697392600, 697657950, 697923350, 698188800, 698454300, 698719850, 698985450, 699251100, 699516800, 699782550, 700048350, 700314200, 700580100, 700846050, 701112050, 701378100, 701644200, 701910350, 702176550, 702442800, 702709100, 702975450, 703241850, 703508300, 703774800, 704041350, 704307950, 704574600, 704841300, 705108050, 705374850, 705641700, 705908600, 706175550, 706442550, 706709600, 706976700, 707243850, 707511050, 707778300, 708045600, 708312950, 708580350, 708847800, 709115300, 709382850, 709650450, 709918100, 710185800, 710453550, 710721350, 710989200, 711257100, 711525050, 711793050, 712061100, 712329200, 712597350, 712865550, 713133800, 713402100, 713670450, 713938850, 714207300, 714475800, 714744350, 715012950, 715281600, 715550300, 715819050, 716087850, 716356700, 716625600, 716894550, 717163550, 717432600, 717701700, 717970850, 718240050, 718509300, 718778600, 719047950, 719317350, 719586800, 719856300, 720125850, 720395450, 720665100, 720934800, 721204550, 721474350, 721744200, 722014100, 722284050, 722554050, 722824100, 723094200, 723364350, 723634550, 723904800, 724175100, 724445450, 724715850, 724986300, 725256800, 725527350, 725797950, 726068600, 726339300, 726610050, 726880850, 727151700, 727422600, 727693550, 727964550, 728235600, 728506700, 728777850, 729049050, 729320300, 729591600, 729862950, 730134350, 730405800, 730677300, 730948850, 731220450, 731492100, 731763800, 732035550, 732307350, 732579200, 732851100, 733123050, 733395050, 733667100, 733939200, 734211350, 734483550, 734755800, 735028100, 735300450, 735572850, 735845300, 736117800, 736390350, 736662950, 736935600, 737208300, 737481050, 737753850, 738026700, 738299600, 738572550, 738845550, 739118600, 739391700, 739664850, 739938050, 740211300, 740484600, 740757950, 741031350, 741304800, 741578300, 741851850, 742125450, 742399100, 742672800, 742946550, 743220350, 743494200, 743768100, 744042050, 744316050, 744590100, 744864200, 745138350, 745412550, 745686800, 745961100, 746235450, 746509850, 746784300, 747058800, 747333350, 747607950, 747882600, 748157300, 748432050, 748706850, 748981700, 749256600, 749531550, 749806550, 750081600, 750356700, 750631850, 750907050, 751182300, 751457600, 751732950, 752008350, 752283800, 752559300, 752834850, 753110450, 753386100, 753661800, 753937550, 754213350, 754489200, 754765100, 755041050, 755317050, 755593100, 755869200, 756145350, 756421550, 756697800, 756974100, 757250450, 757526850, 757803300, 758079800, 758356350, 758632950, 758909600, 759186300, 759463050, 759739850, 760016700, 760293600, 760570550, 760847550, 761124600, 761401700, 761678850, 761956050, 762233300, 762510600, 762787950, 763065350, 763342800, 763620300, 763897850, 764175450, 764453100, 764730800, 765008550, 765286350, 765564200, 765842100, 766120050, 766398050, 766676100, 766954200, 767232350, 767510550, 767788800, 768067100, 768345450, 768623850, 768902300, 769180800, 769459350, 769737950, 770016600, 770295300, 770574050, 770852850, 771131700, 771410600, 771689550, 771968550, 772247600, 772526700, 772805850, 773085050, 773364300, 773643600, 773922950, 774202350, 774481800, 774761300, 775040850, 775320450, 775600100, 775879800, 776159550, 776439350, 776719200, 776999100, 777279050, 777559050, 777839100, 778119200, 778399350, 778679550, 778959800, 779240100, 779520450, 779800850, 780081300, 780361800, 780642350, 780922950, 781203600, 781484300, 781765050, 782045850, 782326700, 782607600, 782888550, 783169550, 783450600, 783731700, 784012850, 784294050, 784575300, 784856600, 785137950, 785419350, 785700800, 785982300, 786263850, 786545450, 786827100, 787108800, 787390550, 787672350, 787954200, 788236100, 788518050, 788800050, 789082100, 789364200, 789646350, 789928550, 790210800, 790493100, 790775450, 791057850, 791340300, 791622800, 791905350, 792187950, 792470600, 792753300, 793036050, 793318850, 793601700, 793884600, 794167550, 794450550, 794733600, 795016700, 795299850, 795583050, 795866300, 796149600, 796432950, 796716350, 796999800, 797283300, 797566850, 797850450, 798134100, 798417800, 798701550, 798985350, 799269200, 799553100, 799837050, 800121050, 800405100, 800689200, 800973350, 801257550, 801541800, 801826100, 802110450, 802394850, 802679300, 802963800, 803248350, 803532950, 803817600, 804102300, 804387050, 804671850, 804956700, 805241600, 805526550, 805811550, 806096600, 806381700, 806666850, 806952050, 807237300, 807522600, 807807950, 808093350, 808378800, 808664300, 808949850, 809235450, 809521100, 809806800, 810092550, 810378350, 810664200, 810950100, 811236050, 811522050, 811808100, 812094200, 812380350, 812666550, 812952800, 813239100, 813525450, 813811850, 814098300, 814384800, 814671350, 814957950, 815244600, 815531300, 815818050, 816104850, 816391700, 816678600, 816965550, 817252550, 817539600, 817826700, 818113850, 818401050, 818688300, 818975600, 819262950, 819550350, 819837800, 820125300, 820412850, 820700450, 820988100, 821275800, 821563550, 821851350, 822139200, 822427100, 822715050, 823003050, 823291100, 823579200, 823867350, 824155550, 824443800, 824732100, 825020450, 825308850, 825597300, 825885800, 826174350, 826462950, 826751600, 827040300, 827329050, 827617850, 827906700, 828195600, 828484550, 828773550, 829062600, 829351700, 829640850, 829930050, 830219300, 830508600, 830797950, 831087350, 831376800, 831666300, 831955850, 832245450, 832535100, 832824800, 833114550, 833404350, 833694200, 833984100, 834274050, 834564050, 834854100, 835144200, 835434350, 835724550, 836014800, 836305100, 836595450, 836885850, 837176300, 837466800, 837757350, 838047950, 838338600, 838629300, 838920050, 839210850, 839501700, 839792600, 840083550, 840374550, 840665600, 840956700, 841247850, 841539050, 841830300, 842121600, 842412950, 842704350, 842995800, 843287300, 843578850, 843870450, 844162100, 844453800, 844745550, 845037350, 845329200, 845621100, 845913050, 846205050, 846497100, 846789200, 847081350, 847373550, 847665800, 847958100, 848250450, 848542850, 848835300, 849127800, 849420350, 849712950, 850005600, 850298300, 850591050, 850883850, 851176700, 851469600, 851762550, 852055550, 852348600, 852641700, 852934850, 853228050, 853521300, 853814600, 854107950, 854401350, 854694800, 854988300, 855281850, 855575450, 855869100, 856162800, 856456550, 856750350, 857044200, 857338100, 857632050, 857926050, 858220100, 858514200, 858808350, 859102550, 859396800, 859691100, 859985450, 860279850, 860574300, 860868800, 861163350, 861457950, 861752600, 862047300, 862342050, 862636850, 862931700, 863226600, 863521550, 863816550, 864111600, 864406700, 864701850, 864997050, 865292300, 865587600, 865882950, 866178350, 866473800, 866769300, 867064850, 867360450, 867656100, 867951800, 868247550, 868543350, 868839200, 869135100, 869431050, 869727050, 870023100, 870319200, 870615350, 870911550, 871207800, 871504100, 871800450, 872096850, 872393300, 872689800, 872986350, 873282950, 873579600, 873876300, 874173050, 874469850, 874766700, 875063600, 875360550, 875657550, 875954600, 876251700, 876548850, 876846050, 877143300, 877440600, 877737950, 878035350, 878332800, 878630300, 878927850, 879225450, 879523100, 879820800, 880118550, 880416350, 880714200, 881012100, 881310050, 881608050, 881906100, 882204200, 882502350, 882800550, 883098800, 883397100, 883695450, 883993850, 884292300, 884590800, 884889350, 885187950, 885486600, 885785300, 886084050, 886382850, 886681700, 886980600, 887279550, 887578550, 887877600, 888176700, 888475850, 888775050, 889074300, 889373600, 889672950, 889972350, 890271800, 890571300, 890870850, 891170450, 891470100, 891769800, 892069550, 892369350, 892669200, 892969100, 893269050, 893569050, 893869100, 894169200, 894469350, 894769550, 895069800, 895370100, 895670450, 895970850, 896271300, 896571800, 896872350, 897172950, 897473600, 897774300, 898075050, 898375850, 898676700, 898977600, 899278550, 899579550, 899880600, 900181700, 900482850, 900784050, 901085300, 901386600, 901687950, 901989350, 902290800, 902592300, 902893850, 903195450, 903497100, 903798800, 904100550, 904402350, 904704200, 905006100, 905308050, 905610050, 905912100, 906214200, 906516350, 906818550, 907120800, 907423100, 907725450, 908027850, 908330300, 908632800, 908935350, 909237950, 909540600, 909843300, 910146050, 910448850, 910751700, 911054600, 911357550, 911660550, 911963600, 912266700, 912569850, 912873050, 913176300, 913479600, 913782950, 914086350, 914389800, 914693300, 914996850, 915300450, 915604100, 915907800, 916211550, 916515350, 916819200, 917123100, 917427050, 917731050, 918035100, 918339200, 918643350, 918947550, 919251800, 919556100, 919860450, 920164850, 920469300, 920773800, 921078350, 921382950, 921687600, 921992300, 922297050, 922601850, 922906700, 923211600, 923516550, 923821550, 924126600, 924431700, 924736850, 925042050, 925347300, 925652600, 925957950, 926263350, 926568800, 926874300, 927179850, 927485450, 927791100, 928096800, 928402550, 928708350, 929014200, 929320100, 929626050, 929932050, 930238100, 930544200, 930850350, 931156550, 931462800, 931769100, 932075450, 932381850, 932688300, 932994800, 933301350, 933607950, 933914600, 934221300, 934528050, 934834850, 935141700, 935448600, 935755550, 936062550, 936369600, 936676700, 936983850, 937291050, 937598300, 937905600, 938212950, 938520350, 938827800, 939135300, 939442850, 939750450, 940058100, 940365800, 940673550, 940981350, 941289200, 941597100, 941905050, 942213050, 942521100, 942829200, 943137350, 943445550, 943753800, 944062100, 944370450, 944678850, 944987300, 945295800, 945604350, 945912950, 946221600, 946530300, 946839050, 947147850, 947456700, 947765600, 948074550, 948383550, 948692600, 949001700, 949310850, 949620050, 949929300, 950238600, 950547950, 950857350, 951166800, 951476300, 951785850, 952095450, 952405100, 952714800, 953024550, 953334350, 953644200, 953954100, 954264050, 954574050, 954884100, 955194200, 955504350, 955814550, 956124800, 956435100, 956745450, 957055850, 957366300, 957676800, 957987350, 958297950, 958608600, 958919300, 959230050, 959540850, 959851700, 960162600, 960473550, 960784550, 961095600, 961406700, 961717850, 962029050, 962340300, 962651600, 962962950, 963274350, 963585800, 963897300, 964208850, 964520450, 964832100, 965143800, 965455550, 965767350, 966079200, 966391100, 966703050, 967015050, 967327100, 967639200, 967951350, 968263550, 968575800, 968888100, 969200450, 969512850, 969825300, 970137800, 970450350, 970762950, 971075600, 971388300, 971701050, 972013850, 972326700, 972639600, 972952550, 973265550, 973578600, 973891700, 974204850, 974518050, 974831300, 975144600, 975457950, 975771350, 976084800, 976398300, 976711850, 977025450, 977339100, 977652800, 977966550, 978280350, 978594200, 978908100, 979222050, 979536050, 979850100, 980164200, 980478350, 980792550, 981106800, 981421100, 981735450, 982049850, 982364300, 982678800, 982993350, 983307950, 983622600, 983937300, 984252050, 984566850, 984881700, 985196600, 985511550, 985826550, 986141600, 986456700, 986771850, 987087050, 987402300, 987717600, 988032950, 988348350, 988663800, 988979300, 989294850, 989610450, 989926100, 990241800, 990557550, 990873350, 991189200, 991505100, 991821050, 992137050, 992453100, 992769200, 993085350, 993401550, 993717800, 994034100, 994350450, 994666850, 994983300, 995299800, 995616350, 995932950, 996249600, 996566300, 996883050, 997199850, 997516700, 997833600, 998150550, 998467550, 998784600, 999101700, 999418850, 999736050, 1000053300, 1000370600, 1000687950, 1001005350, 1001322800, 1001640300, 1001957850, 1002275450, 1002593100, 1002910800, 1003228550, 1003546350, 1003864200, 1004182100, 1004500050, 1004818050, 1005136100, 1005454200, 1005772350, 1006090550, 1006408800, 1006727100, 1007045450, 1007363850, 1007682300, 1008000800, 1008319350, 1008637950, 1008956600, 1009275300, 1009594050, 1009912850, 1010231700, 1010550600, 1010869550, 1011188550, 1011507600, 1011826700, 1012145850, 1012465050, 1012784300, 1013103600, 1013422950, 1013742350, 1014061800, 1014381300, 1014700850, 1015020450, 1015340100, 1015659800, 1015979550, 1016299350, 1016619200, 1016939100, 1017259050, 1017579050, 1017899100, 1018219200, 1018539350, 1018859550, 1019179800, 1019500100, 1019820450, 1020140850, 1020461300, 1020781800, 1021102350, 1021422950, 1021743600, 1022064300, 1022385050, 1022705850, 1023026700, 1023347600, 1023668550, 1023989550, 1024310600, 1024631700, 1024952850, 1025274050, 1025595300, 1025916600, 1026237950, 1026559350, 1026880800, 1027202300, 1027523850, 1027845450, 1028167100, 1028488800, 1028810550, 1029132350, 1029454200, 1029776100, 1030098050, 1030420050, 1030742100, 1031064200, 1031386350, 1031708550, 1032030800, 1032353100, 1032675450, 1032997850, 1033320300, 1033642800, 1033965350, 1034287950, 1034610600, 1034933300, 1035256050, 1035578850, 1035901700, 1036224600, 1036547550, 1036870550, 1037193600, 1037516700, 1037839850, 1038163050, 1038486300, 1038809600, 1039132950, 1039456350, 1039779800, 1040103300, 1040426850, 1040750450, 1041074100, 1041397800, 1041721550, 1042045350, 1042369200, 1042693100, 1043017050, 1043341050, 1043665100, 1043989200, 1044313350, 1044637550, 1044961800, 1045286100, 1045610450, 1045934850, 1046259300, 1046583800, 1046908350, 1047232950, 1047557600, 1047882300, 1048207050, 1048531850, 1048856700, 1049181600, 1049506550, 1049831550, 1050156600, 1050481700, 1050806850, 1051132050, 1051457300, 1051782600, 1052107950, 1052433350, 1052758800, 1053084300, 1053409850, 1053735450, 1054061100, 1054386800, 1054712550, 1055038350, 1055364200, 1055690100, 1056016050, 1056342050, 1056668100, 1056994200, 1057320350, 1057646550, 1057972800, 1058299100, 1058625450, 1058951850, 1059278300, 1059604800, 1059931350, 1060257950, 1060584600, 1060911300, 1061238050, 1061564850, 1061891700, 1062218600, 1062545550, 1062872550, 1063199600, 1063526700, 1063853850, 1064181050, 1064508300, 1064835600, 1065162950, 1065490350, 1065817800, 1066145300, 1066472850, 1066800450, 1067128100, 1067455800, 1067783550, 1068111350, 1068439200, 1068767100, 1069095050, 1069423050, 1069751100, 1070079200, 1070407350, 1070735550, 1071063800, 1071392100, 1071720450, 1072048850, 1072377300, 1072705800, 1073034350, 1073362950, 1073691600, 1074020300, 1074349050, 1074677850, 1075006700, 1075335600, 1075664550, 1075993550, 1076322600, 1076651700, 1076980850, 1077310050, 1077639300, 1077968600, 1078297950, 1078627350, 1078956800, 1079286300, 1079615850, 1079945450, 1080275100, 1080604800, 1080934550, 1081264350, 1081594200, 1081924100, 1082254050, 1082584050, 1082914100, 1083244200, 1083574350, 1083904550, 1084234800, 1084565100, 1084895450, 1085225850, 1085556300, 1085886800, 1086217350, 1086547950, 1086878600, 1087209300, 1087540050, 1087870850, 1088201700, 1088532600, 1088863550, 1089194550, 1089525600, 1089856700, 1090187850, 1090519050, 1090850300, 1091181600, 1091512950, 1091844350, 1092175800, 1092507300, 1092838850, 1093170450, 1093502100, 1093833800, 1094165550, 1094497350, 1094829200, 1095161100, 1095493050, 1095825050, 1096157100, 1096489200, 1096821350, 1097153550, 1097485800, 1097818100, 1098150450, 1098482850, 1098815300, 1099147800, 1099480350, 1099812950, 1100145600, 1100478300, 1100811050, 1101143850, 1101476700, 1101809600, 1102142550, 1102475550, 1102808600, 1103141700, 1103474850, 1103808050, 1104141300, 1104474600, 1104807950, 1105141350, 1105474800, 1105808300, 1106141850, 1106475450, 1106809100, 1107142800, 1107476550, 1107810350, 1108144200, 1108478100, 1108812050, 1109146050, 1109480100, 1109814200, 1110148350, 1110482550, 1110816800, 1111151100, 1111485450, 1111819850, 1112154300, 1112488800, 1112823350, 1113157950, 1113492600, 1113827300, 1114162050, 1114496850, 1114831700, 1115166600, 1115501550, 1115836550, 1116171600, 1116506700, 1116841850, 1117177050, 1117512300, 1117847600, 1118182950, 1118518350, 1118853800, 1119189300, 1119524850, 1119860450, 1120196100, 1120531800, 1120867550, 1121203350, 1121539200, 1121875100, 1122211050, 1122547050, 1122883100, 1123219200, 1123555350, 1123891550, 1124227800, 1124564100, 1124900450, 1125236850, 1125573300, 1125909800, 1126246350, 1126582950, 1126919600, 1127256300, 1127593050, 1127929850, 1128266700, 1128603600, 1128940550, 1129277550, 1129614600, 1129951700, 1130288850, 1130626050, 1130963300, 1131300600, 1131637950, 1131975350, 1132312800, 1132650300, 1132987850, 1133325450, 1133663100, 1134000800, 1134338550, 1134676350, 1135014200, 1135352100, 1135690050, 1136028050, 1136366100, 1136704200, 1137042350, 1137380550, 1137718800, 1138057100, 1138395450, 1138733850, 1139072300, 1139410800, 1139749350, 1140087950, 1140426600, 1140765300, 1141104050, 1141442850, 1141781700, 1142120600, 1142459550, 1142798550, 1143137600, 1143476700, 1143815850, 1144155050, 1144494300, 1144833600, 1145172950, 1145512350, 1145851800, 1146191300, 1146530850, 1146870450, 1147210100, 1147549800, 1147889550, 1148229350, 1148569200, 1148909100, 1149249050, 1149589050, 1149929100, 1150269200, 1150609350, 1150949550, 1151289800, 1151630100, 1151970450, 1152310850, 1152651300, 1152991800, 1153332350, 1153672950, 1154013600, 1154354300, 1154695050, 1155035850, 1155376700, 1155717600, 1156058550, 1156399550, 1156740600, 1157081700, 1157422850, 1157764050, 1158105300, 1158446600, 1158787950, 1159129350, 1159470800, 1159812300, 1160153850, 1160495450, 1160837100, 1161178800, 1161520550, 1161862350, 1162204200, 1162546100, 1162888050, 1163230050, 1163572100, 1163914200, 1164256350, 1164598550, 1164940800, 1165283100, 1165625450, 1165967850, 1166310300, 1166652800, 1166995350, 1167337950, 1167680600, 1168023300, 1168366050, 1168708850, 1169051700, 1169394600, 1169737550, 1170080550, 1170423600, 1170766700, 1171109850, 1171453050, 1171796300, 1172139600, 1172482950, 1172826350, 1173169800, 1173513300, 1173856850, 1174200450, 1174544100, 1174887800, 1175231550, 1175575350, 1175919200, 1176263100, 1176607050, 1176951050, 1177295100, 1177639200, 1177983350, 1178327550, 1178671800, 1179016100, 1179360450, 1179704850, 1180049300, 1180393800, 1180738350, 1181082950, 1181427600, 1181772300, 1182117050, 1182461850, 1182806700, 1183151600, 1183496550, 1183841550, 1184186600, 1184531700, 1184876850, 1185222050, 1185567300, 1185912600, 1186257950, 1186603350, 1186948800, 1187294300, 1187639850, 1187985450, 1188331100, 1188676800, 1189022550, 1189368350, 1189714200, 1190060100, 1190406050, 1190752050, 1191098100, 1191444200, 1191790350, 1192136550, 1192482800, 1192829100, 1193175450, 1193521850, 1193868300, 1194214800, 1194561350, 1194907950, 1195254600, 1195601300, 1195948050, 1196294850, 1196641700, 1196988600, 1197335550, 1197682550, 1198029600, 1198376700, 1198723850, 1199071050, 1199418300, 1199765600, 1200112950, 1200460350, 1200807800, 1201155300, 1201502850, 1201850450, 1202198100, 1202545800, 1202893550, 1203241350, 1203589200, 1203937100, 1204285050, 1204633050, 1204981100, 1205329200, 1205677350, 1206025550, 1206373800, 1206722100, 1207070450, 1207418850, 1207767300, 1208115800, 1208464350, 1208812950, 1209161600, 1209510300, 1209859050, 1210207850, 1210556700, 1210905600, 1211254550, 1211603550, 1211952600, 1212301700, 1212650850, 1213000050, 1213349300, 1213698600, 1214047950, 1214397350, 1214746800, 1215096300, 1215445850, 1215795450, 1216145100, 1216494800, 1216844550, 1217194350, 1217544200, 1217894100, 1218244050, 1218594050, 1218944100, 1219294200, 1219644350, 1219994550, 1220344800, 1220695100, 1221045450, 1221395850, 1221746300, 1222096800, 1222447350, 1222797950, 1223148600, 1223499300, 1223850050, 1224200850, 1224551700, 1224902600, 1225253550, 1225604550, 1225955600, 1226306700, 1226657850, 1227009050, 1227360300, 1227711600, 1228062950, 1228414350, 1228765800, 1229117300, 1229468850, 1229820450, 1230172100, 1230523800, 1230875550, 1231227350, 1231579200, 1231931100, 1232283050, 1232635050, 1232987100, 1233339200, 1233691350, 1234043550, 1234395800, 1234748100, 1235100450, 1235452850, 1235805300, 1236157800, 1236510350, 1236862950, 1237215600, 1237568300, 1237921050, 1238273850, 1238626700, 1238979600, 1239332550, 1239685550, 1240038600, 1240391700, 1240744850, 1241098050, 1241451300, 1241804600, 1242157950, 1242511350, 1242864800, 1243218300, 1243571850, 1243925450, 1244279100, 1244632800, 1244986550, 1245340350, 1245694200, 1246048100, 1246402050, 1246756050, 1247110100, 1247464200, 1247818350, 1248172550, 1248526800, 1248881100, 1249235450, 1249589850, 1249944300, 1250298800, 1250653350, 1251007950, 1251362600, 1251717300, 1252072050, 1252426850, 1252781700, 1253136600, 1253491550, 1253846550, 1254201600, 1254556700, 1254911850, 1255267050, 1255622300, 1255977600, 1256332950, 1256688350, 1257043800, 1257399300, 1257754850, 1258110450, 1258466100, 1258821800, 1259177550, 1259533350, 1259889200, 1260245100, 1260601050, 1260957050, 1261313100, 1261669200, 1262025350, 1262381550, 1262737800, 1263094100, 1263450450, 1263806850, 1264163300, 1264519800, 1264876350, 1265232950, 1265589600, 1265946300, 1266303050, 1266659850, 1267016700, 1267373600, 1267730550, 1268087550, 1268444600, 1268801700, 1269158850, 1269516050, 1269873300, 1270230600, 1270587950, 1270945350, 1271302800, 1271660300, 1272017850, 1272375450, 1272733100, 1273090800, 1273448550, 1273806350, 1274164200, 1274522100, 1274880050, 1275238050, 1275596100, 1275954200, 1276312350, 1276670550, 1277028800, 1277387100, 1277745450, 1278103850, 1278462300, 1278820800, 1279179350, 1279537950, 1279896600, 1280255300, 1280614050, 1280972850, 1281331700, 1281690600, 1282049550, 1282408550, 1282767600, 1283126700, 1283485850, 1283845050, 1284204300, 1284563600, 1284922950, 1285282350, 1285641800, 1286001300, 1286360850, 1286720450, 1287080100, 1287439800, 1287799550, 1288159350, 1288519200, 1288879100, 1289239050, 1289599050, 1289959100, 1290319200, 1290679350, 1291039550, 1291399800, 1291760100, 1292120450, 1292480850, 1292841300, 1293201800, 1293562350, 1293922950, 1294283600, 1294644300, 1295005050, 1295365850, 1295726700, 1296087600, 1296448550, 1296809550, 1297170600, 1297531700, 1297892850, 1298254050, 1298615300, 1298976600, 1299337950, 1299699350, 1300060800, 1300422300, 1300783850, 1301145450, 1301507100, 1301868800, 1302230550, 1302592350, 1302954200, 1303316100, 1303678050, 1304040050, 1304402100, 1304764200, 1305126350, 1305488550, 1305850800, 1306213100, 1306575450, 1306937850, 1307300300, 1307662800, 1308025350, 1308387950, 1308750600, 1309113300, 1309476050, 1309838850, 1310201700, 1310564600, 1310927550, 1311290550, 1311653600, 1312016700, 1312379850, 1312743050, 1313106300, 1313469600, 1313832950, 1314196350, 1314559800, 1314923300, 1315286850, 1315650450, 1316014100, 1316377800, 1316741550, 1317105350, 1317469200, 1317833100, 1318197050, 1318561050, 1318925100, 1319289200, 1319653350, 1320017550, 1320381800, 1320746100, 1321110450, 1321474850, 1321839300, 1322203800, 1322568350, 1322932950, 1323297600, 1323662300, 1324027050, 1324391850, 1324756700, 1325121600, 1325486550, 1325851550, 1326216600, 1326581700, 1326946850, 1327312050, 1327677300, 1328042600, 1328407950, 1328773350, 1329138800, 1329504300, 1329869850, 1330235450, 1330601100, 1330966800, 1331332550, 1331698350, 1332064200, 1332430100, 1332796050, 1333162050, 1333528100, 1333894200, 1334260350, 1334626550, 1334992800, 1335359100, 1335725450, 1336091850, 1336458300, 1336824800, 1337191350, 1337557950, 1337924600, 1338291300, 1338658050, 1339024850, 1339391700, 1339758600, 1340125550, 1340492550, 1340859600, 1341226700, 1341593850, 1341961050, 1342328300, 1342695600, 1343062950, 1343430350, 1343797800, 1344165300, 1344532850, 1344900450, 1345268100, 1345635800, 1346003550, 1346371350, 1346739200, 1347107100, 1347475050, 1347843050, 1348211100, 1348579200, 1348947350, 1349315550, 1349683800, 1350052100, 1350420450, 1350788850, 1351157300, 1351525800, 1351894350, 1352262950, 1352631600, 1353000300, 1353369050, 1353737850, 1354106700, 1354475600, 1354844550, 1355213550, 1355582600, 1355951700, 1356320850, 1356690050, 1357059300, 1357428600, 1357797950, 1358167350, 1358536800, 1358906300, 1359275850, 1359645450, 1360015100, 1360384800, 1360754550, 1361124350, 1361494200, 1361864100, 1362234050, 1362604050, 1362974100, 1363344200, 1363714350, 1364084550, 1364454800, 1364825100, 1365195450, 1365565850, 1365936300, 1366306800, 1366677350, 1367047950, 1367418600, 1367789300, 1368160050, 1368530850, 1368901700, 1369272600, 1369643550, 1370014550, 1370385600, 1370756700, 1371127850, 1371499050, 1371870300, 1372241600, 1372612950, 1372984350, 1373355800, 1373727300, 1374098850, 1374470450, 1374842100, 1375213800, 1375585550, 1375957350, 1376329200, 1376701100, 1377073050, 1377445050, 1377817100, 1378189200, 1378561350, 1378933550, 1379305800, 1379678100, 1380050450, 1380422850, 1380795300, 1381167800, 1381540350, 1381912950, 1382285600, 1382658300, 1383031050, 1383403850, 1383776700, 1384149600, 1384522550, 1384895550, 1385268600, 1385641700, 1386014850, 1386388050, 1386761300, 1387134600, 1387507950, 1387881350, 1388254800, 1388628300, 1389001850, 1389375450, 1389749100, 1390122800, 1390496550, 1390870350, 1391244200, 1391618100, 1391992050, 1392366050, 1392740100, 1393114200, 1393488350, 1393862550, 1394236800, 1394611100, 1394985450, 1395359850, 1395734300, 1396108800, 1396483350, 1396857950, 1397232600, 1397607300, 1397982050, 1398356850, 1398731700, 1399106600, 1399481550, 1399856550, 1400231600, 1400606700, 1400981850, 1401357050, 1401732300, 1402107600, 1402482950, 1402858350, 1403233800, 1403609300, 1403984850, 1404360450, 1404736100, 1405111800, 1405487550, 1405863350, 1406239200, 1406615100, 1406991050, 1407367050, 1407743100, 1408119200, 1408495350, 1408871550, 1409247800, 1409624100, 1410000450, 1410376850, 1410753300, 1411129800, 1411506350, 1411882950, 1412259600, 1412636300, 1413013050, 1413389850, 1413766700, 1414143600, 1414520550, 1414897550, 1415274600, 1415651700, 1416028850, 1416406050, 1416783300, 1417160600, 1417537950, 1417915350, 1418292800, 1418670300, 1419047850, 1419425450, 1419803100, 1420180800, 1420558550, 1420936350, 1421314200, 1421692100, 1422070050, 1422448050, 1422826100, 1423204200, 1423582350, 1423960550, 1424338800, 1424717100, 1425095450, 1425473850, 1425852300, 1426230800, 1426609350, 1426987950, 1427366600, 1427745300, 1428124050, 1428502850, 1428881700, 1429260600, 1429639550, 1430018550, 1430397600, 1430776700, 1431155850, 1431535050, 1431914300, 1432293600, 1432672950, 1433052350, 1433431800, 1433811300, 1434190850, 1434570450, 1434950100, 1435329800, 1435709550, 1436089350, 1436469200, 1436849100, 1437229050, 1437609050, 1437989100, 1438369200, 1438749350, 1439129550, 1439509800, 1439890100, 1440270450, 1440650850, 1441031300, 1441411800, 1441792350, 1442172950, 1442553600, 1442934300, 1443315050, 1443695850, 1444076700, 1444457600, 1444838550, 1445219550, 1445600600, 1445981700, 1446362850, 1446744050, 1447125300, 1447506600, 1447887950, 1448269350, 1448650800, 1449032300, 1449413850, 1449795450, 1450177100, 1450558800, 1450940550, 1451322350, 1451704200, 1452086100, 1452468050, 1452850050, 1453232100, 1453614200, 1453996350, 1454378550, 1454760800, 1455143100, 1455525450, 1455907850, 1456290300, 1456672800, 1457055350, 1457437950, 1457820600, 1458203300, 1458586050, 1458968850, 1459351700, 1459734600, 1460117550, 1460500550, 1460883600, 1461266700, 1461649850, 1462033050, 1462416300, 1462799600, 1463182950, 1463566350, 1463949800, 1464333300, 1464716850, 1465100450, 1465484100, 1465867800, 1466251550, 1466635350, 1467019200, 1467403100, 1467787050, 1468171050, 1468555100, 1468939200, 1469323350, 1469707550, 1470091800, 1470476100, 1470860450, 1471244850, 1471629300, 1472013800, 1472398350, 1472782950, 1473167600, 1473552300, 1473937050, 1474321850, 1474706700, 1475091600, 1475476550, 1475861550, 1476246600, 1476631700, 1477016850, 1477402050, 1477787300, 1478172600, 1478557950, 1478943350, 1479328800, 1479714300, 1480099850, 1480485450, 1480871100, 1481256800, 1481642550, 1482028350, 1482414200, 1482800100, 1483186050, 1483572050, 1483958100, 1484344200, 1484730350, 1485116550, 1485502800, 1485889100, 1486275450, 1486661850, 1487048300, 1487434800, 1487821350, 1488207950, 1488594600, 1488981300, 1489368050, 1489754850, 1490141700, 1490528600, 1490915550, 1491302550, 1491689600, 1492076700, 1492463850, 1492851050, 1493238300, 1493625600, 1494012950, 1494400350, 1494787800, 1495175300, 1495562850, 1495950450, 1496338100, 1496725800, 1497113550, 1497501350, 1497889200, 1498277100, 1498665050, 1499053050, 1499441100, 1499829200, 1500217350, 1500605550, 1500993800, 1501382100, 1501770450, 1502158850, 1502547300, 1502935800, 1503324350, 1503712950, 1504101600, 1504490300, 1504879050, 1505267850, 1505656700, 1506045600, 1506434550, 1506823550, 1507212600, 1507601700, 1507990850, 1508380050, 1508769300, 1509158600, 1509547950, 1509937350, 1510326800, 1510716300, 1511105850, 1511495450, 1511885100, 1512274800, 1512664550, 1513054350, 1513444200, 1513834100, 1514224050, 1514614050, 1515004100, 1515394200, 1515784350, 1516174550, 1516564800, 1516955100, 1517345450, 1517735850, 1518126300, 1518516800, 1518907350, 1519297950, 1519688600, 1520079300, 1520470050, 1520860850, 1521251700, 1521642600, 1522033550, 1522424550, 1522815600, 1523206700, 1523597850, 1523989050, 1524380300, 1524771600, 1525162950, 1525554350, 1525945800, 1526337300, 1526728850, 1527120450, 1527512100, 1527903800, 1528295550, 1528687350, 1529079200, 1529471100, 1529863050, 1530255050, 1530647100, 1531039200, 1531431350, 1531823550, 1532215800, 1532608100, 1533000450, 1533392850, 1533785300, 1534177800, 1534570350, 1534962950, 1535355600, 1535748300, 1536141050, 1536533850, 1536926700, 1537319600, 1537712550, 1538105550, 1538498600, 1538891700, 1539284850, 1539678050, 1540071300, 1540464600, 1540857950, 1541251350, 1541644800, 1542038300, 1542431850, 1542825450, 1543219100, 1543612800, 1544006550, 1544400350, 1544794200, 1545188100, 1545582050, 1545976050, 1546370100, 1546764200, 1547158350, 1547552550, 1547946800, 1548341100, 1548735450, 1549129850, 1549524300, 1549918800, 1550313350, 1550707950, 1551102600, 1551497300, 1551892050, 1552286850, 1552681700, 1553076600, 1553471550, 1553866550, 1554261600, 1554656700, 1555051850, 1555447050, 1555842300, 1556237600, 1556632950, 1557028350, 1557423800, 1557819300, 1558214850, 1558610450, 1559006100, 1559401800, 1559797550, 1560193350, 1560589200, 1560985100, 1561381050, 1561777050, 1562173100, 1562569200, 1562965350, 1563361550, 1563757800, 1564154100, 1564550450, 1564946850, 1565343300, 1565739800, 1566136350, 1566532950, 1566929600, 1567326300, 1567723050, 1568119850, 1568516700, 1568913600, 1569310550, 1569707550, 1570104600, 1570501700, 1570898850, 1571296050, 1571693300, 1572090600, 1572487950, 1572885350, 1573282800, 1573680300, 1574077850, 1574475450, 1574873100, 1575270800, 1575668550, 1576066350, 1576464200, 1576862100, 1577260050, 1577658050, 1578056100, 1578454200, 1578852350, 1579250550, 1579648800, 1580047100, 1580445450, 1580843850, 1581242300, 1581640800, 1582039350, 1582437950, 1582836600, 1583235300, 1583634050, 1584032850, 1584431700, 1584830600, 1585229550, 1585628550, 1586027600, 1586426700, 1586825850, 1587225050, 1587624300, 1588023600, 1588422950, 1588822350, 1589221800, 1589621300, 1590020850, 1590420450, 1590820100, 1591219800, 1591619550, 1592019350, 1592419200, 1592819100, 1593219050, 1593619050, 1594019100, 1594419200, 1594819350, 1595219550, 1595619800, 1596020100, 1596420450, 1596820850, 1597221300, 1597621800, 1598022350, 1598422950, 1598823600, 1599224300, 1599625050, 1600025850, 1600426700, 1600827600, 1601228550, 1601629550, 1602030600, 1602431700, 1602832850, 1603234050, 1603635300, 1604036600, 1604437950, 1604839350, 1605240800, 1605642300, 1606043850, 1606445450, 1606847100, 1607248800, 1607650550, 1608052350, 1608454200, 1608856100, 1609258050, 1609660050, 1610062100, 1610464200, 1610866350, 1611268550, 1611670800, 1612073100, 1612475450, 1612877850, 1613280300, 1613682800, 1614085350, 1614487950, 1614890600, 1615293300, 1615696050, 1616098850, 1616501700, 1616904600, 1617307550, 1617710550, 1618113600, 1618516700, 1618919850, 1619323050, 1619726300, 1620129600, 1620532950, 1620936350, 1621339800, 1621743300, 1622146850, 1622550450, 1622954100, 1623357800, 1623761550, 1624165350, 1624569200, 1624973100, 1625377050, 1625781050, 1626185100, 1626589200, 1626993350, 1627397550, 1627801800, 1628206100, 1628610450, 1629014850, 1629419300, 1629823800, 1630228350, 1630632950, 1631037600, 1631442300, 1631847050, 1632251850, 1632656700, 1633061600, 1633466550, 1633871550, 1634276600, 1634681700, 1635086850, 1635492050, 1635897300, 1636302600, 1636707950, 1637113350, 1637518800, 1637924300, 1638329850, 1638735450, 1639141100, 1639546800, 1639952550, 1640358350, 1640764200, 1641170100, 1641576050, 1641982050, 1642388100, 1642794200, 1643200350, 1643606550, 1644012800, 1644419100, 1644825450, 1645231850, 1645638300, 1646044800, 1646451350, 1646857950, 1647264600, 1647671300, 1648078050, 1648484850, 1648891700, 1649298600, 1649705550, 1650112550, 1650519600, 1650926700, 1651333850, 1651741050, 1652148300, 1652555600, 1652962950, 1653370350, 1653777800, 1654185300, 1654592850, 1655000450, 1655408100, 1655815800, 1656223550, 1656631350, 1657039200, 1657447100, 1657855050, 1658263050, 1658671100, 1659079200, 1659487350, 1659895550, 1660303800, 1660712100, 1661120450, 1661528850, 1661937300, 1662345800, 1662754350, 1663162950, 1663571600, 1663980300, 1664389050, 1664797850, 1665206700, 1665615600, 1666024550, 1666433550, 1666842600, 1667251700, 1667660850, 1668070050, 1668479300, 1668888600, 1669297950, 1669707350, 1670116800, 1670526300, 1670935850, 1671345450, 1671755100, 1672164800, 1672574550, 1672984350, 1673394200, 1673804100, 1674214050, 1674624050, 1675034100, 1675444200, 1675854350, 1676264550, 1676674800, 1677085100, 1677495450, 1677905850, 1678316300, 1678726800, 1679137350, 1679547950, 1679958600, 1680369300, 1680780050, 1681190850, 1681601700, 1682012600, 1682423550, 1682834550, 1683245600, 1683656700, 1684067850, 1684479050, 1684890300, 1685301600, 1685712950, 1686124350, 1686535800, 1686947300, 1687358850, 1687770450, 1688182100, 1688593800, 1689005550, 1689417350, 1689829200, 1690241100, 1690653050, 1691065050, 1691477100, 1691889200, 1692301350, 1692713550, 1693125800, 1693538100, 1693950450, 1694362850, 1694775300, 1695187800, 1695600350, 1696012950, 1696425600, 1696838300, 1697251050, 1697663850, 1698076700, 1698489600, 1698902550, 1699315550, 1699728600, 1700141700, 1700554850, 1700968050, 1701381300, 1701794600, 1702207950, 1702621350, 1703034800, 1703448300, 1703861850, 1704275450, 1704689100, 1705102800, 1705516550, 1705930350, 1706344200, 1706758100, 1707172050, 1707586050, 1708000100, 1708414200, 1708828350, 1709242550, 1709656800, 1710071100, 1710485450, 1710899850, 1711314300, 1711728800, 1712143350, 1712557950, 1712972600, 1713387300, 1713802050, 1714216850, 1714631700, 1715046600, 1715461550, 1715876550, 1716291600, 1716706700, 1717121850, 1717537050, 1717952300, 1718367600, 1718782950, 1719198350, 1719613800, 1720029300, 1720444850, 1720860450, 1721276100, 1721691800, 1722107550, 1722523350, 1722939200, 1723355100, 1723771050, 1724187050, 1724603100, 1725019200, 1725435350, 1725851550, 1726267800, 1726684100, 1727100450, 1727516850, 1727933300, 1728349800, 1728766350, 1729182950, 1729599600, 1730016300, 1730433050, 1730849850, 1731266700, 1731683600, 1732100550, 1732517550, 1732934600, 1733351700, 1733768850, 1734186050, 1734603300, 1735020600, 1735437950, 1735855350, 1736272800, 1736690300, 1737107850, 1737525450, 1737943100, 1738360800, 1738778550, 1739196350, 1739614200, 1740032100, 1740450050, 1740868050, 1741286100, 1741704200, 1742122350, 1742540550, 1742958800, 1743377100, 1743795450, 1744213850, 1744632300, 1745050800, 1745469350, 1745887950, 1746306600, 1746725300, 1747144050, 1747562850, 1747981700, 1748400600, 1748819550, 1749238550, 1749657600, 1750076700, 1750495850, 1750915050, 1751334300, 1751753600, 1752172950, 1752592350, 1753011800, 1753431300, 1753850850, 1754270450, 1754690100, 1755109800, 1755529550, 1755949350, 1756369200, 1756789100, 1757209050, 1757629050, 1758049100, 1758469200, 1758889350, 1759309550, 1759729800, 1760150100, 1760570450, 1760990850, 1761411300, 1761831800, 1762252350, 1762672950, 1763093600, 1763514300, 1763935050, 1764355850, 1764776700, 1765197600, 1765618550, 1766039550, 1766460600, 1766881700, 1767302850, 1767724050, 1768145300, 1768566600, 1768987950, 1769409350, 1769830800, 1770252300, 1770673850, 1771095450, 1771517100, 1771938800, 1772360550, 1772782350, 1773204200, 1773626100, 1774048050, 1774470050, 1774892100, 1775314200, 1775736350, 1776158550, 1776580800, 1777003100, 1777425450, 1777847850, 1778270300, 1778692800, 1779115350, 1779537950, 1779960600, 1780383300, 1780806050, 1781228850, 1781651700, 1782074600, 1782497550, 1782920550, 1783343600, 1783766700, 1784189850, 1784613050, 1785036300, 1785459600, 1785882950, 1786306350, 1786729800, 1787153300, 1787576850}
			--I just couldn't find the right global, so that's why you see "RPtoRank" list here

	CrewRank:add_bare_item("",
		function()
				CurrentCrewRP = stats.get_int("MPPLY_CREW_LOCAL_XP_" .. a77)
				CurrentCrewRank = 0
			for i = 1, 8000 do
				if CurrentCrewRP < RPtoRank[i] then
					break
				else
					CurrentCrewRank = i
				end
			end
			return "Selected Crew Rank: " .. CurrentCrewRank
		end, null, null, null)

			NumberList1 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
			NumberList2 = {0, 1, 2, 3, 4, 5, 6, 7, 8}

			DefNum33 = NumberList2[1]
			DefNum33Cur = 1
	CrewRank:add_array_item("Number #1", NumberList2,
		function()
			return DefNum33Cur
		end,
		function(NewNum33)
			DefNum33 = NumberList2[NewNum33]
			DefNum33Cur = NewNum33
		end)

			DefNum34 = NumberList1[1]
			DefNum34Cur = 1
	CrewRank:add_array_item("Number #2", NumberList1,
		function()
			return DefNum34Cur
		end,
		function(NewNum34)
			DefNum34 = NumberList1[NewNum34]
			DefNum34Cur = NewNum34
		end)

			DefNum35 = NumberList1[1]
			DefNum35Cur = 1
	CrewRank:add_array_item("Number #3", NumberList1,
		function()
			return DefNum35Cur
		end,
		function(NewNum35)
			DefNum35 = NumberList1[NewNum35]
			DefNum35Cur = NewNum35
		end)

			DefNum36 = NumberList1[1]
			DefNum36Cur = 1
	CrewRank:add_array_item("Number #4", NumberList1,
		function()
			return DefNum36Cur
		end,
		function(NewNum36)
			DefNum36 = NumberList1[NewNum36]
			DefNum36Cur = NewNum36
		end)

	CrewRank:add_bare_item("",
		function()
			if DefNum33 == 0 then
				NewCrewRank = tonumber(DefNum34 .. DefNum35 .. DefNum36)
			else
				NewCrewRank = tonumber(DefNum33 .. DefNum34 .. DefNum35 .. DefNum36)
			end
			if NewCrewRank == 0 then
				NewCrewRank = ""
			end
			return "Set Crew Rank: " .. NewCrewRank
		end,
		function()
			stats.set_int("MPPLY_CREW_LOCAL_XP_" .. a77, RPtoRank[NewCrewRank])
			if a78 == true then
				DefNum33Cur = 1
				DefNum34Cur = 1
				DefNum35Cur = 1
				DefNum36Cur = 1
				DefNum33 = NumberList2[1]
				DefNum34 = NumberList1[1]
				DefNum35 = NumberList1[1]
				DefNum36 = NumberList1[1]
			end
		end, null, null)

			a78 = true
	CrewRank:add_toggle("Reset Value", function() return a78 end, function() a78 = not a78 end)

	CrewRank:add_action("", null)

	CrewRankNote = CrewRank:add_submenu("Read Me")

	CrewRankNote:add_action("     Select one of five crews and set rank;", null)
	CrewRankNote:add_action(" you may need to change session to apply", null)
	CrewRankNote:add_action("", null)
	CrewRankNote:add_action("                        Reset Value:", null)
	CrewRankNote:add_action("  Resets «Set Crew Rank» value after using", null)

--Rank--

	Rank = CharactersStats:add_submenu("Rank")

	Rank:add_bare_item("",
		function()
			CurrentRP = globals.get_int(1853988 + 1 + localplayer:get_player_id() * 867 + 205 + 1)
			CurrentRank = 0
			for i = 1, 8000 do
				if CurrentRP < RPtoRank[i] then
					break
				else
					CurrentRank = i
				end
			end
			if CurrentRank == 1 then
				CurrentRank = " "
			end
			return "Current Rank: " .. CurrentRank
		end, null, null, null)

			DefNum29 = NumberList2[1]
			DefNum29Cur = 1
	Rank:add_array_item("Number #1", NumberList2,
		function()
			return DefNum29Cur
		end,
		function(NewNum29)
			DefNum29 = NumberList2[NewNum29]
			DefNum29Cur = NewNum29
		end)

			DefNum30 = NumberList1[1]
			DefNum30Cur = 1
	Rank:add_array_item("Number #2", NumberList1,
		function()
			return DefNum30Cur
		end,
		function(NewNum30)
			DefNum30 = NumberList1[NewNum30]
			DefNum30Cur = NewNum30
		end)

			DefNum31 = NumberList1[1]
			DefNum31Cur = 1
	Rank:add_array_item("Number #3", NumberList1,
		function()
			return DefNum31Cur
		end,
		function(NewNum31)
			DefNum31 = NumberList1[NewNum31]
			DefNum31Cur = NewNum31
		end)

			DefNum32 = NumberList1[1]
			DefNum32Cur = 1
	Rank:add_array_item("Number #4", NumberList1,
		function()
			return DefNum32Cur
		end,
		function(NewNum32)
			DefNum32 = NumberList1[NewNum32]
			DefNum32Cur = NewNum32
		end)

	Rank:add_bare_item("",
		function()
			if DefNum29 == 0 then
				NewRank = tonumber(DefNum30 .. DefNum31 .. DefNum32)
			else
				NewRank = tonumber(DefNum29 .. DefNum30 .. DefNum31 .. DefNum32)
			end
			if NewRank == 0 then
				NewRank = ""
			end
		return "Set Rank: " .. NewRank
		end,
		function()
			stats.set_int(MPX .. "CHAR_SET_RP_GIFT_ADMIN", RPtoRank[NewRank])
			sleep(2)
			globals.set_int(1575020, 8)
			globals.set_int(1574589, 1)
			sleep(3)
			globals.set_int(1574589, 0)
			if a79 == true then
				sleep(1)
				DefNum29Cur = 1
				DefNum30Cur = 1
				DefNum31Cur = 1
				DefNum32Cur = 1
				DefNum29 = NumberList2[1]
				DefNum30 = NumberList1[1]
				DefNum31 = NumberList1[1]
				DefNum32 = NumberList1[1]
			end
		end, null, null)

			a79 = true
	Rank:add_toggle("Reset Value", function() return a79 end, function() a79 = not a79 end)

	Rank:add_action("", null)

	RankNote = Rank:add_submenu("Read Me")

	RankNote:add_action("             High level = More reports", null)
	RankNote:add_action("", null)
	RankNote:add_action("                        Reset Value:", null)
	RankNote:add_action("      Resets «Set Rank» value after using", null)

--K/D Changer--

	KDChanger = CharactersStats:add_submenu("K/D Changer")

	KDChanger:add_bare_item("",
		function()
			return "Current K/D Ratio: " .. stats.get_float("MPPLY_KILL_DEATH_RATIO")
		end, null, null, null)

			DefNum37 = NumberList[1]
			DefNum37Cur = 1
	KDChanger:add_array_item("Number #1", NumberList,
		function()
			return DefNum37Cur
		end,
		function(NewNum37)
			DefNum37 = NumberList[NewNum37]
			DefNum37Cur = NewNum37
		end)

			DefNum38 = NumberList[1]
			DefNum38Cur = 1
	KDChanger:add_array_item("Number #2", NumberList,
		function()
			return DefNum38Cur
		end,
		function(NewNum38)
			DefNum38 = NumberList[NewNum38]
			DefNum38Cur = NewNum38
		end)

			DefNum39 = NumberList[1]
			DefNum39Cur = 1
	KDChanger:add_array_item("Number #3", NumberList,
		function()
			return DefNum39Cur
		end,
		function(NewNum39)
			DefNum39 = NumberList[NewNum39]
			DefNum39Cur = NewNum39
		end)

			DefNum40 = NumberList[1]
			DefNum40Cur = 1
	KDChanger:add_array_item("Number #4", NumberList,
		function()
			return DefNum40Cur
		end,
		function(NewNum40)
			DefNum40 = NumberList[NewNum40]
			DefNum40Cur = NewNum40
		end)

			DefNum41 = NumberList[1]
			DefNum41Cur = 1
	KDChanger:add_array_item("Number #5", NumberList,
		function()
			return DefNum41Cur
		end,
		function(NewNum41)
			DefNum41 = NumberList[NewNum41]
			DefNum41Cur = NewNum41
		end)

			DefNum42 = NumberList[1]
			DefNum42Cur = 1
	KDChanger:add_array_item("Number #6", NumberList,
		function()
			return DefNum42Cur
		end,
		function(NewNum42)
			DefNum42 = NumberList[NewNum42]
			DefNum42Cur = NewNum42
		end)

			DefNum43 = NumberList[1]
			DefNum43Cur = 1
	KDChanger:add_array_item("Number #7", NumberList,
		function()
			return DefNum43Cur
		end,
		function(NewNum43)
			DefNum43 = NumberList[NewNum43]
			DefNum43Cur = NewNum43
		end)

			DefNum44 = NumberList[1]
			DefNum44Cur = 1
	KDChanger:add_array_item("Number #8", NumberList,
		function()
			return DefNum44Cur
		end,
		function(NewNum44)
			DefNum44 = NumberList[NewNum44]
			DefNum44Cur = NewNum44
		end)

			DefNum45 = NumberList[1]
			DefNum45Cur = 1
	KDChanger:add_array_item("Number #9", NumberList,
		function()
			return DefNum45Cur
		end,
		function(NewNum45)
			DefNum45 = NumberList[NewNum45]
			DefNum45Cur = NewNum45
		end)

			DefNum46 = NumberList[1]
			DefNum46Cur = 1
	KDChanger:add_array_item("Number #10", NumberList,
		function()
			return DefNum46Cur
		end,
		function(NewNum46)
			DefNum46 = NumberList[NewNum46]
			DefNum46Cur = NewNum46
		end)

	KDChanger:add_bare_item("",
		function()
			ValueToChange = tonumber(DefNum37 .. DefNum38 .. DefNum39 .. DefNum40 .. DefNum41 .. DefNum42 .. DefNum43 .. DefNum44 .. DefNum45 .. DefNum46)
			if ValueToChange > 2147483646 then
				ValueToChange = 2147483646
			end
			return "Set K/D Ratio: " .. ValueToChange
		end,
		function()
			stats.set_float("MPPLY_KILL_DEATH_RATIO", ValueToChange)
			stats.set_int("MPPLY_KILLS_PLAYERS", ValueToChange)
			stats.set_int("MPPLY_DEATHS_PLAYER", 0)
			if a97 == true then
				sleep(1)
				DefNum37Cur = 1
				DefNum38Cur = 1
				DefNum39Cur = 1
				DefNum40Cur = 1
				DefNum41Cur = 1
				DefNum42Cur = 1
				DefNum43Cur = 1
				DefNum44Cur = 1
				DefNum45Cur = 1
				DefNum46Cur = 1
				DefNum37 = NumberList[1]
				DefNum38 = NumberList[1]
				DefNum39 = NumberList[1]
				DefNum40 = NumberList[1]
				DefNum41 = NumberList[1]
				DefNum42 = NumberList[1]
				DefNum43 = NumberList[1]
				DefNum44 = NumberList[1]
				DefNum45 = NumberList[1]
				DefNum46 = NumberList[1]
			end
		end, null, null)

			a97 = true
	KDChanger:add_toggle("Reset Value", function() return a97 end, function() a97 = not a97 end)

	KDChangerDM = KDChanger:add_submenu("Detailed Method")

	KDChangerDM:add_bare_item("",
		function()
			return "Current K/D Ratio: " .. stats.get_float("MPPLY_KILL_DEATH_RATIO")
		end, null, null, null)

			kills = 0
	KDChangerDM:add_int_range("New Kills", 1, kills, 2147483646,
		function()
			return kills
		end,
		function(Kil)
			kills = Kil
		end)

			deaths = 0
	KDChangerDM:add_int_range("New Deaths", 1, deaths, 2147483646,
		function()
			return deaths
		end,
		function(Dea)
			deaths = Dea
		end)

	KDChangerDM:add_bare_item("",
		function()
			newkd = tonumber(string.format("%.2f", kills / deaths))
			if newkd == nil then
				newkd = 0
			end
			return "Set K/D Ratio: " .. newkd
		end,
		function()
			stats.set_float("MPPLY_KILL_DEATH_RATIO", newkd)
			stats.set_int("MPPLY_KILLS_PLAYERS", kills)
			stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
			if b2 == true then
				kills = 0
				deaths = 0
				newkd = nil
			end
		end, null, null)

			b2 = true
	KDChangerDM:add_toggle("Reset Value", function() return b2 end, function() b2 = not b2 end)

	KDChangerDM:add_action("", null)

	KDChangerDMNote = KDChangerDM:add_submenu("Read Me")

	KDChangerDMNote:add_action("                        Reset Value:", null)
	KDChangerDMNote:add_action("  Resets «Set K/D Ratio» value after using", null)

	KDChanger:add_action("", null)

	KDChangerNote = KDChanger:add_submenu("Read Me")

	KDChangerNote:add_action("                        Reset Value:", null)
	KDChangerNote:add_action("  Resets «Set K/D Ratio» value after using", null)

			a60 = false
		local function SexChanger(Enabled)
			if Enabled then
				stats.set_int(MPX .. "ALLOW_GENDER_CHANGE", 52)
				globals.set_int(281050, 0)
			else
				stats.set_int(MPX .. "ALLOW_GENDER_CHANGE", 0)
			end
		end
	CharactersStats:add_toggle("Sex Changer", function() return a60 end, function() a60 = not a60 SexChanger(a60) end)

	CharactersStats:add_action("", null)

	CharactersStatsNote = CharactersStats:add_submenu("Read Me")

	CharactersStatsNote:add_action("                       Sex Changer:", null)
	CharactersStatsNote:add_action("     Unlocks «Change Sex» option while", null)
	CharactersStatsNote:add_action("                editing your character", null)

---Facilities Unlocks---

	FacilitiesUnlocks = UnlockTool:add_submenu("Facilities Unlocks (Safe)")

--Arena War--

	ArenaWar = FacilitiesUnlocks:add_submenu("Arena War")

	ArenaWar:add_action("Unlock Trade Prices for Headlights",
		function()
			for i = 18, 29 do
				stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, i)
			end
		end)

	ArenaWar:add_action("Unlock Trade Prices for Vehicles",
		function()
			for i = 1, 16 do
				stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, i)
			end
			for i = 11, 19 do
				stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, i)
			end
		end)

		ArenaWarVehicles = {"Select", "Taxi", "HVY Dozer", "Clown Van", "Trashmaster", "HVY Barracks Semi", "HVY Mixer", "Space Docker", "Tractor"}
			a61 = 1
	ArenaWar:add_array_item("Unlock Vehicle", ArenaWarVehicles, function() return a61 end,
		function(AreWarVeh)
			if AreWarVeh == 1 then
				a61 = 1
			elseif ArenaWarVehicles[AreWarVeh] == "Taxi" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 24)
				stats.set_int(MPX .. "ARENAWARS_AP", 249)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "HVY Dozer" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 49)
				stats.set_int(MPX .. "ARENAWARS_AP", 479)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "Clown Van" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 74)
				stats.set_int(MPX .. "ARENAWARS_AP", 749)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "Trashmaster" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 99)
				stats.set_int(MPX .. "ARENAWARS_AP", 999)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "HVY Barracks Semi" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 199)
				stats.set_int(MPX .. "ARENAWARS_AP", 2039)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "HVY Mixer" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 299)
				stats.set_int(MPX .. "ARENAWARS_AP", 3039)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "Space Docker" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 499)
				stats.set_int(MPX .. "ARENAWARS_AP", 4999)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif ArenaWarVehicles[AreWarVeh] == "Tractor" then
				stats.set_int(MPX .. "ARENAWARS_AP_TIER", 999)
				stats.set_int(MPX .. "ARENAWARS_AP", 10029)
				sleep(2)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			end
			a61 = AreWarVeh
		end)

	ArenaWar:add_action("Suicide", function() menu.suicide_player() end)

	ArenaWar:add_action("", null)

	ArenaWarNote = ArenaWar:add_submenu("Read Me")
	
	ArenaWarNote:add_action("                     Unlock Vehicle:", null)
	ArenaWarNote:add_action("       First, make the following settings:", null)
	ArenaWarNote:add_action("Join Next Mode from Spectator Box: Open", null)
	ArenaWarNote:add_action("                Allow Spectators: On", null)
	ArenaWarNote:add_action("                 Matchmaking: Open", null)
	ArenaWarNote:add_action("    select the vehicle you want to unlock;", null)
	ArenaWarNote:add_action("                        Navigate to:", null)
	ArenaWarNote:add_action("    Online -> Jobs -> Rockstar Created ->", null)
	ArenaWarNote:add_action("        -> Arena War -> Start Wreck It I", null)
	ArenaWarNote:add_action("       if you receive an Alert, press Enter;", null)
	ArenaWarNote:add_action("    wait for the carnage to begin, suicide", null)
	ArenaWarNote:add_action("     and spin the wheel until you get AP;", null)
	ArenaWarNote:add_action("   if you've used Arena War awards unlock", null)
	ArenaWarNote:add_action(" before, all unlocks will be temporary only", null)

--Bunker--

	BunkerUnlocks = FacilitiesUnlocks:add_submenu("Bunker")

	BunkerUnlocks:add_action("Unlock All (Temporarily)",
		function()
			for i = 0, 63 do
				for j = 0, 2 do
					stats.set_bool_masked(MPX .. "DLCGUNPSTAT_BOOL" .. j, true, i, MPX)
				end
				for j = 0, 5 do
					stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL" .. j, true, i, MPX)
				end
			end
		end)

	PBunkerUnlocks = BunkerUnlocks:add_submenu("Unlock All (Permanently)")

			a63 = false
		local function ResUnlocker(Enabled)
			if Enabled then
				globals.set_int(FMG + 21475, 1)
				globals.set_int(FMG + 21727, 1)
				globals.set_int(FMG + 21728, 1)
				globals.set_int(FMG + 21729, 1)
				globals.set_int(FMG + 21731, 0)
				globals.set_int(FMG + 21732, 0)
				menu.trigger_bunker_research()
			else
				globals.set_int(FMG + 21475, 60)
				globals.set_int(FMG + 21727, 300000)
				globals.set_int(FMG + 21728, 45000)
				globals.set_int(FMG + 21729, 45000)
				globals.set_int(FMG + 21731, 2)
				globals.set_int(FMG + 21732, 1)
			end
			while a63 do
				globals.set_int(2764608, 121)
				sleep(11)
			end
		end
	PBunkerUnlocks:add_toggle("Unlock All", function() return a63 end, function() a63 = not a63 ResUnlocker(a63) end)

	PBunkerUnlocks:add_action("", null)

	PBunkerUnlocksNote = PBunkerUnlocks:add_submenu("Read Me")

	PBunkerUnlocksNote:add_action("         Set staff equally, activate and", null)
	PBunkerUnlocksNote:add_action(" then all researches will unlock one by one", null)

--LS Car Meet--

	LSCarMeet = FacilitiesUnlocks:add_submenu("LS Car Meet")

	LSCarMeet:add_action("Unlock All",
		function()
			for i = FMG + 31835, FMG + 31862 do
				globals.set_float(i, 100000)
			end
		end)

	LSCarMeet:add_action("Unlock Trade Prices for Headlights",
		function()
			for i = 18, 29 do
				stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, i)
			end
		end)

	LSCarMeet:add_action("Unlock Podium Prize",
		function()
			stats.set_bool(MPX .. "CARMEET_PV_CHLLGE_CMPLT", true)
			stats.set_bool(MPX .. "CARMEET_PV_CLMED", false)
		end)

	LSCarMeet:add_action("", null)

	LSCarMeetNote = LSCarMeet:add_submenu("Read Me")

	LSCarMeetNote:add_action("                         Unlock All:", null)
	LSCarMeetNote:add_action("      Buy a membership, activate, sit in", null)
	LSCarMeetNote:add_action("          a test car and go to the track;", null)
	LSCarMeetNote:add_action("      if your level is not 1, then activate", null)
	LSCarMeetNote:add_action("    and buy something in the LSCM store;", null)
	LSCarMeetNote:add_action("   if you've used LS Tuners awards unlock", null)
	LSCarMeetNote:add_action(" before, all unlocks will be temporary only", null)

--LS Customs--

	LSCustoms = FacilitiesUnlocks:add_submenu("LS Customs")

	LSCustoms:add_action("Unlock All",
		function()
			for i = 1, 7 do
				stats.set_int(MPX .. "CHAR_FM_CARMOD_" .. i .. "_UNLCK", -1)
			end
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
			stats.set_int(MPX .. "AWD_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
			stats.set_int(MPX .. "TOTAL_RACES_WON", 50)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
			stats.set_int(MPX .. "RACES_WON", 50)
			stats.set_int(MPX .. "USJS_COMPLETED", 50)
			stats.set_int(MPX .. "USJS_FOUND", 50)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
		end)

	LSCustoms:add_action("Unlock Hidden Liveries",
		function()
			stats.set_int("MPPLY_XMASLIVERIES", -1)
			for i = 1, 20 do
				stats.set_int("MPPLY_XMASLIVERIES" .. i, -1)
			end
		end)

	LSCustoms:add_action("Unlock Taxi Liveries",
		function()
			stats.set_int(MPX .. "AWD_TAXIDRIVER", 50)
			stats.set_masked_int(MPX .. "DLC22022PSTAT_INT536", 10, 16, 8)
		end)

--Custom Modifications--

	CustomModifications = LSCustoms:add_submenu("Custom Modifications")

	CustomWheels = CustomModifications:add_submenu("Custom Wheels")

			F1Mode = false
			OldF1Hash = 0
	CustomWheels:add_toggle("F1 Wheels",
		function()
			return F1Mode
		end,
		function()
			F1Mode = not F1Mode
			if F1Mode then
				if localplayer ~= nil and localplayer:is_in_vehicle() then
					OldF1Hash = localplayer:get_current_vehicle():get_model_hash()
					localplayer:get_current_vehicle():set_model_hash(1492612435)
				end
			else
				if localplayer ~= nil and localplayer:is_in_vehicle() then
					localplayer:get_current_vehicle():set_model_hash(OldF1Hash)
				end
			end
		end)

			BennysMode = false
			OldBennysHash = 0
	CustomWheels:add_toggle("Benny's Wheels",
		function()
			return BennysMode
		end,
		function()
			BennysMode = not BennysMode
			if BennysMode then
				if localplayer ~= nil and localplayer:is_in_vehicle() then
					OldBennysHash = localplayer:get_current_vehicle():get_model_hash()
					localplayer:get_current_vehicle():set_model_hash(196747873)
				end
			else
				if localplayer ~= nil and localplayer:is_in_vehicle() then
					localplayer:get_current_vehicle():set_model_hash(OldBennysHash)
				end
			end
		end)

	CustomWheels:add_action("", null)

	CustomWheelsNote = CustomWheels:add_submenu("Read Me")

	CustomWheelsNote:add_action("    Enable which feature you want to use", null)
	CustomWheelsNote:add_action(" when you're in CEO Office Mod Shop and", null)
	CustomWheelsNote:add_action("      disable after purchasing the wheels", null)

	CustomPlate = CustomModifications:add_submenu("Custom Plate")

			PlateChar = {".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
						 "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

			DefNum21 = PlateChar[1]
			DefNum21Cur = 1
	CustomPlate:add_array_item("Symbol #1", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum21Cur
			end
		end,
		function(NewNum21)
			DefNum21 = PlateChar[NewNum21]
			DefNum21Cur = NewNum21
		end)

			DefNum22 = PlateChar[1]
			DefNum22Cur = 1
	CustomPlate:add_array_item("Symbol #2", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum22Cur
			end
		end,
		function(NewNum22)
			DefNum22 = PlateChar[NewNum22]
			DefNum22Cur = NewNum22
		end)

			DefNum23 = PlateChar[1]
			DefNum23Cur = 1
	CustomPlate:add_array_item("Symbol #3", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle()
				then return DefNum23Cur
			end
		end,
		function(NewNum23)
			DefNum23 = PlateChar[NewNum23]
			DefNum23Cur = NewNum23
		end)

			DefNum24 = PlateChar[1]
			DefNum24Cur = 1
	CustomPlate:add_array_item("Symbol #4", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum24Cur
			end
		end,
		function(NewNum24)
			DefNum24 = PlateChar[NewNum24]
			DefNum24Cur = NewNum24
		end)

			DefNum25 = PlateChar[1]
			DefNum25Cur = 1
	CustomPlate:add_array_item("Symbol #5", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum25Cur
			end
		end,
		function(NewNum25)
			DefNum25 = PlateChar[NewNum25]
			DefNum25Cur = NewNum25
		end)

			DefNum26 = PlateChar[1]
			DefNum26Cur = 1
	CustomPlate:add_array_item("Symbol #6", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum26Cur
			end
		end,
		function(NewNum26)
			DefNum26 = PlateChar[NewNum26]
			DefNum26Cur = NewNum26
		end)

			DefNum27 = PlateChar[1]
			DefNum27Cur = 1
	CustomPlate:add_array_item("Symbol #7", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum27Cur
			end
		end,
		function(NewNum27)
			DefNum27 = PlateChar[NewNum27]
			DefNum27Cur = NewNum27
		end)

			DefNum28 = PlateChar[1]
			DefNum28Cur = 1
	CustomPlate:add_array_item("Symbol #8", PlateChar,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				return DefNum28Cur
			end
		end,
		function(NewNum28)
			DefNum28 = PlateChar[NewNum28]
			DefNum28Cur = NewNum28
		end)

	local function CheckPlate(IfSpace)
			if IfSpace == "." then
				return " "
			else
				return IfSpace
			end
		end

	CustomPlate:add_bare_item("",
		function()
			return "Apply Plate: " .. CheckPlate(DefNum21) .. CheckPlate(DefNum22) .. CheckPlate(DefNum23) .. CheckPlate(DefNum24) .. CheckPlate(DefNum25) .. CheckPlate(DefNum26) .. CheckPlate(DefNum27) .. CheckPlate(DefNum28)
		end,
		function()
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_number_plate_text(DefNum21 .. DefNum22 .. DefNum23 .. DefNum24 .. DefNum25 .. DefNum26 .. DefNum27 .. DefNum28)
			end
			if b3 == true then
				sleep(1)
				DefNum21Cur = 1
				DefNum22Cur = 1
				DefNum23Cur = 1
				DefNum24Cur = 1
				DefNum25Cur = 1
				DefNum26Cur = 1
				DefNum27Cur = 1
				DefNum28Cur = 1
				DefNum21 = PlateChar[1]
				DefNum22 = PlateChar[1]
				DefNum23 = PlateChar[1]
				DefNum24 = PlateChar[1]
				DefNum25 = PlateChar[1]
				DefNum26 = PlateChar[1]
				DefNum27 = PlateChar[1]
				DefNum28 = PlateChar[1]
			end
		end, null, null)

			b3 = true
	CustomPlate:add_toggle("Reset Value", function() return b3 end, function() b3 = not b3 end)

	CustomPlate:add_action("", null)

	CustomPlateNote = CustomPlate:add_submenu("Read Me")

	CustomPlateNote:add_action("                        «.» = space;", null)
	CustomPlateNote:add_action("      Use in LSC and buy a plate to save", null)
	CustomPlateNote:add_action("", null)
	CustomPlateNote:add_action("                        Reset Value:", null)
	CustomPlateNote:add_action("    Resets «Apply Plate» value after using", null)

	LSCustoms:add_action("", null)

	LSCustomsNote = LSCustoms:add_submenu("Read Me")

	LSCustomsNote:add_action("         Some colors may not be saved", null)

--Misc--

	Misc = UnlockTool:add_submenu("Misc (Safe)")

			a74 = 1
	Misc:add_array_item("Bad Sport Label", {"Select", "Add", "Remove"},
		function()
			return a74
		end,
		function(BadSpo)
			if BadSpo == 1 then
				a74 = 1
			elseif BadSpo == 2 then
				stats.set_int("MPPLY_BADSPORT_MESSAGE", -1)
				stats.set_int("MPPLY_BECAME_BADSPORT_NUM", -1)
				stats.set_float("MPPLY_OVERALL_BADSPORT", 60000)
				stats.set_bool("MPPLY_CHAR_IS_BADSPORT", true)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			elseif BadSpo == 3 then
				stats.set_int("MPPLY_BADSPORT_MESSAGE", 0)
				stats.set_int("MPPLY_BECAME_BADSPORT_NUM", 0)
				stats.set_float("MPPLY_OVERALL_BADSPORT", 0)
				stats.set_bool("MPPLY_CHAR_IS_BADSPORT", false)
				globals.set_int(1575020, 8)
				globals.set_int(1574589, 1)
				sleep(3)
				globals.set_int(1574589, 0)
			end
			a74 = BadSpo
		end)

			a66 = false
		local function SilentNSneaky(Enabled)
			PlayerID = localplayer:get_player_id()
			HideMe = 1853988 + 1 + (PlayerID * 867) + 205
			if Enabled then
				globals.set_int(HideMe, 8)
			else
				globals.set_int(HideMe, 9)
			end
		end
	Misc:add_toggle("Hide Me", function() return a66 end, function() a66 = not a66 SilentNSneaky(a66) end)

	GunVan = Misc:add_submenu("Modify Gun Van Weapons")

			b1 = 1
	GunVan:add_array_item("Possible Locations", {"Select", "Paleto Bay", "Grapeseed Store", "Sandy Shores", "Grand Senora #1", "Grand Senora #2", "Vinewood Sign",
										   "Chumash", "Paleto Forest", "Zancudo River", "Power Station", "Lago Zancudo", "El Burro Heights", "Murrieta Heights", "Elysian Island",
										   "Tataviam Mountains", "La Mesa #1", "La Mesa #2", "Del Perro", "Dock Terminal", "La Puerta", "Vespucci Beach", "West Vinewood", "Downtown Vinewood", "Pillbox Hill",
										   "Little Seoul", "Alamo Sea", "Hookies", "Truck Terminal", "Mirror Park", "Davis"},
	function()
		return b1
	end,
	function(PosLoc)
		if PosLoc == 1 then
			b1 = 1
		elseif PosLoc == 2 then
			TP(-29.532, 6435.136, 31.162, 0, 0, 0)
		elseif PosLoc == 3 then
			TP(1705.214, 4819.167, 41.75, 0, 0, 0)
		elseif PosLoc == 4 then
			TP(1795.522, 3899.753, 33.869, 0, 0, 0)
		elseif PosLoc == 5 then
			TP(1335.536, 2758.746, 51.099, 0, 0, 0)
		elseif PosLoc == 6 then
			TP(2340.418, 3054.188, 47.888, 0, 0, 0)
		elseif PosLoc == 7 then
			TP(795.583, 1210.78, 338.962, 0, 0, 0)
		elseif PosLoc == 8 then
			TP(-3192.67, 1077.205, 20.594, 0, 0, 0)
		elseif PosLoc == 9 then
			TP(-789.719, 5400.921, 33.915, 0, 0, 0)
		elseif PosLoc == 10 then
			TP(-24.384, 3048.167, 40.703, 0, 0, 0)
		elseif PosLoc == 11 then
			TP(2666.786, 1469.324, 24.237, 0, 0, 0)
		elseif PosLoc == 12 then
			TP(-1454.966, 2667.503, 3.2, 0, 0, 0)
		elseif PosLoc == 13 then
			TP(1509.183, -2146.795, 76.853, 0, 0, 0)
		elseif PosLoc == 14 then
			TP(1137.404, -1358.654, 34.322, 0, 0, 0)
		elseif PosLoc == 15 then
			TP(-57.208, -2658.793, 5.737, 0, 0, 0)
		elseif PosLoc == 16 then
			TP(1905.017, 565.222, 175.558, 0, 0, 0)
		elseif PosLoc == 17 then
			TP(974.484, -1718.798, 30.296, 0, 0, 0)
		elseif PosLoc == 18 then
			TP(733.99, -736.803, 26.165, 0, 0, 0)
		elseif PosLoc == 19 then
			TP(-1694.632, -454.082, 40.712, 0, 0, 0)
		elseif PosLoc == 20 then
			TP(779.077, -3266.297, 5.719, 0, 0, 0)
		elseif PosLoc == 21 then
			TP(-587.728, -1637.208, 19.611, 0, 0, 0)
		elseif PosLoc == 22 then
			TP(-1330.726, -1163.948, 4.313, 0, 0, 0)
		elseif PosLoc == 23 then
			TP(-496.618, 40.231, 52.316, 0, 0, 0)
		elseif PosLoc == 24 then
			TP(275.527, 66.509, 94.108, 0, 0, 0)
		elseif PosLoc == 25 then
			TP(260.928, -763.35, 30.559, 0, 0, 0)
		elseif PosLoc == 26 then
			TP(-478.025, -741.45, 30.299, 0, 0, 0)
		elseif PosLoc == 27 then
			TP(894.94, 3603.911, 32.56, 0, 0, 0)
		elseif PosLoc == 28 then
			TP(-2166.511, 4289.503, 48.733, 0, 0, 0)
		elseif PosLoc == 29 then
			TP(1465.633,  6553.67, 13.771, 0, 0, 0)
		elseif PosLoc == 30 then
			TP(1101.032, -335.172, 66.944, 0, 0, 0)
		elseif PosLoc == 31 then
			TP(149.683, -1655.674, 29.028, 0, 0, 0)
		end
		b1 = PosLoc
	end)

			weapons_hash = {
				-656458692, -- 1
				-1786099057, -- 2
				-853065399, -- 3
				-102323637, -- 4
				-2067956739, -- 5
				-1834847097, -- 6
				-1951375401, -- 7
				1317494643, -- 8
				-102973651, -- 9
				-1716189206, -- 10
				-581044007, -- 11
				1737195953, -- 12
				-1810795771, -- 13
				-538741184, -- 14
				419712736, -- 15
				584646201, -- 16
				727643628, -- 17
				1593441988, -- 18
				-1746263880, -- 19
				1198879012, -- 20
				1470379660, -- 21
				-771403250, -- 22
				-598887786, -- 23
				-1853920116, -- 24
				453432689, -- 25
				-1075685676, -- 26
				-1716589765, -- 27
				-1355376991, -- 28
				-1045183535, -- 29
				-879347409, -- 30
				-1076751822, -- 31
				-2009644972, -- 32
				137902532, -- 33
				1171102963, -- 34
				-270015777, -- 35
				171789620, -- 36
				-619010992, -- 37
				324215364, -- 38
				-1121678507, -- 39
				736523883, -- 40
				2024373456, -- 41
				350597077, -- 42
				-1357824103, -- 43
				-1074790547, -- 44
				961495388, -- 45
				2132975508, -- 46
				-2066285827, -- 47
				-2084633992, -- 48
				-86904375, -- 49
				1649403952, -- 50
				-947031628, -- 51
				-1658906650, -- 52
				-1063057011, -- 53
				-1768145561, -- 54
				-774507221, -- 55
				-494615257, -- 56
				317205821, -- 57
				-1654528753, -- 58
				94989220, -- 59
				-275439685, -- 60
				984333226, -- 61
				487013001, -- 62
				1432025498, -- 63
				2017895192, -- 64
				-1466123874, -- 65
				2144741730, -- 66
				-608341376, -- 67
				1627465347, -- 68
				-1660422300, -- 69
				1198256469, -- 70
				205991906, -- 71
				177293209, -- 72
				-952879014, -- 73
				1785463520, -- 74
				1853742572, -- 75
				100416529, -- 76
				125959754, -- 77
				-618237638, -- 78
				2138347493, -- 79
				-1568386805, -- 80
				1672152130, -- 81
				1119849093, -- 82
				-22923932, -- 83
				-1238556825, -- 84
				-1312131151, -- 85
				-1813897027, -- 86
				615608432, -- 87
				-1169823560, -- 88
				-1420407917, -- 89
				-37975472, -- 90
				741814745, -- 91
				883325847 -- 92
			}
			weapons_name = {
				"Knuckle Duster", -- 1
				"Baseball Bat", -- 2
				"Battle Axe", -- 3
				"Bottle", -- 4
				"Crowbar", -- 5
				"Antique Cavalry Dagger", -- 6
				"Flashlight", -- 7
				"Hammer", -- 8
				"Hatchet", -- 9
				"Knife", -- 10
				"Machete", -- 11
				"Nightstick", -- 12
				"Pool Cue", -- 13
				"Switchblade", -- 14
				"Pipe Wrench", -- 15
				"AP Pistol", -- 16
				"Ceramic Pistol", -- 17
				"Combat Pistol", -- 18
				"Double Action Revolver", -- 19
				"Flare Gun", -- 20
				"Perico Pistol", -- 21
				"Heavy Pistol", -- 22
				"Marksman Pistol", -- 23
				"Navy Revolver", -- 24
				"Pistol", -- 25
				"Pistol Mk II", -- 26
				"Pistol .50", -- 27
				"Up-n-Atomizer", -- 28
				"Heavy Revolver", -- 29
				"Heavy Revolver Mk II", -- 30
				"SNS Pistol", -- 31
				"SNS Pistol Mk II", -- 32
				"Vintage Pistol", -- 33
				"Stun Gun", -- 34
				"Assault SMG", -- 35
				"Combat PDW", -- 36
				"Machine Pistol", -- 37
				"Micro SMG", -- 38
				"Mini SMG", -- 39
				"SMG", -- 40
				"SMG Mk II", -- 41
				"Tactical SMG", -- 42
				"Advanced Rifle", -- 43
				"Assault Rifle", -- 44
				"Assault Rifle Mk II", -- 45
				"Bullpup Rifle", -- 46
				"Bullpup Rifle Mk II", -- 47
				"Carbine Rifle", -- 48
				"Carbine Rifle Mk II", -- 49
				"Compact Rifle", -- 50
				"Heavy Rifle", -- 51
				"Military Rifle", -- 52
				"Special Carbine", -- 53
				"Special Carbine Mk II", -- 54
				"Service Carbine", -- 55
				"Assault Shotgun", -- 56
				"Sweeper Shotgun", -- 57
				"Bullpup Shotgun", -- 58
				"Combat Shotgun", -- 59
				"Double Barrel Shotgun", -- 60
				"Heavy Shotgun", -- 61
				"Pump Shotgun", -- 62
				"Pump Shotgun Mk II", -- 63
				"Sawed-Off Shotgun", -- 64
				"Musket", -- 65
				"Combat MG", -- 66
				"Combat MG Mk II", -- 67
				"Gusenberg Sweeper", -- 68
				"MG", -- 69
				"Unholy Hellbringer", -- 70
				"Heavy Sniper", -- 71
				"Heavy Sniper Mk II", -- 72
				"Marksman Rifle", -- 73
				"Marksman Rifle Mk II", -- 74
				"Precision Rifle", -- 75
				"Sniper Rifle", -- 76
				"Compact Grenade Launcher", -- 77
				"Compact EMP Launcher", -- 78
				"Firework Launcher", -- 79
				"Grenade Launcher", -- 80
				"Homing Launcher", -- 81
				"Minigun", -- 82
				"Railgun", -- 83
				"Widowmaker", -- 84
				"RPG", -- 85
				"Grenade", -- 86
				"Molotov", -- 87
				"Pipe Bomb", -- 88
				"Proximity Mine", -- 89
				"Tear Gas", -- 90
				"Sticky Bomb", -- 91
				"Jerry Can", -- 92
			}

	GunVanWeapons = GunVan:add_submenu("Weapons")

	WSlot1 = GunVanWeapons:add_submenu("1-slot")
		for i = 1, 85 do
			WSlot1:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 1) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 1, weapons_hash[i])
				end)
		end

	WSlot2 = GunVanWeapons:add_submenu("2-slot")
		for i = 1, 85 do
			WSlot2:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 2) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 2, weapons_hash[i])
				end)
		end

	WSlot3 = GunVanWeapons:add_submenu("3-slot")
		for i = 1, 85 do
			WSlot3:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 3) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 3, weapons_hash[i])
				end)
		end

	WSlot4 = GunVanWeapons:add_submenu("4-slot")
		for i = 1, 85 do
			WSlot4:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 4) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 4, weapons_hash[i])
				end)
		end

	WSlot5 = GunVanWeapons:add_submenu("5-slot")
		for i = 1, 85 do
			WSlot5:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 5) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 5, weapons_hash[i])
				end)
		end

	WSlot6 = GunVanWeapons:add_submenu("6-slot")
		for i = 1, 85 do
			WSlot6:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 6) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 6, weapons_hash[i])
				end)
		end

	WSlot7 = GunVanWeapons:add_submenu("7-slot")
		for i = 1, 85 do
			WSlot7:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 7) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 7, weapons_hash[i])
				end)
		end

	WSlot8 = GunVanWeapons:add_submenu("8-slot")
		for i = 1, 85 do
			WSlot8:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 8) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 8, weapons_hash[i])
				end)
		end

	WSlot9 = GunVanWeapons:add_submenu("9-slot")
		for i = 1, 85 do
			WSlot9:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34094 + 9) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(262145 + 34131, 0)
					globals.set_int(FMG + 34094 + 9, weapons_hash[i])
				end)
		end

	GunVanThorwables = GunVan:add_submenu("Throwables")

	TSlot1 = GunVanThorwables:add_submenu("1-slot")
		for i = 86, 92 do
			TSlot1:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34116 + 1) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(FMG + 34116 + 1, weapons_hash[i])
				end)
		end

	TSlot2 = GunVanThorwables:add_submenu("2-slot")
		for i = 86, 92 do
			TSlot2:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34116 + 2) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(FMG + 34116 + 2, weapons_hash[i])
				end)
		end

	TSlot3 = GunVanThorwables:add_submenu("3-slot")
		for i = 86, 92 do
			TSlot3:add_toggle(weapons_name[i],
				function()
					if weapons_hash[i] == globals.get_int(FMG + 34116 + 3) then
						return true
					else
						return false
					end
				end,
				function()
					globals.set_int(FMG + 34116 + 3, weapons_hash[i])
				end)
		end

			a99 = false
		local function Discounts(Enabled)
			if Enabled then
				for i = 1, 9 do
					globals.set_int(FMG + 34105 + i, 1036831744)
				end
				for i = 1, 3 do
					globals.set_int(FMG + 34120 + i, 1036831744)
				end
				for i = 1, 5 do
					globals.set_int(FMG + 34124 + i, 1036831744)
				end
			else
				for i = 1, 9 do
					globals.set_int(FMG + 34105 + i, 0)
				end
				for i = 1, 3 do
					globals.set_int(FMG + 34120 + i, 0)
				end
				for i = 1, 5 do
					globals.set_int(FMG + 34124 + i, 0)
				end
			end
		end
	GunVan:add_toggle("Jewish Trade Skills (-10%)", function() return a99 end, function() a99 = not a99 Discounts(a99) end)

	Misc:add_action("Unlock All Tattoos",
		function()
			stats.set_int(MPX .. "TATTOO_FM_CURRENT_32", -1)
			for i = 0, 47 do
				stats.set_int(MPX .. "TATTOO_FM_UNLOCKS_" .. i, -1)
			end
		end)

	Misc:add_action("Unlock Flight School Gold Medals",
		function()
			stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
			for i = 0, 9 do
				stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i , -1)
				stats.set_int(MPX .. "PILOT_SCHOOL_MEDAL_" .. i, -1)
				stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_" .. i, true)
			end
		end)

	Misc:add_action("Unlock Shooting Range Rewards",
		function()
			stats.set_int(MPX .. "SR_HIGHSCORE_1", 690)
			stats.set_int(MPX .. "SR_HIGHSCORE_2", 1860)
			stats.set_int(MPX .. "SR_HIGHSCORE_3", 2690)
			stats.set_int(MPX .. "SR_HIGHSCORE_4", 2660)
			stats.set_int(MPX .. "SR_HIGHSCORE_5", 2650)
			stats.set_int(MPX .. "SR_HIGHSCORE_6", 450)
			stats.set_int(MPX .. "SR_TARGETS_HIT", 269)
			stats.set_int(MPX .. "SR_WEAPON_BIT_SET", -1)
			stats.set_bool(MPX .. "SR_TIER_1_REWARD", true)
			stats.set_bool(MPX .. "SR_TIER_3_REWARD", true)
			stats.set_bool(MPX .. "SR_INCREASE_THROW_CAP", true)
		end)

	Misc:add_action("", null)

	MiscNote = Misc:add_submenu("Read Me")

	MiscNote:add_action("                          Hide Me:", null)
	MiscNote:add_action("            Hides you from player list;", null)
	MiscNote:add_action("    also removes your blip from the map", null)

--Credits--

	Credits = SilentNight:add_submenu("♥ Credits")

	Credits:add_action("Developer: Silent", null)
	Credits:add_action("Helpers #1: Mr. Robot, Big Smoke, gaymer", null)
	Credits:add_action("Helpers #2: Killa`B, Slon, L7NEG", null)
	Credits:add_action("Helpers #3: Professor, Zeiger", null)
	Credits:add_action("Helpers #4: Amnesia, Pewpew", null)
	Credits:add_action("", null)
	Credits:add_action("Discord: silentsalo", null)

--Developer: Silent--
