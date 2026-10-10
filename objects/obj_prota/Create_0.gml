escala_ref = 2.68;
move_spd_base = 2;

var _escala = (abs(image_xscale) + abs(image_yscale)) / 2;
move_spd = move_spd_base * (_escala / escala_ref);

tilemap = layer_tilemap_get_id("tile_col");
window_set_cursor(cr_none);
iGotThis = false;

lupa_inst = instance_create_layer(x, y, "Instances", obj_lupa);
lupa_inst.player = id;

tem_scanner = variable_global_exists("tem_scanner") ? global.tem_scanner : false;
tem_lupa    = variable_global_exists("tem_lupa")    ? global.tem_lupa    : false;
tem_tablet  = variable_global_exists("tem_tablet")  ? global.tem_tablet  : false;

