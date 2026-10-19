sound_reiniciar = false;
persistent = true;

if (!variable_global_exists("musica_ativa")) {
	global.musica_ativa = true;
}

if (global.musica_ativa && !audio_is_playing(sound_ini)) {
	audio_play_sound(sound_ini, 10, true);
}