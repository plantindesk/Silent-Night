---[[ Developer: Silent, Last Changes: April 16 2024 ]]---

--Game Version & Submenu Start--

require_game_build(3179) -- GTA Online v1.68 (build 3179)

SilentNight = menu.add_submenu("ツ Silent Night | v1.68")

--Required Functions--

	local function MPX()
		return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
	end

	local function PlayerID()
		return globals.get_int(2672761)
		--return localplayer:get_player_id()
	end

	local function TP(x, y, z, yaw, roll, pitch)
		if localplayer ~= nil then
			localplayer:set_position(x, y, z)
			localplayer:set_rotation(yaw, roll, pitch)
		end
	end

	local function SessionChanger(session)
		globals.set_int(CSg1, session)
		if session == -1 then
			globals.set_int(CSg3, -1)
		end
		sleep(0.5)
		globals.set_int(CSg2, 1)
		sleep(0.5)
		globals.set_int(CSg2, 0)
	end

	local function MoneyFormatter(n)
		n = tostring(n)
		return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
	end

		stat_ranges = {
			{stat = "PSTAT_BOOL", start = 0, finish = 191},
			{stat = "???", start = 192, finish = 512},
			{stat = "MP_PSTAT_BOOL", start = 513, finish = 704},
			{stat = "???", start = 705, finish = 2918},
			{stat = "MP_TUPSTAT_BOOL", start = 2919, finish = 3110},
			{stat = "TUPSTAT_BOOL", start = 3111, finish = 3878},
			{stat = "???", start = 3879, finish = 4206},
			{stat = "NGPSTAT_BOOL", start = 4207, finish = 4334},
			{stat = "MP_NGPSTAT_BOOL", start = 4335, finish = 4398},
			{stat = "???", start = 4399, finish = 6028},
			{stat = "NGTATPSTAT_BOOL", start = 6029, finish = 6412},
			{stat = "???", start = 6413, finish = 7320},
			{stat = "MP_NGDLCPSTAT_BOOL", start = 7321, finish = 7384},
			{stat = "NGDLCPSTAT_BOOL", start = 7385, finish = 7640},
			{stat = "???", start = 7641, finish = 9360},
			{stat = "DLCBIKEPSTAT_BOOL", start = 9361, finish = 9552},
			{stat = "???", start = 9553, finish = 15368},
			{stat = "DLCGUNPSTAT_BOOL", start = 15369, finish = 15560},
			{stat = "???", start = 15561, finish = 15561},
			{stat = "GUNTATPSTAT_BOOL", start = 15562, finish = 15945},
			{stat = "DLCSMUGCHARPSTAT_BOOL", start = 15946, finish = 16009},
			{stat = "???", start = 16010, finish = 18097},
			{stat = "GANGOPSPSTAT_BOOL", start = 18098, finish = 18161},
			{stat = "???", start = 18162, finish = 22065},
			{stat = "BUSINESSBATPSTAT_BOOL", start = 22066, finish = 22193},
			{stat = "???", start = 22194, finish = 24961},
			{stat = "ARENAWARSPSTAT_BOOL", start = 24962, finish = 25537},
			{stat = "???", start = 25538, finish = 26809},
			{stat = "CASINOPSTAT_BOOL", start = 26810, finish = 27257},
			{stat = "???", start = 27256, finish = 28097},
			{stat = "CASINOHSTPSTAT_BOOL", start = 28098, finish = 28353},
			{stat = "???", start = 28354, finish = 28354},
			{stat = "HEIST3TATTOOSTAT_BOOL", start = 28355, finish = 28482},
			{stat = "???", start = 28483, finish = 30226},
			{stat = "SU20PSTAT_BOOL", start = 30227, finish = 30354},
			{stat = "SU20TATTOOSTAT_BOOL", start = 30355, finish = 30482},
			{stat = "???", start = 30483, finish = 30514},
			{stat = "HISLANDPSTAT_BOOL", start = 30515, finish = 30706},
			{stat = "???", start = 30707, finish = 31706},
			{stat = "TUNERPSTAT_BOOL", start = 31707, finish = 32282},
			{stat = "FIXERPSTAT_BOOL", start = 32283, finish = 32410},
			{stat = "FIXERTATTOOSTAT_BOOL", start = 32411, finish = 32474},
			{stat = "???", start = 32475, finish = 34122},
			{stat = "GEN9PSTAT_BOOL", start = 34123, finish = 34250},
			{stat = "DLC12022PSTAT_BOOL", start = 34251, finish = 34762},
			{stat = "???", start = 34763, finish = 36626},
			{stat = "DLC22022PSTAT_BOOL", start = 36627, finish = 36946},
			{stat = "???", start = 36947, finish = 41250},
			{stat = "DLC22022TATTOOSTAT_BOOL", start = 41251, finish = 41314},
			{stat = "DLC12023PSTAT_BOOL", start = 41315, finish = 42082},
			{stat = "???", start = 42083, finish = 42106},
			{stat = "DLC22023PSTAT_BOOL", start = 42107, finish = 42298},
			{stat = "???", start = 42299, finish = 51058},
			{stat = "DLC22023TATTOOSTAT_BOOL", start = 51059, finish = 51186}
		}
	local function StatInfoGetter(packed_bool)
		for _, info in ipairs(stat_ranges) do
			if packed_bool >= info.start and packed_bool <= info.finish then
				return info
			end
		end
	end
	local function stats_set_packed_bool(packed_bool, bool)
		local stat_info = StatInfoGetter(packed_bool)
		local stat = stat_info.stat
		if stat ~= "???" then
			local bool_start = stat_info.start
			local bool_finish = stat_info.finish
			local temp_bool = bool_start
			local index = 0
			local bit = nil
			for i = bool_start, bool_finish do
				for j = 0, 63 do
					if temp_bool + j == packed_bool then
						bit = j
						break
					end
				end
				if bit ~= nil then
					break
				end
				temp_bool = temp_bool + 64
				index = index + 1
			end
			stats.set_bool_masked(MPX() .. stat .. index, bool, bit)
		end
	end
	local function stats_set_packed_bools(packed_bool_start, packed_bool_finish, bool)
		for i = packed_bool_start, packed_bool_finish do
			stats_set_packed_bool(i, bool)
		end
	end

	local function globals_set_ints(global_start, global_finish, step, value)
		for i = global_start, global_finish, step do
			globals.set_int(i, value)
		end
	end
	local function globals_set_bools(global_start, global_finish, step, bool)
		for i = global_start, global_finish, step do
			globals.set_bool(i, bool)
		end
	end

	local function null() end

--Required Scripts--

		ASS = script("appsecuroserv")
		GCS = script("gb_contraband_sell")
		GCB = script("gb_contraband_buy")
		AMW = script("am_mp_warehouse")
		GB = script("gb_gunrunning")
		FMC = script("fm_mission_controller")
		FMC20 = script("fm_mission_controller_2020")
		HIP = script("heist_island_planning")
		AMN = script("am_mp_nightclub")
		CLW = script("casino_lucky_wheel")
		BJ = script("blackjack")
		CR = script("casinoroulette")
		CS = script("casino_slots")
		TCP = script("three_card_poker")
		GS = script("gb_smuggler")

--Globals & Locals & Variables--

		FMg = 262145 -- free mode global ("CASH_MULTIPLIER")
		XMg = FMg + 1 -- xp multiplier global ("XP_MULTIPLIER")
		FMCSHl = 3234 -- fm_mission_controller script host local ("MP_Reduce_Score_For_Emitters_Scene")
		FMC20SHl = 18943 -- fm_mission_controller_2020 script host local (flag = NETWORK::NETWORK_IS_HOST_OF_THIS_SCRIPT())
		APg = FMg + 32071 -- agency payout global ("FIXER_FINALE_LEADER_CASH_REWARD")
		AIFl1 = 38397 -- agency instant finish local 1 (outdated)
		AIFl2 = 39772 -- agency instant finish local 2 (outdated)
		ACKg = FMg + 32022 -- agency cooldown killer global ("FIXER_STORY_COOLDOWN_POSIX")
		ASPg1 = FMg + 31323 + 1 -- auto shop payout global 1 ("TUNER_ROBBERY_LEADER_CASH_REWARD0")
		ASPg2 = FMg + 31323 + 8 -- auto shop payout global 2 ("TUNER_ROBBERY_LEADER_CASH_REWARD7")
		ASFg = FMg + 31319 -- auto shop fee global ("TUNER_ROBBERY_CONTACT_FEE")
		ASCKg = FMg + 31342 -- auto shop cooldown global ("TUNER_ROBBERY_COOLDOWN_TIME")
		ASIFl1 = 48513 + 1 -- auto shop instant finish local 1
		ASIFl2 = 48513 + 1765 + 1 -- auto shop finish local 2
		ACg1 = 1928233 + 1 + 1 -- global apartment player 1 cut global
		ACg2 = 1928233 + 1 + 2 -- global apartment player 2 cut global
		ACg3 = 1928233 + 1 + 3 -- global apartment player 3 cut global
		ACg4 = 1928233 + 1 + 4 -- global apartment player 4 cut global
		ACg5 = 1930201 + 3008 + 1 -- local apartment player 1 cut global
		AUAJg1 = FMg + 9237 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
		AUAJg2 = FMg + 9242 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
		AUAJg3 = FMg + 9249 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
		AUAJg4 = FMg + 9255 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
		AUAJg5 = FMg + 9261 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
		AIFl3 = 19728 -- apartment instant finish local 1
		AIFl4 = 28347 + 1 -- apartment instant finish local 2
		AIFl5 = 31603 + 69 -- apartment instant finish local 3
		AFHl = 11776 + 24 -- apartment fleeca hack local
		AFDl = 10067 + 11 -- apartment fleeca drill local
		CPRBl = 1544 -- cayo perico reset board local
		CPCg1 = 1970744 + 831 + 56 + 1 -- cayo perico player 1 cut global
		CPCg2 = 1970744 + 831 + 56 + 2 -- cayo perico player 2 cut global
		CPCg3 = 1970744 + 831 + 56 + 3 -- cayo perico player 3 cut global
		CPCg4 = 1970744 + 831 + 56 + 4 -- cayo perico player 4 cut global
		GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)
		CPBg = FMg + 30009 -- cayo perico bag global (1859395035)
		CPFHl = 24333 -- cayo perico fingerprint hack local
		CPPCCl = 30357 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds")
		CPSTCl = 29118 -- cayo perico drainage pipe cut local
		CPIFl1 = 48513 -- cayo perico instant finish local 1
		CPIFl2 = 48513 + 1765 + 1 -- cayo perico instant finish local 2
		DCCg1 = 1963945 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
		DCCg2 = 1963945 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
		DCCg3 = 1963945 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
		DCCg4 = 1963945 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
		DCAl = 10253 -- diamond casino autograbber local ("DLC_HEIST_MINIGAME_PAC_CASH_GRAB_SCENE")
		DCASl = 14 -- diamond casino autograbber speed local
		DCFHl = 52985 -- diamond casino fingerprint hack local
		DCKHl = 54047 -- diamond casino keypad hack local
		DCDVDl1 = 10107 + 7 -- diamond casino drill vault door local 1
		DCDVDl2 = 10107 + 37 -- diamond casino drill vault door local 2
		DCg1 = 1959865 + 812 + 50 + 1 -- doomsday player 1 cut global
		DCg2 = 1959865 + 812 + 50 + 2 -- doomsday player 2 cut global
		DCg3 = 1959865 + 812 + 50 + 3 -- doomsday player 3 cut global
		DCg4 = 1959865 + 812 + 50 + 4 -- doomsday player 4 cut global
		DDBHl = 1512 -- doomsday data breaches hack local (outdated)
		DDSHl = 1269 + 135 -- doomsday doomsday scenario hack local
		DIFl1 = 19728 + 12 -- doomsday instant finish local 1
		DIFl2 = 19728 + 2686 -- doomsday instant finish local 2
		DIFl3 = 28347 + 1 -- doomsday instant finish local 3
		DIFl4 = 31603 + 69 -- doomsday instant finish local 4
		SYRTg = FMg + 34080 -- salvage yard robbery type global ("SALV23_VEHICLE_ROBBERY_0")
		SYCKg = FMg + 34084 -- salvage yard can keep global ("SALV23_VEHICLE_ROBBERY_CAN_KEEP_0")
		SYVTg = FMg + 34088 -- salvage yard vehicle type global 1 ("SALV23_VEHICLE_ROBBERY_ID_0")
		SYVVg = FMg + 34092 -- salvage yard vehicle value global ("SALV23_VEHICLE_ROBBERY_VALUE_0")
		SYWCg = FMg + 34108 -- salvage yard weekly cooldown global (488207018)
		SYCg1 = FMg + 34118 --  salvage yard cooldown global ("SALV23_VEH_ROB_COOLDOWN_TIME")
		SYCg2 = FMg + 34119 --  salvage yard cooldown global ("SALV23_CFR_COOLDOWN_TIME")
		SYCPg = FMg +  34129 -- salvage yard claim price global ("SALV23_VEHICLE_CLAIM_PRICE")
		SYCPDg = FMg + 34130 -- salvage yard claim price discount global ("SALV23_VEHICLE_CLAIM_PRICE_FORGERY_DISCOUNT")
		SYSMg = FMg + 34100 -- salvage yard salvage multiplier global ("SALV23_VEHICLE_SALVAGE_VALUE_MULTIPLIER")
		SYSPg = FMg + 36063 -- salvage yard setup price global (71522671)
		BCISl = 1983 -- bunker crash instant sell local
		CMACLg1 = FMg + 27237 -- casino master acquire chips limit global 1 ("VC_CASINO_CHIP_MAX_BUY")
		CMACLg2 = FMg + 27238 -- casino master acquire chips limit global 2 ("VC_CASINO_CHIP_MAX_BUY_PENTHOUSE")
		CMBJCl = 114 -- casino master bjackjack cards local
		CMBJDl = 846 -- casino master bjackjack decks local
		CMBJPTl = 1774 -- casino master bjackjack player's table local
		CMBJPTSl = 8 -- casino master bjackjack player's table size local
		CMGLPl1 = 278 + 14 -- casino master lucky wheel win state local
		CMGLPl2 = 278 + 45 -- casino master lucky wheel prize state local
		CMPTl = 747 -- casino master poker table local
		CMPTSl = 9 -- casino master poker table size local
		CMPCl = 114 -- casino master poker cards local
		CMPCDl = 168 -- casino master poker current deck local
		CMPACl = 1036 -- casino master poker anti cheat local
		CMPACDl = 799 -- casino master poker anti cheat deck local
		CMPDSl = 55 -- casino master poker deck size local
		CMRMTl = 122 -- casino master roulette master table local
		CMROTl = 1357 -- casino master roulette outcomes table local
		CMRBTl = 153 -- casino master roulette ball table local
		CMSRRTl = 1346 -- casino master slots random results table local
		HCVPg = FMg + 23020 -- hangar cargo vip payout global (-954321460)
		HCVRCg = FMg + 23003 -- hangar cargo vip ron's cut (1232447926)
		HCVISl1 = 1932 + 1078 -- hangar cargo vip instant sell local 1
		HCVISl2 = 2700 -- hangar cargo vip instant sell local 2
		CRg = 2707037 + 36 -- cash remover global (/*You paid $~1~ to repair this vehicle for storage.*/)
		NHCNSg = FMg + 24599 -- nightclub helper cargo n shipments global (1162393585)
		NHSGg = FMg + 24593 -- nightclub helper sporting goods global (-1523050891)
		NHSAIg = FMg + 24594 -- nightclub helper s.a. imports global (147773667)
		NHPRg = FMg + 24595 -- nightclub helper pharmaceutical reseacrh global (-1188700671)
		NHOPg = FMg + 24596 -- nightclub helper organic produce global (-1188963032)
		NHPNCg = FMg + 24597 -- nightclub helper printing n copying global (967514627)
		NHCCg = FMg + 24598 -- nightclub helper cash creation global (1983962738)
		NHCKg1 = FMg + 24659 -- nightclub helper cooldown killer global 1 (1763921019)
		NHCKg2 = FMg + 24701 -- nightclub helper cooldown killer global 2 (-1004589438)
		NHCKg3 = FMg + 24702 -- nightclub helper cooldown killer global 3 (464940095)
		CSg1 = 1575032 -- change session (type) global 1 (NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);)
		CSg2 = 1574589 -- change session (switch) global 2 ("MP_POST_MATCH_TRANSITION_SCENE")
		CSg3 = 1574589 + 2 -- change session (quit) global 3 ("MP_POST_MATCH_TRANSITION_SCENE")
		SCVPg = FMg + 15991 -- special cargo vip price global ("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1")
		SCVCKg1 = FMg + 15756 -- special cargo vip cooldown global 1 ("EXEC_BUY_COOLDOWN")
		SCVCKg2 = FMg + 15757 -- special cargo vip cooldown global 2 ("EXEC_SELL_COOLDOWN")
		BTEg1 = 4537356 -- bypass transaction error global 1
		BTEg2 = 4537357 -- bypass transaction error global 2
		BTEg3 = 4537358 -- bypass transaction error global 3
		SCVAl1 = 739 -- special cargo vip appsecuroserv local 1 ("MP_WH_SELL")
		SCVAl2 = 740 -- special cargo vip appsecuroserv local 2 ("MP_WH_SELL")
		SCVAl3 = 558 -- special cargo vip appsecuroserv local 3 ("MP_WH_SELL")
		SCVAl4 = 1136 -- special cargo vip additional local 1
		SCVAl5 = 596 -- special cargo vip additional local 2
		SCVAl6 = 1125 -- special cargo vip additional local 3
		SCVMTl = 543 + 7 -- special cargo vip mission type local
		SCVISl = 543 + 1 -- special cargo vip instant sell local
		SCVIBl1 = 601 + 5 -- special cargo vip instant buy local 1
		SCVIBl2 = 601 + 1 -- special cargo vip instant buy local 2
		SCVIBl3 = 601 + 191 -- special cargo vip instant buy local 3
		SCVIBl4 = 601 + 192 -- special cargo vip instant buy local 4
		CLg = 1963515 -- cheap loop global ("MPPLY_CASINO_MEM_BONUS")
		TTg = 4537212 -- trigger transaction global
		NLCl = 183 + 32 + 1 -- night loop collect local
		NLSCg = FMg + 24257 -- night loop safe capacity global ("NIGHTCLUBMAXSAFEVALUE")
		NLISg = FMg + 24234 -- night loop income start global ("NIGHTCLUBINCOMEUPTOPOP5")
		NLIEg = FMg + 24253 -- night loop income end global ("NIGHTCLUBINCOMEUPTOPOP100")
		ORg = 1961347 -- orbital refund global ("ORB_CAN_QUIT1")
		AUg = 4543283 + 1 -- achievements unlocker global (PLAYER::HAS_ACHIEVEMENT_BEEN_PASSED(iParam0) && iParam1 == 1)
		CUg = 2707706 -- collectibles unlocker global ("cellphone_badger")
		AFo = 209 -- action figures offset
		LDOo = 593 -- ld organics offset
		PCo = 210 -- plating cards offset
		SJo = 211 -- signal jammers offset
		So = 600 -- snowmen offset
		MPo = 494 -- movie props offset
		JOLo = 591 -- jack o lanterns offset
		SCCg = FMg + 19321 -- sex changer change appearance cooldown global ("CHARACTER_APPEARANCE_COOLDOWN")
		BUCg1 = FMg + 21505 -- bunker unlocker cooldown global 1 (946764522)
		BUCg2 = FMg + 21757 -- bunker unlocker cooldown global 2 ("GR_RESEARCH_CAPACITY")
		BUCg3 = FMg + 21758 -- bunker unlocker cooldown global 3 ("GR_RESEARCH_PRODUCTION_TIME")
		BUCg4 = FMg + 21759 -- bunker unlocker cooldown global 4 ("GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME")
		BUAg1 = FMg + 21761 -- bunker unlocker additional global 1 (1485279815)
		BUAg2 = FMg + 21762 -- bunker unlocker additional global 2 (2041812011)
		LSCMMg1 = FMg + 31944 -- ls car meet multiplier global 1 ("TUNER_SPRINT_FIRST_TIME_BONUS_XP_MULTIPLIER")
		LSCMMg2 = FMg + 31973 -- ls car meet multiplier global 2 ("TUNER_MERCH_PURCHASE_XP_MULTIPLIER")
		GSIg = 1662873 -- get supplies instantly global ("OR_PSUP_DEL)
		GVLg = 2652572 + 2650 + 1 -- gun van location global (NETWORK::NETWORK_GET_NUM_PARTICIPANTS())
		GVWSg = FMg + 34328 -- modify gun van weapon slot global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_0")
		GVTSg = FMg + 34350 -- modify gun van throwable slot 1 global ("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_0")
		GVWDg = FMg + 34339 -- modify gun van weapon slot 1 discount global ("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_0")
		GVTDg = FMg + 34354 -- modify gun van throwable discount global ("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_0")
		GVADg = FMg + 34358 -- modify gun van armor discount global ("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_0")
		GVSg = FMg + 34365 -- modify gun van skins for knife and bat (1490225691)
		EVg1 = FMg + 14936 -- enable vehicles global 1 ("ENABLE_LOWRIDER2_VIRGO3")
		EVg2 = FMg + 14941 -- enable vehicles global 2 ("ENABLE_LOWRIDER2_SLAMVAN")
		EVg3 = FMg + 17682 -- enable vehicles global 3 ("ENABLE_BIKER_DEFILER")
		EVg4 = FMg + 17703 -- enable vehicles global 4 ("ENABLE_BIKER_RATBIKE")
		EVg5 = FMg + 19341 -- enable vehicles global 5 ("ENABLE_IE_VOLTIC2")
		EVg6 = FMg + 19365 -- enable vehicles global 6 ("ENABLE_IE_TEMPESTA")
		EVg7 = FMg + 21304 -- enable vehicles global 7 ("ENABLE_XA21")
		EVg8 = FMg + 21309 -- enable vehicles global 8 ("ENABLE_NIGHTSHARK")
		EVg9 = FMg + 22103 -- enable vehicles global 9 ("ENABLE_ULTRALIGHT")
		EVg10 = FMg + 22122 -- enable vehicles global 10 ("ENABLE_LAZER")
		EVg11 = FMg + 23071 -- enable vehicles global 11 ("ENABLE_DELUXO")
		EVg12 = FMg + 23098 -- enable vehicles global 12 ("ENABLE_KAMACHO")
		EVg13 = FMg + 24292 -- enable vehicles global 13 ("ENABLE_HOTRING")
		EVg14 = FMg + 24307 -- enable vehicles global 14 ("ENABLE_JESTER3")
		EVg15 = FMg + 24383 -- enable vehicles global 15 ("ENABLE_TERBYTE")
		EVg16 = FMg + 24405 -- enable vehicles global 16 ("ENABLE_HABANERO")
		EVg17 = FMg + 26039 -- enable vehicles global 17 ("ENABLE_VEHICLE_TOROS")
		EVg18 = FMg + 26045 -- enable vehicles global 18 ("ENABLE_VEHICLE_BANDITO")
		EVg19 = FMg + 26050 -- enable vehicles global 19 ("ENABLE_VEHICLE_THRAX")
		EVg20 = FMg + 26070 -- enable vehicles global 20 ("ENABLE_VEHICLE_PARAGON")
		EVg21 = FMg + 27026 -- enable vehicles global 21 ("ENABLE_VEHICLE_DEVESTE")
		EVg22 = FMg + 27027 -- enable vehicles global 22 ("ENABLE_VEHICLE_VAMOS")
		EVg23 = FMg + 28888 -- enable vehicles global 23 ("ENABLE_VEHICLE_FORMULA_PODIUM")
		EVg24 = FMg + 28910 -- enable vehicles global 24 ("ENABLE_VEHICLE_BLAZER2")
		EVg25 = FMg + 28933 -- enable vehicles global 25 ("ENABLE_VEHICLE_FORMULA")
		EVg26 = FMg + 28936 -- enable vehicles global 26 ("ENABLE_VEHICLE_FORMULA2")
		EVg27 = FMg + 28941 -- enable vehicles global 27 ("ENABLE_VEHICLE_IMORGEN")
		EVg28 = FMg + 28943 -- enable vehicles global 28 ("ENABLE_VEHICLE_VSTR")
		EVg29 = FMg + 29953 -- enable vehicles global 29 ("ENABLE_VEH_TIGON")
		EVg30 = FMg + 29611 -- enable vehicles global 30 ("ENABLE_VEH_DUKES3")
		EVg31 = FMg + 30418 -- enable vehicles global 31 ("ENABLE_VEHICLE_TOREADOR")
		EVg32 = FMg + 30434 -- enable vehicles global 32 ("ENABLE_VEHICLE_VERUS")
		EVg33 = FMg + 31290 -- enable vehicles global 33 ("ENABLE_VEHICLE_TAILGATER2")
		EVg34 = FMg + 31306 -- enable vehicles global 34 ("ENABLE_VEHICLE_COMET6")
		EVg35 = FMg + 32214 -- enable vehicles global 35 ("ENABLE_VEHICLE_CHAMPION")
		EVg36 = FMg + 32228 -- enable vehicles global 36 ("ENABLE_VEHICLE_BALLER7")
		EVg37 = FMg + 33463 -- enable vehicles global 37 ("ENABLE_VEHICLE_OMNISEGT")
		EVg38 = FMg + 33481 -- enable vehicles global 38 ("ENABLE_VEHICLE_SENTINEL4")
		EVg39 = FMg + 34446 -- enable vehicles global 39 ("ENABLE_VEHICLE_ENTITY3")
		EVg40 = FMg + 34461 -- enable vehicles global 40 ("ENABLE_VEHICLE_BOOR")
		EVg41 = FMg + 35402 -- enable vehicles global 41 ("ENABLE_VEHICLE_EXEMPLAR")
		EVg42 = FMg + 35678 -- enable vehicles global 42 ("ENABLE_VEHICLE_MONSTER")
		EVg43 = FMg + 35697 -- enable vehicles global 43 ("ENABLE_VEHICLE_L35")
		EVg44 = FMg + 35709 -- enable vehicles global 44 ("ENABLE_VEHICLE_BRIGHAM")
		EVg47 = FMg + 24414 -- enable vehicles global 47 ("ENABLE_COQUETTE_MODS")
		EDVg1 = FMg + 36285 -- enable dripfeed vehicles global 1 ("ENABLE_VEHICLE_FR36")
		EDVg2 = FMg + 36304 -- enable dripfeed vehicles global 2 ("ENABLE_VEHICLE_BENSON2")
		INT_MAX = 2147483646 -- max integer value
		SPACE = "➖ | ➖" -- just space
		README = "Read Me" -- just read me

---Heist Tool---

HeistTool = SilentNight:add_submenu("♠ Heist Tool")

--Agency--

Agency = HeistTool:add_submenu("Agency | Safe")

		contract_id = {3, 4, 12, 28, 60, 124, 252, 508, 2044, 4095, -1}
		a1 = 1
Agency:add_array_item("VIP Contract", {"Select", "The Nightclub", "The Marina", "Nightlife Leak", "The Country Club", "Guest List", "High Society Leak", "Davis", "The Ballas", "The South Central Leak", "Studio Time", "Don't Fuck With Dre"},
	function()
		return a1
	end,
	function(contract)
		if contract ~= 1 then
			stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contract - 1])
		elseif contract == 12 then
			stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contract - 1])
			stats.set_int(MPX() .. "FIXER_STORY_STRAND", -1)
		end
		a1 = contract
	end)

Agency:add_action("Complete Preps",
	function()
		stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
		stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
		stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
	end)

Agency:add_action("Max Payout (after start)", function() globals.set_int(APg, 2500000) end)

Agency:add_action("Cooldown Killer", function() globals.set_int(ACKg, 0) end)

Agency:add_action("Skip Cutscene", function() menu.end_cutscene() end)

	local function HeistScriptHostGetter(script_local)
		if FMC20:get_int(script_local) == 1 or FMC:get_int(script_local) == 1 then
			return "Available"
		else
			return "Unavaliable"
		end
	end

Agency:add_bare_item("",
	function()
		if FMC20:is_active() then
			return "Instant Finish [Outdated] | 〔" .. HeistScriptHostGetter(FMC20SHl) .. "〕"
		else
			return "Instant Finish [Outdated]: Waiting..."
		end
	end,
	function()
		if FMC20:is_active() then
			FMC20:set_int(AIFl1, 51338752)
			FMC20:set_int(AIFl2, 50)
		end
	end, null, null)

Agency:add_action(SPACE, null)

AgencyNote = Agency:add_submenu(README)

AgencyNote:add_action("                 After all choices and", null)
AgencyNote:add_action("            pressing «Complete Preps»", null)
AgencyNote:add_action("                  just wait some time", null)

--Auto Shop--

AutoShop = HeistTool:add_submenu("Auto Shop | Safe")

		a2 = 1
AutoShop:add_array_item("Auto Shop Mission", {"Select", "Union Depository", "Superdollar Deal", "Bank Contract", "ECU Job", "Prison Contract", "Agency Deal", "Lost Contract", "Data Contract"},
	function()
		return a2
	end,
	function(mission)
		if mission ~= 1 then
			stats.set_int(MPX() .. "TUNER_CURRENT", mission - 2)
		end
		a2 = mission
	end)

AutoShop:add_action("Complete Preps",
	function()
		current_mission = stats.get_int(MPX() .. "TUNER_CURRENT")
		if current_mission == 1 then
			stats.set_int(MPX() .. "TUNER_GEN_BS", 4351)
		else
			stats.set_int(MPX() .. "TUNER_GEN_BS", 12543)
		end
	end)

AutoShop:add_action("Max Payout (after start)",
	function()
		globals.set_float(ASFg, 0)
		globals_set_ints(ASPg1, ASPg2, 1, 2000000)
	end)

AutoShop:add_action("Cooldown Killer",
	function()
		for i = 0, 7 do
			stats.set_int(MPX() .. "TUNER_CONTRACT" .. i .. "_POSIX", 0)
		end
		globals.set_int(ASCKg, 0)
	end)

AutoShop:add_bare_item("",
	function()
		if FMC20:is_active() then
			return "Instant Finish | 〔" .. HeistScriptHostGetter(FMC20SHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end,
	function()
		if FMC20:is_active() then
			FMC20:set_int(ASIFl1, 51338977)
			FMC20:set_int(ASIFl2, 101)
		end
	end, null, null)

AutoShop:add_action(SPACE, null)

AutoShopNote = AutoShop:add_submenu(README)

AutoShopNote:add_action("                 After all choices and", null)
AutoShopNote:add_action("            pressing «Complete Preps»", null)
AutoShopNote:add_action("       leave autoshop and come back in", null)

--Apartment--

Apartment = HeistTool:add_submenu("Apartment | Safe")

Apartment:add_action("Change Session", function() SessionChanger(0) end)

Apartment:add_action("Complete Preps (any heist)", function() stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1) end)

AC = Apartment:add_submenu("Cuts")

AC15mil = AC:add_submenu("15mil Payout")

AC15mil:add_action("Skip Cutscene", function() menu.end_cutscene() end)

		tkl_config = false
AC15mil:add_toggle("TKL Config (60% keyboard)", function() return tkl_config end, function() tkl_config = not tkl_config end)

		cash_receivers = 1
		a3 = 1
AC15mil:add_array_item("Cash Receivers", {"All", "Only Crew", "Only Me"},
	function()
		return a3
	end,
	function(receivers)
		cash_receivers = receivers
		a3 = receivers
	end)

	local function Apartment15milCutsSetter(Enabled, config, receivers, players, cut)
		if Enabled then
			if receivers == 1 then
				globals.set_int(ACg1, 100 - (cut * players))
				globals.set_int(ACg2, cut)
				if players ~= 2 then
					globals_set_ints(ACg3, ACg4, 1, cut)
				end
				sleep(1)
				if config == false then
					menu.send_key_press(13)
					sleep(1)
				end
				menu.send_key_press(27)
				sleep(1)
				globals.set_int(ACg5, cut)
			elseif receivers == 2 then
				globals.set_int(ACg1, 100 - (cut * players))
				globals.set_int(ACg2, cut)
				if players ~= 2 then
					globals_set_ints(ACg3, ACg4, 1, cut)
				end
				sleep(1)
				if config == false then
					menu.send_key_press(13)
					sleep(1)
				end
				menu.send_key_press(27)
			else
				globals.set_int(ACg5, cut)
			end
		else
			if players ~= 2 then
				globals.set_int(ACg1, 55)
				globals_set_ints(ACg2, ACg4, 1, 15)
			else
				globals.set_int(ACg1, 60)
				globals.set_int(ACg2, 40)
			end
			sleep(1)
			if config == false then
				menu.send_key_press(13)
				sleep(1)
			end
			menu.send_key_press(27)
			sleep(1)
			if players ~= 2 then
				globals.set_int(ACg5, 55)
			else
				globals.set_int(ACg5, 60)
			end
		end
	end

		a4 = false
AC15mil:add_toggle("The Freeca Job (Normal)", function() return a4 end, function() a4 = not a4 Apartment15milCutsSetter(a4, tkl_config, cash_receivers, 2, 7453) end)

		a5 = false
AC15mil:add_toggle("The Prison Break (Normal)", function() return a5 end, function() a5 = not a5 Apartment15milCutsSetter(a5, tkl_config, cash_receivers, 4, 2142) end)

		a6 = false
AC15mil:add_toggle("The Humane Labs Raid (Normal)", function() return a6 end, function() a6 = not a6 Apartment15milCutsSetter(a6, tkl_config, cash_receivers, 4, 1587) end)

		a7 = false
AC15mil:add_toggle("Series A Funding (Normal)", function() return a7 end, function() a7 = not a7 Apartment15milCutsSetter(a7, tkl_config, cash_receivers, 4, 2121) end)

		a8 = false
AC15mil:add_toggle("The Pacific Standard Job (Normal)", function() return a8 end, function() a8 = not a8 Apartment15milCutsSetter(a8, tkl_config, cash_receivers, 4, 1000) end)

AC15mil:add_action(SPACE, null)

AC15milNote = AC15mil:add_submenu(README)

AC15milNote:add_action("                     Cash Receivers:", null)
AC15milNote:add_action("       Choose who'll receive the money", null)
AC15milNote:add_action(SPACE, null)
AC15milNote:add_action("                          For «All»:", null)
AC15milNote:add_action("             Activate within 1st 30 secs", null)
AC15milNote:add_action("   after the cutsene ends (on cuts screen);", null)
AC15milNote:add_action("   before that select your cut on a board;", null)
AC15milNote:add_action("     wait till your cut changes to positive", null)
AC15milNote:add_action(SPACE, null)
AC15milNote:add_action("                    For «Only Crew»:", null)
AC15milNote:add_action("             Activate within 1st 30 secs", null)
AC15milNote:add_action("   after the cutsene ends (on cuts screen);", null)
AC15milNote:add_action("   before that select your cut on a board;", null)
AC15milNote:add_action("    wait till your cut changes to negative", null)
AC15milNote:add_action(SPACE, null)
AC15milNote:add_action("                    For «Only Me»:", null)
AC15milNote:add_action("         Activate option on cuts screen", null)

		cut_presets = {"Select", "85 All", "100 All"}
		cut_values = {85, 100}

		apartment_players = 4
		b16 = false
	local function ApartmentFleecaSetter(Enabled)
		if Enabled then
			apartment_players = 2
		else
			apartment_players = 4
		end
	end
AC:add_toggle("The Fleeca Job", function() return b16 end, function() b16 = not b16 ApartmentFleecaSetter(b16) end)

		a9 = 1
	local function ApartmentCutsPresetter(cut)
		globals.set_int(ACg1, 100 - (cut * apartment_players))
		globals.set_int(ACg2, cut)
		if apartment_players ~= 2 then
			globals_set_ints(ACg3, ACg4, 1, cut)
		else
			globals_set_ints(ACg3, ACg4, 1, 0)
		end
	end
AC:add_array_item("Presets", cut_presets,
	function()
		return a9
	end,
	function(preset)
		if preset ~= 1 then
			ApartmentCutsPresetter(cut_values[preset - 1])
		end
		a9 = preset
	end)

AC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(ACg1) end, function(cut) globals.set_int(ACg1, 100 - (cut * apartment_players)) end)
AC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(ACg2) end, function(cut) globals.set_int(ACg2, cut) end)
AC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(ACg3) end, function(cut) globals.set_int(ACg3, cut) end)
AC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(ACg4) end, function(cut) globals.set_int(ACg4, cut) end)
AC:add_action("Set Negative to Positive (own)", function() globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / apartment_players) end)

AC:add_action(SPACE, null)

ACNote = AC:add_submenu(README)

ACNote:add_action("                     The Fleeca Job:", null)
ACNote:add_action("  Toggle this if you're playing fleeca heist", null)
ACNote:add_action(SPACE, null)
ACNote:add_action("         Choose cuts within 1st 30 secs", null)
ACNote:add_action("   after the cutsene ends (on cuts screen);", null)
ACNote:add_action("       after that select your ingame cut,", null)
ACNote:add_action("      press «Enter» and then press «Esc»", null)
ACNote:add_action("              to force cuts to change;", null)
ACNote:add_action("    after this change your cut to positive", null)

AE = Apartment:add_submenu("Extra")

AE:add_action("Skip Cutscene", function() menu.end_cutscene() end)

AE:add_action("Bypass Fleeca Hack", function() FMC:set_int(AFHl, 7) end)

AE:add_action("Bypass Fleeca Drill", function() FMC:set_float(AFDl, 100) end)

AE:add_action("Unlock All Jobs",
	function()
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0", globals.get_int(AUAJg1))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1", globals.get_int(AUAJg2))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2", globals.get_int(AUAJg3))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3", globals.get_int(AUAJg4))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4", globals.get_int(AUAJg5))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4_L", 5)
	end)

AE:add_action(SPACE, null)

AENote = AE:add_submenu(README)

AENote:add_action("                     Unlock All Jobs:", null)
AENote:add_action("  Activate the option and restart the game", null)

Apartment:add_bare_item("",
	function()
		if FMC:is_active() then
			return "Instant Finish | 〔" .. HeistScriptHostGetter(FMCSHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end,
	function()
		if FMC:is_active() then
			FMC:set_int(AIFl3, 12)
			FMC:set_int(AIFl4, 99999)
			FMC:set_int(AIFl5, 99999)
		end
	end, null, null)

Apartment:add_action(SPACE, null)

ApartmentNote = Apartment:add_submenu(README)

ApartmentNote:add_action("           Complete Preps (for fleeca):", null)
ApartmentNote:add_action("    Pay for the preparation, start the first", null)
ApartmentNote:add_action("   mission and as soon as you are sent to", null)
ApartmentNote:add_action("  scout, change the session, come back to", null)
ApartmentNote:add_action("  planning room, press «Complete Preps»", null)
ApartmentNote:add_action(" near white board and press «E» and leave", null)
ApartmentNote:add_action(SPACE, null)
ApartmentNote:add_action("       Complete Preps (for other heists):", null)
ApartmentNote:add_action("  Start the mission and leave after the 1st", null)
ApartmentNote:add_action("   cutscene ends, press «Complete Preps»", null)
ApartmentNote:add_action("         near white board and press «E»", null)

--Cayo Perico--

CayoPerico = HeistTool:add_submenu("Cayo Perico | Safe")

CPDS = CayoPerico:add_submenu("Data Saver")

		cayo_targets = {"Tequila", "Necklace", "Bonds", "Diamond", "Madrazo Files", "Statue"}
CPDS:add_bare_item("",
	function()
		cayo_target = stats.get_int(MPX() .. "H4CNF_TARGET")
		if cayo_difficulty_show ~= "None or Legit" then
			cayo_target_show = cayo_targets[cayo_target + 1]
		else
			cayo_target_show = "None"
		end
		return "Primary Target: " .. cayo_target_show
	end, null, null, null)
CPDS:add_bare_item("",
	function()
		compound_cash = stats.get_int(MPX() .. "H4LOOT_CASH_C")
		compound_weed = stats.get_int(MPX() .. "H4LOOT_WEED_C")
		compound_coke = stats.get_int(MPX() .. "H4LOOT_COKE_C")
		compound_gold = stats.get_int(MPX() .. "H4LOOT_GOLD_C")
		compound_arts = stats.get_int(MPX() .. "H4LOOT_PAINT")
		current_compound_cash = ""
		current_compound_weed = ""
		current_compound_coke = ""
		current_compound_gold = ""
		current_compound_arts = ""
		if compound_cash > 0 then
			current_compound_cash = "Cash; "
		end
		if compound_weed > 0 then
			current_compound_weed = "Weed; "
		end
		if compound_coke > 0 then
			current_compound_coke = "Coke; "
		end
		if compound_gold > 0 then
			current_compound_gold = "Gold; "
		end
		if compound_arts > 0 then
			current_compound_arts = "Arts"
		end
		if compound_cash == 0 and compound_weed == 0 and compound_coke == 0 and compound_gold == 0 and compound_arts == 0 then
			current_compound_cash = "None"
			current_compound_weed = ""
			current_compound_coke = ""
			current_compound_gold = ""
			current_compound_arts = ""
		end
		cayo_compound_targets_show = current_compound_cash .. current_compound_weed .. current_compound_coke .. current_compound_gold .. current_compound_arts
		return "Compound: " .. cayo_compound_targets_show
	end, null, null, null)
CPDS:add_bare_item("",
	function()
		island_cash = stats.get_int(MPX() .. "H4LOOT_CASH_I")
		island_weed = stats.get_int(MPX() .. "H4LOOT_WEED_I")
		island_coke = stats.get_int(MPX() .. "H4LOOT_COKE_I")
		island_gold = stats.get_int(MPX() .. "H4LOOT_GOLD_I")
		current_island_cash = ""
		current_island_weed = ""
		current_island_coke = ""
		current_island_gold = ""
		if island_cash > 0 then
			current_island_cash = "Cash; "
		end
		if island_weed > 0 then
			current_island_weed = "Weed; "
		end
		if island_coke > 0 then
			current_island_coke = "Coke; "
		end
		if island_gold > 0 then
			current_island_gold = "Gold"
		end
		if island_cash == 0 and island_weed == 0 and island_coke == 0 and island_gold == 0 then
			current_island_cash = "None"
			current_island_weed = ""
			current_island_coke = ""
			current_island_gold = ""
		end
		cayo_island_targets_show = current_island_cash .. current_island_weed .. current_island_coke .. current_island_gold
		return "Island: " .. cayo_island_targets_show
	end, null, null, null)
CPDS:add_bare_item("",
	function()
		cayo_difficulty = stats.get_int(MPX() .. "H4_PROGRESS")
		if cayo_difficulty == 126823 then
			cayo_difficulty_show = "Normal"
		elseif cayo_difficulty == 131055 then
			cayo_difficulty_show = "Hard"
		else
			cayo_difficulty_show = "None or Legit"
		end
		return "Difficulty: " .. cayo_difficulty_show
	end, null, null, null)
		cayo_approach_id = {65283, 65413, 65289, 65425, 65313, 65345, 65535}
		cayo_approaches = {"Kosatka", "Alkonost", "Velum", "Stealth Annihilator", "Patrol Boat", "Longfin", "All Ways"}
CPDS:add_bare_item("",
	function()
		cayo_approach = stats.get_int(MPX() .. "H4_MISSIONS")
		for i = 1, 7 do
			if cayo_approach == cayo_approach_id[i] then
				cayo_approach_show = cayo_approaches[i]
				break
			else
				cayo_approach_show = "None or Legit"
			end
		end
		return "Approach: " .. cayo_approach_show
	end, null, null, null)
		cayo_weapons = {"None", "Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"}
CPDS:add_bare_item("",
	function()
		cayo_weapon = stats.get_int(MPX() .. "H4CNF_WEAPONS")
		cayo_weapon_show = cayo_weapons[cayo_weapon + 1]
		return "Weapons: " .. cayo_weapon_show
	end, null, null, null)

		cayo_preset = false
CPDS:add_bare_item("Save Heist Preset",
	function()
		if cayo_preset ~= false then
			status = "Saved"
		else
			status = "Unsaved"
		end
		return "Save Heist Preset | 〔" .. status .. "〕"
	end,
	function()
		cayo_preset = not cayo_preset
		sleep(0.5)
		if cayo_preset == true then
			cayo_primary_preset = cayo_target
			compound_cash_preset = compound_cash
			compound_weed_preset = compound_weed
			compound_coke_preset = compound_coke
			compound_gold_preset = compound_gold
			compound_arts_preset = compound_arts
			island_cash_preset = island_cash
			island_weed_preset = island_weed
			island_coke_preset = island_coke
			island_gold_preset = island_gold
			cayo_difficulty_preset = cayo_difficulty
			cayo_approach_preset = cayo_approach
			cayo_weapons_preset = cayo_weapon
		end
	end, null, null)

	local function CayoCompletePreps()
		stats.set_int(MPX() .. "H4CNF_UNIFORM", -1)
		stats.set_int(MPX() .. "H4CNF_GRAPPEL", -1)
		stats.set_int(MPX() .. "H4CNF_TROJAN", 5)
		stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
		stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
		stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
		stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 10)
		sleep(1)
		HIP:set_int(CPRBl, 2)
	end

CPDS:add_action("Apply Saved Preset",
	function()
		if cayo_preset == true then
			stats.set_int(MPX() .. "H4CNF_TARGET", cayo_primary_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_C", compound_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", compound_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_C", compound_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", compound_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_C", compound_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", compound_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_C", compound_gold_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", compound_gold_preset)
			stats.set_int(MPX() .. "H4LOOT_PAINT", compound_arts_preset)
			stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", compound_arts_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_I", island_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", island_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_I", island_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", island_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_I", island_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", island_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_I", island_gold_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", island_gold_preset)
			stats.set_int(MPX() .. "H4_PROGRESS", cayo_difficulty_preset)
			stats.set_int(MPX() .. "H4_MISSIONS", cayo_approach_preset)
			stats.set_int(MPX() .. "H4CNF_WEAPONS", cayo_weapons_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_V", 90000)
			stats.set_int(MPX() .. "H4LOOT_WEED_V", 147870)
			stats.set_int(MPX() .. "H4LOOT_COKE_V", 200095)
			stats.set_int(MPX() .. "H4LOOT_GOLD_V", 330350)
			stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
			CayoCompletePreps()
		end
	end)

CPDS:add_action(SPACE, null)

CPDSNote = CPDS:add_submenu(README)

CPDSNote:add_action("                    Save Heist Preset:", null)
CPDSNote:add_action("    Use to save your heist planning screen", null)
CPDSNote:add_action(SPACE, null)
CPDSNote:add_action("                  Apply Saved Preset:", null)
CPDSNote:add_action("   Use to make your heist planning screen", null)
CPDSNote:add_action("   the same as it was before saving preset", null)

CPP = CayoPerico:add_submenu("Preps")

		cayo_target_id = {0, 1, 2, 3, 5}
		a10 = 1
CPP:add_array_item("Primary Target", {"Select", "Tequila", "Necklace", "Bonds", "Diamond", "Statue"},
	function()
		return a10
	end,
	function(target)
		if target ~= 1 then
			stats.set_int(MPX() .. "H4CNF_TARGET", cayo_target_id[target - 1])
		end
		a10 = target
	end)

CPST = CPP:add_submenu("Secondary Targets")

	local function CayoTargetsSetter(cash, weed, coke, gold, where, target, value)
		stats.set_int(MPX() .. "H4LOOT_CASH_" .. where, cash)
		stats.set_int(MPX() .. "H4LOOT_CASH_" .. where .. "_SCOPED", cash)
		stats.set_int(MPX() .. "H4LOOT_WEED_" .. where, weed)
		stats.set_int(MPX() .. "H4LOOT_WEED_" .. where .. "_SCOPED", weed)
		stats.set_int(MPX() .. "H4LOOT_COKE_" .. where, coke)
		stats.set_int(MPX() .. "H4LOOT_COKE_" .. where .. "_SCOPED", coke)
		stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where, gold)
		stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where .. "_SCOPED", gold)
		if target ~= 0 then
			stats.set_int(MPX() .. "H4LOOT_" .. target .. "_V", value)
		end
	end

		a11 = 1
CPST:add_array_item("Fill Compound Storages", {"None", "Cash", "Weed", "Coke", "Gold"},
	function()
		return a11
	end,
	function(target)
		if target == 1 then
			CayoTargetsSetter(0, 0, 0, 0, "C", 0, 0)
		elseif target == 2 then
			CayoTargetsSetter(255, 0, 0, 0, "C", "CASH", 90000)
		elseif target == 3 then
			CayoTargetsSetter(0, 255, 0, 0, "C", "WEED", 147870)
		elseif target == 4 then
			CayoTargetsSetter(0, 0, 255, 0, "C", "COKE", 200095)
		elseif target == 5 then
			CayoTargetsSetter(0, 0, 0, 255, "C", "GOLD", 330350)
		end
		a11 = target
	end)

		a12 = 1
CPST:add_array_item("Fill Island Storages", {"None", "Cash", "Weed", "Coke", "Gold"},
	function()
		return a12
	end,
	function(target)
		if target == 1 then
			CayoTargetsSetter(0, 0, 0, 0, "I", 0, 0)
		elseif target == 2 then
			CayoTargetsSetter(16777215, 0, 0, 0, "I", "CASH", 90000)
		elseif target == 3 then
			CayoTargetsSetter(0, 16777215, 0, 0, "I", "WEED", 147870)
		elseif target == 4 then
			CayoTargetsSetter(0, 0, 16777215, 0, "I", "COKE", 200095)
		elseif target == 5 then
			CayoTargetsSetter(0, 0, 0, 16777215, "I", "GOLD", 330350)
		end
		a12 = target
	end)

		a13 = false
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
CPST:add_toggle("Add Paintings", function() return a13 end, function() a13 = not a13 CayoPaintingsToggler(a13) end)

CPDM = CPST:add_submenu("Detailed Method")

CPCST = CPDM:add_submenu("Compound")

		a14 = 1
CPCST:add_array_item("Target (only one)", {"Select", "Cash", "Weed", "Coke", "Gold"},
	function()
		return a14
	end,
	function(target)
		if target == 2 then
			compound_target = "CASH"
			stats.set_int(MPX() .. "H4LOOT_CASH_V", 90000)
		elseif target == 3 then
			compound_target = "WEED"
			stats.set_int(MPX() .. "H4LOOT_WEED_V", 147870)
		elseif target == 4 then
			compound_target = "COKE"
			stats.set_int(MPX() .. "H4LOOT_COKE_V", 200095)
		elseif target == 5 then
			compound_target	 = "GOLD"
			stats.set_int(MPX() .. "H4LOOT_GOLD_V", 330350)
		end
		CayoTargetsSetter(0, 0, 0, 0, "C", 0, 0)
		a14 = target
	end)

		target_amount = {0, 128, 64, 196, 204, 220, 252, 253, 255}
		a15 = 1
CPCST:add_array_item("Target Amount", {"0", "1", "2", "3", "4", "5", "6", "7", "8"},
	function()
		return a15
	end,
	function(amount)
		if compound_target ~= nil then
			compound_amount = target_amount[amount]
			stats.set_int(MPX() .. "H4LOOT_" .. compound_target .. "_C", compound_amount)
			stats.set_int(MPX() .. "H4LOOT_" .. compound_target .. "_C_SCOPED", compound_amount)
			a15 = amount
		end
	end)

		target_amount2 = {0, 64, 96, 112, 120, 122, 126, 127}
		a16 = 1
CPCST:add_array_item("Arts Amount",  {"0", "1", "2", "3", "4", "5", "6", "7"},
	function()
		return a16
	end,
	function(amount)
		arts_amount = target_amount2[amount]
		stats.set_int(MPX() .. "H4LOOT_PAINT", arts_amount)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", arts_amount)
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
		a16 = amount
	end)

CPIST = CPDM:add_submenu("Island")

		a17 = 1
CPIST:add_array_item("Target (only one)", {"Select", "Cash", "Weed", "Coke", "Gold"},
	function()
		return a17
	end,
	function(target)
		if target == 2 then
			island_target = "CASH"
			stats.set_int(MPX() .. "H4LOOT_CASH_V", 90000)
		elseif target == 3 then
			island_target = "WEED"
			stats.set_int(MPX() .. "H4LOOT_WEED_V", 147870)
		elseif target == 4 then
			island_target = "COKE"
			stats.set_int(MPX() .. "H4LOOT_COKE_V", 200095)
		elseif target == 5 then
			island_target = "GOLD"
			stats.set_int(MPX() .. "H4LOOT_GOLD_V", 330350)
		end
		CayoTargetsSetter(0, 0, 0, 0, "I", 0, 0)
		a17 = target
	end)

		target_amount3 = {
			0, 8388608, 12582912, 12845056, 12976128, 13500416, 14548992,
			16646144, 16711680, 16744448, 16760832, 16769024, 16769536,
			16770560, 16770816, 16770880, 16771008, 16773056, 16777152,
			16777184, 16777200, 16777202, 16777203, 16777211, 16777215
		}
		a18 = 1
CPIST:add_array_item("Target Amount", {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"},
	function()
		return a18
	end,
	function(amount)
		if island_target ~= nil then
			island_amount = target_amount3[amount]
			stats.set_int(MPX() .. "H4LOOT_" .. island_target .. "_I", island_amount)
			stats.set_int(MPX() .. "H4LOOT_" .. island_target .. "_I_SCOPED", island_amount)
			a18 = amount
		end
	end)

		cayo_difficulty_id = {126823, 131055}
		a19 = 1
CPP:add_array_item("Difficulty", {"Select", "Normal", "Hard"},
	function()
		return a19
	end,
	function(difficulty)
		if difficulty ~= 1 then
			stats.set_int(MPX() .. "H4_PROGRESS", cayo_difficulty_id[difficulty - 1])
		end
		a19 = difficulty
	end)

		cayo_approach_id = {65283, 65413, 65289, 65425, 65313, 65345, 65535}
		a20 = 1
CPP:add_array_item("Approach", {"Select", "Kosatka", "Alkonost", "Velum", "Stealth Annihilator", "Patrol Boat", "Longfin", "All Ways"},
	function()
		return a20
	end,
	function(approach)
		if approach ~= 1 then
			stats.set_int(MPX() .. "H4_MISSIONS", cayo_approach_id[approach - 1])
		end
		a20 = approach
	end)

		a21 = 1
CPP:add_array_item("Weapons", {"Select", "Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"},
	function()
		return a21
	end,
	function(weapons)
		if weapons ~= 1 then
			stats.set_int(MPX() .. "H4CNF_WEAPONS", weapons - 1)
		end
		a21 = weapons
	end)

CPP:add_action("Complete Preps", function() CayoCompletePreps() end)

CPP:add_action(SPACE, null)

CPPNote = CPP:add_submenu(README)

CPPNote:add_action("                 After all choices and", null)
CPPNote:add_action("            pressing «Complete Preps»", null)
CPPNote:add_action("                  just wait some time", null)

CPC = CayoPerico:add_submenu("Cuts")

	local function CutsPresetter(global_start, global_finish, cut)
		globals.set_int(GCg, cut)
		globals_set_ints(global_start, global_finish, 1, cut)
	end

		a22 = 1
CPC:add_array_item("Presets", cut_presets,
	function()
		return a22
	end,
	function(preset)
		if preset ~= 1 then
			CutsPresetter(CPCg1, CPCg4, cut_values[preset - 1])
		end
		a22 = preset
	end)

CPC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(CPCg1) end, function(cut) globals.set_int(CPCg1, cut) end)
CPC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(CPCg2) end, function(cut) globals.set_int(CPCg2, cut) end)
CPC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(CPCg3) end, function(cut) globals.set_int(CPCg3, cut) end)
CPC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(CPCg4) end, function(cut) globals.set_int(CPCg4, cut) end)
CPC:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(GCg) end, function(cut) globals.set_int(GCg, cut) end)

CPE = CayoPerico:add_submenu("Extra")

CPE:add_action("Skip Cutscene", function() menu.end_cutscene() end)

CPCL = CPE:add_submenu("Cooldown Killer")

CPCL:add_action("Kill Cooldown (after solo)",
	function()
		stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659643454)
		stats.set_int(MPX() .. "H4_COOLDOWN", 0)
		stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
	end)

CPCL:add_action("Kill Cooldown (after with friends)",
	function()
		stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659429119)
		stats.set_int(MPX() .. "H4_COOLDOWN", 0)
		stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
	end)

		a23 = 1
CPCL:add_array_item("Session", {"Go Offline", "Go Online"},
	function()
		return a23
	end,
	function(session)
		if session == 1 then
			SessionChanger(-1)
		else
			SessionChanger(8)
		end
		a23 = session
	end)

CPCL:add_action(SPACE, null)

CPCLNote = CPCL:add_submenu(README)

CPCLNote:add_action("         Choose a cooldown, go offline", null)
CPCLNote:add_action("                and come back online", null)

		a24 = false
	local function CayoBypasses()
		if FMC20:is_active() then
			if FMC20:get_int(CPFHl) == 4 then
				FMC20:set_int(CPFHl, 5)
			end
			if FMC20:get_int(CPSTCl) >= 3 or FMC20:get_int(CPSTCl) <= 6 then
				FMC20:set_int(CPSTCl, 6)
			end
			FMC20:set_float(CPPCCl, 100)
		end
	end
	local function CayoHeckerToggler(Enabled)
		if Enabled then
			cayo_hecker_hotkey = menu.register_hotkey(72, CayoBypasses)
		else
			menu.remove_hotkey(cayo_hecker_hotkey)
		end
	end
CPE:add_toggle("Hecker", function() return a24 end, function() a24 = not a24 CayoHeckerToggler(a24) end)

		a25 = false
	local function CayoWomansBagToggler(Enabled)
		if localplayer ~= nil then
			if Enabled then
				globals.set_int(CPBg, 99999)
			else
				globals.set_int(CPBg, 1800)
			end
		end
	end
CPE:add_toggle("Woman's Bag", function() return a25 end, function() a25 = not a25 CayoWomansBagToggler(a25) end)

CPE:add_action("Bypass Fingerprint Hack",
	function()
		if FMC20:get_int(CPFHl) == 4 then
			FMC20:set_int(CPFHl, 5)
		end
	end)

CPE:add_action("Bypass Plasma Cutter Cut", function() FMC20:set_float(CPPCCl, 100) end)

CPE:add_action("Bypass Drainage Pipe Cut",
	function()
		if FMC20:get_int(CPSTCl) >= 3 or FMC20:get_int(CPSTCl) <= 6 then
			FMC20:set_int(CPSTCl, 6)
		end
	end)

CPE:add_action("Unlock All POI",
	function()
		stats.set_int(MPX() .. "H4CNF_BS_GEN", -1)
		stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
		stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
		stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
		sleep(1)
		HIP:set_int(CPRBl, 2)
	end)

CPE:add_action(SPACE, null)

CPENote = CPE:add_submenu(README)

CPENote:add_action("                           Hecker:", null)
CPENote:add_action(" Pressing «H» will trigger bypass any hack", null)
CPENote:add_action(SPACE, null)
CPENote:add_action("                      Woman's Bag:", null)
CPENote:add_action("       Changes your bag size to infinity", null)
CPENote:add_action(SPACE, null)
CPENote:add_action("                For the first robbery:", null)
CPENote:add_action("           Use «Unlock All POI» option", null)

CPTP = CayoPerico:add_submenu("Teleports")

CPCom = CPTP:add_submenu("Compound")

CPCom:add_action("Office", function() TP(5005.557617, -5754.321289, 27.545269, 0, 0, 0) end)

CPCom:add_action("Primary Target", function() TP(5007.763184, -5756.029785, 14.184443, 0, 0, 0) end)

		cayo_storages = {
			[0] = {4999.613281, -5749.913086, 13.540487},
			[1] = {5080.862305, -5756.300781, 14.529651},
			[2] = {5030.722168, -5736.470703,  16.565588},
			[3] = {5007.434570, -5787.255859, 16.531698}
		}
		a26 = 1
CPCom:add_array_item("Storage", {"Select", "Basement", "North", "West", "South"},
	function()
		return a26
	end,
	function(storage)
		if storage ~= 1 then
			TP(cayo_storages[storage - 2][1], cayo_storages[storage - 2][2], cayo_storages[storage - 2][3], 0, 0, 0)
		end
		a26 = storage
	end)

CPCom:add_action("Main Exit", function() TP(4990.194824, -5716.448730, 18.580215, 0, 0, 0) end)

CPCom:add_action("Water Escape", function() TP(4639.124023, -6010.004883, -7.475036, 0, 0, 0) end)

CPIsl = CPTP:add_submenu("Island")

		cayo_airport = {
			[0] = {4441.150391, -4459.684082, 3.028352},
			[1] = {4503.571777, -4552.908203, 2.871924}
		}
		a27 = 1
CPIsl:add_array_item("Airport", {"Select", "Loot #1","Loot #2"},
	function()
		return a27
	end,
	function(loot)
		if loot ~= 1 then
			TP(cayo_airport[loot - 2][1], cayo_airport[loot - 2][2], cayo_airport[loot - 2][3], 0, 0, 0)
		end
		a27 = loot
	end)

		cayo_main_dock = {
			[0] = {4923.965820, -5244.269531, 1.223746},
			[1] = {4998.924316, -5165.349121, 1.464225},
			[2] = {4962.446777, -5107.580078, 1.682065},
			[3] = {5194.393066, -5134.665039, 2.047954}
		}
		a28 = 1
CPIsl:add_array_item("Main Dock", {"Select", "Loot #1", "Loot #2", "Loot #3", "Loot #4"},
	function()
		return a28
	end,
	function(loot)
		if loot ~= 1 then
			TP(cayo_main_dock[loot - 2][1], cayo_main_dock[loot - 2][2], cayo_main_dock[loot - 2][3], 0, 0, 0)
		end
		a28 = loot
	end)

		cayo_north_dock = {
			[0] = {5134.185547, -4611.440430, 1.196429},
			[1] = {5065.229492, -4591.959473, 1.555425},
			[2] = {5091.613281, -4682.282715, 1.107359}
		}
		a29 = 1
CPIsl:add_array_item("North Dock", {"Select", "Loot #1", "Loot #2", "Loot #3"},
	function()
		return a29
	end,
	function(loot)
		if loot ~= 1 then
			TP(cayo_north_dock[loot - 2][1], cayo_north_dock[loot - 2][2], cayo_north_dock[loot - 2][3], 0, 0, 0)
		end
		a29 = loot
	end)

CPIsl:add_action("Cord Field Loot", function() TP(5330.717285, -5270.096191, 31.886055, 0, 0, 0) end)

CPSO = CPTP:add_submenu("Scope Out")

CPSO:add_action("Power Station", function() TP(4478.291992, -4580.129883, 4.258523, 0, 0, 0) end)

		cayo_towers = {
			[0] = {5266.797363, -5427.772461, 139.746445},
			[1] = {4350.219238, -4577.410645, 2.899095},
			[2] = {5108.437012, -4580.132812, 28.417776},
			[3] = {4903.939453, -5337.220703, 34.306366}
		}
		a30 = 1
CPSO:add_array_item("Towers", {"Select", "Communications Tower", "Control Tower", "Water Tower #1", "Water Tower #2"},
	function()
		return a30
	end,
	function(tower)
		if tower ~= 1 then
			TP(cayo_towers[tower - 2][1], cayo_towers[tower - 2][2], cayo_towers[tower - 2][3], 0, 0, 0)
		end
		a30 = tower
	end)

		cayo_bolts = {
			[0] = {5097.452637, -4620.177734, 1.193875},
			[1] = {4880.295898, -5112.941406, 1.053022},
			[2] = {4537.624512, -4542.424805, 3.546365},
			[3] = {5466.320801, -5230.169922, 25.993027},
			[4] = {4075.548828, -4663.984863, 2.994547},
			[5] = {4522.588867, -4509.868652, 3.188455},
			[6] = {4506.013672, -4656.211914, 10.579565},
			[7] = {4803.885742, -4317.895020, 6.201560},
			[8] = {5071.072266, -4639.869629, 2.112077},
			[9] = {5179.191895, -4669.967285, 5.832691},
			[10] = {5214.377441, -5126.496582, 4.925748},
			[11] = {4954.719727, -5180.171875, 2.966018},
			[12] = {4903.507812, -5345.524414, 8.850177},
			[13] = {4756.349609, -5539.995605, 17.625168},
			[14] = {5365.069336, -5438.819824, 47.831707}
		}
		a31 = 1
CPSO:add_array_item("Bolt Cutters", {"Select", "#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10", "#11", "#12", "#13", "#14", "#15"},
	function()
		return a31
	end,
	function(bolt)
		if bolt ~= 1 then
			TP(cayo_bolts[bolt - 2][1], cayo_bolts[bolt - 2][2], cayo_bolts[bolt - 2][3], 0, 0, 0)
		end
		a31 = bolt
	end)

		cayo_powders = {
			[0] = {5404.111328, -5171.486328, 30.132875},
			[1] = {5214.664551, -5131.837402, 4.938407},
			[2] = {4924.137695, -5271.690918, 4.351841}
		}
		a32 = 1
CPSO:add_array_item("Cutting Powders", {"Select", "#1", "#2", "#3"},
	function()
		return a32
	end,
	function(powder)
		if powder ~= 1 then
			TP(cayo_powders[powder - 2][1], cayo_powders[powder - 2][2], cayo_powders[powder - 2][3], 0, 0, 0)
		end
		a32 = powder
	end)

		cayo_hooks = {
			[0] = {4901.115723, -5332.090820, 27.841076},
			[1] = {4882.464355, -4487.831543, 8.713233},
			[2] = {5609.771484, -5653.084473, 8.651618},
			[3] = {5125.838379, -5095.626953, 0.893209},
			[4] = {4529.709961, -4700.855957, 3.120182},
			[5] = {3901.137451, -4690.617676, 2.826484},
			[6] = {5404.485840, -5170.345215, 30.130934},
			[7] = {5333.016602, -5264.369629, 31.446018},
			[8] = {5110.171387, -4579.133301, 28.417776},
			[9] = {5267.243164, -5429.493164, 139.747177}
		}
		a33 = 1
CPSO:add_array_item("Grappling Hooks", {"Select", "#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10"},
	function()
		return a33
	end,
	function(hook)
		if hook ~= 1 then
			TP(cayo_hooks[hook - 2][1], cayo_hooks[hook - 2][2], cayo_hooks[hook - 2][3], 0, 0, 0)
		end
		a33 = hook
	end)

		cayo_clothes = {
			[0] = {5059.213867, -4592.870605, 1.595251},
			[1] = {4949.736328, -5320.138672, 6.776219},
			[2] = {4884.802734, -5452.898926, 29.437197},
			[3] = {4764.295898, -4781.471680, 2.501517},
			[4] = {5170.228516, -4677.545898, 1.122545},
			[5] = {5161.595215, -4993.595215, 11.394773},
			[6] = {5128.021484, -5530.752930, 52.743076}
		}
		a34 = 1
CPSO:add_array_item("Guard Clothes", {"Select", "#1", "#2", "#3", "#4", "#5", "#6", "#7"},
	function()
		return a34
	end,
	function(clothes)
		if clothes ~= 1 then
			TP(cayo_clothes[clothes - 2][1], cayo_clothes[clothes - 2][2], cayo_clothes[clothes - 2][3], 0, 0, 0)
		end
		a34 = clothes
	end)

		cayo_boxes = {
			[0] = {5262.136719, -5432.140625, 64.297203},
			[1] = {5265.863281, -5421.060059, 64.297638},
			[2] = {5266.750977, -5426.982910, 139.746857}
		}
		a35 = 1
CPSO:add_array_item("Signal Boxes", {"Select", "#1", "#2", "#3"},
	function()
		return a35
	end,
	function(box)
		if box ~= 1 then
			TP(cayo_boxes[box - 2][1], cayo_boxes[box - 2][1], cayo_boxes[box - 2][1], 0, 0, 0)
		end
		a35 = box
	end)

		cayo_trucks = {
			[0] = {4517.433105, -4531.979492, 2.820656},
			[1] = {5148.460938, -4620.099121, 1.108461},
			[2] = {4901.324219, -5216.216797, 2.768269},
			[3] = {5152.886719, -5143.897949, 0.997772}
		}
		a36 = 1
CPSO:add_array_item("Supply Trucks", {"Select", "#1", "#2", "#3", "#4"},
	function()
		return a36
	end,
	function(truck)
		if truck ~= 1 then
			TP(cayo_trucks[truck - 2][1], cayo_trucks[truck - 2][2], cayo_trucks[truck - 2][3], 0, 0, 0)
		end
		a36 = truck
	end)

CayoPerico:add_bare_item("",
	function()
		if FMC20:is_active() then
			return "Instant Finish | 〔" .. HeistScriptHostGetter(FMC20SHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end,
	function()
		if FMC20:is_active() then
			FMC20:set_int(CPIFl1, 9)
			FMC20:set_int(CPIFl2, 50)
		end
	end, null, null)

--Diamond Сasino--

DiamondCasino = HeistTool:add_submenu("Diamond Casino | Safe")

DDC = DiamondCasino:add_submenu("Data Saver")

		casino_targets = {"Cash", "Gold", "Arts", "Diamonds"}
DDC:add_bare_item("",
	function()
		casino_target = stats.get_int(MPX() .. "H3OPT_TARGET")
		if casino_approach_show ~= casino_approaches[1] then
			casino_target_show = casino_targets[casino_target + 1]
		else
			casino_target_show = "None"
		end
		return "Target: " .. casino_target_show
	end, null, null, null)
		casino_approaches = {"None", "Silent n Sneaky", "Big Con", "Aggressive"}
DDC:add_bare_item("",
	function()
		casino_approach = stats.get_int(MPX() .. "H3OPT_APPROACH")
		casino_hard_approach = stats.get_int(MPX() .. "H3_HARD_APPROACH")
		casino_approach_show = casino_approaches[casino_approach + 1]
		if casino_approach ~= 0 then
			if casino_approach == casino_hard_approach then
				casino_hard_approach_show = "(Hard)"
			else
				casino_hard_approach_show = "(Normal)"
			end
		else
			casino_hard_approach_show = ""
		end
		return "Approach: " .. casino_approach_show .. " " .. casino_hard_approach_show
	end, null, null, null)
		casino_gunmans = {"None", "Karl Abolaji", "Gustavo Mota", "Charlie Reed", "Chester McCoy", "Patrick McReary"}
DDC:add_bare_item("",
	function()
		casino_gunman = stats.get_int(MPX() .. "H3OPT_CREWWEAP")
		casino_gunman_show = casino_gunmans[casino_gunman + 1]
		return "Gunman: " .. casino_gunman_show
	end, null, null, null)
		casino_drivers = {"None", "Karim Denz", "Taliana Martinez", "Eddie Toh", "Zach Nelson", "Chester McCoy"}
DDC:add_bare_item("",
	function()
		casino_driver = stats.get_int(MPX() .. "H3OPT_CREWDRIVER")
		casino_driver_show = casino_drivers[casino_driver + 1]
		return "Driver: " .. casino_driver_show
	end, null, null, null)
		casino_hackers = {"None", "Rickie Lukens", "Christian Feltz", "Yohan Blair", "Avi Schwartzman", "Page Harris"}
DDC:add_bare_item("",
	function()
		casino_hacker = stats.get_int(MPX() .. "H3OPT_CREWHACKER")
		casino_hacker_show = casino_hackers[casino_hacker + 1]
		return "Hacker: " .. casino_hacker_show
	end, null, null, null)
		casino_masks = {"None", "Geometric", "Hunter", "Oni Half Mask", "Emoji", "Ornate Skull", "Lucky Fruit", "Guerilla", "Clown", "Animal", "Riot", "Oni Full Mask", "Hockey"}
DDC:add_bare_item("",
	function()
		casino_mask = stats.get_int(MPX() .."H3OPT_MASKS")
		casino_masks_show = casino_masks[casino_mask + 1]
		if casino_mask > 0 then
			return "Masks: " .. casino_masks_show .. " Set"
		else
			return "Masks: " .. casino_masks_show
		end
	end, null, null, null)

		casino_preset = false
DDC:add_bare_item("",
	function()
		if casino_preset ~= false then
			status = "Saved"
		else
			status = "Unsaved"
		end
		return "Save Heist Preset | 〔" .. status .. "〕"
	end,
	function()
		casino_preset = not casino_preset
		sleep(0.5)
		if casino_preset == true then
			casino_target_preset = casino_target
			casino_approach_preset = casino_approach
			casino_hard_approach_preset = casino_hard_approach
			casino_last_approach_preset = stats.get_int(MPX() .. "H3_LAST_APPROACH")
			casino_gunman_preset = casino_gunman
			casino_driver_preset = casino_driver
			casino_hacker_preset = casino_hacker
			casino_masks_preset = casino_mask
		end
	end, null, null)

	local function CasinoCompletePreps()
		stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
		stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
		stats.set_int(MPX() .. "H3OPT_VEHS", 3)
		stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
		stats.set_int(MPX() .. "H3OPT_BITSET0", -1)
		stats.set_int(MPX() .. "H3OPT_BITSET1", -1)
		stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", -1)
	end

DDC:add_action("Apply Saved Preset",
	function()
		if casino_preset == true then
			stats.set_int(MPX() .. "H3OPT_TARGET", casino_target_preset)
			stats.set_int(MPX() .. "H3OPT_APPROACH", casino_approach_preset)
			stats.set_int(MPX() .. "H3_HARD_APPROACH", casino_hard_approach_preset)
			stats.set_int(MPX() .. "H3_LAST_APPROACH", casino_last_approach_preset)
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", casino_gunman_preset)
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", casino_driver_preset)
			stats.set_int(MPX() .. "H3OPT_CREWHACKER", casino_hacker_preset)
			stats.set_int(MPX() .. "H3OPT_MASKS", casino_masks_preset)
			CasinoCompletePreps()
		end
	end)

DDC:add_action(SPACE, null)

DDCNote = DDC:add_submenu(README)

DDCNote:add_action("                    Save Heist Preset:", null)
DDCNote:add_action("    Use to save your heist planning screen", null)
DDCNote:add_action(SPACE, null)
DDCNote:add_action("                  Apply Saved Preset:", null)
DDCNote:add_action("   Use to make your heist planning screen", null)
DDCNote:add_action("   the same as it was before saving preset", null)


DCP = DiamondCasino:add_submenu("Preps")

		casino_target_id = {0, 2, 1, 3}
		a37 = 1
DCP:add_array_item("Target", {"Select", "Cash", "Arts", "Gold", "Diamonds"},
	function()
		return a37
	end,
	function(target)
		if target ~= 1 then
			stats.set_int(MPX() .. "H3OPT_TARGET", casino_target_id[target - 1])
		end
		a37 = target
	end)

		a38 = 1
	local function CasinoApproachSetter(last_approach, hard_approach, approach, selected_approach)
		stats.set_int(MPX() .. "H3_LAST_APPROACH", last_approach)
		stats.set_int(MPX() .. "H3_HARD_APPROACH", hard_approach)
		stats.set_int(MPX() .. "H3_APPROACH", approach)
		stats.set_int(MPX() .. "H3OPT_APPROACH", selected_approach)
	end
DCP:add_array_item("Approach", {"Select", "Silent n Sneaky (Normal)", "Big Con (Normal)", "Aggressive (Normal)", "Silent n Sneaky (Hard)", "Big Con (Hard)", "Aggressive (Hard)"},
	function()
		return a38
	end,
	function(approach)
		if approach == 2 then
			CasinoApproachSetter(3, 2, 1, 1)
		elseif approach == 3 then
			CasinoApproachSetter(3, 1, 2, 2)
		elseif approach == 4 then
			CasinoApproachSetter(1, 2, 3, 3)
		elseif approach == 5 then
			CasinoApproachSetter(2, 1, 3, 1)
		elseif approach == 6 then
			CasinoApproachSetter(1, 2, 3, 2)
		elseif approach == 7 then
			CasinoApproachSetter(2, 3, 1, 3)
		end
		a38 = approach
	end)

		casino_gunman_id = {1, 3, 5, 2, 4}
		a39 = 1
DCP:add_array_item("Gunman", {"Select", "Karl Abolaji (5%)", "Charlie Reed (7%)", "Patrick McReary (8%)", "Gustavo Mota (9%)", "Chester McCoy (10%)"},
	function()
		return a39
	end,
	function(gunman)
		if gunman ~= 1 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", casino_gunman_id[gunman - 1])
		end
		a39 = gunman
	end)

		casino_driver_id = {1, 4, 2, 3, 5}
		a40 = 1
DCP:add_array_item("Driver", {"Select", "Karim Denz (5%)", "Zach Nelson (6%)", "Taliana Martinez (7%)", "Eddie Toh (9%)", "Chester McCoy (10%)"},
	function()
		return a40
	end,
	function(driver)
		if driver ~= 1 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", casino_driver_id[driver - 1])
		end
		a40 = driver
	end)

		casino_hacker_id = {1, 3, 2, 5, 4}
		a41 = 1
DCP:add_array_item("Hacker", {"Select", "Rickie Lukens (3%)", "Yohan Blair (5%)", "Christian Feltz (7%)", "Page Harris (9%)", "Avi Schwartzman (10%)"},
	function()
		return a41
	end,
	function(hacker)
		if hacker ~= 1 then
			stats.set_int(MPX() .. "H3OPT_CREWHACKER", casino_hacker_id[hacker - 1])
		end
		a41 = hacker
	end)

		a42 = 1
DCP:add_array_item("Masks", {"Select", "Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Guerilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set"},
	function()
		return a42
	end,
	function(masks)
		if masks ~= 1 then
			stats.set_int(MPX() .. "H3OPT_MASKS", masks - 1)
		end
		a42 = masks
	end)

DCP:add_action("Complete Preps", function() CasinoCompletePreps() end)

DCP:add_action("Reset Preps",
	function()
		stats.set_int(MPX() .. "H3OPT_BITSET1", 0)
		stats.set_int(MPX() .. "H3OPT_BITSET0", 0)
	end)

DCP:add_action(SPACE, null)

DCPNote = DCP:add_submenu(README)

DCPNote:add_action("                 After all choices and", null)
DCPNote:add_action("            pressing «Complete Preps»", null)
DCPNote:add_action("                  just wait some time", null)

DCC = DiamondCasino:add_submenu("Cuts")

		a43 = 1
DCC:add_array_item("Presets", cut_presets,
	function()
		return a43
	end,
	function(preset)
		if preset ~= 1 then
			CutsPresetter(DCCg1, DCCg4, cut_values[preset - 1])
		end
		a43 = preset
	end)

DCC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(DCCg1) end, function(cut) globals.set_int(DCCg1, cut) end)
DCC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(DCCg2) end, function(cut) globals.set_int(DCCg2, cut) end)
DCC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(DCCg3) end, function(cut) globals.set_int(DCCg3, cut) end)
DCC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(DCCg4) end, function(cut) globals.set_int(DCCg4, cut) end)
DCC:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(GCg) end, function(cut) globals.set_int(GCg, cut) end)

DCE = DiamondCasino:add_submenu("Extra")

DCE:add_action("Skip Cutscene", function() menu.end_cutscene() end)

DCE:add_action("Cooldown Killer",
	function()
		stats.set_int(MPX() .. "H3_COMPLETEDPOSIX", -1)
		stats.set_int("MPPLY_H3_COOLDOWN", -1)
	end)

		b12 = false
	local function CasinoAutograbber()
		while b12 do
			if FMC:get_int(DCAl) == 3 then
				FMC:set_int(DCAl, 4)
			elseif FMC:get_int(DCAl) == 4 then
				FMC:set_int(DCAl + DCASl, 2)
			end
			sleep(0.1)
		end
	end
DCE:add_toggle("Autograbber (slow af)", function() return b12 end, function() b12 = not b12 CasinoAutograbber() end)

		a44 = false
	local function CasinoBypasses()
		if FMC:is_active() then
			FMC:set_int(DCFHl, 5)
			FMC:set_int(DCKHl, 5)
		end
	end
	local function CasinoHeckerToggler(Enabled)
		if Enabled then
			casino_hecker_hotkey = menu.register_hotkey(72, CasinoBypasses)
		else
			menu.remove_hotkey(casino_hecker_hotkey)
		end
	end
DCE:add_toggle("Hecker", function() return a44 end, function() a44 = not a44 CasinoHeckerToggler(a44) end)

DCE:add_action("Bypass Fingerprint Hack",
	function()
		if FMC:get_int(DCFHl) == 4 then
			FMC:set_int(DCFHl, 5)
		end
	end)

DCE:add_action("Bypass Keypad Hack",
	function()
		if FMC:get_int(DCKHl) ~= 4 then
			FMC:set_int(DCKHl, 5)
		end
	end)

DCE:add_action("Bypass Drill Vault Door", function() FMC:set_int(DCDVDl1, FMC:get_int(DCDVDl2)) end)

DCE:add_action("Unlock All POI",
	function()
		stats.set_int(MPX() .. "H3OPT_POI", -1)
		stats.set_int(MPX() .. "H3OPT_ACCESSPOINTS", -1)
	end)

DCE:add_action("Unlock Cancellation",
	function()
		stats.set_int(MPX() .. "CAS_HEIST_NOTS", -1)
		stats.set_int(MPX() .. "CAS_HEIST_FLOW", -1)
	end)

DCE:add_action(SPACE, null)

DCENote = DCE:add_submenu(README)

DCENote:add_action("                    Cooldown Killer:", null)
DCENote:add_action("    Use outside arcade, wait up to 5 mins", null)
DCENote:add_action(SPACE, null)
DCENote:add_action("                           Hecker:", null)
DCENote:add_action(" Pressing «H» will trigger bypass any hack", null)
DCENote:add_action(SPACE, null)
DCENote:add_action("                For the first robbery:", null)
DCENote:add_action("               Use «Unlock» options", null)

DCTP = DiamondCasino:add_submenu("Teleports")

		casino_rooms = {
			[0] = {960.168335, -14.924523, 78.754761},
			[1] = {2549.139893, -267.529999, -60.022987}
		}
		a45 = 1
DCTP:add_array_item("Staff Room", {"Select", "Outside", "Inside"},
	function()
		return a45
	end,
	function(room)
		if room ~= 1 then
			TP(casino_rooms[room - 2][1], casino_rooms[room - 2][2], casino_rooms[room - 2][3], 0, 0, 0)
		end
		a45 = room
	end)

		casino_vaults = {
			[0] = {2500.535889, -239.953308, -72.037086},
			[1] = {2515.317139, -238.673294, -72.037102},
			[2] = {2521.761719, -287.359192, -60.022976}
		}
		a46 = 1
DCTP:add_array_item("Vaults", {"Select", "Outside Main", "Inside Main", "Daily"},
	function()
		return a46
	end,
	function(vault)
		if vault ~= 1 then
			TP(casino_vaults[vault - 2][1], casino_vaults[vault - 2][2], casino_vaults[vault - 2][3], 0, 0, 0)
		end
		a46 = vault
	end)

		casino_mini_vaults = {
			[0] = {2510.261475, -224.366699, -72.037163},
			[1] = {2533.521729, -225.209366, -72.037163},
			[2] = {2537.823486, -237.452118, -72.037163},
			[3] = {2534.049561, -248.194931, -72.037163},
			[4] = {2520.342773, -255.425705, -72.037178},
			[5] = {2509.844238, -250.968552, -72.037170}
		}
		a47 = 1
DCTP:add_array_item("Mini-Vaults", {"Select", "#1", "#2", "#3", "#4", "#5", "#6"},
	function()
		return a47
	end,
	function(mini_vault)
		if mini_vault ~= 1 then
			TP(casino_mini_vaults[mini_vault - 2][1], casino_mini_vaults[mini_vault - 2][2], casino_mini_vaults[mini_vault - 2][3], 0, 0, 0)
		end
		a47 = mini_vault
	end)

--Doomsday--

Doomsday = HeistTool:add_submenu("Doomsday | Safe")

Doomsday:add_action("Teleport to Screen (use inside base)", function() TP(352.23, 4874.45, -62.09, 0, 0, 0) end)

DP = Doomsday:add_submenu("Preps")

		a48 = 1
	local function DoomsdayActSetter(progress, status)
		stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
		stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
		stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
	end
DP:add_array_item("Doomsday Act", {"Select", "Data Breaches", "Bogdan Problem", "Doomsday Scenario"},
	function()
		return a48
	end,
	function(act)
		if act == 2 then
			DoomsdayActSetter(503, 229383)
		elseif act == 3 then
			DoomsdayActSetter(240, 229378)
		elseif act == 4 then
			DoomsdayActSetter(16368, 229380)
		end
		a48 = act
	end)

DP:add_action("Complete Preps", function() stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1) end)

DP:add_action("Reset Preps", function()	DoomsdayActSetter(240, 0) end)

DP:add_action(SPACE, null)

DPNote = DP:add_submenu(README)

DPNote:add_action("                 After all choices and", null)
DPNote:add_action("            pressing «Complete Preps»", null)
DPNote:add_action("      leave your base and come back in", null)

DC = Doomsday:add_submenu("Cuts")

		a49 = 1
DC:add_array_item("Presets", cut_presets,
	function()
		return a49
	end,
	function(preset)
		if preset ~= 1 then
			CutsPresetter(DCg1, DCg4, cut_values[preset - 1])
		end
		a49 = preset
	end)

DC:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(DCg1) end, function(cut) globals.set_int(DCg1, cut) end)
DC:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(DCg2) end, function(cut) globals.set_int(DCg2, cut) end)
DC:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(DCg3) end, function(cut) globals.set_int(DCg3, cut) end)
DC:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(DCg4) end, function(cut) globals.set_int(DCg4, cut) end)
DC:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(GCg) end, function(cut) globals.set_int(GCg, cut) end)

DE = Doomsday:add_submenu("Extra")

DE:add_action("Skip Cutscene", function() menu.end_cutscene() end)

DE:add_action("Bypass Data Breaches Hack [Outdated]", function() FMC:set_int(DDBHl, 2) end)

DE:add_action("Bypass Doomsday Scenario Hack", function() FMC:set_int(DDSHl, 3) end)

Doomsday:add_bare_item("",
	function()
		if FMC:is_active() then
			return "Instant Finish | 〔" .. HeistScriptHostGetter(FMCSHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end,
	function()
		if FMC:is_active() then
			FMC:set_int(DIFl1, 12)
			FMC:set_int(DIFl2, 10000000)
			FMC:set_int(DIFl3, 99999)
			FMC:set_int(DIFl4, 99999)
		end
	end, null, null)

--Salvage Yard--

SalvageYard = HeistTool:add_submenu("Salvage Yard | Safe")

SYRT = SalvageYard:add_submenu("Alter Robbery Type")

SYVT = SalvageYard:add_submenu("Alter Vehicle Type")

SYVT1 = SYVT:add_submenu("Vehicle 1 Model")
SYVT2 = SYVT:add_submenu("Vehicle 2 Model")
SYVT3 = SYVT:add_submenu("Vehicle 3 Model")

SVVV = SalvageYard:add_submenu("⚠ Alter Vehicle Cost")

SVVV:add_float_range("Salvage Value Multiplier", 0.2, 0, 999,
	function()
		return globals.get_float(SYSMg)
	end,
	function(SalMul)
		globals.set_float(SYSMg, SalMul)
	end)

SYVS = SalvageYard:add_submenu("Alter Vehicle Status")

SYVS:add_bare_item("",
	function()
		claim_price = globals.get_int(SYCPg)
		if claim_price ~= nil and claim_price == 0 then
			status = "On"
		else
			status = "Off"
		end
		return "Claim for Free | 〔" .. status .. "〕"
	end,
	function()
		claim_price = globals.get_int(SYCPg)
		if claim_price ~= nil and claim_price == 0 then
			globals.set_int(SYCPg, 20000)
			globals.set_int(SYCPDg, 10000)
		else
			globals.set_int(SYCPg, 0)
			globals.set_int(SYCPDg, 0)
		end
	end, null, null)

SYAS = SalvageYard:add_submenu("Alter Availability Status")

		yard_robberies = {"Unknown", "The Cargo Ship", "The Gangbanger", "The Duggan", "The Podium", "The McTony"}
		yard_vehicle_statuses = {"Unknown", "Available", "In Progress", "Acquired", "Salvaging", "Salvaged", "Claimed", "Sold"}
for i = 1, 3 do
	SYRT:add_array_item("Vehicle " .. i .. " Robbery", yard_robberies,
		function()
			robbery_type = globals.get_int(SYRTg + i)
			if robbery_type ~= nil then
				return robbery_type + 2
			else
				return 1
			end
		end,
		function(robbery)
			if robbery ~= 1 then
				globals.set_int(SYRTg + i, robbery - 2)
			end
		end)

	SVVV:add_int_range("Vehicle " .. i .. " Sell Value", 100000, 0, 1000000,
		function()
			return globals.get_int(SYVVg + i)
		end,
		function(cost)
			globals.set_int(SYVVg + i, cost)
		end)

	SYVS:add_bare_item("",
		function()
			vehicle_status = globals.get_int(SYCKg + i)
			if vehicle_status ~= nil and vehicle_status == 1 then
				status = "Claimable"
			elseif vehicle_status ~= nil and vehicle_status == 0 then
				status = "Unclaimable"
			else
				status = "Unknown"
			end
			return "Vehicle " .. i .. " Status | 〔" .. status .. "〕"
		end,
		function()
			vehicle_status = globals.get_int(SYCKg + i)
			if vehicle_status ~= nil then
				if vehicle_status == 0 then
					globals.set_int(SYCKg + i, 1)
				else
					globals.set_int(SYCKg + i, 0)
				end
			end
		end, null, null)

	SYAS:add_bare_item("",
		function()
			status_id = stats.get_int(MPX() .. "SALV23_VEHROB_STATUS" .. i - 1)
			if localplayer ~= nil then
				status = yard_vehicle_statuses[status_id + 2]
			else
				status = yard_vehicle_statuses[1]
			end
			return "Vehicle " .. i .. " Status | 〔" .. status .. "〕"
		end,
		function()
			status_id = stats.get_int(MPX() .. "SALV23_VEHROB_STATUS" .. i - 1)
			if status_id ~= 1 then
				stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. i - 1, 0)
			end
		end, null, null)
end

	yard_vehicles = {
		"LM87 v1", "Cinquemila v1", "Autarch v1", "Tigon v1", "Champion v1",
		"10F v1", "SM722 v1", "Omnis e-GT v1", "Growler v1", "Deity v1",
		"Itali RSX v1", "Coquette D10 v1", "Jubilee v1", "Astron v1", "Comet S2 Cabrio v1",
		"Torero v1", "Cheetah Classic v1", "Turismo Classic v1", "Infernus Classic v1", "Stafford v1",
		"GT500 v1", "Viseris v1", "Mamba v1", "Coquette BlackFin v1", "Stinger GT v1",
		"Z-Type v1", "Broadway v1", "Vigero ZX v1", "Buffalo STX v1", "Ruston v1",
		"Gauntlet Hellfire v1", "Dominator GTT v1", "Roosevelt Valor v1", "Swinger v1", "Feltzer Classic v1",
		"Omnis v1", "Tropos Rallye v1", "Jugular v1", "Patriot Mil-Spec v1", "Toros v1",
		"Caracara 4x4 v1", "Sentinel Classic  v1", "Weevil v1", "Blista Kanjo v1", "Eudora v1",
		"Kamacho v1", "Hellion v1", "Ellie v1", "Hermes v1", "Hustler v1",
		"Turismo Omaggio v1", "Buffalo EVX v1", "Itali GTO Stinger TT v1", "Virtue v1", "Ignus v1",
		"Zentorno v1", "Neon v1", "Furia v1", "Zorrusso v1", "Thrax v1",
		"Vagner v1", "Panthere v1", "Itali GTO v1", "S80RR v1", "Tyrant v1",
		"Entity MT v1", "Torero XO v1", "Neo v1", "Corsita v1", "Paragon R v1",
		"Fränken Stange v1", "Comet Safari v1", "FR36 v1", "Hotring Everon v1", "Komoda v1",
		"Tailgater S v1", "Jester Classic v1", "Jester RR v1", "Euros v1", "ZR350 v1",
		"Cypher v1", "Dominator ASP v1", "Baller ST-D v1", "Casco v1", "Drift Yosemite v1",
		"Everon v1", "Penumbra FF v1", "V-STR v1", "Dominator GT v1", "Schlagen GT v1",
		"Cavalcade XL v1", "Clique v1", "Boor v1", "Sugoi v1", "Greenwood v1",
		"Brigham v1", "Issi Rally v1", "Seminole Frontier v1", "Kanjo SJ v1", "Previon v1",
		"LM87 v2", "Cinquemila v2", "Autarch v2", "Tigon v2", "Champion v2",
		"10F v2", "SM722 v2", "Omnis e-GT v2", "Growler v2", "Deity v2",
		"Itali RSX v2", "Coquette D10 v2", "Jubilee v2", "Astron v2", "Comet S2 Cabrio v2",
		"Torero v2", "Cheetah Classic v2", "Turismo Classic v2", "Infernus Classic v2", "Stafford v2",
		"GT500 v2", "Viseris v2", "Mamba v2", "Coquette BlackFin v2", "Stinger GT v2",
		"Z-Type v2", "Broadway v2", "Vigero ZX v2", "Buffalo STX v2", "Ruston v2",
		"Gauntlet Hellfire v2", "Dominator GTT v2", "Roosevelt Valor v2", "Swinger v2", "Feltzer Classic v2",
		"Omnis v2", "Tropos Rallye v2", "Jugular v2", "Patriot Mil-Spec v2", "Toros v2",
		"Caracara 4x4 v2", "Sentinel Classic  v2", "Weevil v2", "Blista Kanjo v2", "Eudora v2",
		"Kamacho v2", "Hellion v2", "Ellie v2", "Hermes v2", "Hustler v2",
		"Turismo Omaggio v2", "Buffalo EVX v2", "Itali GTO Stinger TT v2", "Virtue v2", "Ignus v2",
		"Zentorno v2", "Neon v2", "Furia v2", "Zorrusso v2", "Thrax v2",
		"Vagner v2", "Panthere v2", "Itali GTO v2", "S80RR v2", "Tyrant v2",
		"Entity MT v2", "Torero XO v2", "Neo v2", "Corsita v2", "Paragon R v2",
		"Fränken Stange v2", "Comet Safari v2", "FR36 v2", "Hotring Everon v2", "Komoda v2",
		"Tailgater S v2", "Jester Classic v2", "Jester RR v2", "Euros v2", "ZR350 v2",
		"Cypher v2", "Dominator ASP v2", "Baller ST-D v2", "Casco v2", "Drift Yosemite v2",
		"Everon v2", "Penumbra FF v2", "V-STR v2", "Dominator GT v2", "Schlagen GT v2",
		"Cavalcade XL v2", "Clique v2", "Boor v2", "Sugoi v2", "Greenwood v2",
		"Brigham v2", "Issi Rally v2", "Seminole Frontier v2", "Kanjo SJ v2", "Previon v2",
		"LM87 v3", "Cinquemila v3", "Autarch v3", "Tigon v3", "Champion v3",
		"10F v3", "SM722 v3", "Omnis e-GT v3", "Growler v3", "Deity v3",
		"Itali RSX v3", "Coquette D10 v3", "Jubilee v3", "Astron v3", "Comet S2 Cabrio v3",
		"Torero v3", "Cheetah Classic v3", "Turismo Classic v3", "Infernus Classic v3", "Stafford v3",
		"GT500 v3", "Viseris v3", "Mamba v3", "Coquette BlackFin v3", "Stinger GT v3",
		"Z-Type v3", "Broadway v3", "Vigero ZX v3", "Buffalo STX v3", "Ruston v3",
		"Gauntlet Hellfire v3", "Dominator GTT v3", "Roosevelt Valor v3", "Swinger v3", "Feltzer Classic v3",
		"Omnis v3", "Tropos Rallye v3", "Jugular v3", "Patriot Mil-Spec v3", "Toros v3",
		"Caracara 4x4 v3", "Sentinel Classic  v3", "Weevil v3", "Blista Kanjo v3", "Eudora v3",
		"Kamacho v3", "Hellion v3", "Ellie v3", "Hermes v3", "Hustler v3",
		"Turismo Omaggio v3", "Buffalo EVX v3", "Itali GTO Stinger TT v3", "Virtue v3", "Ignus v3",
		"Zentorno v3", "Neon v3", "Furia v3", "Zorrusso v3", "Thrax v3",
		"Vagner v3", "Panthere v3", "Itali GTO v3", "S80RR v3", "Tyrant v3",
		"Entity MT v3", "Torero XO v3", "Neo v3", "Corsita v3", "Paragon R v3",
		"Fränken Stange v3", "Comet Safari v3", "FR36 v3", "Hotring Everon v3", "Komoda v3",
		"Tailgater S v3", "Jester Classic v3", "Jester RR v3", "Euros v3", "ZR350 v3",
		"Cypher v3", "Dominator ASP v3", "Baller ST-D v3", "Casco v3", "Drift Yosemite v3",
		"Everon v3", "Penumbra FF v3", "V-STR v3", "Dominator GT v3", "Schlagen GT v3",
		"Cavalcade XL v3", "Clique v3", "Boor v3", "Sugoi v3", "Greenwood v3",
		"Brigham v3", "Issi Rally v3", "Seminole Frontier v3", "Kanjo SJ v3", "Previon v3",
		"LM87 v4", "Cinquemila v4", "Autarch v4", "Tigon v4", "Champion v4",
		"10F v4", "SM722 v4", "Omnis e-GT v4", "Growler v4", "Deity v4",
		"Itali RSX v4", "Coquette D10 v4", "Jubilee v4", "Astron v4", "Comet S2 Cabrio v4",
		"Torero v4", "Cheetah Classic v4", "Turismo Classic v4", "Infernus Classic v4", "Stafford v4",
		"GT500 v4", "Viseris v4", "Mamba v4", "Coquette BlackFin v4", "Stinger GT v4",
		"Z-Type v4", "Broadway v4", "Vigero ZX v4", "Buffalo STX v4", "Ruston v4",
		"Gauntlet Hellfire v4", "Dominator GTT v4", "Roosevelt Valor v4", "Swinger v4", "Feltzer Classic v4",
		"Omnis v4", "Tropos Rallye v4", "Jugular v4", "Patriot Mil-Spec v4", "Toros v4",
		"Caracara 4x4 v4", "Sentinel Classic  v4", "Weevil v4", "Blista Kanjo v4", "Eudora v4",
		"Kamacho v4", "Hellion v4", "Ellie v4", "Hermes v4", "Hustler v4",
		"Turismo Omaggio v4", "Buffalo EVX v4", "Itali GTO Stinger TT v4", "Virtue v4", "Ignus v4",
		"Zentorno v4", "Neon v4", "Furia v4", "Zorrusso v4", "Thrax v4",
		"Vagner v4", "Panthere v4", "Itali GTO v4", "S80RR v4", "Tyrant v4",
		"Entity MT v4", "Torero XO v4", "Neo v4", "Corsita v4", "Paragon R v4",
		"Fränken Stange v4", "Comet Safari v4", "FR36 v4", "Hotring Everon v4", "Komoda v4",
		"Tailgater S v4", "Jester Classic v4", "Jester RR v4", "Euros v4", "ZR350 v4",
		"Cypher v4", "Dominator ASP v4", "Baller ST-D v4", "Casco v4", "Drift Yosemite v4",
		"Everon v4", "Penumbra FF v4", "V-STR v4", "Dominator GT v4", "Schlagen GT v4",
		"Cavalcade XL v4", "Clique v4", "Boor v4", "Sugoi v4", "Greenwood v4",
		"Brigham v4", "Issi Rally v4", "Seminole Frontier v4", "Kanjo SJ v4", "Previon v4",
		"LM87 v5", "Cinquemila v5", "Autarch v5", "Tigon v5", "Champion v5",
		"10F v5", "SM722 v5", "Omnis e-GT v5", "Growler v5", "Deity v5",
		"Itali RSX v5", "Coquette D10 v5", "Jubilee v5", "Astron v5", "Comet S2 Cabrio v5",
		"Torero v5", "Cheetah Classic v5", "Turismo Classic v5", "Infernus Classic v5", "Stafford v5",
		"GT500 v5", "Viseris v5", "Mamba v5", "Coquette BlackFin v5", "Stinger GT v5",
		"Z-Type v5", "Broadway v5", "Vigero ZX v5", "Buffalo STX v5", "Ruston v5",
		"Gauntlet Hellfire v5", "Dominator GTT v5", "Roosevelt Valor v5", "Swinger v5", "Feltzer Classic v5",
		"Omnis v5", "Tropos Rallye v5", "Jugular v5", "Patriot Mil-Spec v5", "Toros v5",
		"Caracara 4x4 v5", "Sentinel Classic  v5", "Weevil v5", "Blista Kanjo v5", "Eudora v5",
		"Kamacho v5", "Hellion v5", "Ellie v5", "Hermes v5", "Hustler v5",
		"Turismo Omaggio v5", "Buffalo EVX v5", "Itali GTO Stinger TT v5", "Virtue v5", "Ignus v5",
		"Zentorno v5", "Neon v5", "Furia v5", "Zorrusso v5", "Thrax v5",
		"Vagner v5", "Panthere v5", "Itali GTO v5", "S80RR v5", "Tyrant v5",
		"Entity MT v5", "Torero XO v5", "Neo v5", "Corsita v5", "Paragon R v5",
		"Fränken Stange v5", "Comet Safari v5", "FR36 v5", "Hotring Everon v5", "Komoda v5",
		"Tailgater S v5", "Jester Classic v5", "Jester RR v5", "Euros v5", "ZR350 v5",
		"Cypher v5", "Dominator ASP v5", "Baller ST-D v5", "Casco v5", "Drift Yosemite v5",
		"Everon v5", "Penumbra FF v5", "V-STR v5", "Dominator GT v5", "Schlagen GT v5",
		"Cavalcade XL v5", "Clique v5", "Boor v5", "Sugoi v5", "Greenwood v5",
		"Brigham v5", "Issi Rally v5", "Seminole Frontier v5", "Kanjo SJ v5", "Previon v5"
	}
for i = 1, 500 do
	SYVT1:add_toggle(yard_vehicles[i],
		function()
			if i == globals.get_int(SYVTg + 1) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(SYVTg + 1, i)
		end)

	SYVT2:add_toggle(yard_vehicles[i],
		function()
			if i == globals.get_int(SYVTg + 2) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(SYVTg + 2, i)
		end)

	SYVT3:add_toggle(yard_vehicles[i],
		function()
			if i == globals.get_int(SYVTg + 3) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(SYVTg + 3, i)
		end)
end

SalvageYard:add_bare_item("",
	function()
		setup_price = globals.get_int(SYSPg)
		if setup_price ~= nil and setup_price == 0 then
			status = "On"
		else
			status = "Off"
		end
		return "Setup for Free | 〔" .. status .. "〕"
	end,
	function()
		setup_price = globals.get_int(SYSPg)
		if setup_price ~= nil and setup_price == 0 then
			globals.set_int(SYSPg, 20000)
		else
			globals.set_int(SYSPg, 0)
		end
	end, null, null)

	local function YardPrepsSetter(value)
		stats.set_int(MPX() .. "SALV23_GEN_BS", value)
		stats.set_int(MPX() .. "SALV23_SCOPE_BS", value)
		stats.set_int(MPX() .. "SALV23_FM_PROG", value)
		stats.set_int(MPX() .. "SALV23_INST_PROG", value)
	end

SalvageYard:add_action("Complete Preps", function() YardPrepsSetter(-1) end)

SalvageYard:add_action("Reset Preps", function() YardPrepsSetter(0) end)

SalvageYard:add_action("Cooldown Killer", function() globals_set_ints(SYCg1, SYCg2, 1, 0) end)

SalvageYard:add_action("Skip Weekly Cooldown",
	function()
		current_week = stats.get_int(MPX() .. "SALV23_WEEK_SYNC")
		globals.set_int(SYWCg, current_week + 1)
	end)

SalvageYard:add_action(SPACE, null)

SalvageYardNote = SalvageYard:add_submenu(README)

SalvageYardNote:add_action(" Do all actions before paying for the setup", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("                  Alter Robbery Type:", null)
SalvageYardNote:add_action("           Select mission type you want;", null)
SalvageYardNote:add_action("   do this outside salvage yard for results", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("                  Alter Vehicle Type:", null)
SalvageYardNote:add_action("           Select vehicle type you want;", null)
SalvageYardNote:add_action("   do this outside salvage yard for results", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("                  Alter Vehicle Status:", null)
SalvageYardNote:add_action(" Allows you to claim vehicle after robbery;", null)
SalvageYardNote:add_action("   do this outside salvage yard for results", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("                   Alter Vehicle Cost:", null)
SalvageYardNote:add_action("   Allows you to change vehicle sell value;", null)
SalvageYardNote:add_action("   do this outside salvage yard for results", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("               Alter Availability Status:", null)
SalvageYardNote:add_action("    Makes your mission «Available» again;", null)
SalvageYardNote:add_action("    changing «In Progress» isn't possible;", null)
SalvageYardNote:add_action("   do this outside salvage yard for results", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("                    Complete Preps:", null)
SalvageYardNote:add_action("   Pay for the preparation, wait till Jamal", null)
SalvageYardNote:add_action("    finishes talking, press «Esc» and then", null)
SalvageYardNote:add_action("               press «Complete Preps»", null)
SalvageYardNote:add_action(SPACE, null)
SalvageYardNote:add_action("                       Reset Preps:", null)
SalvageYardNote:add_action("          Computer bugged? unbrick it;", null)
SalvageYardNote:add_action("   do this outside salvage yard for results", null)

---Money Tool---

MoneyTool = SilentNight:add_submenu("♣ Money Tool")

--Bunker Crash--

BunkerCrash = MoneyTool:add_submenu("Bunker Crash | Safe")

BunkerCrash:add_action("Teleport to Laptop (use inside bunker)",
	function()
		TP(907.060000, -3207.460000, -98.490000, -1.500000, -0.000000, 0.000000)
		sleep(1)
		menu.send_key_press(69)
		sleep(7.5)
		menu.send_key_press(13)
	end)

BunkerCrash:add_action("Get Supplies", function() globals.set_int(GSIg + 6, 1) end)

		a50 = false
	local function BunkerTurkishSupplierToggler()
		if localplayer ~= nil then
			while a50 do
				globals.set_int(GSIg + 6, 1)
				menu.trigger_bunker_production()
				sleep(1)
			end
		end
	end
BunkerCrash:add_toggle("Turkish Supplier", function() return a50 end, function() a50 = not a50 BunkerTurkishSupplierToggler() end)

BunkerCrash:add_action("Instant Sell", function() GB:set_int(BCISl, 0) end)

LegalStats = BunkerCrash:add_submenu("Legal Stats")

LegalStats:add_bare_item("",
	function()
		if not localplayer then
			return "Sales Made/Undertaken: In Menu"
		else
			return "Sales Made/Undertaken: " .. stats.get_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC5") .. "/" .. stats.get_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC5")
		end
	end, null, null, null)
LegalStats:add_bare_item("",
	function()
		if not localplayer then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. MoneyFormatter(stats.get_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS5"))
		end
	end, null, null, null)

		new_sell_missions = 999
LegalStats:add_int_range("New Sell Missions", 10, 0, INT_MAX,
	function()
		return new_sell_missions
	end,
	function(missions)
		new_sell_missions = missions
	end)

		new_earnings = 19990000
LegalStats:add_int_range("New Earnings", 10000, 0, INT_MAX,
	function()
		return new_earnings
	end,
	function(earnings)
		new_earnings = earnings
	end)

LegalStats:add_action("Apply New Stats",
	function()
		if a50 == false then
			stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC5", new_sell_missions)
			stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC5", new_sell_missions)
			stats.set_int(MPX() .. "BUNKER_UNITS_MANUFAC", new_sell_missions * 100)
		end
		if a51 == false then
			stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS5", new_earnings)
		end
	end)

		a50 = false
LegalStats:add_toggle("Don't Apply Missions", function() return a50 end, function() a50 = not a50 end)

		a51 = false
LegalStats:add_toggle("Don't Apply Earnings", function() return a51 end, function() a51 = not a51 end)

LegalStats:add_action(SPACE, null)

LegalStatsNote = LegalStats:add_submenu(README)

LegalStatsNote:add_action("         To save the legal statistics, you", null)
LegalStatsNote:add_action("  need to make one more sale for $5,000+", null)

BunkerCrash:add_action(SPACE, null)

BunkerCrashNote = BunkerCrash:add_submenu(README)

BunkerCrashNote:add_action("                  Teleport to Laptop:", null)
BunkerCrashNote:add_action("   Use to tp to laptop inside your bunker;", null)
BunkerCrashNote:add_action("              it also automatically sits", null)
BunkerCrashNote:add_action("            down and opens the menu", null)
BunkerCrashNote:add_action(SPACE, null)
BunkerCrashNote:add_action("                       Get Supplies:", null)
BunkerCrashNote:add_action("               Use to refill your stock", null)
BunkerCrashNote:add_action(SPACE, null)
BunkerCrashNote:add_action("                    Turkish Supplier:", null)
BunkerCrashNote:add_action("          Use this to get goods; ≈1u/1s", null)
BunkerCrashNote:add_action(SPACE, null)
BunkerCrashNote:add_action("                        Instant Sell:", null)
BunkerCrashNote:add_action("Start the sale mission and then activate", null)

--Casino Master--

CasinoMaster = MoneyTool:add_submenu("Casino Master | Safe")

		a52 = 0
CasinoMaster:add_int_range("Acquire Chips Limit", 50000, 0, INT_MAX,
	function()
		return a52
	end,
	function(limit)
		globals_set_ints(CMACLg1, CMACLg2, 1, limit)
		a52 = limit
	end)

CasinoMaster:add_action("Bypass Casino Limits",
	function()
		stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
		stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
		stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
	end)

BlackJack = CasinoMaster:add_submenu("Blackjack")

	local function CasinoCardNameGetter(index)
		if index == 0 then
			return "Rolling..."
		end
		card_number = math.fmod(index, 13)
		card_name = ""
		card_suit = ""
		if card_number == 1 then
			card_name = "A"
		elseif card_number == 0 then
			card_name = "K"
		elseif card_number == 12 then
			card_name = "Q"
		elseif card_number == 11 then
			card_name = "J"
		else
			card_name = tostring(card_number)
		end
		if index >= 1 and index <= 13 then
			card_suit = "♣"
		elseif index >= 14 and index <= 26 then
			card_suit = "♦"
		elseif index >= 27 and index <= 39 then
			card_suit = "♥"
		elseif index >= 40 and index <= 52 then
			card_suit = "♠"
		end
		return card_name .. card_suit
	end

BlackJack:add_bare_item("",
	function()
		if localplayer ~= nil then
			current_table = BJ:get_int(CMBJPTl + 1 + (PlayerID() * CMBJPTSl) + 4)
			if current_table ~= nil and current_table ~= -1 then
				card = BJ:get_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 1)
				return "Dealer's Face Down Card: " .. CasinoCardNameGetter(card)
			else
				return "Dealer's Face Down Card: Unknown"
			end
		else
			return "Dealer's Face Down Card: Unknown"
		end
	end, null, null, null)

BlackJack:add_action("Trick The Dealer",
	function()
		if localplayer ~= nil then
			current_table = BJ:get_int(CMBJPTl + 1 + (PlayerID() * CMBJPTSl) + 4)
			if current_table ~= -1 then
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 1, 11)
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 2, 12)
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 3, 13)
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 12, 3)
			end
		end
	end)

LuckyWheel = CasinoMaster:add_submenu("Lucky Wheel")

		wheel_id = {
			-1, 0, 8,
			12, 16, 1,
			5, 9, 13,
			17, 2, 6,
			14, 19, 3,
			7, 10, 15,
			4, 11, 18
		}
		wheel_name = {
			"Select", "Clothing 1", "Clothing 2",
			"Clothing 3", "Clothing 4", "2,500 RP",
			"5,000 RP", "7,500 RP", "10,000 RP",
			"15,000 RP", "$20,000", "$30,000",
			"$40,000", "$50,000", "10,000 Chips",
			"15,000 Chips", "20,000 Chips", "25,000 Chips",
			"Discount",	"Mystery", "Vehicle"
		}

		a53 = 1
LuckyWheel:add_array_item("Select Prize (before «S»)", wheel_name,
	function()
		return a53
	end,
	function(prize)
		if localplayer ~= nil then
			prize_status = 117 + 1 + (PlayerID() * 5)
			if CLW:get_int(prize_status) ~= -1 then
				CLW:set_int(prize_status, wheel_id[prize])
				a53 = prize
			end
		end
	end)

		a54 = 1
LuckyWheel:add_array_item("⚠ Give Prize", wheel_name,
	function()
		return a54
	end,
	function(prize)
		CLW:set_int(CMGLPl1, wheel_id[prize])
		CLW:set_int(CMGLPl2, 11)
		a54 = 1
	end)

Poker = CasinoMaster:add_submenu("Poker")

	local function PokerCardsSetter(ID, current_table, card1, card2, card3)
		TCP:set_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 1 + (ID * 3), card1)
		TCP:set_int(CMPACl + CMPACDl + 1 + 1 + (current_table * CMPDSl) + 1 + (ID * 3), card1)
		TCP:set_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 2 + (ID * 3), card2)
		TCP:set_int(CMPACl + CMPACDl + 1 + 1 + (current_table * CMPDSl) + 2 + (ID * 3), card2)
		TCP:set_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 3 + (ID * 3), card3)
		TCP:set_int(CMPACl + CMPACDl + 1 + 1 + (current_table * CMPDSl) + 3 + (ID * 3), card3)
	end

	local function PokerDealersIDGetter(current_table)
		players = 0
		for i = 0, 31 do
			players_table = TCP:get_int(CMPTl + 1 + (i * CMPTSl) + 2)
			if i ~= PlayerID() and players_table == current_table then
				players = players + 1
			end
			return players + 1
		end
	end

Poker:add_bare_item("",
	function()
		if localplayer ~= nil then
			current_table = TCP:get_int(CMPTl + 1 + (PlayerID() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				card1 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 1 + (PlayerID() * 3))
				card2 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 2 + (PlayerID() * 3))
				card3 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 3 + (PlayerID() * 3))
				return "My Cards: " .. CasinoCardNameGetter(card1) .. " " .. CasinoCardNameGetter(card2) .. " " .. CasinoCardNameGetter(card3)
			else
				return "My Cards: Unknowns"
			end
		else
			return "My Cards: Unknowns"
		end
	end, null, null, null)
Poker:add_bare_item("",
	function()
		if localplayer ~= nil then
			current_table = TCP:get_int(CMPTl + 1 + (PlayerID() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				DealerID = PokerDealersIDGetter(current_table)
				card1 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 1 + (DealerID * 3))
				card2 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 2 + (DealerID * 3))
				card3 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 3 + (DealerID * 3))
				return "Dealer's Cards: " .. CasinoCardNameGetter(card1) .. " " .. CasinoCardNameGetter(card2) .. " " .. CasinoCardNameGetter(card3)
			else
				return "Dealer's Cards: Unknowns"
			end
		else
			return "Dealer's Cards: Unknowns"
		end
	end, null, null, null)

Poker:add_action("Give Straight Flush",
	function()
		if localplayer ~= nil then
			current_table = TCP:get_int(CMPTl + 1 + (PlayerID() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				PokerCardsSetter(PlayerID(), current_table, 50, 51, 52)
			end
		end
	end)

Poker:add_action("Trick The Dealer",
	function()
		if localplayer ~= nil then
			current_table = TCP:get_int(CMPTl + 1 + (PlayerID() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				DealerID = PokerDealersIDGetter(current_table)
				PokerCardsSetter(DealerID, current_table, 2, 17, 32)
			end
		end
	end)

Poker:add_action(SPACE, null)

PokerNote = Poker:add_submenu(README)

PokerNote:add_action("  Give Straight Flush and Trick The Dealer:", null)
PokerNote:add_action("       Use features during the animation", null)
PokerNote:add_action("              where you sit in the chair", null)

Roulette = CasinoMaster:add_submenu("Roulette")

Roulette:add_action("Land On Black 13 (after 00:00)",
	function()
		if localplayer ~= nil then
			for i = 0, 6 do
				CR:set_int(CMRMTl + CMROTl + CMRBTl + i, 13)
			end
		end
	end)

SlotMachines = CasinoMaster:add_submenu("Slot Machines")

	local function SlotsStatusSetter(value)
		if localplayer ~= nil then
			for i = 3, 196 do
				if i ~= 67 and i ~= 132 then
					CS:set_int(CMSRRTl + i, value)
				end
			end
		end
	end

SlotMachines:add_action("⚠ Rig Slots", function() SlotsStatusSetter(6) end)

SlotMachines:add_action("Lose Slots", function() SlotsStatusSetter(0) end)

--Hangar Cargo VIP--

HangarCargoVIP = MoneyTool:add_submenu("Hangar Cargo VIP | Safe")

HangarCargoVIP:add_action("Start Solo Session", function() SessionChanger(8) end)

HangarCargoVIP:add_action("Get Some Cargo", function() stats_set_packed_bool(36828, true) end)

		b13 = false
	local function HangarCargoLoopToggler()
		while b13 do
			stats_set_packed_bool(36828, true)
			sleep(1)
		end
	end
HangarCargoVIP:add_toggle("Cargo Loop", function() return b13 end, function() b13 = not b13 HangarCargoLoopToggler() end)

PricePerPiece = HangarCargoVIP:add_submenu("⚠ Price per Piece (max 4mil)")

		hangar_cargo = {"Animal Materials", "Art n Antiques", "Chemicals", "Counterfeit Goods", "Jewel n Gems", "Medical Supplies", "Narcotics", "Tabacco n Alcohol"}
for i = 1, 8 do
	PricePerPiece:add_int_range(hangar_cargo[i], 30000, 0, 4000000,
		function()
			return globals.get_int(HCVPg + i)
		end,
		function(price)
			globals.set_int(HCVPg + i, price)
		end)
end

HangarCargoVIP:add_int_range("Instant Air Cargo Sell", 1, 0, 15,
	function()
		return 0
	end,
	function(delivered)
		globals.set_float(HCVRCg, 0)
		GS:set_int(HCVISl1, delivered)
		sleep(1)
		GS:set_int(HCVISl2, -1)
	end)

LegalStats2 = HangarCargoVIP:add_submenu("Legal Stats")

LegalStats2:add_bare_item("",
	function()
		if not localplayer then
			return "Buy Made/Undertaken: In Menu"
		else
			return "Buy Made/Undertaken: " .. stats.get_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET") .. "/" .. stats.get_int(MPX() .. "LFETIME_HANGAR_BUY_UNDETAK")
		end
	end, null, null, null)
LegalStats2:add_bare_item("",
	function()
		if not localplayer then
			return "Sales Made/Undertaken: In Menu"
		else
			return "Sales Made/Undertaken: " .. stats.get_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET") .. "/" .. stats.get_int(MPX() .. "LFETIME_HANGAR_SEL_UNDETAK")
		end
	end, null, null, null)
LegalStats2:add_bare_item("",
	function()
		if not localplayer then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. MoneyFormatter(stats.get_int(MPX() .. "LFETIME_HANGAR_EARNINGS"))
		end
	end, null, null, null)

		new_buy_missions = 1000
LegalStats2:add_int_range("New Buy Missions", 10, 0, INT_MAX,
	function()
		return new_buy_missions
	end,
	function(missions)
		new_buy_missions = missions
	end)

		new_sell_missions2 = 999
LegalStats2:add_int_range("New Sell Missions", 10, 0, INT_MAX,
	function()
		return new_sell_missions2
	end,
	function(missions)
		new_sell_missions2 = missions
	end)

		new_earnings2 = 19970000
LegalStats2:add_int_range("New Earnings", 30000, 0, INT_MAX,
	function()
		return new_earnings2
	end,
	function(earnings)
		new_earnings2 = earnings
	end)

LegalStats2:add_action("Apply New Stats",
	function()
		if b14 == false then
			stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET", new_buy_missions)
			stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_UNDETAK", new_buy_missions)
			stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET", new_sell_missions2)
			stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_UNDETAK", new_sell_missions2)
		end
		if b15 == false then
			stats.set_int(MPX() .. "LFETIME_HANGAR_EARNINGS", new_earnings2)
		end
	end)

		b14 = false
LegalStats2:add_toggle("Don't Apply Missions", function() return b14 end, function() b14 = not b14 end)

		b15 = false
LegalStats2:add_toggle("Don't Apply Earnings", function() return b15 end, function() b15 = not b15 end)

LegalStats2:add_action(SPACE, null)

LegalStats2Note = LegalStats2:add_submenu(README)

LegalStats2Note:add_action("         To save the legal statistics, you", null)
LegalStats2Note:add_action(" need to make one more sale for $30,000+", null)

HangarCargoVIP:add_action(SPACE, null)

HangarCargoVIPNote = HangarCargoVIP:add_submenu(README)

HangarCargoVIPNote:add_action("                   Start Solo Session:", null)
HangarCargoVIPNote:add_action("        Use if you aren't alone in session", null)
HangarCargoVIPNote:add_action(SPACE, null)
HangarCargoVIPNote:add_action("                Instant Air Cargo Sell:", null)
HangarCargoVIPNote:add_action("      Select number of «Total Delivered»", null)

--Money Editor--

MoneyEditor = MoneyTool:add_submenu("Money Editor | Safe")

CashRemover = MoneyEditor:add_submenu("Cash Remover (Real)")

		list_0_9 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
		list_0_8 = {0, 1, 2, 3, 4, 5, 6, 7, 8}

		def_num1 = list_0_9[1]
		def_num_cur1 = 1
CashRemover:add_array_item("Number #1", list_0_9,
	function()
		return def_num_cur1
	end,
	function(number1)
		def_num1 = list_0_9[number1]
		def_num_cur1 = number1
	end)

		def_num2 = list_0_9[1]
		def_num_cur2 = 1
CashRemover:add_array_item("Number #2", list_0_9,
	function()
		return def_num_cur2
	end,
	function(number2)
		def_num2 = list_0_9[number2]
		def_num_cur2 = number2
	end)

		def_num3 = list_0_9[1]
		def_num_cur3 = 1
CashRemover:add_array_item("Number #3", list_0_9,
	function()
		return def_num_cur3
	end,
	function(number3)
		def_num3 = list_0_9[number3]
		def_num_cur3 = number3
	end)

		def_num4 = list_0_9[1]
		def_num_cur4 = 1
CashRemover:add_array_item("Number #4", list_0_9,
	function()
		return def_num_cur4
	end,
	function(number4)
		def_num4 = list_0_9[number4]
		def_num_cur4 = number4
	end)

		def_num5 = list_0_9[1]
		def_num_cur5 = 1
CashRemover:add_array_item("Number #5", list_0_9,
	function()
		return def_num_cur5
	end,
	function(number5)
		def_num5 = list_0_9[number5]
		def_num_cur5 = number5
	end)

		def_num6 = list_0_9[1]
		def_num_cur6 = 1
CashRemover:add_array_item("Number #6", list_0_9,
	function()
		return def_num_cur6
	end,
	function(number6)
		def_num6 = list_0_9[number6]
		def_num_cur6 = number6
	end)

		def_num7 = list_0_9[1]
		def_num_cur7 = 1
CashRemover:add_array_item("Number #7", list_0_9,
	function()
		return def_num_cur7
	end,
	function(number7)
		def_num7 = list_0_9[number7]
		def_num_cur7 = number7
	end)

		def_num8 = list_0_9[1]
		def_num_cur8 = 1
CashRemover:add_array_item("Number #8", list_0_9,
	function()
		return def_num_cur8
	end,
	function(number8)
		def_num8 = list_0_9[number8]
		def_num_cur8 = number8
	end)

		def_num9 = list_0_9[1]
		def_num_cur9 = 1
CashRemover:add_array_item("Number #9", list_0_9,
	function()
		return def_num_cur9
	end,
	function(number9)
		def_num9 = list_0_9[number9]
		def_num_cur9 = number9
	end)

		def_num10 = list_0_9[1]
		def_num_cur10 = 1
CashRemover:add_array_item("Number #10", list_0_9,
	function()
		return def_num_cur10
	end,
	function(number10)
		def_num10 = list_0_9[number10]
		def_num_cur10 = number10
	end)

CashRemover:add_bare_item("",
	function()
		cash_to_remove = tonumber(def_num1 .. def_num2 .. def_num3 .. def_num4 .. def_num5 .. def_num6 .. def_num7 .. def_num8 .. def_num9 .. def_num10)
		if cash_to_remove > INT_MAX then
			cash_to_remove = INT_MAX
		end
		return "Remove Cash: $" ..  MoneyFormatter(cash_to_remove)
	end,
	function()
		globals.set_int(CRg, cash_to_remove)
		if a55 == true then
			sleep(1)
			def_num_cur1 = 1
			def_num_cur2 = 1
			def_num_cur3 = 1
			def_num_cur4 = 1
			def_num_cur5 = 1
			def_num_cur6 = 1
			def_num_cur7 = 1
			def_num_cur8 = 1
			def_num_cur9 = 1
			def_num_cur10 = 1
			def_num1 = list_0_9[1]
			def_num2 = list_0_9[1]
			def_num3 = list_0_9[1]
			def_num4 = list_0_9[1]
			def_num5 = list_0_9[1]
			def_num6 = list_0_9[1]
			def_num7 = list_0_9[1]
			def_num8 = list_0_9[1]
			def_num9 = list_0_9[1]
			def_num10 = list_0_9[1]
		end
	end, null, null)

		a55 = true
CashRemover:add_toggle("Reset Value", function() return a55 end, function() a55 = not a55 end)

CashRemover:add_action(SPACE, null)

CashRemoverNote = CashRemover:add_submenu(README)

CashRemoverNote:add_action("                        Reset Value:", null)
CashRemoverNote:add_action("  Resets «Remove Cash» value after using", null)

StoryCharacters = MoneyEditor:add_submenu("Story Characters (Real)")

		story_characters = {"Michael", "Franklin", "Trevor"}
for i = 1, 3 do
	StoryCharacters:add_int_range(story_characters[i] .. "'s Cash", 1000000, 0, INT_MAX,
	function()
		return stats.get_int("SP" .. i - 1 .. "_TOTAL_CASH")
	end,
	function(cash)
		stats.set_int("SP" .. i - 1 .. "_TOTAL_CASH", cash)
	end)
end

Totals = MoneyEditor:add_submenu("Earned n Spent (Stats)")

		totals_earned = {"Not Selected", "MPPLY_TOTAL_EVC", "MONEY_EARN_JOBS", "MONEY_EARN_SELLING_VEH", "MONEY_EARN_BETTING", "MONEY_EARN_GOOD_SPORT", "MONEY_EARN_PICKED_UP"}
		earned_from = totals_earned[1]
		a57 = 1
Totals:add_array_item("Earned From", {"Select", "Total", "Jobs", "Selling Vehicles", "Betting", "Good Sport", "Picked Up"},
	function()
		return a57
	end,
	function(selected_from)
		earned_from = totals_earned[selected_from]
		spent_on = totals_spent[1]
		a57 = selected_from
		a58 = 1
	end)

		totals_spent = {
			"Not Selected", "MPPLY_TOTAL_SVC", "MONEY_SPENT_WEAPON_ARMOR", "MONEY_SPENT_VEH_MAINTENANCE", "MONEY_SPENT_STYLE_ENT", "MONEY_SPENT_PROPERTY_UTIL",
			"MONEY_SPENT_JOB_ACTIVITY", "MONEY_SPENT_BETTING", "MONEY_SPENT_CONTACT_SERVICE", "MONEY_SPENT_HEALTHCARE", "MONEY_SPENT_DROPPED_STOLEN"
		}
		spent_on = totals_spent[1]
		a58 = 1
Totals:add_array_item("Spent On", {"Select", "Total", "Weapons n Armor", "Vehicles n Maintenance", "Style n Entertainment", "Property n Utilities", "Job n Activity Entry Fees", "Betting", "Contact Services", "Healthcare n Bail", "Dropped or Stolen"},
	function()
		return a58
	end,
	function(selected_spent)
		spent_on = totals_spent[selected_spent]
		earned_from = totals_earned[1]
		a58 = selected_spent
		a57 = 1
	end)

Totals:add_bare_item("",
	function()
		if a57 == 1 then
			return "Current Earned: " .. earned_from
		elseif a57 == 2 then
			return "Current Total Earned: $" .. MoneyFormatter(stats.get_int(earned_from))
		else
			return "Current Earned: $" .. MoneyFormatter(stats.get_int(MPX() .. earned_from))
		end
	end, null, null, null)
Totals:add_bare_item("",
	function()
		if a58 == 1 then
			return "Current Spent: " .. spent_on
		elseif a58 == 2 then
			return "Current Total Spent: $" .. MoneyFormatter(stats.get_int(spent_on))
		else
			return "Current Spent: $" .. MoneyFormatter(stats.get_int(MPX() .. spent_on))
		end
	end, null, null, null)

		def_num11 = list_0_9[1]
		def_num_cur11 = 1
Totals:add_array_item("Number #1", list_0_9,
	function()
		return def_num_cur11
	end,
	function(number11)
		def_num11 = list_0_9[number11]
		def_num_cur11 = number11
	end)

		def_num12 = list_0_9[1]
		def_num_cur12 = 1
Totals:add_array_item("Number #2", list_0_9,
	function()
		return def_num_cur12
	end,
	function(number12)
		def_num12 = list_0_9[number12]
		def_num_cur12 = number12
	end)

		def_num13 = list_0_9[1]
		def_num_cur13 = 1
Totals:add_array_item("Number #3", list_0_9,
	function()
		return def_num_cur13
	end,
	function(number13)
		def_num13 = list_0_9[number13]
		def_num_cur13 = number13
	end)

		def_num14 = list_0_9[1]
		def_num_cur14 = 1
Totals:add_array_item("Number #4", list_0_9,
	function()
		return def_num_cur14
	end,
	function(number14)
		def_num14 = list_0_9[number14]
		def_num_cur14 = number14
	end)

		def_num15 = list_0_9[1]
		def_num_cur15 = 1
Totals:add_array_item("Number #5", list_0_9,
	function()
		return def_num_cur15
	end,
	function(number15)
		def_num15 = list_0_9[number15]
		def_num_cur15 = number15
	end)

		def_num16 = list_0_9[1]
		def_num_cur16 = 1
Totals:add_array_item("Number #6", list_0_9,
	function()
		return def_num_cur16
	end,
		function(number16)
	def_num16 = list_0_9[number16]
		def_num_cur16 = number16
	end)

		def_num17 = list_0_9[1]
		def_num_cur17 = 1
Totals:add_array_item("Number #7", list_0_9,
	function()
		return def_num_cur17
	end,
	function(number17)
		def_num17 = list_0_9[number17]
		def_num_cur17 = number17
	end)

		def_num18 = list_0_9[1]
		def_num_cur18 = 1
Totals:add_array_item("Number #8", list_0_9,
	function()
		return def_num_cur18
	end,
	function(number18)
		def_num18 = list_0_9[number18]
		def_num_cur18 = number18
	end)

		def_num19 = list_0_9[1]
		def_num_cur19 = 1
Totals:add_array_item("Number #9", list_0_9,
	function()
		return def_num_cur19
	end,
	function(number19)
		def_num19 = list_0_9[number19]
		def_num_cur19 = number19
	end)

		def_num20 = list_0_9[1]
		def_num_cur20 = 1
Totals:add_array_item("Number #10", list_0_9,
	function() return def_num_cur20 end, function(number20)
		def_num20 = list_0_9[number20]
		def_num_cur20 = number20
	end)

Totals:add_bare_item("",
	function()
		cash_to_change = tonumber(def_num11 .. def_num12 .. def_num13 .. def_num14 .. def_num15 .. def_num16 .. def_num17 .. def_num18 .. def_num19 .. def_num20)
		if cash_to_change > INT_MAX then
			cash_to_change = INT_MAX
		end
		return "Change Value: $" .. MoneyFormatter(cash_to_change)
	end,
	function()
		if a57 == 1 then
			if a58 == 2 then
				stats.set_int(spent_on, cash_to_change)
			else
				stats.set_int(MPX() .. spent_on, cash_to_change)
			end
		else
			if a57 == 2 then
				stats.set_int(earned_from, cash_to_change)
			else
				stats.set_int(MPX() .. earned_from, cash_to_change)
			end
		end
		if a59 == true then
			sleep(1)
			def_num_cur11 = 1
			def_num_cur12 = 1
			def_num_cur13 = 1
			def_num_cur14 = 1
			def_num_cur15 = 1
			def_num_cur16 = 1
			def_num_cur17 = 1
			def_num_cur18 = 1
			def_num_cur19 = 1
			def_num_cur20 = 1
			def_num11 = list_0_9[1]
			def_num12 = list_0_9[1]
			def_num13 = list_0_9[1]
			def_num14 = list_0_9[1]
			def_num15 = list_0_9[1]
			def_num16 = list_0_9[1]
			def_num17 = list_0_9[1]
			def_num18 = list_0_9[1]
			def_num19 = list_0_9[1]
			def_num20 = list_0_9[1]
		end
	end, null, null)

		a59 = true
Totals:add_toggle("Reset Value", function() return a59 end, function() a59 = not a59 end)

Totals:add_action("Make Total Earned n Spent The Same", function() stats.set_int("MPPLY_TOTAL_EVC", stats.get_int("MPPLY_TOTAL_SVC")) end)

Totals:add_action("Make Total Spent n Earned The Same", function() stats.set_int("MPPLY_TOTAL_SVC", stats.get_int("MPPLY_TOTAL_EVC")) end)

Totals:add_action(SPACE, null)

TotalsNote = Totals:add_submenu(README)

TotalsNote:add_action("   To save the new statistics, you need to", null)
TotalsNote:add_action("    earn or spend somehow some money", null)
TotalsNote:add_action(SPACE, null)
TotalsNote:add_action("                        Reset Value:", null)
TotalsNote:add_action("  Resets «Change Value» value after using", null)

--Nightclub Helper--

NightclubHelper = MoneyTool:add_submenu("Nightclub Helper | Safe")

NightclubHelperInfo = NightclubHelper:add_submenu("Data Collector")

NightclubHelperInfo:add_bare_item("",
	function()
		return "Popularity: " .. math.floor(stats.get_int(MPX() .. "CLUB_POPULARITY") / 10) .. "%"
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		return "Safe: $" .. MoneyFormatter(stats.get_int(MPX() .. "CLUB_SAFE_CASH_VALUE"))
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		cargo_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_0")
		if cargo_amount == 0 then
			return "Cargo n Shipments: $0 (0/50)"
		else
			return "Cargo n Shipments: $" .. MoneyFormatter(globals.get_int(NHCNSg) * cargo_amount) .. " (" .. cargo_amount .. "/50)"
		end
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		sporting_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_1")
		if sporting_amount == 0 then
			return "Sporting Goods: $0 (0/100)"
		else
			return "Sporting Goods: $" .. MoneyFormatter(globals.get_int(NHSGg) * sporting_amount) .. " (" .. sporting_amount .. "/100)"
		end
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		imports_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_2")
		if imports_amount == 0 then
			return "S.A. Imports: $0 (0/10)"
		else
			return "S.A. Imports: $" .. MoneyFormatter(globals.get_int(NHSAIg) * imports_amount) .. " (" .. imports_amount .. "/10)"
		end
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		pharmaceut_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_3")
		if pharmaceut_amount == 0 then
			return "Pharmaceut. Research: $0 (0/20)"
		else
			return "Pharmaceut. Research: $" .. MoneyFormatter(globals.get_int(NHPRg) * pharmaceut_amount) .. " (" .. pharmaceut_amount .. "/20)"
		end
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		organic_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_4")
		if organic_amount == 0 then
			return "Organic Produce: $0 (0/80)"
		else
			return "Organic Produce: $" .. MoneyFormatter(globals.get_int(NHOPg) * organic_amount) .. " (" .. organic_amount .. "/80)"
		end
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		printing_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_5")
		if printing_amount == 0 then
			return "Printing n Copying: $0 (0/60)"
		else
			return "Printing n Copying: $" .. MoneyFormatter(globals.get_int(NHPNCg) * printing_amount) .. " (" .. printing_amount .. "/60)"
		end
	end, null, null, null)
NightclubHelperInfo:add_bare_item("",
	function()
		cash_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_6")
		if cash_amount == 0 then
			return "Cash Creation: $0 (0/40)"
		else
			return "Cash Creation: $" .. MoneyFormatter(globals.get_int(NHCCg) * cash_amount) .. " (" .. cash_amount .. "/40)"
		end
	end, null, null, null)

NightclubHelper:add_action("Start Solo Session", function() SessionChanger(8) end)

		a60 = false
	local function NightclubCooldownKiller(Enabled)
		if Enabled then
			globals.set_int(NHCKg1, 0)
			globals_set_ints(NHCKg2, NHCKg3, 1, 0)
		else
			globals.set_int(NHCKg1, 300000)
			globals_set_ints(NHCKg2, NHCKg3, 1, 300000)
		end
	end
NightclubHelper:add_toggle("Cooldown Killer", function() return a60 end, function() a60 = not a60 NightclubCooldownKiller(a60) end)

		a61 = false
	local function NightclubTurkishSupplierToggler()
		while a61 do
			menu.trigger_nightclub_production()
			sleep(10)
		end
	end
NightclubHelper:add_toggle("Turkish Supplier", function() return a61 end, function() a61 = not a61 NightclubTurkishSupplierToggler() end)

		a62 = 1
NightclubHelper:add_array_item("Popularity", {"Select", "Max", "Min"},
	function()
		return a62
	end,
	function(popularity)
		if popularity == 2 then
			stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
		elseif popularity == 3 then
			stats.set_int(MPX() .. "CLUB_POPULARITY", 0)
		end
	end)

		a63 = 1
NightclubHelper:add_array_item("Safe", {"Select", "Fill", "Collect (inside only)"},
	function()
		return a63
	end,
	function(safe)
		if safe == 2 then
			stats.set_int(MPX() .. "CLUB_POPULARITY", 0)
			sleep(0.2)
			globals.set_int(NLISg, 300000)
			globals.set_int(NLSCg, 300000)
			stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
			a63 = safe
		elseif safe == 3 then
			AMN:set_int(NLCl, 1)
			a63 = 1
		end
	end)

		a64 = 1
NightclubHelper:add_array_item("⚠ Max Payout (4mil)", {"Select", "Cargo n Shipments", "Sporting Goods", "S.A. Imports", "Pharmaceut. Research", "Organic Produce", "Printing n Copying", "Cash Creation"},
	function()
		return a64
	end,
	function(payout)
		if localplayer ~= nil then
			if payout == 2 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_0") ~= 0 then
				globals.set_int(NHCNSg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_0")))
			elseif payout == 3 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_1") ~= 0 then
				globals.set_int(NHSGg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_1")))
			elseif payout == 4 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_2") ~= 0 then
				globals.set_int(NHSAIg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_2")))
			elseif payout == 5 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_3") ~= 0 then
				globals.set_int(NHPRg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_3")))
			elseif payout == 6 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_4") ~= 0 then
				globals.set_int(NHOPg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_4")))
			elseif payout == 7 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_5") ~= 0 then
				globals.set_int(NHPNCg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_5")))
			elseif payout == 8 and stats.get_int(MPX() .. "HUB_PROD_TOTAL_6") ~= 0 then
				globals.set_int(NHCCg, math.floor(4000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_6")))
			end
		end
		a64 = payout
	end)

NightclubHelper:add_action("Default Payout",
	function()
		globals.set_int(NHCNSg, 10000)
		globals.set_int(NHSGg, 5000)
		globals.set_int(NHSAIg, 27000)
		globals.set_int(NHPRg, 11475)
		globals.set_int(NHOPg, 2025)
		globals.set_int(NHPNCg, 10000)
		globals.set_int(NHCCg, 4725)
	end)

LegalStats3 = NightclubHelper:add_submenu("Legal Stats")

LegalStats3:add_bare_item("",
	function()
		if not localplayer then
			return "Sales Made: In Menu"
		else
			return "Sales Made: " .. stats.get_int(MPX() .. "HUB_SALES_COMPLETED")
		end
	end, null, null, null)
LegalStats3:add_bare_item("",
	function()
		if not localplayer then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. MoneyFormatter(stats.get_int(MPX() .. "HUB_EARNINGS"))
		end
	end, null, null, null)

		new_sell_missions3 = 999
LegalStats3:add_int_range("New Sell Missions", 10, 0, INT_MAX,
	function()
		return new_sell_missions3
	end,
	function(missions)
		new_sell_missions3 = missions
	end)

		new_earnings3 = 19990000
LegalStats3:add_int_range("New Earnings", 10000, 0, INT_MAX,
	function()
		return new_earnings3
	end,
	function(earnings)
		new_earnings3 = earnings
	end)

LegalStats3:add_action("Apply New Stats",
	function()
		if a65 == false then
			stats.set_int(MPX() .. "HUB_SALES_COMPLETED", new_sell_missions3)
		end
		if a66 == false then
			stats.set_int(MPX() .. "HUB_EARNINGS", new_earnings3)
		end
	end)

		a65 = false
LegalStats3:add_toggle("Don't Apply Missions", function() return a65 end, function() a65 = not a65 end)

		a66 = false
LegalStats3:add_toggle("Don't Apply Earnings", function() return a66 end, function() a66 = not a66 end)

LegalStats3:add_action(SPACE, null)

LegalStats3Note = LegalStats3:add_submenu(README)

LegalStats3Note:add_action("         To save the legal statistics, you", null)
LegalStats3Note:add_action("  need to make one more sale for $5,000+", null)

NightclubHelper:add_action(SPACE, null)

NightclubHelperNote = NightclubHelper:add_submenu(README)

NightclubHelperNote:add_action("                   Start Solo Session:", null)
NightclubHelperNote:add_action("        Use if you aren't alone in session", null)
NightclubHelperNote:add_action(SPACE, null)
NightclubHelperNote:add_action("                    Turkish Supplier:", null)
NightclubHelperNote:add_action("         Use this to get goods; ≈1p/10s", null)

--Special Cargo VIP--

SpecialCargoVIP = MoneyTool:add_submenu("Special Cargo VIP | Safe")

AFKMode = SpecialCargoVIP:add_submenu("AFK Mode")

		cargo_delays = {0.5, 1, 2, 3}

		def_delay = cargo_delays[1]
		a67 = 1
AFKMode:add_array_item("Delay", {"Default", "Fast", "Medium", "Slow"},
	function()
		return a67
	end,
	function(delay)
		def_delay = cargo_delays[delay]
		a67 = delay
	end)

		def_warehouse = 1
		a68 = 1
AFKMode:add_array_item("Warehouse Type", {"Select", "Small (16)", "Medium (42)", "Large (111)"},
	function()
		return a68
	end,
	function(warehouse)
		if warehouse ~= 1 then
			def_warehouse = warehouse - 1
		end
		a68 = warehouse
	end)

		def_cash = 0
		a69 = 0
AFKMode:add_int_range("Required Cash", 6000000, 0, 996000000,
	function()
		return a69
	end,
	function(cash)
		def_cash = cash
		a69 = cash
	end)

		inf_mode = true
AFKMode:add_toggle("Infinity $$$", function() return inf_mode end, function() inf_mode = not inf_mode end)

		keyboard = {W = 87, S = 83, A = 65, D = 68, E = 69}
		stop_loop = 0
		a70 = false
	local function CargoAfkMode(part, option1, option2)
		if part == 1 then
			globals.set_int(SCVPg, 6000000)
			globals_set_ints(SCVCKg1, SCVCKg2, 1, 0)
			globals_set_ints(BTEg1, BTEg3, 1, 0)
		elseif part == 2 then
			ASS:set_int(SCVAl1, 1)
			sleep(0.2)
			ASS:set_int(SCVAl2, 1)
			sleep(0.2)
			ASS:set_int(SCVAl3, 3012)
		elseif part == 3 then
			if option2 == false then
				globals.set_float(XMg, 1)
			else
				globals.set_float(XMg, 0)
			end
			GCS:set_int(SCVAl4, 1)
			GCS:set_int(SCVAl5, 1)
			GCS:set_int(SCVAl6, 0)
			GCS:set_int(SCVMTl, 7)
			sleep(def_delay)
			GCS:set_int(SCVISl, 99999)
			if option1 == false then
				stats_set_packed_bools(32359, 32363, true)
			end
			sleep(2)
		elseif part == 4 then
			GCS:set_int(SCVISl, 99999)
			menu.send_key_down(keyboard.S)
			sleep(1.5)
			menu.send_key_up(keyboard.S)
		end
	end
	local function CargoAfkModeToggler()
		total_cash = stats.get_int("MPPLY_TOTAL_EVC")
		save_total_cash = total_cash
		required_cash = save_total_cash + def_cash
		if a70 == false then
			stop_loop = 1
			return
		end
		if def_warehouse == 1 then
			while stop_loop == 0 do
				if AMW:is_active() then
					CargoAfkMode(1, crate_back, no_rp)
					if AMW:is_active() then
						menu.send_key_down(keyboard.D)
						sleep(1.8)
						menu.send_key_up(keyboard.D)
						menu.send_key_press(keyboard.E)
						if ASS:is_active() then
							CargoAfkMode(2, crate_back, no_rp)
						end
						if GCS:is_active() then
							CargoAfkMode(3, crate_back, no_rp)
							if not AMW:is_active() then
								CargoAfkMode(4, crate_back, no_rp)
								if inf_mode == false then
									if stats.get_int("MPPLY_TOTAL_EVC") >= required_cash then
										stop_loop = 1
										a70 = false
									else
										stop_loop = 0
									end
								end
							end
						end
					end
				end
			end
			stop_loop = 0
		end
		if def_warehouse == 2 then
			while stop_loop == 0 do
				if AMW:is_active() then
					CargoAfkMode(1, crate_back, no_rp)
					if AMW:is_active() then
						menu.send_key_down(keyboard.D)
						sleep(1.6)
						menu.send_key_down(keyboard.W)
						sleep(0.8)
						menu.send_key_up(keyboard.D)
						menu.send_key_up(keyboard.W)
						menu.send_key_press(keyboard.E)
						if ASS:is_active() then
							CargoAfkMode(2, crate_back, no_rp)
						end
						if GCS:is_active() then
							CargoAfkMode(3, crate_back, no_rp)
							if not AMW:is_active() then
								CargoAfkMode(4, crate_back, no_rp)
								if inf_mode == false then
									if stats.get_int("MPPLY_TOTAL_EVC") >= required_cash then
										stop_loop = 1
										a70 = false
									else
										stop_loop = 0
									end
								end
							end
						end
					end
				end
			end
			stop_loop = 0
		end
		if def_warehouse == 3 then
			while stop_loop == 0 do
				if AMW:is_active() then
					CargoAfkMode(1, crate_back, no_rp)
					if AMW:is_active() then
						menu.send_key_down(keyboard.W)
						menu.send_key_down(keyboard.A)
						sleep(0.8)
						menu.send_key_up(keyboard.W)
						menu.send_key_up(keyboard.A)
						menu.send_key_press(keyboard.E)
						if ASS:is_active() then
							CargoAfkMode(2, crate_back, no_rp)
						end
						if GCS:is_active() then
							CargoAfkMode(3, crate_back, no_rp)
							if not AMW:is_active() then
								CargoAfkMode(4, crate_back, no_rp)
								if inf_mode == false then
									if stats.get_int("MPPLY_TOTAL_EVC") >= required_cash then
										stop_loop = 1
										a70 = false
									else
										stop_loop = 0
									end
								end
							end
						end
					end
				end
			end
		end
		stop_loop = 0
	end
AFKMode:add_toggle("⚠ Toggle AFK Mode (buggy)", function() return a70 end, function() a70 = not a70 CargoAfkModeToggler(a70) end)

AFKMode:add_action(SPACE, null)

AFKModeNote = AFKMode:add_submenu(README)

AFKModeNote:add_action("                            Delay:", null)
AFKModeNote:add_action("  Change this if you aren't getting money", null)
AFKModeNote:add_action(SPACE, null)
AFKModeNote:add_action("                   Warehouse Type:", null)
AFKModeNote:add_action("           Select your warehouse type", null)
AFKModeNote:add_action(SPACE, null)
AFKModeNote:add_action("                     Required Cash:", null)
AFKModeNote:add_action("     Choose amount of money you want", null)
AFKModeNote:add_action("               to get with AFK mode", null)
AFKModeNote:add_action(SPACE, null)
AFKModeNote:add_action("                        Infinity $$$:", null)
AFKModeNote:add_action("           Activates infinite AFK mode;", null)
AFKModeNote:add_action("  ignores the setting of the option above", null)
AFKModeNote:add_action(SPACE, null)
AFKModeNote:add_action("                  Toggle AFK Mode:", null)
AFKModeNote:add_action("     Activate when your character enters", null)
AFKModeNote:add_action("  and completely stops in the warehouse;", null)
AFKModeNote:add_action("          don't move the camera before", null)
AFKModeNote:add_action("               and during activation", null)
AFKModeNote:add_action(SPACE, null)

EasterEgg = AFKModeNote:add_submenu("Easter Egg")

EasterEgg:add_action(" Woah, you found me! Take this prize then:", null)
EasterEgg:add_action("                   Receive The Prize",
	function()
		globals.set_int(CLg, 1)
		sleep(10)
		menu.suicide_player()
	end)

Settings = SpecialCargoVIP:add_submenu("Settings")

Settings:add_action("Start Solo Session", function() SessionChanger(8) end)

		crate_back = false
Settings:add_toggle("Disable CrateBack", function() return crate_back end, function() crate_back = not crate_back end)

		no_rp = true
Settings:add_toggle("Disable RP Gain", function() return no_rp end, function() no_rp = not no_rp end)

GetCrates = Settings:add_submenu("Get Crates")

GetCrates:add_action("1-3 per Press", function() stats_set_packed_bools(32359, 32363, true) end)

		a71 = false
	local function CargoCratesLoopToggler()
		while a71 do
			stats_set_packed_bools(32359, 32363, true)
			sleep(1)
		end
	end
GetCrates:add_toggle("Crates Loop", function() return a71 end, function() a71 = not a71 CargoCratesLoopToggler() end)

		a72 = 1
GetCrates:add_int_range("Instant Buy", 1, 1, 111,
	function()
		return a72
	end,
	function(crates)
		GCB:set_int(SCVIBl1, 1)
		GCB:set_int(SCVIBl2, crates)
		GCB:set_int(SCVIBl3, 6)
		GCB:set_int(SCVIBl4, 4)
		a72 = crates
	end)

GetCrates:add_action(SPACE, null)

GetCratesNote = GetCrates:add_submenu(README)

GetCratesNote:add_action("                       Instant Buy:", null)
GetCratesNote:add_action("       Start the buy mission first, select", null)
GetCratesNote:add_action("      the number of crates and activate", null)

LegalStats4 = Settings:add_submenu("Legal Stats")

LegalStats4:add_bare_item("",
	function()
		if not localplayer then
			return "Buy Made/Undertaken: In Menu"
		else
			return "Buy Made/Undertaken: " .. stats.get_int(MPX() .. "LIFETIME_BUY_COMPLETE") .. "/" .. stats.get_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN")
		end
	end, null, null, null)
LegalStats4:add_bare_item("",
	function()
		if not localplayer then
			return "Sales Made/Undertaken: In Menu"
		else
			return "Sales Made/Undertaken: " .. stats.get_int(MPX() .. "LIFETIME_SELL_COMPLETE") .. "/" .. stats.get_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN")
		end
	end, null, null, null)
LegalStats4:add_bare_item("",
	function()
		if not localplayer then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. MoneyFormatter(stats.get_int(MPX() .. "LIFETIME_CONTRA_EARNINGS"))
		end
	end, null, null, null)

		new_buy_missions2 = 1000
LegalStats4:add_int_range("New Buy Missions", 10, 0, INT_MAX,
	function()
		return new_buy_missions2
	end,
	function(missions)
		new_buy_missions2 = missions
	end)

		new_sell_missions4 = 999
LegalStats4:add_int_range("New Sell Missions", 10, 0, INT_MAX,
	function()
		return new_sell_missions4
	end,
	function(missions)
		new_sell_missions4 = missions
	end)

		new_earnings4 = 19990000
LegalStats4:add_int_range("New Earnings", 10000, 0, INT_MAX,
	function()
		return new_earnings3
	end,
	function(earnings)
		new_earnings3 = earnings
	end)

LegalStats4:add_action("Apply New Stats",
	function()
		if a73 == false then
			stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", new_buy_missions2)
			stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", new_buy_missions2)
			stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", new_sell_missions4)
			stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", new_sell_missions4)
		end
		if a74 == false then
			stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", new_earnings4)
		end
	end)

		a73 = false
LegalStats4:add_toggle("Don't Apply Missions", function() return a73 end, function() a73 = not a73 end)

		a74 = false
LegalStats4:add_toggle("Don't Apply Earnings", function() return a74 end, function() a74 = not a74 end)

LegalStats4:add_action(SPACE, null)

LegalStats4Note = LegalStats4:add_submenu(README)

LegalStats4Note:add_action("         To save the legal statistics, you", null)
LegalStats4Note:add_action(" need to make one more sale for $10,000+", null)

Settings:add_action("Clean Office",
	function()
		stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", 1)
		stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", 1)
		stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", 1)
		stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", 1)
		stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", 1)
		sleep(2)
		SessionChanger(8)
	end)

Settings:add_action(SPACE, null)

SettingsNote = Settings:add_submenu(README)

SettingsNote:add_action("                   Start Solo Session:", null)
SettingsNote:add_action("        Use if you aren't alone in session", null)
SettingsNote:add_action(SPACE, null)
SettingsNote:add_action("                   Disable CrateBack:", null)
SettingsNote:add_action(" Disables the return of crates after its sale", null)
SettingsNote:add_action(SPACE, null)
SettingsNote:add_action("                    Disable RP Gain:", null)
SettingsNote:add_action("           Disables earning experience", null)
SettingsNote:add_action(SPACE, null)
SettingsNote:add_action("                       Clean Office:", null)
SettingsNote:add_action("       Removes money from your office;", null)
SettingsNote:add_action("   to save the result, make one more sale", null)

ManualMode = SpecialCargoVIP:add_submenu("Manual Mode")

		def_delay2 = cargo_delays[1]
		a75 = 1
ManualMode:add_array_item("Delay", {"Default", "Fast", "Medium", "Slow"},
	function()
		return a75
	end,
	function(delay)
		def_delay2 = cargo_delays[delay]
		a75 = delay
	end)

		a76 = false
	local function CargoCooldownKiller(Enabled)
		if Enabled then
			globals_set_ints(SCVCKg1, SCVCKg2, 1, 0)
		else
			globals.set_int(SCVCKg1, 300000)
			globals.set_int(SCVCKg2, 1800000)
		end
	end
ManualMode:add_toggle("Cooldown Killer", function() return a76 end, function() a76 = not a76 CargoCooldownKiller(a76) end)

		cargo_values = {0, 10000, 3000000, 6000000, 3330000}
		a77 = 1
	local function CargoPriceSetter(price)
		for i = 0, 4 do
			if stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) > 0 then
				stats.set_int(MPX() .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) - 1)
			end
		end
		globals.set_int(SCVPg, price)
	end
ManualMode:add_array_item("⚠ Set Price", {"Select", "Min", "Half", "Max", "Max Legal"},
	function()
		return a77
	end,
	function(price)
		if price ~= 1 then
			CargoPriceSetter(cargo_values[price])
		end
		a77 = price
	end)

ManualMode:add_bare_item("",
	function()
		if cargo_values[a77] == 0 then
			return "Price per Crate: Not Selected"
		else
			return "Price per Crate: $" .. MoneyFormatter(cargo_values[a77])
		end
	end, null, null, null)

ManualMode:add_action("Instant Sell",
	function()
		if no_rp == false then
			globals.set_float(XMg, 1)
		else
			globals.set_float(XMg, 0)
		end
		if crate_back == false then
			if GCS:is_active() then
				stats_set_packed_bools(32359, 32363, true)
			end
		end
		GCS:set_int(SCVMTl, 7)
		sleep(def_delay2)
		GCS:set_int(SCVISl, 99999)
		sleep(3)
		for i = 0, 4 do
			if stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) > 0 then
				stats.set_int(MPX() .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) - 1)
			end
		end
		GCS:set_int(SCVISl, 99999)
	end)

ManualMode:add_action(SPACE, null)

ManualModeNote = ManualMode:add_submenu(README)

ManualModeNote:add_action("                            Delay:", null)
ManualModeNote:add_action("  Change this if you aren't getting money", null)
ManualModeNote:add_action(SPACE, null)
ManualModeNote:add_action("                        Instant Sell:", null)
ManualModeNote:add_action("        Always choose to sell one crate;", null)
ManualModeNote:add_action("      start the sale mission first, activate", null)
ManualModeNote:add_action("            after leaving the warehouse", null)

--Cheap Loop--

CheapLoop = MoneyTool:add_submenu("Cheap Loop | Safe")

		cheap_delays = {3, 2, 1}
		cheap_delay = cheap_delays[1]
		a78 = 1
CheapLoop:add_array_item("Delay", {"Default", "Faster", "Flash"},
	function()
		return a78
	end,
	function(delay)
		cheap_delay = cheap_delays[delay]
		a78 = delay
	end)

		money_count2 = 0
		def_cash2 = 0
		a79 = 0
CheapLoop:add_int_range("Required Chips (0 - inf)", 50000, 0, INT_MAX,
	function()
		return a79
	end,
	function(cash)
		def_cash2 = cash
		money_count2 = 0
		a79 = cash
	end)

		money_made2 = 0
		a80 = false
	local function CheapLoopToggler()
		if localplayer ~= nil then
			while a80 do
				if def_cash2 > 0 then
					if money_count2 >= def_cash2 then
						a80 = false
						a79 = 0
						def_cash2 = 0
						break
					end
				end
				money_made2 = money_made2 + 5
				money_count2 = money_count2 + 5000
				globals.set_int(CLg, 1)
				sleep(cheap_delay)
			end
		end
	end
CheapLoop:add_toggle("5k chips/3s (AFK)", function() return a80 end, function() a80 = not a80 CheapLoopToggler() end)

CheapLoop:add_bare_item("",
	function()
		if money_made2 ~= 0 then
			return "Chips Made: " .. MoneyFormatter(money_made2 .. "000")
		else
			return "Chips Made: " .. MoneyFormatter(money_made2)
		end
	end, null, null, null)

CheapLoop:add_action(SPACE, null)

CheapLoopNote = CheapLoop:add_submenu(README)

CheapLoopNote:add_action("                     Required Cash:", null)
CheapLoopNote:add_action("     Сhoose amount of money you want", null)
CheapLoopNote:add_action("               to get with AFK mode", null)
CheapLoopNote:add_action(SPACE, null)
CheapLoopNote:add_action("                        Chips Made:", null)
CheapLoopNote:add_action("     Reselect the option to see the result;", null)
CheapLoopNote:add_action("       works better with «Default» delay", null)

--Death Loop--

DeathLoop = MoneyTool:add_submenu("Death Loop | Safe")

		gaymers_delays = {1, 0.66, 0.33}
		death_delay = gaymers_delays[1]
		a81 = 1
DeathLoop:add_array_item("Delay", {"Default", "Faster", "Flash"},
	function()
		return a81
	end,
	function(delay)
		death_delay = gaymers_delays[delay]
		a81 = delay
	end)

		money_count3 = 0
		def_cash3 = 0
		a82 = 0
DeathLoop:add_int_range("Required Cash (0 - inf)", 100000, 0, INT_MAX,
	function()
		return a82
	end,
	function(cash)
		def_cash3 = cash
		money_count3 = 0
		a82 = cash
	end)

	local function TransactionSetter(hash, amount)
		globals.set_int(TTg + 1, INT_MAX)
		globals.set_int(TTg + 7, INT_MAX + 1)
		globals.set_int(TTg + 6, 0)
		globals.set_int(TTg + 5, 0)
		globals.set_int(TTg + 3, hash)
		globals.set_int(TTg + 2, amount)
		globals.set_int(TTg, 1)
	end

		money_made3 = 0
		a83 = false
	local function DeathLoopToggler()
		if localplayer ~= nil then
			while a83 do
				if def_cash3 > 0 then
					if money_count3 >= def_cash3 then
						a83 = false
						a82 = 0
						def_cash3 = 0
						break
					end
				end
				money_made3 = money_made3 + 5
				money_count3 = money_count3 + 50000
				TransactionSetter(0x610F9AB4, 50000)
				sleep(death_delay)
			end
		end
	end
DeathLoop:add_toggle("$50k/1s (AFK)", function() return a83 end, function() a83 = not a83 DeathLoopToggler() end)

DeathLoop:add_bare_item("",
	function()
		if money_made3 ~= 0 then
			return "Money Made: $" .. MoneyFormatter(money_made3 .. "0000")
		else
			return "Money Made: $" .. MoneyFormatter(money_made3)
		end
	end, null, null, null)

DeathLoop:add_action(SPACE, null)

DeathLoopNote = DeathLoop:add_submenu(README)

DeathLoopNote:add_action("                     Required Cash:", null)
DeathLoopNote:add_action("     Сhoose amount of money you want", null)
DeathLoopNote:add_action("               to get with AFK mode", null)
DeathLoopNote:add_action(SPACE, null)
DeathLoopNote:add_action("                       Money Made:", null)
DeathLoopNote:add_action("     Reselect the option to see the result;", null)
DeathLoopNote:add_action("       works better with «Default» delay", null)

--Night Loop--

NightLoop = MoneyTool:add_submenu("Night Loop | Safe")

		night_delays = {0.9, 1.2, 1.5, 1.8}
		night_delay = night_delays[1]
		a84 = 1
NightLoop:add_array_item("Delay", {"Default", "Fast", "Medium", "Slow"},
	function()
		return a84
	end,
	function(delay)
		night_delay = night_delays[delay]
		a84 = delay
	end)

		bypass_error = false
NightLoop:add_toggle("Bypass Transaction Error", function()	return bypass_error end, function() bypass_error = not bypass_error end)

		money_count4 = 0
		def_cash4 = 0
		a85 = 0
NightLoop:add_int_range("Required Cash (0 - inf)", 300000, 0, INT_MAX,
	function()
		return a85
	end,
	function(cash)
		def_cash4 = cash
		money_count4 = 0
		a85 = cash
	end)

		money_made4 = 0
		a86 = false
	local function NightLoopToggler()
		if localplayer ~= nil then
			while a86 do
				safe_value = 1845263 + (PlayerID() * 877) + 267 + 354 + 6
				for i = NLISg, NLIEg do
					globals.set_int(i, 300000)
				end
				globals.set_int(NLSCg, 300000)
				stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
				sleep(night_delay)
				if globals.get_int(safe_value) ~= 0 then
					if bypass_error == true then
						globals_set_ints(BTEg1, BTEg3, 1, 0)
					end
					if def_cash4 > 0 then
						if money_count4 >= def_cash4 then
							a86 = false
							a85 = 0
							def_cash4 = 0
							break
						end
					end
					money_made4 = money_made4 + 3
					money_count4 = money_count4 + 300000
					AMN:set_int(NLCl, 1)
					sleep(night_delay)
				end
			end
		end
	end
NightLoop:add_toggle("$300k/2s (AFK)", function() return a86 end, function() a86 = not a86 NightLoopToggler() end)

NightLoop:add_bare_item("",
	function()
		if money_made4 ~= 0 then
			return "Money Made: $" .. MoneyFormatter(money_made4 .. "00000")
		else
			return "Money Made: $" .. MoneyFormatter(money_made4)
		end
	end, null, null, null)

NightLoop:add_action(SPACE, null)

NightLoopNote = NightLoop:add_submenu(README)

NightLoopNote:add_action("  Come inside your nightclub and activate", null)
NightLoopNote:add_action(SPACE, null)
NightLoopNote:add_action("                            Delay:", null)
NightLoopNote:add_action("  Change this if you aren't getting money", null)
NightLoopNote:add_action(SPACE, null)
NightLoopNote:add_action("              Bypass Transaction Error:", null)
NightLoopNote:add_action(" Toggle this if you're still getting an error", null)
NightLoopNote:add_action(SPACE, null)
NightLoopNote:add_action("                     Required Cash:", null)
NightLoopNote:add_action("     Сhoose amount of money you want", null)
NightLoopNote:add_action("               to get with AFK mode", null)
NightLoopNote:add_action(SPACE, null)
NightLoopNote:add_action("                       Money Made:", null)
NightLoopNote:add_action("     Reselect the option to see the result;", null)
NightLoopNote:add_action("       works better with «Default» delay", null)

--OP Loop--

OPLoop = MoneyTool:add_submenu("OP Loop | Safe")

		op_delay = gaymers_delays[1]
		a87 = 1
OPLoop:add_array_item("Delay", {"Default", "Faster", "Flash"},
	function()
		return a87
	end,
	function(delay)
		op_delay = gaymers_delays[delay]
		a87 = delay
	end)

		money_count5 = 0
		def_cash5 = 0
		a88 = 0
OPLoop:add_int_range("Required Cash (0 - inf)", 1000000, 0, INT_MAX,
	function()
		return a88
	end,
	function(cash)
		def_cash5 = cash
		money_count5 = 0
		a88 = cash
	end)

		money_made5 = 0
		a89 = false
	local function OPLoopToggler()
		if localplayer ~= nil then
			while a89 do
				if def_cash5 > 0 then
					if money_count5 >= def_cash5 then
						a89 = false
						a88 = 0
						def_cash5 = 0
						break
					end
				end
				money_made5 = money_made5 + 1
				money_count5 = money_count5 + 1000000
				TransactionSetter(0x615762F1, 1000000)
				sleep(op_delay)
			end
		end
	end
OPLoop:add_toggle("$1m/1s (AFK)", function() return a89 end, function() a89 = not a89 OPLoopToggler() end)

OPLoop:add_bare_item("",
	function()
		if money_made5 ~= 0 then
			return "Money Made: $" .. MoneyFormatter(money_made5 .. "000000")
		else
			return "Money Made: $" .. MoneyFormatter(money_made5)
		end
	end, null, null, null)

OPLoop:add_action(SPACE, null)

OPLoopNote = OPLoop:add_submenu(README)

OPLoopNote:add_action("                     Required Cash:", null)
OPLoopNote:add_action("     Сhoose amount of money you want", null)
OPLoopNote:add_action("               to get with AFK mode", null)
OPLoopNote:add_action(SPACE, null)
OPLoopNote:add_action("                       Money Made:", null)
OPLoopNote:add_action("     Reselect the option to see the result;", null)
OPLoopNote:add_action("       works better with «Default» delay", null)

--Orbital Loop--

OrbitalRefund = MoneyTool:add_submenu("Orbital Loop | Detected")

		a90 = false
	local function OrbitalLoopToggler()
		if localplayer ~= nil then
			while a90 do
				globals.set_int(ORg, 2)
				sleep(3)
				globals.set_int(ORg, 0)
				sleep(30)
			end
		end
	end
OrbitalRefund:add_toggle("$500k/30s (AFK)", function() return a90 end, function() a90 = not a90 OrbitalLoopToggler() end)

---Unlock Tool---

UnlockTool = SilentNight:add_submenu("♦ Unlock Tool")

--Character's Stats--

CharactersStats = UnlockTool:add_submenu("Character's Stats | Safe")

--Achievements--

Achievements = CharactersStats:add_submenu("Achievements")

Achievements1b1 = Achievements:add_submenu("Unlock One By One")

		achievements = {
			"Welcome to Los Santos", "A Friendship Resurrected", "A Fair Day's Pay", "The Moment of Truth", "To Live or Die in Los Santos",
			"Diamond Hard", "Subversive", "Blitzed", "Small Town, Big Job", "The Government Gimps",
			"The Big One!", "Solid Gold, Baby!", "Career Criminal", "San Andreas Sightseer", "All's Fare in Love and War",
			"TP Industries Arms Race", "Multi-Disciplined", "From Beyond the Stars", "A Mystery, Solved", "Waste Management",
			"Red Mist", "Show Off", "Kifflom!", "Three Man Army", "Out of Your Depth",
			"Altruist Acolyte", "A Lot of Cheddar", "Trading Pure Alpha", "Pimp My Sidearm", "Wanted: Alive Or Alive",
			"Los Santos Customs", "Close Shave", "Off the Plane", "Three-Bit Gangster", "Making Moves",
			"Above the Law", "Numero Uno", "The Midnight Club", "Unnatural Selection", "Backseat Driver",
			"Run Like The Wind", "Clean Sweep", "Decorated", "Stick Up Kid", "Enjoy Your Stay",
			"Crew Cut", "Full Refund", "Dialling Digits", "American Dream", "A New Perspective",
			"Be Prepared", "In the Name of Science", "Dead Presidents", "Parole Day", "Shot Caller",
			"Four Way", "Live a Little", "Can't Touch This", "Mastermind", "Vinewood Visionary",
			"Majestic", "Humans of Los Santos", "First Time Director",  "Animal Lover", "Ensemble Piece",
			"Cult Movie", "Location Scout", "Method Actor", "Cryptozoologist", "Getting Started",
			"The Data Breaches", "The Bogdan Problem", "The Doomsday Scenario", "A World Worth Saving", "Orbital Obliteration",
			"Elitist", "Masterminds"
		}
for i = 1, 77 do
	Achievements1b1:add_action(achievements[i], function() globals.set_int(AUg, i) end)
end

		a91 = false
	local function AchievementUnlocker()
		while a91 do
			for i = 1, 77 do
				globals.set_int(AUg, i)
			end
		sleep(1)
		end
	end
Achievements:add_toggle("Unlock All", function() return a91 end, function() a91 = not a91 AchievementUnlocker() end)

Achievements:add_action(SPACE, null)

AchievementsNote = Achievements:add_submenu(README)

AchievementsNote:add_action("                         Unlock All:", null)
AchievementsNote:add_action("  Unlocks all achievements auto; ≈10 mins", null)

--Awards--

Awards = CharactersStats:add_submenu("Awards")

Awards1b1 = Awards:add_submenu("Unlock One By One")

	local function AwardsVictoryMpx(v1, v2, v3, v4)
		stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", v1)
		stats.set_int(MPX() .. "AWD_FM_DM_WINS", v2)
		stats.set_int(MPX() .. "AWD_FM_TDM_WINS", v2)
		stats.set_int(MPX() .. "AWD_FM_TDM_MVP", v2)
		stats.set_int(MPX() .. "AWD_RACES_WON", v2)
		stats.set_int(MPX() .. "AWD_FM_GTA_RACES_WON", v2)
		stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", v2)
		stats.set_int(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE", v2)
		stats.set_int(MPX() .. "AWD_CARS_EXPORTED", v2)
		stats.set_int(MPX() .. "AWD_WIN_CAPTURES", v2)
		stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", v2)
		stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", v2)
		stats.set_int(MPX() .. "AWD_FMWINAIRRACE", v3)
		stats.set_int(MPX() .. "AWD_FMWINSEARACE", v3)
		stats.set_int(MPX() .. "AWD_NO_ARMWRESTLING_WINS", v3)
		stats.set_int(MPX() .. "MOST_ARM_WRESTLING_WINS", v3)
		stats.set_int(MPX() .. "AWD_WIN_AT_DARTS", v3)
		stats.set_int(MPX() .. "AWD_FM_GOLF_WON", v3)
		stats.set_int(MPX() .. "AWD_FM_TENNIS_WON", v3)
		stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_CT_WON", v3)
		stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_RT_WON", v3)
		stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_TG_WON", v3)
		stats.set_int(MPX() .. "AWD_WIN_CAPTURE_DONT_DYING", v3)
		stats.set_int(MPX() .. "AWD_KILL_TEAM_YOURSELF_LTS", v3)
		stats.set_int(MPX() .. "AIR_LAUNCHES_OVER_40M", v3)
		stats.set_int(MPX() .. "AWD_LESTERDELIVERVEHICLES", v3)
		stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", v3)
		stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", v3)
		stats.set_int(MPX() .. "AWD_FMWINRACETOPOINTS", v3)
		stats.set_int(MPX() .. "AWD_FM_RACE_LAST_FIRST", v3)
		stats.set_int(MPX() .. "AWD_FMHORDWAVESSURVIVE", v4)
	end
	local function AwardsVictoryMpply(v1, v2, v3, v4, v5, v6, v7)
		stats.set_int("MPPLY_FM_MISSION_LIKES", v1)
		stats.set_int("MPPLY_SHOOTINGRANGE_TOTAL_MATCH", v2)
		stats.set_int("MPPLY_DARTS_TOTAL_MATCHES", v3)
		stats.set_int("MPPLY_TOTAL_TDEATHMATCH_WON", v4)
		stats.set_int("MPPLY_DARTS_TOTAL_WINS", v4)
		stats.set_int("MPPLY_RACE_2_POINT_WINS", v4)
		stats.set_int("MPPLY_MISSIONS_CREATED", v4)
		stats.set_int("MPPLY_LTS_CREATED", v4)
		stats.set_int("MPPLY_GOLF_WINS", v4)
		stats.set_int("MPPLY_BJ_WINS", v4)
		stats.set_int("MPPLY_TENNIS_MATCHES_WON", v4)
		stats.set_int("MPPLY_SHOOTINGRANGE_WINS", v4)
		stats.set_int("MPPLY_TOTAL_DEATHMATCH_WON", v4)
		stats.set_int("MPPLY_TOTAL_CUSTOM_RACES_WON", v4)
		stats.set_int("MPPLY_TOTAL_RACES_WON", v4)
		stats.set_int("MPPLY_TOTAL_RACES_LOST", v5)
		stats.set_int("MPPLY_TOTAL_DEATHMATCH_LOST", v5)
		stats.set_int("MPPLY_TOTAL_TDEATHMATCH_LOST", v5)
		stats.set_int("MPPLY_SHOOTINGRANGE_LOSSES", v5)
		stats.set_int("MPPLY_TENNIS_MATCHES_LOST", v5)
		stats.set_int("MPPLY_GOLF_LOSSES", v5)
		stats.set_int("MPPLY_BJ_LOST", v5)
		stats.set_int("MPPLY_RACE_2_POINT_LOST", v5)
		stats.set_int("MPPLY_KILLS_PLAYERS", v6)
		stats.set_int("MPPLY_DEATHS_PLAYER", v7)
	end
	local function AwardsVictoryBool(v)
		stats.set_bool(MPX() .. "AWD_FMKILL3ANDWINGTARACE", v)
		stats.set_bool(MPX() .. "AWD_FMWINCUSTOMRACE", v)
		stats.set_bool(MPX() .. "CL_RACE_MODDED_CAR", v)
		stats.set_bool(MPX() .. "AWD_FMRACEWORLDRECHOLDER", v)
		stats.set_bool(MPX() .. "AWD_FMWINALLRACEMODES", v)
		stats.set_bool(MPX() .. "AWD_FM_TENNIS_5_SET_WINS", v)
		stats.set_bool(MPX() .. "AWD_FM_TENNIS_STASETWIN", v)
		stats.set_bool(MPX() .. "AWD_FM_SHOOTRANG_GRAN_WON", v)
		stats.set_bool(MPX() .. "AWD_FMWINEVERYGAMEMODE", v)
	end
Awards1b1:add_action("Victory",
	function()
		AwardsVictoryMpx(100, 50, 25, 10)
		AwardsVictoryMpply(1500, 800, 750, 500, 250, 3593, 1002)
		AwardsVictoryBool(true)
	end)

	local function AwardsGeneralMpx(v1, v2, v3, v4, v5, v6)
		stats.set_int(MPX() .. "AWD_FMBBETWIN", v1)
		stats.set_int(MPX() .. "BOUNTPLACED", v2)
		stats.set_int(MPX() .. "BETAMOUNT", v2)
		stats.set_int(MPX() .. "CRARMWREST", v2)
		stats.set_int(MPX() .. "CRBASEJUMP", v2)
		stats.set_int(MPX() .. "CRDARTS", v2)
		stats.set_int(MPX() .. "CRDM", v2)
		stats.set_int(MPX() .. "CRGANGHIDE", v2)
		stats.set_int(MPX() .. "CRGOLF", v2)
		stats.set_int(MPX() .. "CRHORDE", v2)
		stats.set_int(MPX() .. "CRMISSION", v2)
		stats.set_int(MPX() .. "CRSHOOTRNG", v2)
		stats.set_int(MPX() .. "CRTENNIS", v2)
		stats.set_int(MPX() .. "NO_TIMES_CINEMA", v2)
		stats.set_int(MPX() .. "BOUNTSONU", v3)
		stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", v4)
		stats.set_int(MPX() .. "AWD_PICKUP_CAP_PACKAGES", v4)
		stats.set_int(MPX() .. "NO_PHOTOS_TAKEN", v4)
		stats.set_int(MPX() .. "AWD_MENTALSTATE_TO_NORMAL", v5)
		stats.set_int(MPX() .. "CR_DIFFERENT_DM", v6)
		stats.set_int(MPX() .. "CR_DIFFERENT_RACES", v6)
		stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_20M", v6)
		stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_50M", v6)
		stats.set_int(MPX() .. "AWD_FMBASEJMP", v6)
		stats.set_int(MPX() .. "AWD_FM_GOLF_BIRDIES", v6)
		stats.set_int(MPX() .. "AWD_FM_TENNIS_ACE", v6)
		stats.set_int(MPX() .. "AWD_LAPDANCES", v6)
		stats.set_int(MPX() .. "AWD_FMCRATEDROPS", v6)
		stats.set_int(MPX() .. "AWD_NO_HAIRCUTS", v6)
		stats.set_int(MPX() .. "AWD_TRADE_IN_YOUR_PROPERTY", v6)
	end
	local function AwardsGeneralMpply(v1, v2, v3)
		stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", v1)
		stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", v2)
		stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", v2)
		stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", v3)
	end
	local function AwardsGeneralBool(v)
		stats.set_bool(MPX() .. "AWD_DAILYOBJWEEKBONUS", v)
		stats.set_bool(MPX() .. "AWD_DAILYOBJMONTHBONUS", v)
		stats.set_bool(MPX() .. "CL_DRIVE_RALLY", v)
		stats.set_bool(MPX() .. "CL_PLAY_GTA_RACE", v)
		stats.set_bool(MPX() .. "CL_PLAY_BOAT_RACE", v)
		stats.set_bool(MPX() .. "CL_PLAY_FOOT_RACE", v)
		stats.set_bool(MPX() .. "CL_PLAY_TEAM_DM", v)
		stats.set_bool(MPX() .. "CL_PLAY_VEHICLE_DM", v)
		stats.set_bool(MPX() .. "CL_PLAY_MISSION_CONTACT", v)
		stats.set_bool(MPX() .. "CL_PLAY_A_PLAYLIST", v)
		stats.set_bool(MPX() .. "CL_PLAY_POINT_TO_POINT", v)
		stats.set_bool(MPX() .. "CL_PLAY_ONE_ON_ONE_DM", v)
		stats.set_bool(MPX() .. "CL_PLAY_ONE_ON_ONE_RACE", v)
		stats.set_bool(MPX() .. "CL_SURV_A_BOUNTY", v)
		stats.set_bool(MPX() .. "CL_SET_WANTED_LVL_ON_PLAY", v)
		stats.set_bool(MPX() .. "CL_GANG_BACKUP_GANGS", v)
		stats.set_bool(MPX() .. "CL_GANG_BACKUP_LOST", v)
		stats.set_bool(MPX() .. "CL_GANG_BACKUP_VAGOS", v)
		stats.set_bool(MPX() .. "CL_CALL_MERCENARIES", v)
		stats.set_bool(MPX() .. "CL_PHONE_MECH_DROP_CAR", v)
		stats.set_bool(MPX() .. "CL_GONE_OFF_RADAR", v)
		stats.set_bool(MPX() .. "CL_FILL_TITAN", v)
		stats.set_bool(MPX() .. "CL_MOD_CAR_USING_APP", v)
		stats.set_bool(MPX() .. "CL_MOD_CAR_USING_APP", v)
		stats.set_bool(MPX() .. "CL_BUY_INSURANCE", v)
		stats.set_bool(MPX() .. "CL_BUY_GARAGE", v)
		stats.set_bool(MPX() .. "CL_ENTER_FRIENDS_HOUSE", v)
		stats.set_bool(MPX() .. "CL_CALL_STRIPPER_HOUSE", v)
		stats.set_bool(MPX() .. "CL_CALL_FRIEND", v)
		stats.set_bool(MPX() .. "CL_SEND_FRIEND_REQUEST", v)
		stats.set_bool(MPX() .. "CL_W_WANTED_PLAYER_TV", v)
		stats.set_bool(MPX() .. "FM_INTRO_CUT_DONE", v)
		stats.set_bool(MPX() .. "FM_INTRO_MISS_DONE", v)
		stats.set_bool(MPX() .. "SHOOTINGRANGE_SEEN_TUT", v)
		stats.set_bool(MPX() .. "TENNIS_SEEN_TUTORIAL", v)
		stats.set_bool(MPX() .. "DARTS_SEEN_TUTORIAL", v)
		stats.set_bool(MPX() .. "ARMWRESTLING_SEEN_TUTORIAL", v)
		stats.set_bool(MPX() .. "HAS_WATCHED_BENNY_CUTSCE", v)
		stats.set_bool(MPX() .. "AWD_FM25DIFFERENTRACES", v)
		stats.set_bool(MPX() .. "AWD_FM25DIFFERENTDM", v)
		stats.set_bool(MPX() .. "AWD_FMATTGANGHQ", v)
		stats.set_bool(MPX() .. "AWD_FM6DARTCHKOUT", v)
		stats.set_bool(MPX() .. "AWD_FM_GOLF_HOLE_IN_1", v)
		stats.set_bool(MPX() .. "AWD_FMPICKUPDLCCRATE1ST", v)
		stats.set_bool(MPX() .. "AWD_FM25DIFITEMSCLOTHES", v)
		stats.set_bool(MPX() .. "AWD_BUY_EVERY_GUN", v)
		stats.set_bool(MPX() .. "AWD_DRIVELESTERCAR5MINS", v)
		stats.set_bool(MPX() .. "AWD_FMTATTOOALLBODYPARTS", v)
		stats.set_bool(MPX() .. "AWD_STORE_20_CAR_IN_GARAGES", v)
	end
Awards1b1:add_action("General",
	function()
		AwardsGeneralMpx(50000, 500, 200, 100, 50, 25)
		AwardsGeneralMpply(100, 25, 1598)
		AwardsGeneralBool(true)
	end)

	local function AwardsWeaponsMpx(v1, v2)
		stats.set_int(MPX() .. "FIREWORK_TYPE_1_WHITE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_1_RED", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_1_BLUE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_2_WHITE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_2_RED", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_2_BLUE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_3_WHITE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_3_RED", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_3_BLUE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_4_WHITE", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_4_RED", v1)
		stats.set_int(MPX() .. "FIREWORK_TYPE_4_BLUE", v1)
		stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED2", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED3", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED4", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_ADDON_1_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_ADDON_2_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_ADDON_3_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_ADDON_4_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_FREE", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_FREE2", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE2", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE3", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE4", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_PURCHASED", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_PURCHASED2", v2)
		stats.set_int(MPX() .. "WEAPON_PICKUP_BITSET", v2)
		stats.set_int(MPX() .. "WEAPON_PICKUP_BITSET2", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED", v2)
		stats.set_int(MPX() .. "NO_WEAPONS_UNLOCK", v2)
		stats.set_int(MPX() .. "NO_WEAPON_MODS_UNLOCK", v2)
		stats.set_int(MPX() .. "NO_WEAPON_CLR_MOD_UNLOCK", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED2", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED3", v2)
		stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED4", v2)
		stats.set_int(MPX() .. "CHAR_KIT_1_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_2_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_3_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_4_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_5_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_6_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_7_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_8_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_9_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_10_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_11_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_12_FM_UNLCK", v2)
		stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE2", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE3", v2)
		stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE4", v2)
		stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH", v2)
		for i = 2, 19 do
			stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH" .. i, v2)
		end
		for j = 1, 19 do
			stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", v2)
		end
		for m = 1, 41 do
			stats.set_int(MPX() .. "CHAR_KIT_" .. m .. "_FM_UNLCK", v2)
		end
		for l = 2, 41 do
			stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE" .. l, v2)
		end
	end
Awards1b1:add_action("Weapons", function() AwardsWeaponsMpx(1000, -1) end)

	local function AwardsCrimesMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
		stats.set_int(MPX() .. "CLUBHOUSECONTRACTEARNINGS", v1)
		stats.set_int(MPX() .. "CHAR_WANTED_LEVEL_TIME5STAR", v2)
		stats.set_int(MPX() .. "STARS_ATTAINED", v3)
		stats.set_int(MPX() .. "KILLS_COP", v4)
		stats.set_int(MPX() .. "STARS_EVADED", v5)
		stats.set_int(MPX() .. "KILLS_PLAYERS", v6)
		stats.set_int(MPX() .. "DEATHS_PLAYER", v7)
		stats.set_int(MPX() .. "MC_CONTRIBUTION_POINTS", v8)
		stats.set_int(MPX() .. "SHOTS", v8)
		stats.set_int(MPX() .. "CR_GANGATTACK_CITY", v8)
		stats.set_int(MPX() .. "CR_GANGATTACK_COUNTRY", v8)
		stats.set_int(MPX() .. "CR_GANGATTACK_LOST", v8)
		stats.set_int(MPX() .. "CR_GANGATTACK_VAGOS", v8)
		stats.set_int(MPX() .. "DIED_IN_DROWNING", v9)
		stats.set_int(MPX() .. "DIED_IN_DROWNINGINVEHICLE", v9)
		stats.set_int(MPX() .. "DIED_IN_EXPLOSION", v9)
		stats.set_int(MPX() .. "DIED_IN_FALL", v9)
		stats.set_int(MPX() .. "DIED_IN_FIRE", v9)
		stats.set_int(MPX() .. "DIED_IN_ROAD", v9)
		stats.set_int(MPX() .. "KILLS", v10)
		stats.set_int(MPX() .. "MEMBERSMARKEDFORDEATH", v11)
		stats.set_int(MPX() .. "MCDEATHS", v11)
		stats.set_int(MPX() .. "RIVALPRESIDENTKILLS", v11)
		stats.set_int(MPX() .. "RIVALCEOANDVIPKILLS", v11)
		stats.set_int(MPX() .. "CLUBHOUSECONTRACTSCOMPLETE", v11)
		stats.set_int(MPX() .. "CLUBCHALLENGESCOMPLETED", v11)
		stats.set_int(MPX() .. "MEMBERCHALLENGESCOMPLETED", v11)
		stats.set_int(MPX() .. "KILLS_ARMED", v12)
		stats.set_int(MPX() .. "HORDKILLS", v13)
		stats.set_int(MPX() .. "UNIQUECRATES", v13)
		stats.set_int(MPX() .. "BJWINS", v13)
		stats.set_int(MPX() .. "HORDEWINS", v13)
		stats.set_int(MPX() .. "MCMWINS", v13)
		stats.set_int(MPX() .. "GANGHIDWINS", v13)
		stats.set_int(MPX() .. "GHKILLS", v13)
		stats.set_int(MPX() .. "TIRES_POPPED_BY_GUNSHOT", v13)
		stats.set_int(MPX() .. "KILLS_INNOCENTS", v13)
		stats.set_int(MPX() .. "KILLS_ENEMY_GANG_MEMBERS", v13)
		stats.set_int(MPX() .. "KILLS_FRIENDLY_GANG_MEMBERS", v13)
		stats.set_int(MPX() .. "MCKILLS", v13)
		stats.set_int(MPX() .. "SNIPERRFL_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "HVYSNIPER_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "BIGGEST_VICTIM_KILLS", v13)
		stats.set_int(MPX() .. "ARCHENEMY_KILLS", v13)
		stats.set_int(MPX() .. "KILLS_SWAT", v13)
		stats.set_int(MPX() .. "VEHEXPORTED", v13)
		stats.set_int(MPX() .. "NO_NON_CONTRACT_RACE_WIN", v13)
		stats.set_int(MPX() .. "MICROSMG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "SMG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "ASLTSMG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "CRBNRIFLE_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "ADVRIFLE_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "MG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "CMBTMG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "ASLTMG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "RPG_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "PISTOL_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "PLAYER_HEADSHOTS", v13)
		stats.set_int(MPX() .. "SAWNOFF_ENEMY_KILLS", v13)
		stats.set_int(MPX() .. "AWD_VEHICLES_JACKEDR", v13)
		stats.set_int(MPX() .. "NUMBER_CRASHES_CARS", v14)
		stats.set_int(MPX() .. "NUMBER_CRASHES_BIKES", v14)
		stats.set_int(MPX() .. "BAILED_FROM_VEHICLE", v14)
		stats.set_int(MPX() .. "NUMBER_CRASHES_QUADBIKES", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_COP_VEHICLE", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_CARS", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_BIKES", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_BOATS", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_HELIS", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_PLANES", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_QUADBIKES", v14)
		stats.set_int(MPX() .. "NUMBER_STOLEN_BICYCLES", v14)
		stats.set_int(MPX() .. "CARS_COPS_EXPLODED", v14)
		stats.set_int(MPX() .. "BOATS_EXPLODED", v15)
		stats.set_int(MPX() .. "PLANES_EXPLODED", v16)
		stats.set_int(MPX() .. "AWD_FMTIME5STARWANTED", v17)
		stats.set_int(MPX() .. "AWD_ENEMYDRIVEBYKILLS", v18)
		stats.set_int(MPX() .. "BIKES_EXPLODED", v18)
		stats.set_int(MPX() .. "HITS_PEDS_VEHICLES", v18)
		stats.set_int(MPX() .. "HEADSHOTS", v18)
		stats.set_int(MPX() .. "SUCCESSFUL_COUNTERS", v18)
		stats.set_int(MPX() .. "KILLS_STEALTH", v18)
		stats.set_int(MPX() .. "KILLS_BY_OTHERS", v18)
		stats.set_int(MPX() .. "TOTAL_NO_SHOPS_HELD_UP", v18)
		stats.set_int(MPX() .. "HELIS_EXPLODED", v19)
		stats.set_int(MPX() .. "AWD_5STAR_WANTED_AVOIDANCE", v20)
		stats.set_int(MPX() .. "QUADBIKE_EXPLODED", v20)
		stats.set_int(MPX() .. "GRENADE_ENEMY_KILLS", v20)
		stats.set_int(MPX() .. "STKYBMB_ENEMY_KILLS", v20)
		stats.set_int(MPX() .. "UNARMED_ENEMY_KILLS", v20)
		stats.set_int(MPX() .. "BICYCLE_EXPLODED", v21)
		stats.set_int(MPX() .. "SUBMARINE_EXPLODED", v22)
		stats.set_int(MPX() .. "AWD_FMSHOOTDOWNCOPHELI", v23)
		stats.set_int(MPX() .. "AWD_SECURITY_CARS_ROBBED", v23)
		stats.set_int(MPX() .. "AWD_ODISTRACTCOPSNOEATH", v23)
		stats.set_int(MPX() .. "AWD_HOLD_UP_SHOPS", v24)
		stats.set_int(MPX() .. "HORDELVL", v25)
	end
Awards1b1:add_action("Crimes", function() AwardsCrimesMpx(32698547, 18000000, 5000, 4500, 4000, 3593, 1002, 1000, 833, 800, 700, 650, 500, 300, 168, 138, 120, 100, 98, 50, 48, 28, 25, 20, 10) end)

	local function AwardsVehiclesMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
		stats.set_int(MPX() .. "FAVOUTFITBIKETIMECURRENT", v1)
		stats.set_int(MPX() .. "FAVOUTFITBIKETIME1ALLTIME", v1)
		stats.set_int(MPX() .. "FAVOUTFITBIKETYPECURRENT", v1)
		stats.set_int(MPX() .. "FAVOUTFITBIKETYPEALLTIME", v1)
		stats.set_int(MPX() .. "NO_CARS_REPAIR", v2)
		stats.set_int(MPX() .. "LONGEST_WHEELIE_DIST", v2)
		stats.set_int(MPX() .. "AWD_50_VEHICLES_BLOWNUP", v3)
		stats.set_int(MPX() .. "CARS_EXPLODED", v3)
		stats.set_int(MPX() .. "VEHICLES_SPRAYED", v3)
		stats.set_int(MPX() .. "NUMBER_NEAR_MISS_NOCRASH", v3)
		stats.set_int(MPX() .. "AWD_CAR_EXPORT", v4)
		stats.set_int(MPX() .. "RACES_WON", v5)
		stats.set_int(MPX() .. "USJS_FOUND", v5)
		stats.set_int(MPX() .. "USJS_COMPLETED", v5)
		stats.set_int(MPX() .. "USJS_TOTAL_COMPLETED", v5)
		stats.set_int(MPX() .. "AWD_FMDRIVEWITHOUTCRASH", v6)
		stats.set_int(MPX() .. "AWD_VEHICLE_JUMP_OVER_40M", v7)
		stats.set_int(MPX() .. "COUNT_HOTRING_RACE", v8)
		stats.set_int(MPX() .. "MOST_FLIPS_IN_ONE_JUMP", v9)
		stats.set_int(MPX() .. "MOST_SPINS_IN_ONE_JUMP", v9)
		stats.set_int(MPX() .. "CRDEADLINE", v9)
		stats.set_int(MPX() .. "AWD_PASSENGERTIME", v10)
		stats.set_int(MPX() .. "AWD_TIME_IN_HELICOPTER", v10)
		stats.set_int(MPX() .. "CHAR_FM_VEHICLE_1_UNLCK", v11)
		stats.set_int(MPX() .. "CHAR_FM_VEHICLE_2_UNLCK", v11)
	end
	local function AwardsVehiclesBool(v)
		stats.set_bool(MPX() .. "AWD_FMFURTHESTWHEELIE", v)
		stats.set_bool(MPX() .. "AWD_FMFULLYMODDEDCAR", v)
	end
Awards1b1:add_action("Vehicles",
	function()
		AwardsVehiclesMpx(2069146067, 1000, 500, 100, 50, 30, 25, 20, 5, 4, -1)
		AwardsVehiclesBool(true)
	end)

	local function AwardsCombatMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9)
		stats.set_int(MPX() .. "HITS", v1)
		stats.set_int(MPX() .. "AWD_FMOVERALLKILLS", v2)
		stats.set_int(MPX() .. "NUMBER_NEAR_MISS", v2)
		stats.set_int(MPX() .. "HIGHEST_SKITTLES", v3)
		stats.set_int(MPX() .. "MELEEKILLS", v4)
		stats.set_int(MPX() .. "AWD_100_HEADSHOTS", v5)
		stats.set_int(MPX() .. "AWD_100_KILLS_PISTOL", v5)
		stats.set_int(MPX() .. "AWD_100_KILLS_SMG", v5)
		stats.set_int(MPX() .. "AWD_100_KILLS_SHOTGUN", v5)
		stats.set_int(MPX() .. "ASLTRIFLE_ENEMY_KILLS", v5)
		stats.set_int(MPX() .. "AWD_100_KILLS_SNIPER", v5)
		stats.set_int(MPX() .. "MG_ENEMY_KILLS", v5)
		stats.set_int(MPX() .. "AWD_FM_DM_TOTALKILLS", v5)
		stats.set_int(MPX() .. "DEATHS", v6)
		stats.set_int(MPX() .. "AWD_FM_DM_KILLSTREAK", v7)
		stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", v7)
		stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", v7)
		stats.set_int(MPX() .. "AWD_KILL_PSYCHOPATHS", v7)
		stats.set_int(MPX() .. "AWD_FMREVENGEKILLSDM", v8)
		stats.set_int(MPX() .. "AWD_TAKEDOWNSMUGPLANE", v8)
		stats.set_int(MPX() .. "AWD_25_KILLS_STICKYBOMBS", v8)
		stats.set_int(MPX() .. "AWD_50_KILLS_GRENADES", v8)
		stats.set_int(MPX() .. "AWD_50_KILLS_ROCKETLAUNCH", v8)
		stats.set_int(MPX() .. "AWD_20_KILLS_MELEE", v8)
		stats.set_int(MPX() .. "AWD_FM_DM_3KILLSAMEGUY", v8)
		stats.set_int(MPX() .. "AWD_FM_DM_STOLENKILL", v8)
		stats.set_int(MPX() .. "AWD_FMKILLBOUNTY", v9)
		stats.set_int(MPX() .. "AWD_CAR_BOMBS_ENEMY_KILLS", v9)
	end
	local function AwardsCombatBool(v)
		stats.set_bool(MPX() .. "AWD_FMKILLSTREAKSDM", v)
		stats.set_bool(MPX() .. "AWD_FMMOSTKILLSGANGHIDE", v)
		stats.set_bool(MPX() .. "AWD_FMMOSTKILLSSURVIVE", v)
	end
Awards1b1:add_action("Combat",
	function()
		AwardsCombatMpx(10000, 1000, 900, 700, 500, 499, 100, 50, 25)
		AwardsCombatBool(true)
	end)

	local function AwardsHeistsMpx(v1, v2, v3)
		stats.set_int(MPX() .. "AWD_FINISH_HEISTS", v1)
		stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", v1)
		stats.set_int(MPX() .. "AWD_WIN_GOLD_MEDAL_HEISTS", v2)
		stats.set_int(MPX() .. "AWD_DO_HEIST_AS_MEMBER", v2)
		stats.set_int(MPX() .. "AWD_DO_HEIST_AS_THE_LEADER", v2)
		stats.set_int(MPX() .. "AWD_CONTROL_CROWDS", v2)
		stats.set_int(MPX() .. "HEIST_COMPLETION", v2)
		stats.set_int(MPX() .. "AWD_COMPLETE_HEIST_NOT_DIE", v3)
		stats.set_int(MPX() .. "HEISTS_ORGANISED", v3)
		stats.set_int(MPX() .. "HEIST_START", v3)
		stats.set_int(MPX() .. "HEIST_END", v3)
		stats.set_int(MPX() .. "CUTSCENE_MID_PRISON", v3)
		stats.set_int(MPX() .. "CUTSCENE_MID_HUMANE", v3)
		stats.set_int(MPX() .. "CUTSCENE_MID_NARC", v3)
		stats.set_int(MPX() .. "CUTSCENE_MID_ORNATE", v3)
		stats.set_int(MPX() .. "CR_FLEECA_PREP_1", v3)
		stats.set_int(MPX() .. "CR_FLEECA_PREP_2", v3)
		stats.set_int(MPX() .. "CR_FLEECA_FINALE", v3)
		stats.set_int(MPX() .. "CR_PRISON_PLANE", v3)
		stats.set_int(MPX() .. "CR_PRISON_BUS", v3)
		stats.set_int(MPX() .. "CR_PRISON_STATION", v3)
		stats.set_int(MPX() .. "CR_PRISON_UNFINISHED_BIZ", v3)
		stats.set_int(MPX() .. "CR_PRISON_FINALE", v3)
		stats.set_int(MPX() .. "CR_HUMANE_KEY_CODES", v3)
		stats.set_int(MPX() .. "CR_HUMANE_ARMORDILLOS", v3)
		stats.set_int(MPX() .. "CR_HUMANE_EMP", v3)
		stats.set_int(MPX() .. "CR_HUMANE_VALKYRIE", v3)
		stats.set_int(MPX() .. "CR_HUMANE_FINALE", v3)
		stats.set_int(MPX() .. "CR_NARC_COKE", v3)
		stats.set_int(MPX() .. "CR_NARC_TRASH_TRUCK", v3)
		stats.set_int(MPX() .. "CR_NARC_BIKERS", v3)
		stats.set_int(MPX() .. "CR_NARC_WEED", v3)
		stats.set_int(MPX() .. "CR_NARC_STEAL_METH", v3)
		stats.set_int(MPX() .. "CR_NARC_FINALE", v3)
		stats.set_int(MPX() .. "CR_PACIFIC_TRUCKS", v3)
		stats.set_int(MPX() .. "CR_PACIFIC_WITSEC", v3)
		stats.set_int(MPX() .. "CR_PACIFIC_HACK", v3)
		stats.set_int(MPX() .. "CR_PACIFIC_BIKES", v3)
		stats.set_int(MPX() .. "CR_PACIFIC_CONVOY", v3)
		stats.set_int(MPX() .. "CR_PACIFIC_FINALE", v3)
		stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", v3)
	end
	local function AwardsHeistsMpply(v1, v2, v3)
		stats.set_int("MPPLY_WIN_GOLD_MEDAL_HEISTS", v1)
		stats.set_int("MPPLY_HEIST_ACH_TRACKER", v2)
		stats.set_bool("MPPLY_AWD_FLEECA_FIN", v3)
		stats.set_bool("MPPLY_AWD_PRISON_FIN", v3)
		stats.set_bool("MPPLY_AWD_HUMANE_FIN", v3)
		stats.set_bool("MPPLY_AWD_SERIESA_FIN", v3)
		stats.set_bool("MPPLY_AWD_PACIFIC_FIN", v3)
		stats.set_bool("MPPLY_AWD_HST_ORDER", v3)
		stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", v3)
		stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", v3)
		stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", v3)
		stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", v3)
	end
	local function AwardsHeistsBool(v)
		stats.set_bool(MPX() .. "AWD_FINISH_HEIST_NO_DAMAGE", v)
		stats.set_bool(MPX() .. "AWD_SPLIT_HEIST_TAKE_EVENLY", v)
		stats.set_bool(MPX() .. "AWD_ACTIVATE_2_PERSON_KEY", v)
		stats.set_bool(MPX() .. "AWD_ALL_ROLES_HEIST", v)
		stats.set_bool(MPX() .. "AWD_MATCHING_OUTFIT_HEIST", v)
		stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_PRINT", v)
		stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_HELP_0", v)
		stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_HELP_1", v)
		stats.set_bool(MPX() .. "HEIST_PRE_PLAN_DONE_HELP_0", v)
		stats.set_bool(MPX() .. "HEIST_CUTS_DONE_FINALE", v)
		stats.set_bool(MPX() .. "HEIST_IS_TUTORIAL", v)
		stats.set_bool(MPX() .. "HEIST_STRAND_INTRO_DONE", v)
		stats.set_bool(MPX() .. "HEIST_CUTS_DONE_ORNATE", v)
		stats.set_bool(MPX() .. "HEIST_CUTS_DONE_PRISON", v)
		stats.set_bool(MPX() .. "HEIST_CUTS_DONE_BIOLAB", v)
		stats.set_bool(MPX() .. "HEIST_CUTS_DONE_NARCOTIC", v)
		stats.set_bool(MPX() .. "HEIST_CUTS_DONE_TUTORIAL", v)
		stats.set_bool(MPX() .. "HEIST_AWARD_DONE_PREP", v)
		stats.set_bool(MPX() .. "HEIST_AWARD_BOUGHT_IN", v)
	end
Awards1b1:add_action("Heists",
	function()
		AwardsHeistsMpx(50, 25, -1)
		AwardsHeistsMpply(25, -1, true)
		AwardsHeistsBool(true)
	end)

	local function AwardsDoomsdayMpx(v1, v2, v3)
		stats.set_int(MPX() .. "CR_GANGOP_MORGUE", v1)
		stats.set_int(MPX() .. "CR_GANGOP_DELUXO", v1)
		stats.set_int(MPX() .. "CR_GANGOP_SERVERFARM", v1)
		stats.set_int(MPX() .. "CR_GANGOP_IAABASE_FIN", v1)
		stats.set_int(MPX() .. "CR_GANGOP_STEALOSPREY", v1)
		stats.set_int(MPX() .. "CR_GANGOP_FOUNDRY", v1)
		stats.set_int(MPX() .. "CR_GANGOP_RIOTVAN", v1)
		stats.set_int(MPX() .. "CR_GANGOP_SUBMARINECAR", v1)
		stats.set_int(MPX() .. "CR_GANGOP_SUBMARINE_FIN", v1)
		stats.set_int(MPX() .. "CR_GANGOP_PREDATOR", v1)
		stats.set_int(MPX() .. "CR_GANGOP_BMLAUNCHER", v1)
		stats.set_int(MPX() .. "CR_GANGOP_BCCUSTOM", v1)
		stats.set_int(MPX() .. "CR_GANGOP_STEALTHTANKS", v1)
		stats.set_int(MPX() .. "CR_GANGOP_SPYPLANE", v1)
		stats.set_int(MPX() .. "CR_GANGOP_FINALE", v1)
		stats.set_int(MPX() .. "CR_GANGOP_FINALE_P2", v1)
		stats.set_int(MPX() .. "CR_GANGOP_FINALE_P3", v1)
		stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", v2)
		stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", v2)
		stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", v2)
		stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", v3)
	end
	local function AwardsDoomsdayMpply(v1, v2)
		stats.set_int("MPPLY_GANGOPS_ALLINORDER", v1)
		stats.set_int("MPPLY_GANGOPS_LOYALTY", v1)
		stats.set_int("MPPLY_GANGOPS_CRIMMASMD", v1)
		stats.set_int("MPPLY_GANGOPS_LOYALTY2", v1)
		stats.set_int("MPPLY_GANGOPS_LOYALTY3", v1)
		stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", v1)
		stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", v1)
		stats.set_int("MPPLY_GANGOPS_SUPPORT", v1)
		stats.set_bool("MPPLY_AWD_GANGOPS_IAA", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", v2)
		stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", v2)
	end
	local function AwardsDoomsdayBool(v)
		stats_set_packed_bools(18098, 18161, v)
	end
Awards1b1:add_action("Doomsday",
	function()
		for i = 16, 48, 8 do
			stats.set_masked_int(MPX() .. "DLCSMUGCHARPSTAT_INT260", 3, i, 8)
		end
		AwardsDoomsdayMpx(10, -1, -229384)
		AwardsDoomsdayMpply(100, true)
		AwardsDoomsdayBool(true)
	end)

	local function AwardsAfterHoursMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
		stats.set_int(MPX() .. "HUB_EARNINGS", v1)
		stats.set_int(MPX() .. "NIGHTCLUB_EARNINGS", v2)
		stats.set_int(MPX() .. "NIGHTCLUB_HOTSPOT_TIME_MS", v3)
		stats.set_int(MPX() .. "DANCE_COMBO_DURATION_MINS", v3)
		stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_SOLD", v4)
		stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_MADE", v5)
		stats.set_int(MPX() .. "HUB_SALES_COMPLETED", v6)
		stats.set_int(MPX() .. "CLUB_CONTRABAND_MISSION", v7)
		stats.set_int(MPX() .. "HUB_CONTRABAND_MISSION", v7)
		stats.set_int(MPX() .. "NIGHTCLUB_VIP_APPEAR", v8)
		stats.set_int(MPX() .. "NIGHTCLUB_JOBS_DONE", v8)
		stats.set_int(MPX() .. "AWD_CLUB_DRUNK", v9)
		stats.set_int(MPX() .. "AWD_DANCE_TO_SOLOMUN", v10)
		stats.set_int(MPX() .. "AWD_DANCE_TO_TALEOFUS", v10)
		stats.set_int(MPX() .. "AWD_DANCE_TO_DIXON", v10)
		stats.set_int(MPX() .. "AWD_DANCE_TO_BLKMAD", v10)
		stats.set_int(MPX() .. "DANCEPERFECTOWNCLUB", v10)
		stats.set_int(MPX() .. "NUMUNIQUEPLYSINCLUB", v10)
		stats.set_int(MPX() .. "NIGHTCLUB_PLAYER_APPEAR", v11)
		stats.set_int(MPX() .. "NIGHTCLUB_CONT_TOTAL", v12)
		stats.set_int(MPX() .. "DANCETODIFFDJS", v13)
		stats.set_int(MPX() .. "NIGHTCLUB_CONT_MISSION", v14)
	end
	local function AwardsAfterHoursBool(v)
		stats.set_bool(MPX() .. "AWD_CLUB_HOTSPOT", v)
		stats.set_bool(MPX() .. "AWD_CLUB_CLUBBER", v)
		stats.set_bool(MPX() .. "AWD_CLUB_COORD", v)
		stats_set_packed_bools(22066, 22193, v)
	end
Awards1b1:add_action("After Hours",
	function()
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 100, 16, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 20, 24, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 80, 32, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 60, 40, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 40, 48, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
		AwardsAfterHoursMpx(20721002, 5721002, 3600000, 784672, 507822, 1001, 1000, 700, 200, 120, 100, 20, 4, -1)
		AwardsAfterHoursBool(true)
	end)

	local function AwardsArenaWarMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
		stats.set_int(MPX() .. "ARN_SPEC_BOX_TIME_MS", v1)
		stats.set_int(MPX() .. "ARENAWARS_AP_LIFETIME", v2)
		stats.set_int(MPX() .. "AWD_ARENA_WAGEWORKER", v3)
		stats.set_int(MPX() .. "ARN_VEH_ISSI", v4)
		stats.set_int(MPX() .. "AWD_TOP_SCORE", v5)
		stats.set_int(MPX() .. "ARN_SPECTATOR_DRONE", v6)
		stats.set_int(MPX() .. "ARN_SPECTATOR_CAMS", v6)
		stats.set_int(MPX() .. "ARN_SMOKE", v6)
		stats.set_int(MPX() .. "ARN_DRINK", v6)
		stats.set_int(MPX() .. "ARN_VEH_MONSTER", v6)
		stats.set_int(MPX() .. "ARN_VEH_MONSTER", v6)
		stats.set_int(MPX() .. "ARN_VEH_MONSTER", v6)
		stats.set_int(MPX() .. "ARN_VEH_CERBERUS", v6)
		stats.set_int(MPX() .. "ARN_VEH_CERBERUS2", v6)
		stats.set_int(MPX() .. "ARN_VEH_CERBERUS3", v6)
		stats.set_int(MPX() .. "ARN_VEH_BRUISER", v6)
		stats.set_int(MPX() .. "ARN_VEH_BRUISER2", v6)
		stats.set_int(MPX() .. "ARN_VEH_BRUISER3", v6)
		stats.set_int(MPX() .. "ARN_VEH_SLAMVAN4", v6)
		stats.set_int(MPX() .. "ARN_VEH_SLAMVAN5", v6)
		stats.set_int(MPX() .. "ARN_VEH_SLAMVAN6", v6)
		stats.set_int(MPX() .. "ARN_VEH_BRUTUS", v6)
		stats.set_int(MPX() .. "ARN_VEH_BRUTUS2", v6)
		stats.set_int(MPX() .. "ARN_VEH_BRUTUS3", v6)
		stats.set_int(MPX() .. "ARN_VEH_SCARAB", v6)
		stats.set_int(MPX() .. "ARN_VEH_SCARAB2", v6)
		stats.set_int(MPX() .. "ARN_VEH_SCARAB3", v6)
		stats.set_int(MPX() .. "ARN_VEH_DOMINATOR4", v6)
		stats.set_int(MPX() .. "ARN_VEH_DOMINATOR5", v6)
		stats.set_int(MPX() .. "ARN_VEH_DOMINATOR6", v6)
		stats.set_int(MPX() .. "ARN_VEH_IMPALER2", v6)
		stats.set_int(MPX() .. "ARN_VEH_IMPALER3", v6)
		stats.set_int(MPX() .. "ARN_VEH_IMPALER4", v6)
		stats.set_int(MPX() .. "ARN_VEH_ISSI4", v6)
		stats.set_int(MPX() .. "ARN_VEH_ISSI5", v6)
		stats.set_int(MPX() .. "AWD_TIME_SERVED", v6)
		stats.set_int(MPX() .. "AWD_CAREER_WINNER", v6)
		stats.set_int(MPX() .. "ARENAWARS_AP_TIER", v6)
		stats.set_int(MPX() .. "ARN_W_THEME_SCIFI", v6)
		stats.set_int(MPX() .. "ARN_W_THEME_APOC", v6)
		stats.set_int(MPX() .. "ARN_W_THEME_CONS", v6)
		stats.set_int(MPX() .. "ARN_W_PASS_THE_BOMB", v6)
		stats.set_int(MPX() .. "ARN_W_DETONATION", v6)
		stats.set_int(MPX() .. "ARN_W_ARCADE_RACE", v6)
		stats.set_int(MPX() .. "ARN_W_CTF", v6)
		stats.set_int(MPX() .. "ARN_W_TAG_TEAM", v6)
		stats.set_int(MPX() .. "ARN_W_DESTR_DERBY", v6)
		stats.set_int(MPX() .. "ARN_W_CARNAGE", v6)
		stats.set_int(MPX() .. "ARN_W_MONSTER_JAM", v6)
		stats.set_int(MPX() .. "ARN_W_GAMES_MASTERS", v6)
		stats.set_int(MPX() .. "ARENAWARS_CARRER_WINS", v6)
		stats.set_int(MPX() .. "ARENAWARS_CARRER_WINT", v6)
		stats.set_int(MPX() .. "ARENAWARS_MATCHES_PLYD", v6)
		stats.set_int(MPX() .. "ARENAWARS_MATCHES_PLYDT", v6)
		stats.set_int(MPX() .. "ARN_VEH_IMPERATOR", v6)
		stats.set_int(MPX() .. "ARN_VEH_IMPERATOR2", v6)
		stats.set_int(MPX() .. "ARN_VEH_IMPERATOR3", v6)
		stats.set_int(MPX() .. "ARN_VEH_ZR380", v6)
		stats.set_int(MPX() .. "ARN_VEH_ZR3802", v6)
		stats.set_int(MPX() .. "ARN_VEH_ZR3803", v6)
		stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE", v6)
		stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE2", v6)
		stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE3", v6)
		stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", v6)
		stats.set_int(MPX() .. "ARN_SPECTATOR_KILLS", v6)
		stats.set_int(MPX() .. "ARN_LIFETIME_KILLS", v6)
		stats.set_int(MPX() .. "ARN_L_PASS_THE_BOMB", v7)
		stats.set_int(MPX() .. "ARN_L_DETONATION", v7)
		stats.set_int(MPX() .. "ARN_L_ARCADE_RACE", v7)
		stats.set_int(MPX() .. "ARN_L_CTF", v7)
		stats.set_int(MPX() .. "ARN_L_TAG_TEAM", v7)
		stats.set_int(MPX() .. "ARN_L_DESTR_DERBY", v7)
		stats.set_int(MPX() .. "ARN_L_CARNAGE", v7)
		stats.set_int(MPX() .. "ARN_L_MONSTER_JAM", v7)
		stats.set_int(MPX() .. "ARN_L_GAMES_MASTERS", v7)
		stats.set_int(MPX() .. "ARN_LIFETIME_DEATHS", v7)
		stats.set_int(MPX() .. "AWD_YOURE_OUTTA_HERE", v8)
		stats.set_int(MPX() .. "ARENAWARS_SP_LIFETIME", v9)
		stats.set_int(MPX() .. "AWD_WATCH_YOUR_STEP", v10)
		stats.set_int(MPX() .. "AWD_TOWER_OFFENSE", v10)
		stats.set_int(MPX() .. "AWD_READY_FOR_WAR", v10)
		stats.set_int(MPX() .. "AWD_THROUGH_A_LENS", v10)
		stats.set_int(MPX() .. "AWD_SPINNER", v10)
		stats.set_int(MPX() .. "AWD_YOUMEANBOOBYTRAPS", v10)
		stats.set_int(MPX() .. "AWD_MASTER_BANDITO", v10)
		stats.set_int(MPX() .. "AWD_SITTING_DUCK", v10)
		stats.set_int(MPX() .. "AWD_CROWDPARTICIPATION", v10)
		stats.set_int(MPX() .. "AWD_KILL_OR_BE_KILLED", v10)
		stats.set_int(MPX() .. "AWD_MASSIVE_SHUNT", v10)
		stats.set_int(MPX() .. "AWD_WEVE_GOT_ONE", v10)
		stats.set_int(MPX() .. "ARENAWARS_SKILL_LEVEL", v11)
		stats.set_int(MPX() .. "ARENAWARS_SP", v12)
		stats.set_int(MPX() .. "ARENAWARS_AP", v12)
		stats.set_int(MPX() .. "ARENAWARS_CARRER_UNLK", v13)
		stats.set_int(MPX() .. "ARN_BS_TRINKET_TICKERS", v13)
		stats.set_int(MPX() .. "ARN_BS_TRINKET_SAVED", v13)
	end
	local function AwardsArenaWarBool(v)
		stats.set_bool(MPX() .. "AWD_BEGINNER", v)
		stats.set_bool(MPX() .. "AWD_FIELD_FILLER", v)
		stats.set_bool(MPX() .. "AWD_ARMCHAIR_RACER", v)
		stats.set_bool(MPX() .. "AWD_LEARNER", v)
		stats.set_bool(MPX() .. "AWD_SUNDAY_DRIVER", v)
		stats.set_bool(MPX() .. "AWD_THE_ROOKIE", v)
		stats.set_bool(MPX() .. "AWD_BUMP_AND_RUN", v)
		stats.set_bool(MPX() .. "AWD_GEAR_HEAD", v)
		stats.set_bool(MPX() .. "AWD_DOOR_SLAMMER", v)
		stats.set_bool(MPX() .. "AWD_HOT_LAP", v)
		stats.set_bool(MPX() .. "AWD_ARENA_AMATEUR", v)
		stats.set_bool(MPX() .. "AWD_PAINT_TRADER", v)
		stats.set_bool(MPX() .. "AWD_SHUNTER", v)
		stats.set_bool(MPX() .. "AWD_JOCK", v)
		stats.set_bool(MPX() .. "AWD_WARRIOR", v)
		stats.set_bool(MPX() .. "AWD_T_BONE", v)
		stats.set_bool(MPX() .. "AWD_MAYHEM", v)
		stats.set_bool(MPX() .. "AWD_WRECKER", v)
		stats.set_bool(MPX() .. "AWD_CRASH_COURSE", v)
		stats.set_bool(MPX() .. "AWD_ARENA_LEGEND", v)
		stats.set_bool(MPX() .. "AWD_PEGASUS", v)
		stats.set_bool(MPX() .. "AWD_UNSTOPPABLE", v)
		stats.set_bool(MPX() .. "AWD_CONTACT_SPORT", v)
		stats_set_packed_bools(24962, 25537, v)
	end
Awards1b1:add_action("Arena War",
	function()
		stats.set_masked_int(MPX() .. "ARENAWARSPSTAT_INT", 1, 35, 8)
		AwardsArenaWarMpx(86400000, 5055000, 1000000, 61000, 55000, 1000, 500, 200, 100, 50, 20, 0, -1)
		AwardsArenaWarBool(true)
	end)

	local function AwardsDiamondCasinoNResortMpx(v1, v2, v3)
		stats.set_int(MPX() .. "AWD_ODD_JOBS", v1)
		stats.set_int(MPX() .. "VCM_STORY_PROGRESS", v2)
		stats.set_int(MPX() .. "VCM_FLOW_PROGRESS", v3)
	end
	local function AwardsDiamondCasinoNResortBool(v)
		stats.set_bool(MPX() .. "AWD_FIRST_TIME1", v)
		stats.set_bool(MPX() .. "AWD_FIRST_TIME2", v)
		stats.set_bool(MPX() .. "AWD_FIRST_TIME3", v)
		stats.set_bool(MPX() .. "AWD_FIRST_TIME4", v)
		stats.set_bool(MPX() .. "AWD_FIRST_TIME5", v)
		stats.set_bool(MPX() .. "AWD_FIRST_TIME6", v)
		stats.set_bool(MPX() .. "AWD_ALL_IN_ORDER", v)
		stats.set_bool(MPX() .. "AWD_SUPPORTING_ROLE", v)
		stats.set_bool(MPX() .. "AWD_LEADER", v)
		stats.set_bool(MPX() .. "AWD_SURVIVALIST", v)
		stats.set_bool(MPX() .. "CAS_VEHICLE_REWARD", v)
		stats_set_packed_bools(26810, 27257, v)
	end
Awards1b1:add_action("Diamond Casino n Resort",
	function()
		AwardsDiamondCasinoNResortMpx(50, 5, -1)
		AwardsDiamondCasinoNResortBool(true)
	end)

	local function AwardsDiamondCasinoMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
		stats.set_int(MPX() .. "AWD_ASTROCHIMP", v1)
		stats.set_int(MPX() .. "AWD_BATSWORD", v2)
		stats.set_int(MPX() .. "AWD_COINPURSE", v3)
		stats.set_int(MPX() .. "AWD_DAICASHCRAB", v4)
		stats.set_int(MPX() .. "AWD_MASTERFUL", v5)
		stats.set_int(MPX() .. "H3_CR_STEALTH_1A", v6)
		stats.set_int(MPX() .. "H3_CR_STEALTH_2B_RAPP", v6)
		stats.set_int(MPX() .. "H3_CR_STEALTH_2C_SIDE", v6)
		stats.set_int(MPX() .. "H3_CR_STEALTH_3A", v6)
		stats.set_int(MPX() .. "H3_CR_STEALTH_4A", v6)
		stats.set_int(MPX() .. "H3_CR_STEALTH_5A", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_1A", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_2A", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_2B", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_3A", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_3B", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_4A", v6)
		stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_5A", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_1A", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_2A1", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_2A2", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_2BP", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_2C", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_3A", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_4A", v6)
		stats.set_int(MPX() .. "H3_CR_DIRECT_5A", v6)
		stats.set_int(MPX() .. "CR_ORDER", v6)
		stats.set_int(MPX() .. "SIGNAL_JAMMERS_COLLECTED", v7)
		stats.set_int(MPX() .. "AWD_PREPARATION", v8)
		stats.set_int(MPX() .. "AWD_BIGBRO", v8)
		stats.set_int(MPX() .. "AWD_SHARPSHOOTER", v8)
		stats.set_int(MPX() .. "AWD_RACECHAMP", v8)
		stats.set_int(MPX() .. "AWD_ASLEEPONJOB", v9)
		stats.set_int(MPX() .. "CAS_HEIST_NOTS", v10)
		stats.set_int(MPX() .. "CAS_HEIST_FLOW", v10)
		stats.set_int(MPX() .. "H3_BOARD_DIALOGUE0", v10)
		stats.set_int(MPX() .. "H3_BOARD_DIALOGUE1", v10)
		stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", v10)
		stats.set_int(MPX() .. "H3_VEHICLESUSED", v10)
	end
	local function AwardsDiamondCasinoBool(v)
		stats.set_bool(MPX() .. "AWD_SCOPEOUT", v)
		stats.set_bool(MPX() .. "AWD_CREWEDUP", v)
		stats.set_bool(MPX() .. "AWD_MOVINGON", v)
		stats.set_bool(MPX() .. "AWD_PROMOCAMP", v)
		stats.set_bool(MPX() .. "AWD_GUNMAN", v)
		stats.set_bool(MPX() .. "AWD_SMASHNGRAB", v)
		stats.set_bool(MPX() .. "AWD_INPLAINSI", v)
		stats.set_bool(MPX() .. "AWD_UNDETECTED", v)
		stats.set_bool(MPX() .. "AWD_ALLROUND", v)
		stats.set_bool(MPX() .. "AWD_ELITETHEIF", v)
		stats.set_bool(MPX() .. "AWD_PRO", v)
		stats.set_bool(MPX() .. "AWD_SUPPORTACT", v)
		stats.set_bool(MPX() .. "AWD_SHAFTED", v)
		stats.set_bool(MPX() .. "AWD_COLLECTOR", v)
		stats.set_bool(MPX() .. "AWD_DEADEYE", v)
		stats.set_bool(MPX() .. "AWD_PISTOLSATDAWN", v)
		stats.set_bool(MPX() .. "AWD_TRAFFICAVOI", v)
		stats.set_bool(MPX() .. "AWD_CANTCATCHBRA", v)
		stats.set_bool(MPX() .. "AWD_WIZHARD", v)
		stats.set_bool(MPX() .. "AWD_APEESCAPE", v)
		stats.set_bool(MPX() .. "AWD_MONKEYKIND", v)
		stats.set_bool(MPX() .. "AWD_AQUAAPE", v)
		stats.set_bool(MPX() .. "AWD_KEEPFAITH", v)
		stats.set_bool(MPX() .. "AWD_vLOVE", v)
		stats.set_bool(MPX() .. "AWD_NEMESIS", v)
		stats.set_bool(MPX() .. "AWD_FRIENDZONED", v)
		stats.set_bool(MPX() .. "VCM_FLOW_CS_RSC_SEEN", v)
		stats.set_bool(MPX() .. "VCM_FLOW_CS_BWL_SEEN", v)
		stats.set_bool(MPX() .. "VCM_FLOW_CS_MTG_SEEN", v)
		stats.set_bool(MPX() .. "VCM_FLOW_CS_OIL_SEEN", v)
		stats.set_bool(MPX() .. "VCM_FLOW_CS_DEF_SEEN", v)
		stats.set_bool(MPX() .. "VCM_FLOW_CS_FIN_SEEN", v)
		stats.set_bool(MPX() .. "HELP_FURIA", v)
		stats.set_bool(MPX() .. "HELP_MINITAN", v)
		stats.set_bool(MPX() .. "HELP_YOSEMITE2", v)
		stats.set_bool(MPX() .. "HELP_ZHABA", v)
		stats.set_bool(MPX() .. "HELP_IMORGEN", v)
		stats.set_bool(MPX() .. "HELP_SULTAN2", v)
		stats.set_bool(MPX() .. "HELP_VAGRANT", v)
		stats.set_bool(MPX() .. "HELP_VSTR", v)
		stats.set_bool(MPX() .. "HELP_STRYDER", v)
		stats.set_bool(MPX() .. "HELP_SUGOI", v)
		stats.set_bool(MPX() .. "HELP_KANJO", v)
		stats.set_bool(MPX() .. "HELP_FORMULA", v)
		stats.set_bool(MPX() .. "HELP_FORMULA2", v)
		stats.set_bool(MPX() .. "HELP_JB7002", v)
		stats_set_packed_bools(28098, 28353, v)
	end
Awards1b1:add_action("Diamond Casino Heist",
	function()
		AwardsDiamondCasinoMpx(3000000, 1000000, 950000, 100000, 40000, 100, 50, 40, 20, -1)
		AwardsDiamondCasinoBool(true)
	end)

	local function AwardsArcadeSCGWInitials(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
		stats.set_int(MPX() .. "SCGW_INITIALS_0", v1)
		stats.set_int(MPX() .. "SCGW_INITIALS_1", v2)
		stats.set_int(MPX() .. "SCGW_INITIALS_2", v3)
		stats.set_int(MPX() .. "SCGW_INITIALS_3", v4)
		stats.set_int(MPX() .. "SCGW_INITIALS_4", v5)
		stats.set_int(MPX() .. "SCGW_INITIALS_5", v6)
		stats.set_int(MPX() .. "SCGW_INITIALS_6", v7)
		stats.set_int(MPX() .. "SCGW_INITIALS_7", v8)
		stats.set_int(MPX() .. "SCGW_INITIALS_8", v9)
		stats.set_int(MPX() .. "SCGW_INITIALS_9", v10)
	end
	local function AwardsArcadeFootageInitials(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_0", v1)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_1", v2)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_2", v3)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_3", v4)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_4", v5)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_5", v6)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_6", v7)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_7", v8)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_8", v9)
		stats.set_int(MPX() .. "FOOTAGE_INITIALS_9", v10)
	end
	local function AwardsArcadeFootageScore(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_0", v1)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_1", v2)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_2", v3)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_3", v4)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_4", v5)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_5", v6)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_6", v7)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_7", v8)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_8", v9)
		stats.set_int(MPX() .. "FOOTAGE_SCORE_9", v10)
	end
	local function AwardsArcadeMpx(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
		for i = 0, 9 do
			stats.set_int(MPX() .. "DG_MONKEY_INITIALS_" .. i, v1)
			stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_" .. i, v1)
			stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_" .. i, v1)
			stats.set_int(MPX() .. "GGSM_INITIALS_" .. i, v1)
			stats.set_int(MPX() .. "TWR_INITIALS_" .. i, v1)
			stats.set_int(MPX() .. "IAP_INITIALS_" .. i, v8)
			stats.set_int(MPX() .. "IAP_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "IAP_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "SCGW_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "DG_DEFENDER_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "DG_MONKEY_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "GGSM_SCORE_" .. i, v8)
			stats.set_int(MPX() .. "TWR_SCORE_" .. i, v8)
		end
		stats.set_int(MPX() .. "IAP_MAX_MOON_DIST", v2)
		stats.set_int(MPX() .. "AWD_ASTROCHIMP", v3)
		stats.set_int(MPX() .. "AWD_BATSWORD", v4)
		stats.set_int(MPX() .. "AWD_COINPURSE", v5)
		stats.set_int(MPX() .. "AWD_DAICASHCRAB", v6)
		stats.set_int(MPX() .. "AWD_MASTERFUL", v7)
		stats.set_int(MPX() .. "AWD_PREPARATION", v8)
		stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_0", v8)
		stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_1", v8)
		stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_2", v8)
		stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_3", v8)
		stats.set_int(MPX() .. "AWD_BIGBRO", v9)
		stats.set_int(MPX() .. "AWD_SHARPSHOOTER", v9)
		stats.set_int(MPX() .. "AWD_RACECHAMP", v9)
		stats.set_int(MPX() .. "AWD_ASLEEPONJOB", v10)
		stats.set_int(MPX() .. "CH_ARC_CAB_CLAW_TROPHY", v11)
		stats.set_int(MPX() .. "CH_ARC_CAB_LOVE_TROPHY", v11)
	end
	local function AwardsArcadeBool(v)
		stats.set_bool(MPX() .. "AWD_SCOPEOUT", v)
		stats.set_bool(MPX() .. "AWD_CREWEDUP", v)
		stats.set_bool(MPX() .. "AWD_MOVINGON", v)
		stats.set_bool(MPX() .. "AWD_PROMOCAMP", v)
		stats.set_bool(MPX() .. "AWD_GUNMAN", v)
		stats.set_bool(MPX() .. "AWD_SMASHNGRAB", v)
		stats.set_bool(MPX() .. "AWD_INPLAINSI", v)
		stats.set_bool(MPX() .. "AWD_UNDETECTED", v)
		stats.set_bool(MPX() .. "AWD_ALLROUND", v)
		stats.set_bool(MPX() .. "AWD_ELITETHEIF", v)
		stats.set_bool(MPX() .. "AWD_PRO", v)
		stats.set_bool(MPX() .. "AWD_SUPPORTACT", v)
		stats.set_bool(MPX() .. "AWD_SHAFTED", v)
		stats.set_bool(MPX() .. "AWD_COLLECTOR", v)
		stats.set_bool(MPX() .. "AWD_DEADEYE", v)
		stats.set_bool(MPX() .. "AWD_PISTOLSATDAWN", v)
		stats.set_bool(MPX() .. "AWD_TRAFFICAVOI", v)
		stats.set_bool(MPX() .. "AWD_CANTCATCHBRA", v)
		stats.set_bool(MPX() .. "AWD_WIZHARD", v)
		stats.set_bool(MPX() .. "AWD_APEESCAP", v)
		stats.set_bool(MPX() .. "AWD_MONKEYKIND", v)
		stats.set_bool(MPX() .. "AWD_AQUAAPE", v)
		stats.set_bool(MPX() .. "AWD_KEEPFAITH", v)
		stats.set_bool(MPX() .. "AWD_vLOVE", v)
		stats.set_bool(MPX() .. "AWD_NEMESIS", v)
		stats.set_bool(MPX() .. "AWD_FRIENDZONED", v)
		stats.set_bool(MPX() .. "IAP_CHALLENGE_0", v)
		stats.set_bool(MPX() .. "IAP_CHALLENGE_1", v)
		stats.set_bool(MPX() .. "IAP_CHALLENGE_2", v)
		stats.set_bool(MPX() .. "IAP_CHALLENGE_3", v)
		stats.set_bool(MPX() .. "IAP_CHALLENGE_4", v)
		stats.set_bool(MPX() .. "IAP_GOLD_TANK", v)
		stats.set_bool(MPX() .. "SCGW_WON_NO_DEATHS", v)
		stats_set_packed_bools(26810, 27257, v)
		stats_set_packed_bools(28098, 28353, v)
	end
Awards1b1:add_action("Arcade",
	function()
		AwardsArcadeSCGWInitials(69644, 50333, 63512, 46136, 21638, 2133, 1215, 2444, 38023, 2233)
		AwardsArcadeFootageInitials(0, 64, 8457, 91275, 53260, 78663, 25103, 102401, 12672, 74380)
		AwardsArcadeFootageScore(284544, 275758, 100000, 90000, 80000, 70000, 60000, 50000, 40000, 30000)
		AwardsArcadeMpx(69644, INT_MAX + 1, 3000000, 1000000, 950000, 100000, 40000, 50, 40, 20, -1)
		AwardsArcadeBool(true)
	end)

	local function AwardsSummerSpecialBool(v)
		stats.set_bool(MPX() .. "AWD_KINGOFQUB3D", v)
		stats.set_bool(MPX() .. "AWD_QUBISM", v)
		stats.set_bool(MPX() .. "AWD_QUIBITS", v)
		stats.set_bool(MPX() .. "AWD_GODOFQUB3D", v)
		stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", v)
		stats.set_bool(MPX() .. "AWD_GOFOR11TH", v)
		stats_set_packed_bools(30227, 30482, v)
	end
Awards1b1:add_action("LS Summer Special",
	function()
		stats.set_masked_int(MPX() .. "SU20PSTAT_INT", 1, 35, 8)
		AwardsSummerSpecialBool(true)
	end)

	local function AwardsCayoPericoMpx(v1, v2, v3, v4, v5, v6, v7)
		stats.set_int(MPX() .. "AWD_FILL_YOUR_BAGS", v1)
		stats.set_int(MPX() .. "AWD_SUNSET", v2)
		stats.set_int(MPX() .. "AWD_KEINEMUSIK", v2)
		stats.set_int(MPX() .. "AWD_PALMS_TRAX", v2)
		stats.set_int(MPX() .. "AWD_MOODYMANN", v2)
		stats.set_int(MPX() .. "AWD_TREASURE_HUNTER", v3)
		stats.set_int(MPX() .. "AWD_WRECK_DIVING", v3)
		stats.set_int(MPX() .. "AWD_LOSTANDFOUND", v4)
		stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", v5)
		stats.set_int(MPX() .. "AWD_WELL_PREPARED", v6)
		stats.set_int(MPX() .. "H4_H4_DJ_MISSIONS", v7)
		stats.set_int(MPX() .. "H4CNF_APPROACH", v7)
		stats.set_int(MPX() .. "H4_MISSIONS", v7)
	end
	local function AwardsCayoPericoBool(v)
		stats.set_bool(MPX() .. "AWD_INTELGATHER", v)
		stats.set_bool(MPX() .. "AWD_COMPOUNDINFILT", v)
		stats.set_bool(MPX() .. "AWD_LOOT_FINDER", v)
		stats.set_bool(MPX() .. "AWD_MAX_DISRUPT", v)
		stats.set_bool(MPX() .. "AWD_THE_ISLAND_HEIST", v)
		stats.set_bool(MPX() .. "AWD_GOING_ALONE", v)
		stats.set_bool(MPX() .. "AWD_TEAM_WORK", v)
		stats.set_bool(MPX() .. "AWD_MIXING_UP", v)
		stats.set_bool(MPX() .. "AWD_TEAM_WORK", v)
		stats.set_bool(MPX() .. "AWD_MIXING_UP", v)
		stats.set_bool(MPX() .. "AWD_PRO_THIEF", v)
		stats.set_bool(MPX() .. "AWD_CAT_BURGLAR", v)
		stats.set_bool(MPX() .. "AWD_ONE_OF_THEM", v)
		stats.set_bool(MPX() .. "AWD_GOLDEN_GUN", v)
		stats.set_bool(MPX() .. "AWD_ELITE_THIEF", v)
		stats.set_bool(MPX() .. "AWD_PROFESSIONAL", v)
		stats.set_bool(MPX() .. "AWD_HELPING_OUT", v)
		stats.set_bool(MPX() .. "AWD_COURIER", v)
		stats.set_bool(MPX() .. "AWD_PARTY_VIBES", v)
		stats.set_bool(MPX() .. "AWD_HELPING_HAND", v)
		stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", v)
		stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_VETIR", v)
		stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_LONGFIN", v)
		stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_ANNIH", v)
		stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_ALKONOS", v)
		stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_PATROLB", v)
		stats_set_packed_bools(30515, 30706, v)
	end
Awards1b1:add_action("Cayo Perico",
	function()
		AwardsCayoPericoMpx(1000000000, 1800000, 1000000, 500000, 100, 80, -1)
		AwardsCayoPericoBool(true)
	end)

	local function AwardsTunersMpx(v1, v2, v3, v4)
		stats.set_int(MPX() .. "AWD_TEST_CAR", v1)
		stats.set_int(MPX() .. "AWD_CAR_CLUB_MEM", v2)
		stats.set_int(MPX() .. "AWD_CAR_EXPORT", v2)
		stats.set_int(MPX() .. "AWD_ROBBERY_CONTRACT", v2)
		stats.set_int(MPX() .. "AWD_FACES_OF_DEATH", v2)
		stats.set_int(MPX() .. "AWD_SPRINTRACER", v3)
		stats.set_int(MPX() .. "AWD_STREETRACER", v3)
		stats.set_int(MPX() .. "AWD_PURSUITRACER", v3)
		stats.set_int(MPX() .. "AWD_AUTO_SHOP", v3)
		stats.set_int(MPX() .. "AWD_GROUNDWORK", v4)
	end
	local function AwardsTunersBool(v)
		stats.set_bool(MPX() .. "AWD_CAR_CLUB", v)
		stats.set_bool(MPX() .. "AWD_PRO_CAR_EXPORT", v)
		stats.set_bool(MPX() .. "AWD_UNION_DEPOSITORY", v)
		stats.set_bool(MPX() .. "AWD_MILITARY_CONVOY", v)
		stats.set_bool(MPX() .. "AWD_FLEECA_BANK", v)
		stats.set_bool(MPX() .. "AWD_FREIGHT_TRAIN", v)
		stats.set_bool(MPX() .. "AWD_BOLINGBROKE_ASS", v)
		stats.set_bool(MPX() .. "AWD_IAA_RAID", v)
		stats.set_bool(MPX() .. "AWD_METH_JOB", v)
		stats.set_bool(MPX() .. "AWD_BUNKER_RAID", v)
		stats.set_bool(MPX() .. "AWD_STRAIGHT_TO_VIDEO", v)
		stats.set_bool(MPX() .. "AWD_MONKEY_C_MONKEY_DO", v)
		stats.set_bool(MPX() .. "AWD_TRAINED_TO_KILL", v)
		stats.set_bool(MPX() .. "AWD_DIRECTOR", v)
		stats_set_packed_bools(31707, 32282, v)
	end
Awards1b1:add_action("LS Tuners",
	function()
		AwardsTunersMpx(240, 100, 50, 40)
		AwardsTunersBool(true)
	end)

	local function AwardsContractMpx(v1, v2, v3, v4, v5, v6, v7)
		stats.set_int(MPX() .. "FIXER_EARNINGS", v1)
		stats.set_int(MPX() .. "FIXER_COUNT", v2)
		stats.set_int(MPX() .. "FIXER_SC_VEH_RECOVERED", v3)
		stats.set_int(MPX() .. "FIXER_SC_VAL_RECOVERED", v3)
		stats.set_int(MPX() .. "FIXER_SC_GANG_TERMINATED", v3)
		stats.set_int(MPX() .. "FIXER_SC_VIP_RESCUED", v3)
		stats.set_int(MPX() .. "FIXER_SC_ASSETS_PROTECTED", v3)
		stats.set_int(MPX() .. "FIXER_SC_EQ_DESTROYED", v3)
		stats.set_int(MPX() .. "AWD_PRODUCER", v4)
		stats.set_int(MPX() .. "AWD_CONTRACTOR", v5)
		stats.set_int(MPX() .. "AWD_COLD_CALLER", v5)
		stats.set_int(MPX() .. "FIXERTELEPHONEHITSCOMPL", v6)
		stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", v6)
		stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", v7)
		stats.set_int(MPX() .. "FIXER_GENERAL_BS", v7)
		stats.set_int(MPX() .. "FIXER_COMPLETED_BS", v7)
		stats.set_int(MPX() .. "FIXER_STORY_BS", v7)
		stats.set_int(MPX() .. "FIXER_STORY_STRAND", v7)
		stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", v7)
	end
	local function AwardsContractBool(v)
		stats.set_bool(MPX() .. "AWD_TEEING_OFF", v)
		stats.set_bool(MPX() .. "AWD_PARTY_NIGHT", v)
		stats.set_bool(MPX() .. "AWD_BILLIONAIRE_GAMES", v)
		stats.set_bool(MPX() .. "AWD_HOOD_PASS", v)
		stats.set_bool(MPX() .. "AWD_STUDIO_TOUR", v)
		stats.set_bool(MPX() .. "AWD_DONT_MESS_DRE", v)
		stats.set_bool(MPX() .. "AWD_BACKUP", v)
		stats.set_bool(MPX() .. "AWD_SHORTFRANK_1", v)
		stats.set_bool(MPX() .. "AWD_SHORTFRANK_2", v)
		stats.set_bool(MPX() .. "AWD_SHORTFRANK_3", v)
		stats.set_bool(MPX() .. "AWD_CONTR_KILLER", v)
		stats.set_bool(MPX() .. "AWD_DOGS_BEST_FRIEND", v)
		stats.set_bool(MPX() .. "AWD_MUSIC_STUDIO", v)
		stats.set_bool(MPX() .. "AWD_SHORTLAMAR_1", v)
		stats.set_bool(MPX() .. "AWD_SHORTLAMAR_2", v)
		stats.set_bool(MPX() .. "AWD_SHORTLAMAR_3", v)
		stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_0", v)
		stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_1", v)
		stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_2", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_SETUP", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_STRAND", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY_2", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY_F", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL_2", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL_F", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD_2", v)
		stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD_F", v)
		stats_set_packed_bools(32283, 32474, v)
	end
Awards1b1:add_action("Contract",
	function()
		AwardsContractMpx(19734860, 510, 85, 60, 50, 10, -1)
		AwardsContractBool(true)
	end)

	local function AwardsDrugWarsMpx(v1, v2)
		stats.set_int(MPX() .. "AWD_CALLME", v1)
		stats.set_int(MPX() .. "AWD_CHEMCOMPOUNDS", v1)
		stats.set_int(MPX() .. "AWD_RUNRABBITRUN", v2)
	end
	local function AwardsDrugWarsBool(v)
		stats.set_bool(MPX() .. "AWD_ACELIQUOR", v)
		stats.set_bool(MPX() .. "AWD_TRUCKAMBUSH", v)
		stats.set_bool(MPX() .. "AWD_LOSTCAMPREV", v)
		stats.set_bool(MPX() .. "AWD_ACIDTRIP", v)
		stats.set_bool(MPX() .. "AWD_HIPPYRIVALS", v)
		stats.set_bool(MPX() .. "AWD_TRAINCRASH", v)
		stats.set_bool(MPX() .. "AWD_BACKUPB", v)
		stats.set_bool(MPX() .. "AWD_GETSTARTED", v)
		stats.set_bool(MPX() .. "AWD_CHEMREACTION", v)
		stats.set_bool(MPX() .. "AAWD_WAREHODEFEND", v)
		stats.set_bool(MPX() .. "AWD_ATTACKINVEST", v)
		stats.set_bool(MPX() .. "AWD_RESCUECOOK", v)
		stats.set_bool(MPX() .. "AWD_DRUGTRIPREHAB", v)
		stats.set_bool(MPX() .. "AWD_CARGOPLANE", v)
		stats.set_bool(MPX() .. "AWD_BACKUPB2", v)
		stats.set_bool(MPX() .. "AWD_TAXISTAR", v)
	end
Awards1b1:add_action("LS Drug Wars",
	function()
		AwardsDrugWarsMpx(50, 5)
		AwardsDrugWarsBool(true)
	end)

	local function AwardsChopShopMpx(v1, v2, v3)
		stats.set_int(MPX() .. "AWD_CAR_DEALER", v1)
		stats.set_int(MPX() .. "AWD_SECOND_HAND_PARTS", v1)
		stats.set_int(MPX() .. "AWD_PREP_WORK", v2)
		stats.set_int(MPX() .. "AWD_VEHICLE_ROBBERIES", v3)
		stats.set_int(MPX() .. "AWD_TOW_TRUCK_SERVICE", v3)
	end
	local function AwardsChopShopBool(v)
		stats.set_bool(MPX() .. "AWD_MAZE_BANK_ROBBERY", v)
		stats.set_bool(MPX() .. "AWD_CARGO_SHIP_ROBBERY", v)
		stats.set_bool(MPX() .. "AWD_DIAMOND_CASINO_ROBBERY", v)
		stats.set_bool(MPX() .. "AWD_MISSION_ROW_ROBBERY", v)
		stats.set_bool(MPX() .. "AWD_SUBMARINE_ROBBERY", v)
		stats.set_bool(MPX() .. "AWD_PERFECT_RUN", v)
		stats.set_bool(MPX() .. "AWD_EXTRA_MILE", v)
		stats.set_bool(MPX() .. "AWD_BOLINGBROKE", v)
		stats.set_bool(MPX() .. "AWD_GETTING_SET_UP", v)
		stats.set_bool(MPX() .. "AWD_CHICKEN_FACTORY_RAID", v)
		stats.set_bool(MPX() .. "AWD_HELPING_HAND2", v)
		stats.set_bool(MPX() .. "AWD_SURPRISE_ATTACK", v)
		stats.set_bool(MPX() .. "AWD_ALL_OUT_RAID", v)
		stats.set_bool(MPX() .. "AWD_WEAPON_ARSENAL", v)
		stats.set_bool(MPX() .. "AWD_HELPING_HAND2", v)
	end
Awards1b1:add_action("Chop Shop",
	function()
		AwardsChopShopMpx(5000000, 100, 50)
		AwardsChopShopBool(true)
	end)

Awards:add_action("Unlock All",
	function()
		for i = 16, 48, 8 do
			stats.set_masked_int(MPX() .. "DLCSMUGCHARPSTAT_INT260", 3, i, 8)
		end
		stats.set_masked_int(MPX() .. "SU20PSTAT_INT", 1, 35, 8)
		stats.set_masked_int(MPX() .. "ARENAWARSPSTAT_INT", 1, 35, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 100, 16, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 20, 24, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 80, 32, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 60, 40, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 40, 48, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
		AwardsVictoryMpx(100, 50, 25, 10)
		AwardsVictoryMpply(1500, 800, 750, 500, 250, 3593, 1002)
		AwardsVictoryBool(true)
		AwardsGeneralMpx(50000, 500, 200, 100, 50, 25)
		AwardsGeneralMpply(100, 25, 1598)
		AwardsGeneralBool(true)
		AwardsWeaponsMpx(1000, -1)
		AwardsCrimesMpx(32698547, 18000000, 5000, 4500, 4000, 3593, 1002, 1000, 833, 800, 700, 650, 500, 300, 168, 138, 120, 100, 98, 50, 48, 28, 25, 20, 10)
		AwardsVehiclesMpx(2069146067, 1000, 500, 100, 50, 30, 25, 20, 5, 4, -1)
		AwardsVehiclesBool(true)
		AwardsCombatMpx(10000, 1000, 900, 700, 500, 499, 100, 50, 25)
		AwardsCombatBool(true)
		AwardsHeistsMpx(50, 25, -1)
		AwardsHeistsMpply(25, -1, true)
		AwardsHeistsBool(true)
		AwardsDoomsdayMpx(10, -1, -229384)
		AwardsDoomsdayMpply(100, true)
		AwardsDoomsdayBool(true)
		AwardsAfterHoursMpx(20721002, 5721002, 3600000, 784672, 507822, 1001, 1000, 700, 200, 120, 100, 20, 4, -1)
		AwardsAfterHoursBool(true)
		AwardsArenaWarMpx(86400000, 5055000, 1000000, 61000, 55000, 1000, 500, 200, 100, 50, 20, 0, -1)
		AwardsArenaWarBool(true)
		AwardsDiamondCasinoNResortMpx(50, 5, -1)
		AwardsDiamondCasinoNResortBool(true)
		AwardsDiamondCasinoMpx(3000000, 1000000, 950000, 100000, 40000, 100, 50, 40, 20, -1)
		AwardsDiamondCasinoBool(true)
		AwardsArcadeSCGWInitials(69644, 50333, 63512, 46136, 21638, 2133, 1215, 2444, 38023, 2233)
		AwardsArcadeFootageInitials(0, 64, 8457, 91275, 53260, 78663, 25103, 102401, 12672, 74380)
		AwardsArcadeFootageScore(284544, 275758, 100000, 90000, 80000, 70000, 60000, 50000, 40000, 30000)
		AwardsArcadeMpx(69644, INT_MAX + 1, 3000000, 1000000, 950000, 100000, 40000, 50, 40, 20, -1)
		AwardsArcadeBool(true)
		AwardsSummerSpecialBool(true)
		AwardsCayoPericoMpx(1000000000, 1800000, 1000000, 500000, 100, 80, -1)
		AwardsCayoPericoBool(true)
		AwardsTunersMpx(240, 100, 50, 40)
		AwardsTunersBool(true)
		AwardsContractMpx(19734860, 510, 85, 60, 50, 10, -1)
		AwardsContractBool(true)
		AwardsDrugWarsMpx(50, 5)
		AwardsDrugWarsBool(true)
		AwardsChopShopMpx(5000000, 100, 50)
		AwardsChopShopBool(true)
	end)

Awards:add_action("Reset All",
	function()
		AwardsVictoryMpx(0, 0, 0, 0)
		AwardsVictoryMpply(0, 0, 0, 0, 0, 0, 0)
		AwardsVictoryBool(false)
		AwardsGeneralMpx(0, 0, 0, 0, 0, 0)
		AwardsGeneralMpply(0, 0, 0)
		AwardsGeneralBool(false)
		AwardsWeaponsMpx(0, 0)
		AwardsCrimesMpx(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsVehiclesMpx(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsVehiclesBool(false)
		AwardsCombatMpx(0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsCombatBool(false)
		AwardsHeistsMpx(0, 0, 0)
		AwardsHeistsMpply(0, 0, false)
		AwardsHeistsBool(false)
		AwardsDoomsdayMpx(0, 0, 0)
		AwardsDoomsdayMpply(0, false)
		AwardsAfterHoursMpx(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsAfterHoursBool(false)
		AwardsArenaWarMpx(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsArenaWarBool(false)
		AwardsDiamondCasinoNResortMpx(0, 0, 0)
		AwardsDiamondCasinoNResortBool(false)
		AwardsDiamondCasinoMpx(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsDiamondCasinoBool(false)
		AwardsArcadeSCGWInitials(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsArcadeFootageInitials(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsArcadeFootageScore(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsArcadeMpx(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AwardsArcadeBool(false)
		AwardsSummerSpecialBool(false)
		AwardsCayoPericoMpx(0, 0, 0, 0, 0, 0,0)
		AwardsCayoPericoBool(false)
		AwardsTunersMpx(0, 0, 0, 0)
		AwardsTunersBool(false)
		AwardsContractMpx(0, 0, 0, 0, 0, 0, 0)
		AwardsContractBool(false)
		AwardsDrugWarsMpx(0, 0)
		AwardsDrugWarsBool(false)
		AwardsChopShopMpx(0, 0, 0)
		AwardsChopShopBool(false)
	end)

Awards:add_action(SPACE, null)

AwardsNote = Awards:add_submenu(README)

AwardsNote:add_action("    	 Unlocking «After Hours» awards will ", null)
AwardsNote:add_action("  cause a transaction error multiple times;", null)
AwardsNote:add_action("        some awards can be temporarily", null)

--Characteristics--

Characteristics = CharactersStats:add_submenu("Characteristics")

	skills = {"STAMINA", "SHOOTING_ABILITY", "STRENGTH", "STEALTH_ABILITY", "FLYING_ABILITY", "WHEELIE_ABILITY", "LUNG_CAPACITY"}
	skills_increase = {"DRIV", "FLY", "LUNG", "SHO", "STAM", "STL", "STRN"}
Characteristics:add_toggle("Max Stats",
	function()
		if stats.get_int(MPX() .. skills[1]) == 100 and stats.get_int(MPX() .. skills[2]) == 100 and stats.get_int(MPX() .. skills[3]) == 100 and stats.get_int(MPX() .. skills[4]) == 100 then
			if stats.get_int(MPX() .. skills[5]) == 100 and stats.get_int(MPX() .. skills[6]) == 100 and stats.get_int(MPX() .. skills[7]) == 100 then
				return true
			end
		else
			return false
		end
	end,
	function()
		for i = 1, 7 do
			stats.set_int(MPX() .. "SCRIPT_INCREASE_" .. skills_increase[i], 100)
		end
	end)

		a92 = false
	local function FastRunNReloadSetter(value)
		for i = 1, 3 do
			stats.set_int(MPX() .. "CHAR_FM_ABILITY_" .. i .. "_UNLCK", value)
			stats.set_int(MPX() .. "CHAR_ABILITY_" .. i .. "_UNLCK", value)
		end
	end
	local function FastRunNReloadToggler(Enabled)
		if Enabled then
			FastRunNReloadSetter(-1)
		else
			FastRunNReloadSetter(0)
		end
	end
Characteristics:add_toggle("Fast Run n Reload", function() return a92 end, function() a92 = not a92 FastRunNReloadToggler(a92) end)

	local function SkillsStatusGetter(stat_name, label1, label2, label3, labal4, label5)
		stat = stats.get_int(MPX() .. stat_name)
		if stat <= 25 then
			status = label1
		elseif stat > 25 and stat <= 50 then
			status = label2
		elseif stat > 50 and stat <= 75 then
			status = label3
		elseif stat > 75 and stat <= 99 then
			status = labal4
		else
			status = label5
		end
		return stat .. "/100 " .. status
	end

Characteristics:add_bare_item("", function() return "Stamina: " .. SkillsStatusGetter("STAMINA", "(lung cancer)", "(fat ass)", "(athlete)", "(pro)", "(Usain Bolt)") end, null, null, null)
Characteristics:add_bare_item("", function() return "Shooting: " .. SkillsStatusGetter("SHOOTING_ABILITY", "(cataract)", "(american)", "(policeman)", "(pvp kid)", "(John Wick)") end, null, null, null)
Characteristics:add_bare_item("", function() return "Strength: " .. SkillsStatusGetter("STRENGTH", "(anorexia)", "(weak af)", "(boxer)", "(builder)", "(Gym Rat)") end, null, null, null)
Characteristics:add_bare_item("", function() return "Stealth: " .. SkillsStatusGetter("STEALTH_ABILITY", "(gorlock the destroyer)", "(drunk teenager)", "(thief)", "(assassin)", "(Agent 47)") end, null, null, null)
Characteristics:add_bare_item("", function() return "Flying: " .. SkillsStatusGetter("FLYING_ABILITY", "(kamikaze)", "(german)", "(pilot)", "(war thunder enjoyer)", "(«Maverick» Mitchell)") end, null, null, null)
Characteristics:add_bare_item("", function() return "Driving: " .. SkillsStatusGetter("WHEELIE_ABILITY", "(grandma)", "(amateur)", "(taxi driver)", "(drifter)", "(Ken Block)") end, null, null, null)
Characteristics:add_bare_item("", function() return "Swimming: " .. SkillsStatusGetter("LUNG_CAPACITY", "(rock)", "(wood)", "(fisherman)", "(dolphine)", "(Poseidon)") end, null, null, null)

Characteristics:add_float_range("Mental State", 5, 0, 100,
	function()
		return stats.get_float(MPX() .. "PLAYER_MENTAL_STATE")
	end,
	function(state)
		stats.set_float(MPX() .. "PLAYER_MENTAL_STATE", state)
	end)

Characteristics:add_action(SPACE, null)

CharacteristicsNote = Characteristics:add_submenu(README)

CharacteristicsNote:add_action("                  Fast Run n Reload:", null)
CharacteristicsNote:add_action("      Change session to apply the result", null)

--Collectibles--

Collectibles = CharactersStats:add_submenu("Collectibles")

TCollectibles = Collectibles:add_submenu("Unlock All (Temp. + No Rewards)")

	local function CollectibleGetter(collectible, global, offset, max_count)
		if not localplayer then
			return collectible .. ": In Menu"
		else
			return collectible .. " | 〔" .. globals.get_int(global + offset) .. "/" .. max_count .. "〕"
		end
	end

TCollectibles:add_bare_item("", function() return CollectibleGetter("Action Figures", CUg, AFo, 100) end, function() globals.set_int(CUg + AFo, 100) end, null, null)
TCollectibles:add_bare_item("", function() return CollectibleGetter("LD Organics", CUg, LDOo, 100) end, function() globals.set_int(CUg + LDOo, 100) end, null, null)
TCollectibles:add_bare_item("", function() return CollectibleGetter("Playing Cards", CUg, PCo, 54) end, function() globals.set_int(CUg + PCo, 54) end, null, null)
TCollectibles:add_bare_item("", function() return CollectibleGetter("Signal Jammers", CUg, SJo, 50) end, function() globals.set_int(CUg + SJo, 50) end, null, null)
TCollectibles:add_bare_item("", function() return CollectibleGetter("Snowmen", CUg, So, 25) end, function() globals.set_int(CUg + So, 25) end, null, null)
TCollectibles:add_bare_item("", function() return CollectibleGetter("Movie Props", CUg, MPo, 10) end, function() globals.set_int(CUg + MPo, 10) end, null, null)

PCollectibles = Collectibles:add_submenu("Unlock All (Temp. + Rewards)")

PCollectibles:add_bare_item("", function() return CollectibleGetter("Action Figures", CUg, AFo, 100) end, function() globals.set_int(CUg + AFo, 99) end, null, null)
PCollectibles:add_bare_item("", function() return CollectibleGetter("LD Organics", CUg, LDOo, 100) end, function() globals.set_int(CUg + LDOo, 99) end, null, null)
PCollectibles:add_bare_item("", function() return CollectibleGetter("Playing Cards", CUg, PCo, 54) end, function() globals.set_int(CUg + PCo, 53) end, null, null)
PCollectibles:add_bare_item("", function() return CollectibleGetter("Signal Jammers", CUg, SJo, 50) end, function() globals.set_int(CUg + SJo, 49) end, null, null)
PCollectibles:add_bare_item("", function() return CollectibleGetter("Snowmen", CUg, So, 25) end, function() globals.set_int(CUg + So, 24) end, null, null)
PCollectibles:add_bare_item("", function() return CollectibleGetter("Movie Props", CUg, MPo, 10) end, function() globals.set_int(CUg + MPo, 9) end, null, null)

PJackOLanterns = PCollectibles:add_submenu("Jack O' Lantern")

		a93 = 1
PJackOLanterns:add_array_item("Unlock", {"Select", "Mask", "T-Shirt"},
	function()
		return a93
	end,
	function(unlock)
		if unlock == 2 then
			globals.set_int(CUg + JOLo, 9)
		elseif unlock == 3 then
			globals.set_int(CUg + JOLo, 199)
		end
		a93 = unlock
	end)

PJackOLanterns:add_int_range("Set Jack O' Lanterns", 1, 0, 200,
	function()
		return globals.get_int(CUg + JOLo)
	end,
	function(value)
		globals.set_int(CUg + JOLo, value)
	end)

PJackOLanterns:add_action(SPACE, null)

PJackOLanternsNote = PJackOLanterns:add_submenu(README)

PJackOLanternsNote:add_action("     First, find the item you want, select", null)
PJackOLanternsNote:add_action("    an option, and then pick up the item", null)

PCollectibles:add_action(SPACE, null)

PCollectiblesNote = PCollectibles:add_submenu(README)

PCollectiblesNote:add_action("     First, find the item you want, select", null)
PCollectiblesNote:add_action("    an option, and then pick up the item", null)

--Crew Rank--

CrewRank = CharactersStats:add_submenu("Crew Rank")

		rp_till_100 = {
			0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000,
			28500, 33400, 38700, 44200, 50200, 56400, 3000, 69900, 77100, 84700,
			92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100,
			188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,
			312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800,
			465200, 482000, 499000, 516300,	533800, 551600, 569600, 588000, 606500, 625400,
			644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900,
			849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700,
			1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100,
			1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300, 1555800, 1584350
		}
	local function RankToRP(rank)
		if rank <= 99 then
			return rp_till_100[rank]
		else
			return ((25 * (rank^2)) + (23575 * rank) - 1023150) + 100
		end
	end

CrewRank:add_bare_item("",
	function()
		if localplayer ~= nil then
			crew_rank = stats.get_int("MPPLY_CURRENT_CREW_RANK")
		else
			crew_rank = "In Menu"
		end
		return "Current Crew Rank: " .. crew_rank
	end, null, null, null)

		def_num33 = list_0_8[1]
		def_num_cur33 = 1
CrewRank:add_array_item("Number #1", list_0_8,
	function()
		return def_num_cur33
	end,
	function(number33)
		def_num33 = list_0_8[number33]
		def_num_cur33 = number33
	end)

		def_num34 = list_0_9[1]
		def_num_cur34 = 1
CrewRank:add_array_item("Number #2", list_0_9,
	function()
		return def_num_cur34
	end,
	function(number34)
		def_num34 = list_0_9[number34]
		def_num_cur34 = number34
	end)

		def_num35 = list_0_9[1]
		def_num_cur35 = 1
CrewRank:add_array_item("Number #3", list_0_9,
	function()
		return def_num_cur35
	end,
	function(number35)
		def_num35 = list_0_9[number35]
		def_num_cur35 = number35
	end)

		def_num36 = list_0_9[1]
		def_num_cur36 = 1
CrewRank:add_array_item("Number #4", list_0_9,
	function()
		return def_num_cur36
	end,
	function(number36)
		def_num36 = list_0_9[number36]
		def_num_cur36 = number36
	end)

CrewRank:add_bare_item("",
	function()
		if def_num33 == 0 then
			new_crew_rank = tonumber(def_num34 .. def_num35 .. def_num36)
		else
			new_crew_rank = tonumber(def_num33 .. def_num34 .. def_num35 .. def_num36)
		end
		if new_crew_rank == 0 then
			new_crew_rank = "Not Selected"
		end
		return "Set Crew Rank: " .. new_crew_rank
	end,
	function()
		if new_crew_rank ~= "Not Selected" then
			for i = 0, 4 do
				stats.set_int("MPPLY_CREW_LOCAL_XP_" .. i, RankToRP(new_crew_rank))
			end
			if a94 == true then
				sleep(1)
				def_num_cur33 = 1
				def_num_cur34 = 1
				def_num_cur35 = 1
				def_num_cur36 = 1
				def_num33 = list_0_8[1]
				def_num34 = list_0_9[1]
				def_num35 = list_0_9[1]
				def_num36 = list_0_9[1]
			end
		end
	end, null, null)

		a94 = true
CrewRank:add_toggle("Reset Value", function() return a94 end, function() a94 = not a94 end)

CrewRank:add_action(SPACE, null)

CrewRankNote = CrewRank:add_submenu(README)

CrewRankNote:add_action("     Select one of five crews and set rank;", null)
CrewRankNote:add_action(" you may need to change session to apply", null)
CrewRankNote:add_action(SPACE, null)
CrewRankNote:add_action("                        Reset Value:", null)
CrewRankNote:add_action("  Resets «Set Crew Rank» value after using", null)

--Rank--

Rank = CharactersStats:add_submenu("Rank")

Rank:add_bare_item("",
	function()
		if localplayer ~= nil then
			rank = stats.get_int(MPX() .. "CHAR_RANK_FM")
		else
			rank = "In Menu"
		end
		return "Current Rank: " .. rank
	end, null, null, null)

		def_num29 = list_0_8[1]
		def_num_cur29 = 1
Rank:add_array_item("Number #1", list_0_8,
	function()
		return def_num_cur29
	end,
	function(number29)
		def_num29 = list_0_8[number29]
		def_num_cur29 = number29
	end)

		def_num30 = list_0_9[1]
		def_num_cur30 = 1
Rank:add_array_item("Number #2", list_0_9,
	function()
		return def_num_cur30
	end,
	function(number30)
		def_num30 = list_0_9[number30]
		def_num_cur30 = number30
	end)

		def_num31 = list_0_9[1]
		def_num_cur31 = 1
Rank:add_array_item("Number #3", list_0_9,
	function()
		return def_num_cur31
	end,
	function(number31)
		def_num31 = list_0_9[number31]
		def_num_cur31 = number31
	end)

		def_num32 = list_0_9[1]
		def_num_cur32 = 1
Rank:add_array_item("Number #4", list_0_9,
	function()
		return def_num_cur32
	end,
	function(number32)
		def_num32 = list_0_9[number32]
		def_num_cur32 = number32
	end)

Rank:add_bare_item("",
	function()
		if def_num29 == 0 then
			new_rank = tonumber(def_num30 .. def_num31 .. def_num32)
		else
			new_rank = tonumber(def_num29 .. def_num30 .. def_num31 .. def_num32)
		end
		if new_rank == 0 then
			new_rank = "Not Selected"
		end
		return "Set Rank: " .. new_rank
	end,
	function()
		if new_rank ~= "Not Selected" then
			stats.set_int(MPX() .. "CHAR_SET_RP_GIFT_ADMIN", RankToRP(new_rank))
			if a96 == true then
				stats.set_int("MPPLY_GLOBALXP", RankToRP(new_rank))
			end
			if a97 == false then
				sleep(1)
				SessionChanger(8)
			end
			if a95 == true then
				sleep(1)
				def_num_cur29 = 1
				def_num_cur30 = 1
				def_num_cur31 = 1
				def_num_cur32 = 1
				def_num29 = list_0_8[1]
				def_num30 = list_0_9[1]
				def_num31 = list_0_9[1]
				def_num32 = list_0_9[1]
			end
		end
	end, null, null)

		a95 = true
Rank:add_toggle("Reset Value", function() return a95 end, function() a95 = not a95 end)

		a96 = false
Rank:add_toggle("Change Global RP Stat", function() return a96 end, function() a96 = not a96 end)

		a97 = false
Rank:add_toggle("Fix Story Mode Issue", function() return a97 end, function() a97 = not a97 end)

Rank:add_action(SPACE, null)

RankNote = Rank:add_submenu(README)

RankNote:add_action("                        Reset Value:", null)
RankNote:add_action("      Resets «Set Rank» value after using", null)
RankNote:add_action(SPACE, null)
RankNote:add_action("                 Fix Story Mode Issue:", null)
RankNote:add_action("   You'll need to change session manually", null)

--K/D Changer--

KDChanger = CharactersStats:add_submenu("K/D Changer")

KDChanger:add_bare_item("",
	function()
		return "Current K/D Ratio: " .. stats.get_float("MPPLY_KILL_DEATH_RATIO")
	end, null, null, null)

		def_num37 = list_0_9[1]
		def_num_cur37 = 1
KDChanger:add_array_item("Number #1", list_0_9,
	function()
		return def_num_cur37
	end,
	function(number37)
		def_num37 = list_0_9[number37]
		def_num_cur37 = number37
	end)

		def_num38 = list_0_9[1]
		def_num_cur38 = 1
KDChanger:add_array_item("Number #2", list_0_9,
	function()
		return def_num_cur38
	end,
	function(number38)
		def_num38 = list_0_9[number38]
		def_num_cur38 = number38
	end)

		def_num39 = list_0_9[1]
		def_num_cur39 = 1
KDChanger:add_array_item("Number #3", list_0_9,
	function()
		return def_num_cur39
	end,
	function(number39)
		def_num39 = list_0_9[number39]
		def_num_cur39 = number39
	end)

		def_num40 = list_0_9[1]
		def_num_cur40 = 1
KDChanger:add_array_item("Number #4", list_0_9,
	function()
		return def_num_cur40
	end,
	function(number40)
		def_num40 = list_0_9[number40]
		def_num_cur40 = number40
	end)

		def_num41 = list_0_9[1]
		def_num_cur41 = 1
KDChanger:add_array_item("Number #5", list_0_9,
	function()
		return def_num_cur41
	end,
	function(number41)
		def_num41 = list_0_9[number41]
		def_num_cur41 = number41
	end)

		def_num42 = list_0_9[1]
		def_num_cur42 = 1
KDChanger:add_array_item("Number #6", list_0_9,
	function()
		return def_num_cur42
	end,
	function(number42)
		def_num42 = list_0_9[number42]
		def_num_cur42 = number42
	end)

		def_num43 = list_0_9[1]
		def_num_cur43 = 1
KDChanger:add_array_item("Number #7", list_0_9,
	function()
		return def_num_cur43
	end,
	function(number43)
		def_num43 = list_0_9[number43]
		def_num_cur43 = number43
	end)

		def_num44 = list_0_9[1]
		def_num_cur44 = 1
KDChanger:add_array_item("Number #8", list_0_9,
	function()
		return def_num_cur44
	end,
	function(number44)
		def_num44 = list_0_9[number44]
		def_num_cur44 = number44
	end)

		def_num45 = list_0_9[1]
		def_num_cur45 = 1
KDChanger:add_array_item("Number #9", list_0_9,
	function()
		return def_num_cur45
	end,
	function(number45)
		def_num45 = list_0_9[number45]
		def_num_cur45 = number45
	end)

		def_num46 = list_0_9[1]
		def_num_cur46 = 1
KDChanger:add_array_item("Number #10", list_0_9,
	function()
		return def_num_cur46
	end,
	function(number46)
		def_num46 = list_0_9[number46]
		def_num_cur46 = number46
	end)

KDChanger:add_bare_item("",
	function()
		kd_to_change = tonumber(def_num37 .. def_num38 .. def_num39 .. def_num40 .. def_num41 .. def_num42 .. def_num43 .. def_num44 .. def_num45 .. def_num46)
		if kd_to_change > INT_MAX then
			kd_to_change = INT_MAX
		end
		return "Set K/D Ratio: " .. kd_to_change
	end,
	function()
		stats.set_float("MPPLY_KILL_DEATH_RATIO", kd_to_change)
		stats.set_int("MPPLY_KILLS_PLAYERS", kd_to_change)
		stats.set_int("MPPLY_DEATHS_PLAYER", 0)
		if a98 == true then
			sleep(1)
			def_num_cur37 = 1
			def_num_cur38 = 1
			def_num_cur39 = 1
			def_num_cur40 = 1
			def_num_cur41 = 1
			def_num_cur42 = 1
			def_num_cur43 = 1
			def_num_cur44 = 1
			def_num_cur45 = 1
			def_num_cur46 = 1
			def_num37 = list_0_9[1]
			def_num38 = list_0_9[1]
			def_num39 = list_0_9[1]
			def_num40 = list_0_9[1]
			def_num41 = list_0_9[1]
			def_num42 = list_0_9[1]
			def_num43 = list_0_9[1]
			def_num44 = list_0_9[1]
			def_num45 = list_0_9[1]
			def_num46 = list_0_9[1]
		end
	end, null, null)

		a98 = true
KDChanger:add_toggle("Reset Value", function() return a98 end, function() a98 = not a98 end)

KDChangerDM = KDChanger:add_submenu("Detailed Method")

KDChangerDM:add_bare_item("",
	function()
		return "Current K/D Ratio: " .. stats.get_float("MPPLY_KILL_DEATH_RATIO")
	end, null, null, null)

		kills = 0
KDChangerDM:add_int_range("New Kills", 1, 0, INT_MAX,
	function()
		return kills
	end,
	function(new_kills)
		kills = new_kills
	end)

		deaths = 0
KDChangerDM:add_int_range("New Deaths", 1, 0, INT_MAX,
	function()
		return deaths
	end,
	function(new_deaths)
		deaths = new_deaths
	end)

KDChangerDM:add_bare_item("",
	function()
		new_kd = tonumber(string.format("%.2f", kills / deaths))
		if new_kd == nil then
			new_kd = 0.0
		end
		return "Set K/D Ratio: " .. new_kd
	end,
	function()
		stats.set_float("MPPLY_KILL_DEATH_RATIO", new_kd)
		stats.set_int("MPPLY_KILLS_PLAYERS", kills)
		stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
		if a99 == true then
			kills = 0
			deaths = 0
		end
	end, null, null)

		a99 = true
KDChangerDM:add_toggle("Reset Value", function() return a99 end, function() a99 = not a99 end)

KDChangerDM:add_action(SPACE, null)

KDChangerDMNote = KDChangerDM:add_submenu(README)

KDChangerDMNote:add_action("                        Reset Value:", null)
KDChangerDMNote:add_action("  Resets «Set K/D Ratio» value after using", null)

KDChanger:add_action(SPACE, null)

KDChangerNote = KDChanger:add_submenu(README)

KDChangerNote:add_action("                        Reset Value:", null)
KDChangerNote:add_action("  Resets «Set K/D Ratio» value after using", null)

		b1 = false
	local function SexChanger(Enabled)
		if Enabled then
			stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
			globals.set_int(SCCg, 0)
		else
			stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 0)
			globals.set_int(SCCg, 2880000)
		end
	end
CharactersStats:add_toggle("Sex Changer", function() return b1 end, function() b1 = not b1 SexChanger(b1) end)

CharactersStats:add_action(SPACE, null)

CharactersStatsNote = CharactersStats:add_submenu(README)

CharactersStatsNote:add_action("                       Sex Changer:", null)
CharactersStatsNote:add_action("     Unlocks «Change Sex» option while", null)
CharactersStatsNote:add_action("                editing your character", null)

---Facilities Unlocks---

FacilitiesUnlocks = UnlockTool:add_submenu("Facilities Unlocks | Safe")

--Arena War--

ArenaWar = FacilitiesUnlocks:add_submenu("Arena War")

ArenaWar:add_action("Unlock All Vehicles (Temp.)", function() stats_set_packed_bools(24992, 24999, true) end)

ArenaWar:add_action("Unlock Trade Prices for Headlights", function() stats_set_packed_bools(24980, 24991, true) end)

ArenaWar:add_action("Unlock Trade Prices for Vehicles", function() stats_set_packed_bools(24963, 25109, true) end)

		b2 = 1
	local function ArenaStatsSetter(tier, points)
		stats.set_int(MPX() .. "ARENAWARS_AP_TIER", tier)
		stats.set_int(MPX() .. "ARENAWARS_AP", points)
	end
ArenaWar:add_array_item("Unlock Vehicle", {"Select", "Taxi", "HVY Dozer", "Clown Van", "Trashmaster", "HVY Barracks Semi", "HVY Mixer", "Space Docker", "Tractor"},
	function()
		return b2
	end,
	function(vehicle)
		if vehicle == 2 then
			ArenaStatsSetter(24, 289)
		elseif vehicle == 3 then
			ArenaStatsSetter(49, 539)
		elseif vehicle == 4 then
			ArenaStatsSetter(74, 789)
		elseif vehicle == 5 then
			ArenaStatsSetter(99, 1039)
		elseif vehicle == 6 then
			ArenaStatsSetter(199, 2039)
		elseif vehicle == 7 then
			ArenaStatsSetter(299, 3039)
		elseif vehicle == 8 then
			ArenaStatsSetter(499, 5039)
		elseif vehicle == 9 then
			ArenaStatsSetter(999, 10039)
		end
		b2 = vehicle
		if vehicle > 1 and b3 == false then
			sleep(2)
			SessionChanger(8)
		end
	end)

ArenaWar:add_action("Suicide", function() menu.suicide_player() end)

		b3 = false
ArenaWar:add_toggle("Fix Story Mode Issue", function() return b3 end, function() b3 = not b3 end)

ArenaWarDM = ArenaWar:add_submenu("Detailed Method")

ArenaWarDM:add_int_range("Sponsorship Tier", 1, 0, 1000,
	function()
		return stats.get_int(MPX() .. "ARENAWARS_AP_TIER")
	end,
	function(tier)
		stats.set_int(MPX() .. "ARENAWARS_AP_TIER", tier)
	end)

ArenaWarDM:add_int_range("Arena Points", 10, 0, 10040,
	function()
		return stats.get_int(MPX() .. "ARENAWARS_AP")
	end,
	function(points)
		stats.set_int(MPX() .. "ARENAWARS_AP", points)
	end)

ArenaWarDM:add_action("Change Session", function() SessionChanger(8) end)

ArenaWar:add_action(SPACE, null)

ArenaWarNote = ArenaWar:add_submenu(README)

ArenaWarNote:add_action("                      Unlock Vehicle:", null)
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
ArenaWarNote:add_action("     and spin the wheel until you get AP", null)
ArenaWarNote:add_action(SPACE, null)
ArenaWarNote:add_action("                 Fix Story Mode Issue:", null)
ArenaWarNote:add_action("   You'll need to change session manually", null)

--Bunker--

Bunker = FacilitiesUnlocks:add_submenu("Bunker")

		b4 = false
	local function BunkerResearchSetter(value1, value2, value3, value4, value5)
		globals.set_int(BUCg1, value1)
		globals.set_int(BUCg2, value2)
		globals_set_ints(BUCg3, BUCg4, 1, value3)
		globals.set_int(BUAg1, value4)
		globals.set_int(BUAg2, value5)
	end
	local function BunkerResearchUnlocker(Enabled)
		if Enabled then
			BunkerResearchSetter(1, 1, 1, 0, 0)
			menu.trigger_bunker_research()
		else
			BunkerResearchSetter(60, 300000, 45000, 2, 1)
		end
		while b4 do
			globals.set_int(GSIg + 6, 1)
			sleep(11)
		end
	end
Bunker:add_toggle("Unlock All", function() return b4 end, function() b4 = not b4 BunkerResearchUnlocker(b4) end)

Bunker:add_action("Unlock Shooting Range Rewards",
	function()
		stats.set_int(MPX() .. "SR_HIGHSCORE_1", 690)
		stats.set_int(MPX() .. "SR_HIGHSCORE_2", 1860)
		stats.set_int(MPX() .. "SR_HIGHSCORE_3", 2690)
		stats.set_int(MPX() .. "SR_HIGHSCORE_4", 2660)
		stats.set_int(MPX() .. "SR_HIGHSCORE_5", 2650)
		stats.set_int(MPX() .. "SR_HIGHSCORE_6", 450)
		stats.set_int(MPX() .. "SR_TARGETS_HIT", 269)
		stats.set_int(MPX() .. "SR_WEAPON_BIT_SET", -1)
		stats.set_bool(MPX() .. "SR_TIER_1_REWARD", true)
		stats.set_bool(MPX() .. "SR_TIER_3_REWARD", true)
		stats.set_bool(MPX() .. "SR_INCREASE_THROW_CAP", true)
	end)

Bunker:add_action(SPACE, null)

BunkerNote = Bunker:add_submenu(README)

BunkerNote:add_action("          Set staff equally, activate and", null)
BunkerNote:add_action(" then all researches will unlock one by one", null)

--LS Car Meet--

LSCarMeet = FacilitiesUnlocks:add_submenu("LS Car Meet")

LSCarMeet:add_action("Unlock All", function() globals_set_ints(LSCMMg1, LSCMMg2, 1, 100000) end)

LSCarMeet:add_action("Unlock Trade Prices for Headlights", function() stats_set_packed_bools(24980, 24991, true) end)

LSCarMeet:add_action("Unlock Podium Prize",
	function()
		stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
		stats.set_bool(MPX() .. "CARMEET_PV_CLMED", false)
	end)

LSCarMeet:add_action(SPACE, null)

LSCarMeetNote = LSCarMeet:add_submenu(README)

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
			stats.set_int(MPX() .. "CHAR_FM_CARMOD_" .. i .. "_UNLCK", -1)
		end
		stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", 100)
		stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", 100)
		stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
		stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", 100)
		stats.set_int(MPX() .. "AWD_WIN_CAPTURES", 50)
		stats.set_int(MPX() .. "AWD_FINISH_HEISTS", 50)
		stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
		stats.set_int(MPX() .. "AWD_RACES_WON", 50)
		stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
		stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
		stats.set_int(MPX() .. "TOTAL_RACES_WON", 50)
		stats.set_int(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
		stats.set_int(MPX() .. "RACES_WON", 50)
		stats.set_int(MPX() .. "USJS_COMPLETED", 50)
		stats.set_int(MPX() .. "USJS_FOUND", 50)
		stats.set_int(MPX() .. "USJS_TOTAL_COMPLETED", 50)
		stats.set_int(MPX() .. "AWD_FM_GTA_RACES_WON", 50)
		stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", 50)
		stats.set_int(MPX() .. "AWD_FMBASEJMP", 25)
		stats.set_int(MPX() .. "AWD_FMWINAIRRACE", 25)
		stats.set_int(MPX() .. "AWD_FM_RACE_LAST_FIRST", 25)
		stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", 25)
		stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", 25)
		stats.set_int(MPX() .. "AWD_FMWINSEARACE", 25)
		stats.set_int(MPX() .. "MOST_FLIPS_IN_ONE_JUMP", 5)
		stats.set_int(MPX() .. "MOST_SPINS_IN_ONE_JUMP", 5)
	end)

LSCustoms:add_action("Enable Hidden Liveries",
	function()
		for i = 0, 20 do
			stats.set_int("MPPLY_XMASLIVERIES" .. i, -1)
		end
	end)

LSCustoms:add_action("Enable Taxi Liveries",
	function()
		stats.set_int(MPX() .. "AWD_TAXIDRIVER", 50)
		stats.set_masked_int(MPX() .. "DLC22022PSTAT_INT536", 10, 16, 8)
	end)

LSCustoms:add_action("Enable Xmas Plates", function() stats.set_int("MPPLY_XMAS23_PLATES0", -1) end)

		forge_model = false
		old_forge_hash = 0
LSCustoms:add_toggle("Enable Forge Model",
	function()
		return forge_model
	end,
	function()
		forge_model = not forge_model
		if forge_model then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				old_forge_hash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(-1008861746)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(old_forge_hash)
			end
		end
	end)

CustomModifications = LSCustoms:add_submenu("Custom Modifications")

CustomWheels = CustomModifications:add_submenu("Custom Wheels")

		f1_mode = false
		old_f1_hash = 0
CustomWheels:add_toggle("F1 Wheels",
	function()
		return f1_mode
	end,
	function()
		f1_mode = not f1_mode
		if f1_mode then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				old_f1_hash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(1492612435)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(old_f1_hash)
			end
		end
	end)

		bennys_mode = false
		old_bennys_hash = 0
CustomWheels:add_toggle("Benny's Wheels",
	function()
		return bennys_mode
	end,
	function()
		bennys_mode = not bennys_mode
		if bennys_mode then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				old_bennys_mode = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(196747873)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(old_bennys_hash)
			end
		end
	end)

CustomWheels:add_action(SPACE, null)

CustomWheelsNote = CustomWheels:add_submenu(README)

CustomWheelsNote:add_action("    Enable which feature you want to use", null)
CustomWheelsNote:add_action(" when you're in CEO Office Mod Shop and", null)
CustomWheelsNote:add_action("      disable after purchasing the wheels", null)

CustomPlate = CustomModifications:add_submenu("Custom Plate")

		plate_chars = {
			".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
			"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
			"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
			"W", "X", "Y", "Z"
		}

		def_num21 = plate_chars[1]
		def_num_cur21 = 1
CustomPlate:add_array_item("Symbol #1", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur21
		end
	end,
	function(number21)
		def_num21 = plate_chars[number21]
		def_num_cur21 = number21
	end)

		def_num22 = plate_chars[1]
		def_num_cur22 = 1
CustomPlate:add_array_item("Symbol #2", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur22
		end
	end,
	function(number22)
		def_num22 = plate_chars[number22]
		def_num_cur22 = number22
	end)

		def_num23 = plate_chars[1]
		def_num_cur23 = 1
CustomPlate:add_array_item("Symbol #3", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle()
			then return def_num_cur23
		end
	end,
	function(number23)
		def_num23 = plate_chars[number23]
		def_num_cur23 = number23
	end)

		def_num24 = plate_chars[1]
		def_num_cur24 = 1
CustomPlate:add_array_item("Symbol #4", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur24
		end
	end,
	function(number24)
		def_num24 = plate_chars[number24]
		def_num_cur24 = number24
	end)

		def_num25 = plate_chars[1]
		def_num_cur25 = 1
CustomPlate:add_array_item("Symbol #5", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur25
		end
	end,
	function(number25)
		def_num25 = plate_chars[number25]
		def_num_cur25 = number25
	end)

		def_num26 = plate_chars[1]
		def_num_cur26 = 1
CustomPlate:add_array_item("Symbol #6", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur26
		end
	end,
	function(number26)
		def_num26 = plate_chars[number26]
		def_num_cur26 = number26
	end)

		def_num27 = plate_chars[1]
		def_num_cur27 = 1
CustomPlate:add_array_item("Symbol #7", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur27
		end
	end,
	function(number27)
		def_num27 = plate_chars[number27]
		def_num_cur27 = number27
	end)

		def_num28 = plate_chars[1]
		def_num_cur28 = 1
CustomPlate:add_array_item("Symbol #8", plate_chars,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return def_num_cur28
		end
	end,
	function(number28)
		def_num28 = plate_chars[number28]
		def_num_cur28 = number28
	end)

local function PlateChecker(space)
		if space == "." then
			return " "
		else
			return space
		end
	end
CustomPlate:add_bare_item("",
	function()
		checked_plate = PlateChecker(def_num21) .. PlateChecker(def_num22) .. PlateChecker(def_num23) .. PlateChecker(def_num24) .. PlateChecker(def_num25) .. PlateChecker(def_num26) .. PlateChecker(def_num27) .. PlateChecker(def_num28)
		new_plate = def_num21 .. def_num22 .. def_num23 .. def_num24 .. def_num25 .. def_num26 .. def_num27 .. def_num28
		return "Apply Plate: " .. checked_plate
	end,
	function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			localplayer:get_current_vehicle():set_number_plate_text(new_plate)
		end
		if b5 == true then
			sleep(1)
			def_num_cur21 = 1
			def_num_cur22 = 1
			def_num_cur23 = 1
			def_num_cur24 = 1
			def_num_cur25 = 1
			def_num_cur26 = 1
			def_num_cur27 = 1
			def_num_cur28 = 1
			def_num21 = plate_chars[1]
			def_num22 = plate_chars[1]
			def_num23 = plate_chars[1]
			def_num24 = plate_chars[1]
			def_num25 = plate_chars[1]
			def_num26 = plate_chars[1]
			def_num27 = plate_chars[1]
			def_num28 = plate_chars[1]
		end
	end, null, null)

		b5 = true
CustomPlate:add_toggle("Reset Value", function() return b5 end, function() b5 = not b5 end)

CustomPlate:add_action(SPACE, null)

CustomPlateNote = CustomPlate:add_submenu(README)

CustomPlateNote:add_action("                        «.» = space;", null)
CustomPlateNote:add_action("      Use in LSC and buy a plate to save", null)
CustomPlateNote:add_action(SPACE, null)
CustomPlateNote:add_action("                        Reset Value:", null)
CustomPlateNote:add_action("    Resets «Apply Plate» value after using", null)

LSCustoms:add_action(SPACE, null)

LSCustomsNote = LSCustoms:add_submenu(README)

LSCustomsNote:add_action("         Some colors may not be saved", null)

--Miscellaneous--

Misc = UnlockTool:add_submenu("Miscellaneous | Safe")

		b6 = 1
	local function BadSportSetter(value1, value2, value3)
		stats.set_int("MPPLY_BADSPORT_MESSAGE", value1)
		stats.set_int("MPPLY_BECAME_BADSPORT_NUM", value1)
		stats.set_float("MPPLY_OVERALL_BADSPORT", value2)
		stats.set_bool("MPPLY_CHAR_IS_BADSPORT", value3)
		sleep(1)
		SessionChanger(8)
	end
Misc:add_array_item("Bad Sport Label", {"Select", "Add", "Remove"},
	function()
		return b6
	end,
	function(label)
		if label == 2 then
			BadSportSetter(-1, 60000, true)
		elseif label == 3 then
			BadSportSetter(0, 0, false)
		end
	end)

		b7 = 1
Misc:add_array_item("Get Supplies", {"Select", "All", "Cash", "Coke", "Weed", "Meth", "Documents", "Bunker", "Acid"},
	function()
		return b7
	end,
	function(supplies)
		if supplies ~= 1 and supplies ~= 2 then
			globals.set_int(GSIg + (supplies - 2), 1)
		else
			globals_set_ints(GSIg + 1, GSIg + 7, 1, 1)
		end
	end)

		b8 = false
	local function DripfeedVehiclesToggler(Enabled)
		if Enabled then
			globals_set_bools(EDVg1, EDVg2, 1, true)
		else
			globals_set_bools(EDVg1, EDVg2, 1, false)
		end
	end
Misc:add_toggle("Enable Dripfeed Vehicles", function() return b8 end, function() b8 = not b8 DripfeedVehiclesToggler(b8) end)

		b9 = false
	local function RemovedVehiclesSetter(bool)
		globals_set_bools(EVg1, EVg2, 1, bool)
		globals_set_bools(EVg3, EVg4, 1, bool)
		globals_set_bools(EVg5, EVg6, 1, bool)
		globals_set_bools(EVg7, EVg8, 1, bool)
		globals_set_bools(EVg9, EVg10, 1, bool)
		globals_set_bools(EVg11, EVg12, 1, bool)
		globals_set_bools(EVg13, EVg14, 2, bool)
		globals_set_bools(EVg15, EVg16, 1, bool)
		globals_set_bools(EVg17, EVg18, 1, bool)
		globals_set_bools(EVg19, EVg20, 1, bool)
		globals_set_bools(EVg21, EVg22, 1, bool)
		globals_set_bools(EVg23,  EVg24, 1, bool)
		globals.set_bool(EVg25, bool)
		globals.set_bool(EVg26, bool)
		globals_set_bools(EVg23, EVg24, 1, bool)
		globals_set_bools(EVg25, EVg26, 1, bool)
		globals_set_bools(EVg27, EVg28, 1, bool)
		globals_set_bools(EVg29, EVg30, 1, bool)
		globals_set_bools(EVg31, EVg32, 1, bool)
		globals_set_bools(EVg33, EVg34, 1, bool)
		globals_set_bools(EVg35, EVg36, 1, bool)
		globals_set_bools(EVg37, EVg38, 1, bool)
		globals_set_bools(EVg39, EVg40, 1, bool)
		globals_set_bools(EVg41, EVg42, 1, bool)
		globals_set_bools(EVg43, EVg44, 1, bool)
	end
	local function RemovedVehiclesToggler(Enabled)
		if Enabled then
			RemovedVehiclesSetter(true)
		else
			RemovedVehiclesSetter(false)
		end
	end
Misc:add_toggle("Enable Removed Vehicles", function() return b9 end, function() b9 = not b9 RemovedVehiclesToggler(b9) end)

		b10 = false
	local function SilentNSneakyToggler(Enabled)
		if Enabled and localplayer ~= nil then
			hide_me = 1845263 + 1 + (PlayerID() * 877) + 205
			while b10 do
				globals.set_int(hide_me, 8)
				sleep(1)
			end
		else
			globals.set_int(hide_me, 9)
		end
	end
Misc:add_toggle("Hide Me", function() return b10 end, function() b10 = not b10 SilentNSneakyToggler(b10) end)

GunVan = Misc:add_submenu("Modify Gun Van Weapons")

		gunvan_locs = {
			[0] = {-29.532, 6435.136, 31.162},
			[1] = {1705.214, 4819.167, 41.75},
			[2] = {1795.522, 3899.753, 33.869},
			[3] = {1335.536, 2758.746, 51.099},
			[4] = {795.583, 1210.78, 338.962},
			[5] = {-3192.67, 1077.205, 20.594},
			[6] = {-789.719, 5400.921, 33.915},
			[7] = {-24.384, 3048.167, 40.703},
			[8] = {2666.786, 1469.324, 24.237},
			[9] = {-1454.966, 2667.503, 3.2},
			[10] = {2340.418, 3054.188, 47.888},
			[11] = {1509.183, -2146.795, 76.853},
			[12] = {1137.404, -1358.654, 34.322},
			[13] = {-57.208, -2658.793, 5.737},
			[14] = {1905.017, 565.222, 175.558},
			[15] = {974.484, -1718.798, 30.296},
			[16] = {779.077, -3266.297, 5.719},
			[17] = {-587.728, -1637.208, 19.611},
			[18] = {733.99, -736.803, 26.165},
			[19] = {-1694.632, -454.082, 40.712},
			[20] = {-1330.726, -1163.948, 4.313},
			[21] = {-496.618, 40.231, 52.316},
			[22] = {275.527, 66.509, 94.108},
			[23] = {260.928, -763.35, 30.559},
			[24] = {-478.025, -741.45, 30.299},
			[25] = {894.94, 3603.911, 32.56},
			[26] = {-2166.511, 4289.503, 48.733},
			[27] = {1465.633, 6553.67, 13.771},
			[28] = {1101.032, -335.172, 66.944},
			[29] = {149.683, -1655.674, 29.028}
		}
GunVan:add_action("Teleport to Gun Van",
	function()
		location = globals.get_int(GVLg)
		TP(gunvan_locs[location][1], gunvan_locs[location][2], gunvan_locs[location][3], 0, 0, 0)
	end)

		weapons_data = {
			{hash = -656458692, name = "Knuckle Duster"}, -- 1
			{hash = -1786099057, name = "Baseball Bat"}, -- 2
			{hash = -853065399, name = "Battle Axe"}, -- 3
			{hash = -102323637, name = "Bottle"}, -- 4
			{hash = -2067956739, name = "Crowbar"}, -- 5
			{hash = -1834847097, name = "Antique Cavalry Dagger"}, -- 6
			{hash = -1951375401, name = "Flashlight"}, -- 7
			{hash = 1317494643, name = "Hammer"}, -- 8
			{hash = -102973651, name = "Hatchet"}, -- 9
			{hash = -1716189206, name = "Knife"}, -- 10
			{hash = -581044007, name = "Machete"}, -- 11
			{hash = 1737195953, name = "Nightstick"}, -- 12
			{hash = -1810795771, name = "Pool Cue"}, -- 13
			{hash = -538741184, name = "Switchblade"}, -- 14
			{hash = 419712736, name = "Pipe Wrench"}, -- 15
			{hash = 584646201, name = "AP Pistol"}, -- 16
			{hash = 727643628, name = "Ceramic Pistol"}, -- 17
			{hash = 1593441988, name = "Combat Pistol"}, -- 18
			{hash = -1746263880, name = "Double Action Revolver"}, -- 19
			{hash = 1198879012, name = "Flare Gun"}, -- 20
			{hash = 1470379660, name = "Perico Pistol"}, -- 21
			{hash = -771403250, name = "Heavy Pistol"}, -- 22
			{hash = -598887786, name = "Marksman Pistol"}, -- 23
			{hash = -1853920116, name = "Navy Revolver"}, -- 24
			{hash = 453432689, name = "Pistol"}, -- 25
			{hash = -1075685676, name = "Pistol Mk II"}, -- 26
			{hash = -1716589765, name = "Pistol .50"}, -- 27
			{hash = -1355376991, name = "Up-n-Atomizer"}, -- 28
			{hash = -1045183535, name = "Heavy Revolver"}, -- 29
			{hash = -879347409, name = "Heavy Revolver Mk II"}, -- 30
			{hash = -1076751822, name = "SNS Pistol"}, -- 31
			{hash = -2009644972, name = "SNS Pistol Mk II"}, -- 32
			{hash = 137902532, name = "Vintage Pistol"}, -- 33
			{hash = 1171102963, name = "Stun Gun"}, -- 34
			{hash = -270015777, name = "Assault SMG"}, -- 35
			{hash = 171789620, name = "Combat PDW"}, -- 36
			{hash = -619010992, name = "Machine Pistol"}, -- 37
			{hash = 324215364, name = "Micro SMG"}, -- 38
			{hash = -1121678507, name = "Mini SMG"}, -- 39
			{hash = 736523883, name = "SMG"}, -- 40
			{hash = 2024373456, name = "SMG Mk II"}, -- 41
			{hash = 350597077, name = "Tactical SMG"}, -- 42
			{hash = -1357824103, name = "Advanced Rifle"}, -- 43
			{hash = -1074790547, name = "Assault Rifle"}, -- 44
			{hash = 961495388, name = "Assault Rifle Mk II"}, -- 45
			{hash = 2132975508, name = "Bullpup Rifle"}, -- 46
			{hash = -2066285827, name = "Bullpup Rifle Mk II"}, -- 47
			{hash = -2084633992, name = "Carbine Rifle"}, -- 48
			{hash = -86904375, name = "Carbine Rifle Mk II"}, -- 49
			{hash = 1649403952, name = "Compact Rifle"}, -- 50
			{hash = -947031628, name = "Heavy Rifle"}, -- 51
			{hash = -1658906650, name = "Military Rifle"}, -- 52
			{hash = -1063057011, name = "Special Carbine"}, -- 53
			{hash = -1768145561, name = "Special Carbine Mk II"}, -- 54
			{hash = -774507221, name = "Service Carbine"}, -- 55
			{hash = 1924557585, name = "Battle Rifle"}, -- 56
			{hash = -494615257, name = "Assault Shotgun"}, -- 57
			{hash = 317205821, name = "Sweeper Shotgun"}, -- 58
			{hash = -1654528753, name = "Bullpup Shotgun"}, -- 59
			{hash = 94989220, name = "Combat Shotgun"}, -- 60
			{hash = -275439685, name = "Double Barrel Shotgun"}, -- 61
			{hash = 984333226, name = "Heavy Shotgun"}, -- 62
			{hash = 487013001, name = "Pump Shotgun"}, -- 63
			{hash = 1432025498, name = "Pump Shotgun Mk II"}, -- 64
			{hash = 2017895192, name = "Sawed-Off Shotgun"}, -- 65
			{hash = -1466123874, name = "Musket"}, -- 66
			{hash = 2144741730, name = "Combat MG"}, -- 67
			{hash = -608341376, name = "Combat MG Mk II"}, -- 68
			{hash = 1627465347, name = "Gusenberg Sweeper"}, -- 69
			{hash = -1660422300, name = "MG"}, -- 70
			{hash = 1198256469, name = "Unholy Hellbringer"}, -- 71
			{hash = 205991906, name = "Heavy Sniper"}, -- 72
			{hash = 177293209, name = "Heavy Sniper Mk II"}, -- 73
			{hash = -952879014, name = "Marksman Rifle"}, -- 74
			{hash = 1785463520, name = "Marksman Rifle Mk II"}, -- 75
			{hash = 1853742572, name = "Precision Rifle"}, -- 76
			{hash = 100416529, name = "Sniper Rifle"}, -- 77
			{hash = 125959754, name = "Compact Grenade Launcher"}, -- 78
			{hash = -618237638, name = "Compact EMP Launcher"}, -- 79
			{hash = 2138347493, name = "Firework Launcher"}, -- 80
			{hash = -1568386805, name = "Grenade Launcher"}, -- 81
			{hash = 1672152130, name = "Homing Launcher"}, -- 82
			{hash = 1119849093, name = "Minigun"}, -- 83
			{hash = -22923932, name = "Railgun"}, -- 84
			{hash = -1238556825, name = "Widowmaker"}, -- 85
			{hash = -1312131151, name = "RPG"}, -- 86
			{hash = -1813897027, name = "Grenade"}, -- 87
			{hash = 615608432, name = "Molotov"}, -- 88
			{hash = -1169823560, name = "Pipe Bomb"}, -- 89
			{hash = -1420407917, name = "Proximity Mine" }, -- 90
			{hash = -37975472, name = "Tear Gas"}, -- 91
			{hash = 741814745, name = "Sticky Bomb"}, -- 92
			{hash = 883325847, name = "Jerry Can"}, -- 93
		}

GunVanWeapons = GunVan:add_submenu("Weapons")

WSlot1 = GunVanWeapons:add_submenu("1-slot")
WSlot2 = GunVanWeapons:add_submenu("2-slot")
WSlot3 = GunVanWeapons:add_submenu("3-slot")
WSlot4 = GunVanWeapons:add_submenu("4-slot")
WSlot5 = GunVanWeapons:add_submenu("5-slot")
WSlot6 = GunVanWeapons:add_submenu("6-slot")
WSlot7 = GunVanWeapons:add_submenu("7-slot")
WSlot8 = GunVanWeapons:add_submenu("8-slot")
WSlot9 = GunVanWeapons:add_submenu("9-slot")
for i = 1, 86 do
	WSlot1:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 1) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 1, weapons_data[i].hash)
		end)

	WSlot2:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 2) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 2, weapons_data[i].hash)
		end)

	WSlot3:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 3) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 3, weapons_data[i].hash)
		end)

	WSlot4:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 4) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 4, weapons_data[i].hash)
		end)

	WSlot5:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 5) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 5, weapons_data[i].hash)
		end)

	WSlot6:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 6) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 6, weapons_data[i].hash)
		end)

	WSlot7:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 7) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 7, weapons_data[i].hash)
		end)

	WSlot8:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 8) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 8, weapons_data[i].hash)
		end)

	WSlot9:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVWSg + 9) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 9, weapons_data[i].hash)
		end)
end

GunVanThorwables = GunVan:add_submenu("Throwables")

TSlot1 = GunVanThorwables:add_submenu("1-slot")
TSlot2 = GunVanThorwables:add_submenu("2-slot")
TSlot3 = GunVanThorwables:add_submenu("3-slot")
for i = 87, 93 do
	TSlot1:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVTSg + 1) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVTSg + 1, weapons_data[i].hash)
		end)

	TSlot2:add_toggle(weapons_data[i].name,
			function()
				if weapons_data[i].hash == globals.get_int(GVTSg + 2) then
					return true
				else
					return false
				end
			end,
			function()
				globals.set_int(GVTSg + 2, weapons_data[i].hash)
			end)

	TSlot3:add_toggle(weapons_data[i].name,
		function()
			if weapons_data[i].hash == globals.get_int(GVTSg + 3) then
				return true
			else
				return false
			end
		end,
		function()
			globals.set_int(GVTSg + 3, weapons_data[i].hash)
		end)
end

		b11 = false
	local function GunvanDiscountsSetter(value)
		globals_set_ints(GVADg + 1, GVADg + 9, 1, value)
		globals_set_ints(GVTDg + 1, GVTDg + 3, 1, value)
		globals_set_ints(GVWDg + 1, GVWDg + 5, 1, value)
	end
	local function GunvanDiscountsToggler(Enabled)
		if Enabled then
			GunVanDiscountsSetter(1036831744)
		else
			GunVanDiscountsSetter(0)
		end
	end
GunVan:add_toggle("Jewish Trade Skills (-10%)", function() return b11 end, function() b11 = not b11 GunvanDiscountsToggler(b11) end)

Misc:add_action("Unlock All Parachutes",
	function()
		stats_set_packed_bool(3609, true)
		stats_set_packed_bools(31791, 31796, true)
		stats_set_packed_bools(34378, 34379, true)
	end)

Misc:add_action("Unlock All Tattoos",
	function()
		for i = 0, 53 do
			stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_" .. i, -1)
		end
		stats.set_int(MPX() .. "TATTOO_FM_CURRENT_32", -1)
	end)

Misc:add_action("Unlock Diamond Casino Outfits", function() stats_set_packed_bools(28225, 28248, true) end)

Misc:add_action("Unlock Flight School Gold Medals",
	function()
		for i = 0, 9 do
			stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i , -1)
			stats.set_int(MPX() .. "PILOT_SCHOOL_MEDAL_" .. i, -1)
			stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_" .. i, true)
		end
		stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
	end)

Misc:add_action("Unlock Trade Prices for Cop Cars",
	function()
		stats.set_int(MPX() .. "SALV23_GEN_BS", -1)
		stats.set_int(MPX() .. "SALV23_INST_PROG", -1)
		stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1)
		stats.set_int(MPX() .. "MOST_TIME_ON_3_PLUS_STARS", 300000)
	end)

Misc:add_action(SPACE, null)

MiscNote = Misc:add_submenu(README)

MiscNote:add_action("                          Hide Me:", null)
MiscNote:add_action("             Hides you from player list;", null)
MiscNote:add_action("     also removes your blip from the map", null)

---Credits---

Credits = SilentNight:add_submenu("♥ Credits")

Credits:add_action("Developer: Silent", null)
Credits:add_action("Helpers #1: gaymer, Big Smoke, Slon", null)
Credits:add_action("Helpers #2: CasinoPacino, Bababoiiiii", null)
Credits:add_action("Helpers #3: Amnesia, jschaotic, Killa`B", null)
Credits:add_action("Helpers #4: Mr. Robot, L7NEG, LUKY6464", null)
Credits:add_action("Helpers #5: ShinyWasabi, gir489returns", null)
Credits:add_action("Helpers #6: Unkn0wnXit, Zeiger, Pewpew", null)
Credits:add_action("Helpers #7: ObratniyVasya, CheatChris", null)
Credits:add_action("Testers #1: BirbTickles, your_local_racist", null)
Credits:add_action("Testers #2: Hvedemel, fjiafbniae", null)
Credits:add_action(SPACE, null)
Credits:add_action("Discord: silentsalo", null)

---[[ Developer: Silent ]]---
