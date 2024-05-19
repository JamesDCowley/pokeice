    object_const_def
    const PROF_ASPEN_LAB_ASPEN
    const PROF_ASPEN_LAB_SCIENTIST1
    const PROF_ASPEN_LAB_SCIENTIST2
    const PROF_ASPEN_LAB_SCIENTIST3
    const PROF_ASPEN_LAB_SCIENTIST4
    const PROF_ASPEN_LAB_POKEBALL

ProfAspenLab_MapScripts:
    def_scene_scripts
    scene_script ProfAspenLabNoop2Scene, SCENE_PROF_ASPEN_LAB_NOOP
    scene_script ProfAspenLabNoop1Scene, SCENE_PROF_ASPEN_LAB_AIDE_GIVE_MON
    scene_script ProfAspenLabNoop1Scene, SCENE_PROF_ASPEN_LAB_AIDE_GIVE_POTION
    scene_script ProfAspenLabNoop1Scene, SCENE_PROF_ASPEN_LAB_AIDE_GIVE_BALL
    
    
    def_callbacks

ProfAspenLabNoop1Scene:
    end
ProfAspenLabNoop2Scene:
    end

MeetAideScript:
    checkscene 
    ifequal SCENE_PROF_ASPEN_LAB_AIDE_GIVE_MON, .AideJustLeave
    checkevent EVENT_GOT_POKEMON
    iftrue .AideJustLeave
    faceplayer
    opentext
    writetext Text_AideIntro
    promptbutton
    closetext
    setscene SCENE_PROF_ASPEN_LAB_AIDE_GIVE_MON
    end

.AideJustLeave 
    faceplayer
    opentext
    writetext Text_AideJustLeave
    promptbutton
    closetext
    turnobject PROF_ASPEN_LAB_SCIENTIST1, UP
    end

AideGiveMonUpScript:
    setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1 ; flag for up
AideGiveMonDownScript:
    showemote EMOTE_SHOCK, PROF_ASPEN_LAB_SCIENTIST1, 15
    turnobject PROF_ASPEN_LAB_SCIENTIST1, DOWN
    turnobject PLAYER, RIGHT
    opentext
    writetext Text_AideAlmostForgot
    promptbutton
    closetext

    applymovement PROF_ASPEN_LAB_SCIENTIST1, AidePickUpBallMovement
    disappear PROF_ASPEN_LAB_POKEBALL
    clearevent EVENT_STARTER_BALL_IN_LAB
    opentext
    writetext Text_AideHopeHeDoesntMind
    promptbutton
    closetext
    
    checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
    iftrue .OnUp
    applymovement PROF_ASPEN_LAB_SCIENTIST1, AideWalkToPlayerDownMovement
    sjump AideGiveMonScript
.OnUp:
    applymovement PROF_ASPEN_LAB_SCIENTIST1, AideWalkToPlayerUpMovement
AideGiveMonScript:
    opentext
    writetext Text_AideGiveMon
    playsound SFX_CAUGHT_MON
    writetext Text_RecieveSwinub
    waitsfx
    promptbutton
    givepoke SWINUB, 5, BERRY
    writetext Text_AideGoodLuck
    promptbutton
    closetext   

    checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
    iftrue .OnUpReturn
    applymovement PROF_ASPEN_LAB_SCIENTIST1, AideWalkToPCDownMovement
    sjump AideFinishScript
.OnUpReturn:
    applymovement PROF_ASPEN_LAB_SCIENTIST1, AideWalkToPCUpMovement
AideFinishScript:
    setevent EVENT_GOT_POKEMON
    setscene SCENE_PROF_ASPEN_LAB_NOOP
    end

ProfAspenLabScientist2Script:
    jumptextfaceplayer Text_ProfAspenLabScientist2
    end

AidePickUpBallMovement:
    step LEFT
    step LEFT
    turn_head DOWN
    step_end

AideWalkToPlayerDownMovement:
    step RIGHT
    step RIGHT
    step DOWN
    step DOWN
    step DOWN
    step LEFT
    step_end

AideWalkToPlayerUpMovement:
    step RIGHT
    step RIGHT
    step DOWN
    step DOWN
    step LEFT
    step_end

AideWalkToPCDownMovement:
    step RIGHT
    step UP
    step UP
    step UP
    step_end

AideWalkToPCUpMovement:
    step RIGHT
    step UP
    step UP
    step_end

Text_AideIntro:
    text "Oh hey!"
    
    para "Sorry I'm a bit"
    line "busy at the moment"
    
    para "How can I help"
    line "you?"

    para "... ..."
    line "... ..."

    para "Ah, PROF. ASPEN"
    line "needed you?"

    para "Well unfortunately"
    line "he's at a meeting"
    cont "in PUREN CITY at"
    cont "the moment."

    para "Said something"
    line "about it being an"
    cont "emergency..."

    para "...Actually now"
    line "that I think about"
    cont "it, he's been"
    cont "there for an"
    cont "awfully long time."

    para "I hate to ask, but"
    line "can you go check"
    cont "on him?"

    para "PUREN CITY is just"
    line "north of here."
    
    para "Just take ROUTE 14"
    line "and you should get"
    cont "there."

    para "Thanks!"
    done

Text_AideJustLeave:
    text "Yeah! Just head"
    line "north on ROUTE"
    cont "14. Should bring"
    cont "you right to PUREN"
    cont "CITY!"
    done

Text_AideAlmostForgot:
    text "Oh my gosh!"

    para "I almost forgot!"

    para "ROUTE 14 is much"
    line "too dangerous to"
    cont "take alone!"

    para "You need a"
    line "#MON!"
    done

Text_AideHopeHeDoesntMind:
    text "Hmmm...I hope he"
    line "doesn't mind if I"
    cont "give you this..."
    done

Text_AideGiveMon:
    text "Here you go!"
    done

Text_RecieveSwinub:
    text "<PLAYER> recieved"
    line "a SWINUB!"
    done

Text_AideGoodLuck:
    text "Use that #MON"
    line "to defend yourself"
    cont "against wild"
    cont "#MON!"

    para "Good luck, "
    line "<PLAYER>!"
    done

Text_ProfAspenLabScientist2:
    text "I've been awake"
    line "for 32 hours!"

    para "I'm so close to"
    line "cracking this"
    cont "#MON!"
    done

ProfAspenLab_MapEvents:
    db 0, 0  ; filler

    def_warp_events
	warp_event 4, 19, SILENT_TOWN, 2
	warp_event 5, 19, SILENT_TOWN, 2

    def_coord_events
	coord_event 6, 4, SCENE_PROF_ASPEN_LAB_AIDE_GIVE_MON, AideGiveMonUpScript
	coord_event 6, 5, SCENE_PROF_ASPEN_LAB_AIDE_GIVE_MON, AideGiveMonDownScript
    def_bg_events

    def_object_events
	object_event  8,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, EVENT_WAITING_ASPEN
	object_event  8,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeetAideScript, EVENT_SAVED_ASPEN
	object_event  2, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, -1
	object_event  8, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, -1
	object_event  3, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, -1
	object_event  6, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfAspenLabScientist2Script, EVENT_GOT_POKEMON
