/// @description Insert description here
// You can write your code in this editor
Right_key = keyboard_check(vk_right)
Left_key = keyboard_check(vk_left)
Up_key = keyboard_check(vk_up)
Down_key = keyboard_check(vk_down)

xspeed = (Right_key - Left_key) * MoveSpeed;
yspeed = (Down_key - Up_key) * MoveSpeed;
if Stunned == false {
	x += xspeed
	y += yspeed
}

if place_meeting(x, y, OBJ_Player) {
	if x <= OBJ_Player.x {
		x -= 10
		image_angle = 90
		Stunned = true
	}
	if x > OBJ_Player.x {
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