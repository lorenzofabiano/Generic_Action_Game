// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scShowHud() {
	if (!instance_exists(oHud)) instance_create_layer(x,y,"other",oHud);
	else oHud.hudDuration = oHud.hudDurationMax;
}