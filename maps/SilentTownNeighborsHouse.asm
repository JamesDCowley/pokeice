	object_const_def
    const SILENT_TOWN_NEIGHBORS_HOUSE_TEACHER
    const SILENT_TOWN_NEIGHBORS_HOUSE_TWIN

SilentTownNeighborsHouse_MapScripts:
	def_scene_scripts

    def_callbacks

SilentTownNeighborsHouseTeacherScript:
    checkevent EVENT_GOT_A_POKEMON_FROM_ELM
    iftrue .MonIsAdorable
    jumptext Text_AspenLookingForYou

.MonIsAdorable
    jumptextfaceplayer Text_MonIsAdorable

SilentTownNeighborsHosueTwinScript:
    jumptextfaceplayer Text_NoFair

Text_AspenLookingForYou:
    text "Hello, <PLAYER>"
    line "I heard PROF."
    cont "ASPEN is looking"
    cont "for you!"

    para "It's probably"
    line "important!"
    done

Text_MonIsAdorable:
    text "Oh! Your #MON!"
    line "It's so cute!"
    cont "I wish I had one!"
    done

Text_NoFair:
    text "No fair!"
    line "Why do you get to"
    cont "play with PROF."
    cont "ASPEN?!"
    done

SilentTownNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SILENT_TOWN, 4
	warp_event  3,  7, SILENT_TOWN, 4

	def_coord_events

	def_bg_events

	def_object_events
    object_event 2, 3, SPRITE_TEACHER, SPRITEMOVEDATA_STILL, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, SilentTownNeighborsHouseTeacherScript, -1
    object_event 6, 3, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownNeighborsHosueTwinScript, -1 