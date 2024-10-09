/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying != OBJ_Player.None and cooking == false {
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
if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying == OBJ_Player.None and array_last(Holding) == 0 and cooking == false {
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Empty"
	OBJ_Controls_Text.Appliance = "Pot"
}

if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying == OBJ_Player.None and array_length(Holding) != 0 and cooking == false {
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Grab"
	OBJ_Controls_Text.ControlButton = "E"
	OBJ_Controls_Text.Item = array_last(Holding)
	if keyboard_check_pressed(ord("E")) {
		OBJ_Player.carrying = array_pop(Holding)
	}
}

if place_meeting(x, y, OBJ_Player) and array_length(Holding) != 0 and OBJ_Player.carrying == OBJ_Player.None and cooking == false {
	instance_create_layer(x, y + 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text_1)
	OBJ_Controls_Text_1.DrawText = "Cook"
	OBJ_Controls_Text_1.ControlButton = "F"
	OBJ_Controls_Text_1.Appliance = "Pot"
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
	if array_length(Holding) == 2 {
		if array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.BLUE) {
			Holding = [OBJ_Player.PURPLE]
		}
		if array_contains(Holding, OBJ_Player.RED) and array_contains(Holding, OBJ_Player.YELLOW) {
			Holding = [OBJ_Player.ORANGE]
		}
		if array_contains(Holding, OBJ_Player.BLUE) and array_contains(Holding, OBJ_Player.YELLOW) {
			Holding = [OBJ_Player.GREEN]
		}
	}
	if array_length(Holding) == 3 {
		if array_contains(Holding, OBJ_Player.PURPLE) and array_contains(Holding, OBJ_Player.GREEN) and array_contains(Holding, OBJ_Player.ORANGE) {
			Holding = [OBJ_Player.HEISENBURGER]
		}
	}
}
