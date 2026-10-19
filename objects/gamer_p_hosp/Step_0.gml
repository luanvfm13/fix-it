// Hospital removed - this object no longer functions
if (global.ui_bloqueando_jogo || !instance_exists(obj_prota)) exit;

	if (distance_to_object(obj_prota) < 16) {
	    if (keyboard_check_pressed(ord("E"))) {
	        // Hospital removed - no action
	    } else if (instance_exists(obj_men)) {
	        // Hospital removed - no menu text
	    }
	}