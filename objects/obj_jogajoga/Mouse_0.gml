if (instance_exists(obj_painel)) exit;
if (!position_meeting(mouse_x, mouse_y, id)) exit;
reset_jogo();
room_goto(inicio);