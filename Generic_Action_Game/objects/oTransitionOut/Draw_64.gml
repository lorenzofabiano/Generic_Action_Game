/// @description Insert description here
// You can write your code in this editor
if (!goingDown) {
	fade+=fadeSpeed;
	clamp(fade,0,1);
	draw_sprite_ext(sPixel,0,0,0,w,h,0,c_black,fade);
}







