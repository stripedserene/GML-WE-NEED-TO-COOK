/// @description Insert description here
// You can write your code in this editor
if instance_exists(OBJ_Pot){
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_transformed_color(x , y - 10, display, 0.5, 0.5, 0, TextColor, TextColor, TextColor, TextColor, 1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}