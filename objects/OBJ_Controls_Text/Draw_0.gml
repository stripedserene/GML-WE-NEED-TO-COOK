/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if DrawText == "Grab" {
	draw_text_transformed(x, y, "Press " + ControlButton + " to grab " + Item, 0.5, 0.5, 0)
}
if DrawText == "Full" {
	draw_text_transformed(x, y, "The " + Appliance + " is full", 0.5, 0.5, 0)
}
if DrawText == "Cook" {
	draw_text_transformed(x, y, "Press " + ControlButton + " to cook in " + Appliance, 0.5, 0.5, 0)
}
if DrawText == "Place" {
	draw_text_transformed(x, y, "Press " + ControlButton + " to place " + Item + " in the " + Appliance, 0.5, 0.5, 0)
}
if DrawText == "Already Has" {
	draw_text_transformed(x, y, "The " + Appliance + " already has " + Item, 0.5, 0.5, 0)
}
if DrawText == "Empty" {
	draw_text_transformed(x, y, "The " + Appliance + " is empty", 0.5, 0.5, 0)
}
if DrawText == "Throw Away" {
	draw_text_transformed(x, y, "Press " + ControlButton + " to throw away " + Item, 0.5, 0.5, 0)
}
if DrawText == "Hands Full" {
	draw_text_transformed(x, y, "You're already carrying " + Item, 0.5, 0.5, 0)
}
if DrawText == "Cooking" {
	draw_text_transformed(x, y, "The " + Appliance + " is currently cooking", 0.5, 0.5, 0)
}
if DrawText == "Turn Off" {
	draw_text_transformed(x, y, "Press " + ControlButton + " to turn off the " + Appliance, 0.5, 0.5, 0)
}
if DrawText == "See Recipes" {
	draw_text_transformed(x, y, "Press " + ControlButton + " to open the " + Appliance, 0.5, 0.5, 0)
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
instance_destroy()