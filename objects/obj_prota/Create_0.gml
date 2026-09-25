move_spd = 2;
tilemap = layer_tilemap_get_id("tile_col");
window_set_cursor(fa_none);
iGotThis = false;

lupa_inst = instance_create_layer(x, y, "Instances", obj_lupa);
lupa_inst.player = id;

tem_scanner = false;
tem_lupa = false;
tem_tablet = false;