visible = false;
player = noone;
lupa_range = 30;       
target_problema = noone;

if (room == inicio) {
	var _protagonista = instance_find(obj_prota, 0);
	if (_protagonista != noone) {
		var _escala_protagonista = (abs(_protagonista.image_xscale) + abs(_protagonista.image_yscale)) / 2;
		image_xscale = _escala_protagonista / 2.68;
		image_yscale = _escala_protagonista / 2.68;
	}
}