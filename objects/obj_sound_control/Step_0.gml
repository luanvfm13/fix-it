if (global.musica_ativa) {
    if (!audio_is_playing(sound_ini)) {
        audio_play_sound(sound_ini, 10, true);
    }
} else if (audio_is_playing(sound_ini)) {
    audio_stop_sound(sound_ini);
}