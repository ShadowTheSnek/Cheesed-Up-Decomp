if (playerid.visible == false)
{
    global.hp = 8
    global.failcutscene = 0
    with (obj_player1)
    {
        sound_play("event:/sfx/misc/taxibeep")
        state = states.normal
        create_particle(x, y, (9 << 0))
        cutscene = 0
        if isgustavo
        {
            state = states.ratmount
            sprite_index = spr_ratmount_idle
        }
    }
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            state = states.normal
            cutscene = 0
            if isgustavo
                state = states.ratmount
        }
    }
    obj_player1.visible = true
    obj_player2.visible = true
}
