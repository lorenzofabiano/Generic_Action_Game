/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sHud_Bup,0,display_get_gui_width()/4,display_get_gui_height()/6,4,4,0,c_white,1);
draw_sprite_ext(sHud_B,0,display_get_gui_width()/4 * 1.5, display_get_gui_height()/6,4,4,0,c_white,1);
draw_set_font(Silver);
draw_set_color(c_black);
draw_text_transformed(display_get_gui_width()/4+30,display_get_gui_height()/6 - 30,global.bUpAmmo,fontSize,fontSize,0);
draw_text_transformed(display_get_gui_width()/4 * 1.5 + 30,display_get_gui_height()/6 - 30,global.bAmmo,fontSize,fontSize,0);