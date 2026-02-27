//variaveis de movimento
vel = 0
max_vel = 1
max_velv = 3
velv=0
grav = .2
animacao_para = true


trocando_mundo = false
//tocando a musica em camera lenta
//musica = global.mu_fundo
 audio_sound_pitch(aud_musica_de_fundo,.1)

//fazendo ele aparecer no mesmo lugar do outro
x = global.locx
y = global.locy
#region movimento
//variaveis de teclas
pega_teclas = function()
{
    dir = keyboard_check(vk_right) or keyboard_check(ord("D"))
    esq = keyboard_check(vk_left)  or keyboard_check(ord("A"))
    pulo = keyboard_check(vk_space)
}
//movimentaçao
movimentacao = function()
{
    //ativando a velocidade
    vel = (dir - esq)*max_vel
    //ativando a movimentasao ate bater na colisao
    colidir = [Obj_parede,Obj_porta,Object2]
    move_and_collide(vel,0,colidir,40)
    //velocidade vertical
    move_and_collide(0,velv,colidir,30)
    
    //aplicando a gravidade
    if(!place_meeting(x,y+1,colidir))
    {
        velv += grav
        //fazendo troca de mundo quando estiver no chao
        trocando_mundo = false
    }
    //zerando a gravidade
    else
    {
        velv = 0
       //arrendodando o eixo y
        y = round(y)
         if(pulo)
         {//fazendo o pulo pular
             velv = -max_velv
         }
        //fazendo troca de mundo quando estiver no chao
        troca_mundo = function()
        {   if(animacao_para)
            {
                if(keyboard_check_pressed(ord("E")))
                {//parando a animaçao
                    animacao_para = false
                    //ativando o alarme
                    alarm[0] = 30*4
                    //zerando a vel
                    max_vel = 0
                    max_velv= 0
                    //definindo a sprite
                    sprite_index = Spt_caindo
                    image_index = 0
                    //colorindo o clone
                    image_blend = c_navy
                    //ativando o local
                    global.local = true
                    //criando a seq
                    layer_sequence_create("sequencias",0,0,Seq_blo_aparecendo)
                    //o bloco sumindo esta no codigo da room
                    
                }
            }
        }
        trocando_mundo = troca_mundo
    }
    if(animacao_para)
    {
        //animaçao de movimento
        if(dir xor esq)
        {
            //colorindo o clone
            image_blend = c_navy
            sprite_index = Spt_andando
            image_xscale = 1
        }
        else
        {
           //colorindo o clone
           image_blend = c_navy
           sprite_index = Spt_personagem_parado
        }
            
             	
        
        if(esq)
        {  // sprite_index = Spt_andando 
            image_xscale = -1
        }  
        
    }
}
#endregion
#region debugs
/*
debugs = function()
{//definindo a velocidade
    dbg_slider(ref_create(id,"max_vel"),0,10,"max_vel",.1)
    //definindo o pulo
    dbg_slider(ref_create(id,"max_velv"),0,10,"max_velv",.1)
    //definindo a grav
    dbg_slider(ref_create(id,"grav"),0,10,"grav",.1)
}
debugs()
#endregion
*/
