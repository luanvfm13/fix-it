if (room == Menu) {
    if (audio_is_playing(sound_ini)) audio_stop_sound(sound_ini);
    sound_reiniciar = true;
    exit;
}

if (room == inicio && sound_reiniciar) {
    sound_reiniciar = false;
    audio_stop_sound(sound_ini);
    if (global.musica_ativa) audio_play_sound(sound_ini, 10, true);
}

if (global.musica_ativa) {
    if (!audio_is_playing(sound_ini)) audio_play_sound(sound_ini, 10, true);
} else if (audio_is_playing(sound_ini)) {
    audio_stop_sound(sound_ini);
}