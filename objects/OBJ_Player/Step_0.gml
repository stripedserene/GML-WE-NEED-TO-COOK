/// @description Insert description here
// You can write your code in this editor
Right_key = keyboard_check(ord("D"))
Left_key = keyboard_check(ord("A"))
Up_key = keyboard_check(ord("W"))
Down_key = keyboard_check(ord("S"))

xspeed = (Right_key - Left_key) * MoveSpeed;
yspeed = (Down_key - Up_key) * MoveSpeed;

if Stunned == false {
	x += xspeed
	y += yspeed
}

if place_meeting(x, y, OBJ_Player_2) {
	if x <= OBJ_Player_2.x {
		x -= 10
		image_angle = 90
		Stunned = true
	}
	if x > OBJ_Player_2.x {
		x += 10
		image_angle = -90
		Stunned = true 
	}
}

if Stunned = true {
	StunnedTimer -= 1
}
if StunnedTimer <= 0 {
	image_angle = 0
	Stunned = false 
	StunnedTimer = 200
}

x = clamp(x,0, room_width);
y= clamp(y,0,room_height);