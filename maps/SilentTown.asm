	object_const_def
	const SILENT_TOWN_SUPER_NERD

SilentTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilentTownFlypointCallback

SilentTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

SilentTownSuperNerdScript:
	jumptextfaceplayer Text_urMom

SilentTownPlayersHouseSign:
	jumptext SilentTownPlayersHouseSignText

SilentTownAspenLabSign:
	; TODO logic for when lab is put up for sale by GLACIER INC.
	jumptext Text_AspenLab

SilentTownSign:
	jumptext Text_SilentTownDesc

SilentTownGymSign:
	jumptext Text_SilentTownGym

SilentTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

Text_urMom:
	text "ur mom is gay"
	line "lmao get pwned"
	done

Text_SilentTownDesc:
	text "SILENT TOWN"

	para "Where winds howl"
	line "and water blows."

	para "The oldest town"
	line "in KORI."
	done

Text_AspenLab:
	text "ASPEN LABS"
	
	para "The newest"
	line "frontier of"
	cont "#MON"
	cont "research!"
	done

Text_SilentTownGym:
	text "SILENT TOWN GYM"

	para "LEADER: ASPEN"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 23, PLAYERS_HOUSE_1F, 1
	warp_event  2,  5, PROF_ASPEN_LAB, 1
	warp_event 16,  7, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 17, 25, SILENT_TOWN_NEIGHBORS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  4, 24, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event  5,  7, BGEVENT_READ, SilentTownAspenLabSign
	bg_event 10,  4, BGEVENT_READ, SilentTownSign
	bg_event 18,  8, BGEVENT_READ, SilentTownGymSign

	def_object_events
	object_event  15, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownSuperNerdScript, -1
