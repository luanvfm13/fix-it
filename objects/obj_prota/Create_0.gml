escala_ref = 2.68;
move_spd_base = 2;

var _escala = (abs(image_xscale) + abs(image_yscale)) / 2;
move_spd = move_spd_base * (_escala / escala_ref);

var _collision_layer = (room == restaurante) ? "a" : "tile_col";
tilemap = layer_tilemap_get_id(_collision_layer);
npc_colisao_objetos = [obj_npc, obj_npc1, obj_ger, obj_dona, obj_maura, obj_toten, obj_port, obj_port2 ,obj_nelipefeto, obj_flilipe, obj_npc1costas,
	inicio_p_restaurante, res_p_inicio, inicio_p_gamer, gamer_p_inicio, gamer_p_esc, esc__p_gamer,
    obj_npc2costas,
    obj_npc3costas,
    obj_npc4costas,
    obj_npc5costas,
	obj_npc9costas];
barreira_hit = false;
if (room == escritorio) {
	layer_set_visible(layer_get_id(_collision_layer), false);
}
window_set_cursor(cr_none);
iGotThis = false;

lupa_inst = instance_create_layer(x, y, "Instances", obj_lupa);
lupa_inst.player = id;

tem_scanner = variable_global_exists("tem_scanner") ? global.tem_scanner : false;
tem_lupa    = variable_global_exists("tem_lupa")    ? global.tem_lupa    : false;
tem_tablet  = variable_global_exists("tem_tablet")  ? global.tem_tablet  : false;

barreira_ultimo_aviso = -10000;