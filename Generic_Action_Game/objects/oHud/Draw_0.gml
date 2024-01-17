/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sHud_Bup,0,oUfo.x - xHudOffset,oUfo.y - yHudOffset,scalingHud,scalingHud,0,c_white,1);
draw_sprite_ext(sHud_B,0,oUfo.x - xHudOffset,oUfo.y + yHudOffset,scalingHud,scalingHud,0,c_white,1);
draw_set_font(Silver);
draw_set_color(c_black);
draw_text_transformed(oUfo.x - xHudOffset + xTextOffset,oUfo.y - yHudOffset - yTextOffset,global.bUpAmmo,scalingHud,scalingHud,0);
draw_text_transformed(oUfo.x - xHudOffset + xTextOffset,oUfo.y + yHudOffset - yTextOffset,global.bAmmo,scalingHud,scalingHud,0);





