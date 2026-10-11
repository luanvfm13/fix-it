persistent = true;

if (!audio_is_playing(sound_ini)) {
	audio_play_sound(sound_ini, 10, true);
}