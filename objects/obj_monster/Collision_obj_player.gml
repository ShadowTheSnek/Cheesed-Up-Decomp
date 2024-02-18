with (obj_secretportal)
{
    if touched
        return;
}
if ((!instance_exists(obj_fadeout)) && state != (217 << 0) && other.state != states.actor && other.state != states.chainsaw && other.state != states.hit && (!other.cutscene) && other.state != states.door && (!instance_exists(obj_jumpscare)))
{
    if (!global.panic)
    {
        with (obj_player)
        {
            state = states.actor
            hsp = 0
            vsp = 0
        }
    }
    else if global.panic
    {
        with (obj_monster)
        {
            state = (217 << 0)
            x = xstart
            y = ystart
        }
    }
    if (room == kidsparty_secret2)
    {
        global.spaceblockswitch = 1
        with (obj_spaceblockswitch)
            sprite_index = spr_switchblock_happy
        with (obj_patroller)
        {
            x = xstart
            y = ystart
            state = states.walk
        }
        x = xstart
        y = ystart
    }
    with (gml_Script_instance_create(x, y, obj_jumpscare))
    {
        switch other.object_index
        {
            case obj_robotmonster:
                monsterid = 0
                break
            case obj_blobmonster:
                monsterid = 1
                break
            case obj_puppetmonster:
                monsterid = 2
                break
            case obj_hillbillymonster:
                monsterid = 3
                break
        }

        if (other.oktoberfest && random(100) <= 10)
        {
            sound_play("event:/sfx/voice/yodeling")
            oktoberfest = 1
        }
        else
            sound_play("event:/sfx/enemies/jumpscare")
    }
    if ((!oktoberfest) && (!in_saveroom(room_get_name(room))))
    {
        oktoberfest = 1
        add_saveroom(room_get_name(room))
    }
}
