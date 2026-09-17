if(distance_to_object(obj_prota) < 11) 
{
	balaou.visible = true;

	if (keyboard_check_pressed(ord("E")) && instance_exists(obj_men)) {
	    obj_men.text = mensagens[dialogo_indice];
	    obj_men.tempo = 150;

	    dialogo_indice += 1;
	    if (dialogo_indice >= array_length(mensagens)) {
	        dialogo_indice = 0;
	    }
	}
} else 
{
	balaou.visible = false;
	dialogo_indice = 0;
}