	object_const_def

SilentTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilentTownFlypointCallback

SilentTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

SilentTownPlayersHouseSign:
	jumptext SilentTownPlayersHouseSignText

SilentTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 29, PLAYERS_HOUSE_1F, 1
	warp_event  4, 13, BATTLE_TOWER_OUTSIDE, 1
	warp_event 14,  9, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 17, 31, SILENT_TOWN_NEIGHBORS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  4, 30, BGEVENT_READ, SilentTownPlayersHouseSign

	def_object_events
