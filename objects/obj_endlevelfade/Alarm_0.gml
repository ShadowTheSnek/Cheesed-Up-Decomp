if do_rank
{
    with (gml_Script_instance_create((room_width / 2), (room_height / 2), obj_rank))
    {
        toppinvisible = other.toppinvisible
        if ((!toppinvisible) && global.leveltosave != "exit" && global.leveltosave != "secretworld")
        {
            array_delete(text, 0, 1)
            array_pop(text)
        }
        depth = (other.depth - 2)
        ini_open_from_string(obj_savesystem.ini_str)
        var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "war", "kidsparty", "exit"]
        for (var i = 0; i < array_length(toppin); i++)
        {
            if (@@Global@@().newtoppin[i] && array_contains(levels, global.leveltosave) && (!global.sandbox))
                toppin[i] = 1
            else if ini_read_real("Toppin", (global.leveltosave + string((i + 1))), 0)
                toppin[i] = 2
            else
                toppin[i] = 0
        }
        ini_close()
    }
}
else
{
    gml_Script_instance_create(0, 0, obj_endgamefade)
    alarm[1] = 120
}
if (instance_exists(obj_treasureviewer) || (!do_rank))
    return;
obj_player1.visible = false
obj_player2.visible = false
if (global.collect >= global.collectN)
{
    with (gml_Script_instance_create(obj_player2.x, obj_player2.y, obj_dashcloud))
        sprite_index = spr_bombexplosion
    repeat (6)
        gml_Script_instance_create(obj_player2.x, obj_player2.y, obj_baddiegibs)
}
if (global.collectN > global.collect)
{
    with (gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_dashcloud))
        sprite_index = spr_bombexplosion
    repeat (6)
        gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_baddiegibs)
    sound_play("event:/sfx/misc/explosion")
}
