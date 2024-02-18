function scr_player_hang() //gml_Script_scr_player_hang
{
    hsp = 0
    if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerN_wallcling
    vsp = 0
    wallclingcooldown = 0
    if (floor(image_index) == (image_number - 1))
    {
        sound_play_3d("event:/modded/sfx/woosh", x, y)
        jumpstop = 0
        vsp = -15
        state = states.jump
        sprite_index = spr_playerN_noisebombspinjump
        image_index = 0
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0))
    }
    image_speed = 0.35
}

