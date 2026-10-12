if (global.ui_bloqueando_jogo) exit;
var _direita = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _baixo = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _cima = keyboard_check(ord("W")) || keyboard_check(vk_up);
var hor = _direita - _esquerda;
var ver = _baixo - _cima;

if (hor != 0 && ver != 0) {
    hor *= 0.70710678;
    ver *= 0.70710678;
}

var vel_fin = move_spd
if(keyboard_check(vk_shift))
{
	vel_fin = move_spd * 2
}
move_and_collide(hor * vel_fin, ver * vel_fin, tilemap, undefined, undefined, undefined);


if (hor !=0 or ver != 0)
{
    if (ver > 0) sprite_index = spr_prota_fren;
        else if (ver < 0) sprite_index = spr_prota_tras;
            else if (hor > 0) sprite_index = spr_prota_dir;
				 else if (hor < 0) sprite_index = spr_prota_esq;
}
else
{
if (sprite_index == spr_prota_dir) sprite_index = spr_prota_dir_idle;
else if (sprite_index == spr_prota_esq) sprite_index = spr_prota_esq_idle;
else if (sprite_index == spr_prota_fren) sprite_index = spr_prota_par;
else if (sprite_index == spr_prota_tras) sprite_index = spr_prota_tras_idle;
}
