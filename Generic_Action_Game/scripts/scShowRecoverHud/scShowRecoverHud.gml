function scShowRecoverHud() {
	if (!instance_exists(oRecoveryHud)) instance_create_layer(x,y,"other",oRecoveryHud);
	else oRecoveryHud.hudDuration = oRecoveryHud.hudDurationMax;	
}