/// @description Insert description here
// You can write your code in this editor

if (position_meeting(oPlayer.x, oPlayer.y, id))
{
	image_alpha = max(image_alpha - 0.04, 0.25);
}
else
{
	image_alpha = min(image_alpha + 0.04, 1.00);
}
