if (cooldown == 0)
{
    gml_Script_instance_create(x, y, obj_bangeffect)
    cooldown = 30
    hit = 1
    sound_play_3d("event:/sfx/misc/beerhit", x, y)
    vsp = random_range(-7, -10)
    hsp = (random_range(5, 10) * other.xscale)
    spinspeed = (random_range(5, 10) * other.xscale)
}
