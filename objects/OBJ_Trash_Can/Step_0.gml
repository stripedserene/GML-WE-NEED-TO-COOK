/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, OBJ_Player) and OBJ_Player.carrying != OBJ_Player.None {
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "Throw Away"
	OBJ_Controls_Text.ControlButton = "R"
	OBJ_Controls_Text.Appliance = "Trash Can"
	OBJ_Controls_Text.Item = OBJ_Player.carrying
	if keyboard_check_pressed(ord("R")){
		OBJ_Player.carrying = OBJ_Player.None
	}
}