if (instance_exists(obj_painel)) exit;
if (!position_meeting(mouse_x, mouse_y, id)) exit;
var _p = instance_create_depth(0, 0, -1000, obj_painel);
_p.tipo = "creditos";