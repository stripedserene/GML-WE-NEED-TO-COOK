/// @description Insert description here
// You can write your code in this editor
Right_key = keyboard_check(ord("D"))
Left_key = keyboard_check(ord("A"))
Up_key = keyboard_check(ord("W"))
Down_key = keyboard_check(ord("S"))

xspeed = (Right_key - Left_key) * MoveSpeed;
yspeed = (Down_key - Up_key) * MoveSpeed;

x += xspeed
y += yspeed

x = clamp(x,0, room_width);
y= clamp(y,0,room_height);