/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, OBJ_Player) {
	instance_create_layer(x, y - 20, "TEXT_DISPLAY_LAYER", OBJ_Controls_Text)
	OBJ_Controls_Text.DrawText = "See Recipes"
	OBJ_Controls_Text.ControlButton = "E"
	OBJ_Controls_Text.Appliance = "Recipe Book"
	OBJ_Controls_Text.Item = OBJ_Player.carrying
	if keyboard_check_pressed(ord("E")){
		room_goto(Recipes)
	}
}