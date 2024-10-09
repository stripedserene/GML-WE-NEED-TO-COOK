/// @description Insert description here
// You can write your code in this editor
if instance_exists(OBJ_Pot){
	draw_text_transformed(0, 0, OBJ_Pot.Holding, 1, 1, 0)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	if OBJ_Pot.cooking == true {
		draw_text_transformed(OBJ_Pot.x, OBJ_Pot.y - 20, OBJ_Pot.cookingTimerDisplay, 0.5, 0.5, 0)
	}
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}