MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4, Landmarks
	landmark  -8, -16, SpecialMapName
	landmark 100, 116, SilentTownName
	landmark 100, 108, Route14Name
	landmark 100, 100, PurenCityName
	landmark  92, 100, Route15Name
	landmark  76, 100, EvergreenTownName
	landmark  76,  92, EvergreenForestName
	landmark 100,  92, Route21Name
	landmark 100,  76, EbonyTownName
	landmark 100,  68, Route22Name
	landmark  84,  60, Route23Name
	landmark  76,  44, IcicleLakeName

	assert_table_length KANTO_LANDMARK
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	landmark  -8, -16, NotApplicableName
	
	assert_table_length NUM_LANDMARKS

SilentTownName:      db "SILENT TOWN@"
PurenCityName: 		 db "PUREN CITY@"
EvergreenTownName:   db "EVERGREEN<BSP>TOWN@"
EbonyTownName:       db "EBONY TOWN@"
EvergreenForestName: db "EVERGREEN<BSP>FOREST@"
IcicleLakeName:		 db "ICICLE LAKE@"
NotApplicableName:   db "N/A@" ; unreferenced ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 3@"
Route4Name:          db "ROUTE 4@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 9@"
Route10Name:         db "ROUTE 10@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
Route21Name:         db "ROUTE 21@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route24Name:         db "ROUTE 24@"
Route25Name:         db "ROUTE 25@"
Route26Name:         db "ROUTE 26@"
Route27Name:         db "ROUTE 27@"
Route28Name:         db "ROUTE 28@"
Route29Name:         db "ROUTE 29@"
Route30Name:         db "ROUTE 30@"
Route31Name:         db "ROUTE 31@"
Route32Name:         db "ROUTE 32@"
Route33Name:         db "ROUTE 33@"
Route34Name:         db "ROUTE 34@"
Route35Name:         db "ROUTE 35@"
Route36Name:         db "ROUTE 36@"
Route37Name:         db "ROUTE 37@"
Route38Name:         db "ROUTE 38@"
Route39Name:         db "ROUTE 39@"
Route40Name:         db "ROUTE 40@"
Route41Name:         db "ROUTE 41@"
Route42Name:         db "ROUTE 42@"
Route43Name:         db "ROUTE 43@"
Route44Name:         db "ROUTE 44@"
Route45Name:         db "ROUTE 45@"
Route46Name:         db "ROUTE 46@"
DarkCaveName:        db "DARK CAVE@"
IlexForestName:      db "ILEX<BSP>FOREST@"
BurnedTowerName:     db "BURNED<BSP>TOWER@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN<BSP>FOREST@" ; unreferenced
DiglettsCaveName:    db "DIGLETT'S<BSP>CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
BattleTowerName:     db "BATTLE<BSP>TOWER@"
SpecialMapName:      db "SPECIAL@"
