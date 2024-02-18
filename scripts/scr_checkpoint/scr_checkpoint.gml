function set_checkpoint() //gml_Script_set_checkpoint
{
    trace("CHECKPOINT")
    clear_checkpoint()
    create_transformation_tip(gml_Script_lang_get_value_newline("checkpointset"))
    var r = room
    if instance_exists(obj_cyop_loader)
        r = obj_cyop_loader.room_name
    global.checkpoint_data = 
    {
        room: r,
        baddieroom: ds_list_create(),
        saveroom: ds_list_create(),
        escaperoom: ds_list_create(),
        wartime: -1,
        deathtime: -1,
        loaded: 0
    }

    var c = global.checkpoint_data
    with (obj_wartimer)
        c.wartime = (((minutes * 60) + seconds) + addseconds)
    with (obj_deathmode)
    {
        if active
            c.deathtime = (time + (time_fx * 60))
    }
    ds_list_copy(c.baddieroom, global.baddieroom)
    ds_list_copy(c.saveroom, global.saveroom)
    ds_list_copy(c.escaperoom, global.escaperoom)
    var global_store = ["collect", "combo", "combodropped", "lap", "laps", "secretfound", "comboscore", "fill", "panic", "prank_enemykilled", "prank_cankillenemy", "modifier_failed", "gerome", "treasure", "toppintotal", "shroomfollow", "cheesefollow", "tomatofollow", "sausagefollow", "pineapplefollow", "maxwave", "level_minutes", "level_seconds", "heatmeter_count"]
    var player_store = ["targetDoor", "shotgunAnim"]
    while array_length(global_store)
    {
        var name = array_shift(global_store)
        struct_set(c, name, variable_global_get(name))
    }
    while array_length(player_store)
    {
        name = array_shift(player_store)
        struct_set(c, string("p.{0}", name), safe_get(obj_player1, name))
    }
}

function clear_checkpoint() //gml_Script_clear_checkpoint
{
    c = global.checkpoint_data
    if is_struct(c)
    {
        trace("CLEARED CHECKPOINT")
        ds_list_destroy(c.baddieroom)
        ds_list_destroy(c.saveroom)
        ds_list_destroy(c.escaperoom)
        c = undefined
        global.checkpoint_data = -4
    }
}

function load_checkpoint() //gml_Script_load_checkpoint
{
    c = global.checkpoint_data
    if is_struct(c)
    {
        c.loaded = 2
        global.levelreset = 0
        scr_playerreset(0, 1)
        c.loaded = 1
        name = struct_get_names(c)
        var i = 0
        var n = array_length(name)
        while (i < n)
        {
            switch name[i]
            {
                case "room":
                case "baddieroom":
                case "saveroom":
                case "escaperoom":
                case "loaded":
                    break
                case "wartime":
                    if (c.wartime > -1)
                    {
                        with (gml_Script_instance_create(0, 0, obj_wartimer))
                        {
                            for (seconds = c.wartime; seconds >= 60; seconds -= 60)
                                minutes++
                        }
                    }
                    break
                case "deathtime":
                    if (c.deathtime > -1)
                    {
                        with (obj_deathmode)
                        {
                            event_user(15)
                            time = c.deathtime
                        }
                    }
                    break
                default:
                    if string_starts_with(name[i], "p.")
                    {
                        variable_instance_set(obj_player1, string_replace(name[i], "p.", ""), variable_struct_get(c, array_get(name, i)))
                        break
                    }
                    else
                        variable_global_set(name[i], variable_struct_get(c, array_get(name, i)))
            }

            i++
        }
        ds_list_copy(global.baddieroom, c.baddieroom)
        ds_list_copy(global.saveroom, c.saveroom)
        ds_list_copy(global.escaperoom, c.escaperoom)
        if (global.combo > 0)
            global.combotime = 60
        global.levelattempts++
        obj_music.music = -4
        scr_room_goto(c.room)
        if global.shroomfollow
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom)
        if global.cheesefollow
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese)
        if global.tomatofollow
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato)
        if global.sausagefollow
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage)
        if global.pineapplefollow
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple)
        if global.gerome
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_geromefollow)
    }
}

