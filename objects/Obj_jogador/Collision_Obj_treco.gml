//resetando quando tocar no treco
room_restart()

//tocando o grito quando morrer
grito = audio_play_sound(Aud_grito,1,0)
//abaixando o volume
audio_sound_gain(grito,.8,0)
//abaixando a velocidade
audio_sound_pitch(grito,1.2)