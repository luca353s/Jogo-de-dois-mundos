//quando pega o putao, ele vai sumir e liber a parede
instance_destroy(Obj_butao_2)
global.fechadob = false
//tocando o grito quando morrer
grito = audio_play_sound(Aud_grito,1,0)
//abaixando o volume
audio_sound_gain(grito,.8,0)
//abaixando a velocidade
audio_sound_pitch(grito,1.3)