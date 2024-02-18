function scr_shotgunshoot() //gml_Script_scr_shotgunshoot
{
    input_buffer_shoot = 0
    input_buffer_pistol = 0
    sound_play_3d("event:/sfx/enemies/kill", x, y)
    with (gml_Script_instance_create(x, y, obj_pistoleffect))
        image_xscale = other.xscale
    sprite_index = spr_shotgunshoot
    state = states.shotgunshoot
    if grounded
        movespeed = 0
    jumpAnim = 1
    image_index = 0
    with (gml_Script_instance_create((x + (xscale * 46)), (y + 6), obj_shotgunblast))
    {
        image_xscale = other.xscale
        with (bulletID)
            image_xscale = other.image_xscale
    }
}

