window_set_cursor(cr_default);

global.ui_bloqueando_jogo = true;

painel_x = 0;
painel_y = 0;
painel_w = 0;
painel_h = 0;

var _b;

_b = instance_create_depth(0, 0, -1000, obj_hubeq);
_b.ferramenta_alvo = "scanner";
_b.rel_x = 0.097; _b.rel_y = 0.672; _b.rel_w = 0.238; _b.rel_h = 0.117;

_b = instance_create_depth(0, 0, -1000, obj_hubeq);
_b.ferramenta_alvo = "lupa";
_b.rel_x = 0.364; _b.rel_y = 0.672; _b.rel_w = 0.238; _b.rel_h = 0.117;

_b = instance_create_depth(0, 0, -1000, obj_hubeq);
_b.ferramenta_alvo = "tablet";
_b.rel_x = 0.636; _b.rel_y = 0.672; _b.rel_w = 0.238; _b.rel_h = 0.117;