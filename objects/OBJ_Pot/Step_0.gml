/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying != OBJ_Player.None and cooking == false and array_length(Holding) < 3 and array_contains(Holding, OBJ_Player.carrying) == false and burning == false{
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Place"
	OBJ_Controls_Text.ControlButton = "R"
	OBJ_Controls_Text.Item = OBJ_Player.carrying
	OBJ_Controls_Text.Appliance = "Pot"
	if keyboard_check_pressed(ord("R")){
		array_push(Holding, OBJ_Player.carrying)
		OBJ_Player.carrying = OBJ_Player.None
	}
}
if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying != OBJ_Player.None and cooking == false and array_length(Holding) < 3 and array_contains(Holding, OBJ_Player.carrying) == true{
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Already Has"
	OBJ_Controls_Text.Item = OBJ_Player.carrying
	OBJ_Controls_Text.Appliance = "Pot"
}

if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying != OBJ_Player.None and cooking == false and array_length(Holding) > 2{
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Full"
	OBJ_Controls_Text.Appliance = "Pot"
}


if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying == OBJ_Player.None and array_last(Holding) == 0 and cooking == false {
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Empty"
	OBJ_Controls_Text.Appliance = "Pot"
}

if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying == OBJ_Player.None and array_length(Holding) != 0 and cooking == false and burning == false {
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Grab"
	OBJ_Controls_Text.ControlButton = "E"
	OBJ_Controls_Text.Item = array_last(Holding)
	if keyboard_check_pressed(ord("E")) {
		OBJ_Player.carrying = array_pop(Holding)
		burning = false 
		burnTimer = 500
		burnTimerDisplay = 5
		burnTimerDisplayTimer = 100
	}
}

if place_meeting(x, y, OBJ_Player) and array_length(Holding) != 0 and cooking == false and burning == false and array_length(Holding) > 1 {
	instance_create_layer(x, y + 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text_2)
	OBJ_Controls_Text_2.DrawText = "Cook"
	OBJ_Controls_Text_2.ControlButton = "F"
	OBJ_Controls_Text_2.Appliance = "Pot"
	if keyboard_check_pressed(ord("F")){
		cooking = true
	}
}

if place_meeting(x, y, OBJ_Player) and cooking == true {
	instance_create_layer(x, y + 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Cooking"
	OBJ_Controls_Text.Appliance = "Pot"
}

if cooking == true {
	cookingTimer -= 1
	cookingTimerDisplayTimer -= 1
	instance_create_layer(x, y - 10, "FLOOR", OBJ_Pot_Text, {display: cookingTimerDisplay, TextColor: c_yellow})
}

if cookingTimerDisplayTimer <= 0 {
	cookingTimerDisplay -= 1
	cookingTimerDisplayTimer = 100
}

if cookingTimer <= 0 {
	cooking = false 
	cookingTimer = 1000
	cookingTimerDisplayTimer = 100
	cookingTimerDisplay = 10
	if array_contains(Holding, OBJ_Player.RUINED_PRODUCT) {
		Holding = [OBJ_Player.RUINED_PRODUCT]
	}
	if array_length(Holding) == 2 {
		if array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.BLUE) {
			Holding = [OBJ_Player.PURPLE]
		}
		else if array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.YELLOW) {
			Holding = [OBJ_Player.ORANGE]
		}
		else if array_contains(Holding, OBJ_Player.BLUE) and array_contains(Holding, OBJ_Player.YELLOW) {
			Holding = [OBJ_Player.GREEN]
		}
		else if array_contains(Holding, OBJ_Player.BLUE) and array_contains(Holding, OBJ_Player.GREEN) {
			Holding = [OBJ_Player.Zyloxine]
		}
		else if array_contains(Holding, OBJ_Player.YELLOW) and array_contains(Holding, OBJ_Player.GREEN) {
			Holding = [OBJ_Player.Frothium]
		}
		else if array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.GREEN) {
			Holding = [OBJ_Player.CeleritePhosphate]
		}
		else if array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.PURPLE) {
			Holding = [OBJ_Player.Barotine]
		}
		else {
			Holding = [OBJ_Player.MYSTERY_PRODUCT]
		}
	}
	if array_length(Holding) == 3 {
		if array_contains(Holding, OBJ_Player.PURPLE) and array_contains(Holding, OBJ_Player.GREEN) and array_contains(Holding, OBJ_Player.ORANGE) {
			Holding = [OBJ_Player.HEISENBURGER]
		}
		else if array_contains(Holding, OBJ_Player.BLUE) and array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.YELLOW) {
			Holding = [OBJ_Player.Synthestine]
		}
		else {
			Holding = [OBJ_Player.MYSTERY_PRODUCT]
		}
	}
	
	
	burning = true
}

if place_meeting(x, y, OBJ_Player) and array_length(Holding) != 0 and cooking == false and burning == true{
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Turn Off"
	OBJ_Controls_Text.ControlButton = "F"
	OBJ_Controls_Text.Appliance = "Pot"
	if keyboard_check_pressed(ord("F")){
		burning = false 
		burnTimer = 500
		burnTimerDisplay = 5
		burnTimerDisplayTimer = 100
	}
}


if burning == true {
	burnTimer -= 1
	burnTimerDisplayTimer -= 1
	instance_create_layer(x, y - 10, "FLOOR", OBJ_Pot_Text, {display: burnTimerDisplay, TextColor: c_red})
}

if burnTimerDisplayTimer <= 0 {
	burnTimerDisplay -= 1
	burnTimerDisplayTimer = 100
}

if burnTimer <= 0 {
	Holding = [OBJ_Player.RUINED_PRODUCT]
	burning = false 
	burnTimer = 500
	burnTimerDisplay = 5
	burnTimerDisplayTimer = 100
}

for (var i = 0; i < (array_length(Holding)); i++) {
	if Holding[i] == OBJ_Player.RED {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Red)
	}
	if Holding[i] == OBJ_Player.YELLOW {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Yellow)
	}
	if Holding[i] == OBJ_Player.BLUE {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Blue)
	}
	if Holding[i] == OBJ_Player.PURPLE {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Purple)
	}
	if Holding[i] == OBJ_Player.GREEN {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Green)
	}
	if Holding[i] == OBJ_Player.ORANGE {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Orange)
	}
	if Holding[i] == OBJ_Player.Synthestine {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Synthestine)
	}
	if Holding[i] == OBJ_Player.Zyloxine {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Zyloxine)
	}
	if Holding[i] == OBJ_Player.Frothium {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Frothium)
	}
	if Holding[i] == OBJ_Player.CeleritePhosphate {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_CeleritePhosphate)
	}
	if Holding[i] == OBJ_Player.Barotine {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Barotine)
	}
	if Holding[i] == OBJ_Player.HEISENBURGER {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_HEISENBURGER)
	}
	if Holding[i] == OBJ_Player.RUINED_PRODUCT {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Ruined_Product)
	}
	if Holding[i] == OBJ_Player.MYSTERY_PRODUCT {
		instance_create_layer(x, y - i, "Instances", OBJ_Display_Mystery_Product)
	}
}