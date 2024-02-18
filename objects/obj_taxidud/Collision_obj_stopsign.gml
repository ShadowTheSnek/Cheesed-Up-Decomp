if (playerid.visible == false)
{
    jumpbuffer = 15
    start = 1
    with (obj_player1)
    {
        sound_play("event:/sfx/misc/taxibeep")
        if isgustavo
        {
            state = states.ratmount
            sprite_index = spr_ratmount_idle
        }
        else
            state = states.normal
        create_particle(x, y, (9 << 0))
        movespeed = 0
        ratmount_movespeed = 0
        cutscene = 0
    }
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            state = states.normal
            cutscene = 0
        }
    }
    obj_player1.visible = true
    obj_player2.visible = true
}
