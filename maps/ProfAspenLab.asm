    object_const_def
    const PROFASPENLAB_ASPEN
    const PROFASPENLAB_SCIENTIST1
    const PROFASPENLAB_SCIENTIST2
    const PROFASPENLAB_SCIENTIST3
    const PROFASPENLAB_SCIENTIST4
    const PROFASPENLAB_POKEBALL

ProfAspenLab_MapScripts:
    def_scene_scripts
    scene_script ProfAspenLabNoop1Scene, SCENE_PROFASPENLAB_AIDE_GIVE_MON
    scene_script ProfAspenLabNoop2Scene, SCENE_PROFASPENLAB_NOOP
    def_callbacks

ProfAspenLabNoop1Scene:
ProfAspenLabNoop2Scene:
    end

MeetAideScript:
    checkscene SCENE_PROFASPENLAB_AIDE_GIVE_MON
    iftrue .AideJustLeave
    jumptextfaceplayer Text_AideIntro
    setscene SCENE_PROFASPENLAB_AIDE_GIVE_MON
    end

.AideJustLeave 
    jumptextfaceplayer Text_AideJustLeave
    end

AideGiveMonUpScript:
    setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1 ; flag for up
AideGiveMonDownScript:
    showemote EMOTE_SHOCK, PROFASPENLAB_SCIENTIST1, 15
    turnobject PROFASPENLAB_SCIENTIST1, DOWN
    opentext
    writetext Text_AideAlmostForgot
    promptbutton
    closetext

    applymovement PROFASPENLAB_SCIENTIST1, AidePickUpBallMovement
    disappear PROFASPENLAB_POKEBALL
    clearevent EVENT_STARTER_BALL_IN_LAB
    opentext
    writetext Text_AideHopeHeDoesntMind
    promptbutton
    closetext
    
    checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
    iftrue .OnUp
    applymovement PROFASPENLAB_SCIENTIST1, AideWalkToPlayerDownMovement
    sjump AideGiveMonScript
.OnUp
    applymovement PROFASPENLAB_SCIENTIST1, AideWalkToPlayerUpMovement
AideGiveMonScript:
    opentext
    writetext Text_AideGiveMon
    playsound SFX_CAUGHT_MON
    waitsfx
    promptbutton
    givepoke SWINUB, 5, BERRY
    writetext Text_AideGoodLuck
    promptbutton
    closetext

    checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
    iftrue .OnUpReturn
    applymovement PROFASPENLAB_SCIENTIST1, AideWalkToPCDownMovement
    sjump AideFinishScript
.OnUpReturn
    applymovement PROFASPENLAB_SCIENTIST1, AideWalkToPCUpMovement
AideFinishScript:
    setevent EVENT_GOT_POKEMON
    setscene SCENE_PROFASPENLAB_NOOP
    end




ProfAspenLab_MapEvents:
    db 0, 0  ; filler

    def_warp_events
    warp_event 4, 19, SILENT_TOWN, 2
    warp_event 5, 19, SILENT_TOWN, 2

    def_coord_events
    coord_event 6, 4, SCENE_PROFASPENLAB_AIDE_GIVE_MON, AideGiveMonUpScript
    coord_event 6, 5, SCENE_PROFASPENLAB_AIDE_GIVE_MON, AideGiveMonDownScript
    def_bg_events

    def_object_events
    object_event  8,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeetAideScript, EVENT_SAVED_ASPEN
    object_event  8,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeetAideScript, EVENT_WAITING_ASPEN
    object_event  2, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, -1
    object_event  8, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, -1
    object_event  3, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, -1
    object_event  6, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, EVENT_STARTER_BALL_IN_LAB
