if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
achievements_update = []
achievements_notify = []
notify_queue = ds_queue_create()
unlock_queue = ds_queue_create()
add_rank_achievements(1, "s", spr_achievement_srank, 0, ["entrance", "medieval", "ruin", "dungeon"])
add_rank_achievements(2, "s", spr_achievement_srank, 1, ["badland", "graveyard", "saloon", "farm"])
add_rank_achievements(3, "s", spr_achievement_srank, 2, ["plage", "forest", "space", "minigolf"])
add_rank_achievements(4, "s", spr_achievement_srank, 3, ["street", "sewer", "industrial", "freezer"])
add_rank_achievements(5, "s", spr_achievement_srank, 4, ["chateau", "kidsparty", "war"])
add_rank_achievements(1, "p", spr_achievement_prank, 0, ["entrance", "medieval", "ruin", "dungeon"])
add_rank_achievements(2, "p", spr_achievement_prank, 1, ["badland", "graveyard", "saloon", "farm"])
add_rank_achievements(3, "p", spr_achievement_prank, 2, ["plage", "forest", "space", "minigolf"])
add_rank_achievements(4, "p", spr_achievement_prank, 3, ["street", "sewer", "industrial", "freezer"])
add_rank_achievements(5, "p", spr_achievement_prank, 4, ["chateau", "kidsparty", "war"])
add_boss_achievements("pepperman", boss_pepperman, spr_achievement_bosses, 0)
add_boss_achievements("vigilante", boss_vigilante, spr_achievement_bosses, 1)
add_boss_achievements("noise", boss_noise, spr_achievement_bosses, 2)
add_boss_achievements("fakepep", boss_fakepep, spr_achievement_bosses, 3)
add_boss_achievements("pizzaface", boss_pizzafacehub, spr_achievement_bosses, 4)
add_achievement_notify("pal_unfunny", -4, function(argument0) //gml_Script_anon@1734@gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if (type == (50 << 0) && arr[0] >= 75)
        palette_unlock(name, "unfunny", 3)
}
, 0, "Palettes", "unfunny")
add_achievement_notify("pal_mooney", -4, function(argument0) //gml_Script_anon@1964@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (57 << 0))
        palette_unlock(name, "mooney", 15)
}
, 0, "Palettes", "mooney")
add_achievement_notify("pal_sage", -4, function(argument0) //gml_Script_anon@2161@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        var _found = 0
        ini_open_from_string(obj_savesystem.ini_str)
        var lvl = ["entrance", "medieval", "ruin", "dungeon"]
        var i = 0
        while (i < array_length(lvl))
        {
            if (ini_read_real("Highscore", lvl[i], 0) == 0)
            {
                _found = 1
                break
            }
            else
            {
                i++
                continue
            }
        }
        ini_close()
        if ((!_found) && global.file_minutes < 60)
            palette_unlock(name, "sage", 5)
    }
}
, 0, "Palettes", "sage")
add_achievement_notify("pal_money", -4, function(argument0) //gml_Script_anon@2699@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        var _money = 0
        ini_open_from_string(obj_savesystem.ini_str)
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon"]
        for (i = 0; i < array_length(lvl); i++)
        {
            for (var j = 0; j < 5; j++)
            {
                if (ini_read_real("Toppin", concat(lvl[i], (j + 1)), 0) == 1)
                    _money += 10
            }
        }
        _money -= ini_read_real("w1stick", "reduction", 0)
        _money -= ini_read_real("w2stick", "reduction", 0)
        ini_close()
        if (_money >= 300)
            palette_unlock(name, "money", 4)
    }
}
, 0, "Palettes", "money")
add_achievement_notify("pal_blood", -4, function(argument0) //gml_Script_anon@3402@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var _count = ini_read_real("Game", "enemies", 0)
        ini_close()
        if (_count >= 1000)
            palette_unlock(name, "blood", 6)
    }
}
, 0, "Palettes", "blood")
add_achievement_notify("pal_tv", -4, function(argument0) //gml_Script_anon@3737@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        _found = 0
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        var map = ds_map_create()
        ds_map_set(map, "p", 5)
        ds_map_set(map, "s", 4)
        ds_map_set(map, "a", 3)
        ds_map_set(map, "b", 2)
        ds_map_set(map, "c", 1)
        ds_map_set(map, "d", 0)
        for (i = 0; i < array_length(lvl); i++)
        {
            var rank = ini_read_string("Ranks", lvl[i], "d")
            if (ds_map_find_value(map, rank) < ds_map_find_value(map, "p"))
                _found = 1
        }
        ds_map_destroy(map)
        ini_close()
        if (!_found)
            palette_unlock(name, "tv", 7)
    }
}
, 0, "Palettes", "tv")
add_achievement_notify("pal_dark", -4, function(argument0) //gml_Script_anon@4667@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (51 << 0) && (arr[0] == "pepperman" || arr[0] == "vigilante" || arr[0] == "noise" || arr[0] == "fakepep" || arr[0] == "pizzaface"))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        _found = 0
        var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"]
        for (i = 0; i < array_length(ach); i++)
        {
            if (ini_read_real("achievements", ach[i], 0) == 0)
                _found = 1
        }
        ini_close()
        if (!_found)
            palette_unlock(name, "dark", 8)
    }
}
, 0, "Palettes", "dark")
add_achievement_notify("pal_shitty", -4, function(argument0) //gml_Script_anon@5330@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (52 << 0))
        palette_unlock(name, "shitty", 9)
}
, 0, "Palettes", "shitty")
add_achievement_notify("pal_golden", -4, function(argument0) //gml_Script_anon@5525@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        _found = 0
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        map = ds_map_create()
        ds_map_set(map, "p", 5)
        ds_map_set(map, "s", 4)
        ds_map_set(map, "a", 3)
        ds_map_set(map, "b", 2)
        ds_map_set(map, "c", 1)
        ds_map_set(map, "d", 0)
        for (i = 0; i < array_length(lvl); i++)
        {
            rank = ini_read_string("Ranks", lvl[i], "d")
            if (ds_map_find_value(map, rank) < ds_map_find_value(map, "s"))
                _found = 1
        }
        ds_map_destroy(map)
        ini_close()
        if (!_found)
            palette_unlock(name, "golden", 10)
    }
}
, 0, "Palettes", "golden")
add_achievement_notify("pal_garish", function() //gml_Script_anon@6459@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("garish_count", 0, 1, 0)
}
, function(argument0) //gml_Script_anon@6537@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (54 << 0))
    {
        achievement_get_variable("garish_count").value = (achievement_get_variable("garish_count").value + 1)
        if (achievement_get_variable("garish_count").value >= 50)
            palette_unlock(name, "garish", 11)
    }
}
, 0, "Palettes", "garish")
add_achievement_notify("pal_funny", -4, function(argument0) //gml_Script_anon@6850@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (50 << 0) && arr[0] >= 70 && arr[0] < 75)
        palette_unlock(name, "funny", 12, spr_peppattern1)
}
, 0, "Palettes", "funny")
add_achievement_notify("pal_itchy", -4, function(argument0) //gml_Script_anon@7108@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "street" && type == (7 << 0) && arr[2] == obj_grandpa)
        palette_unlock(name, "itchy", 12, spr_peppattern2)
}
, 0, "Palettes", "itchy")
add_achievement_notify("pal_pizza", -4, function(argument0) //gml_Script_anon@7399@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (53 << 0))
        palette_unlock(name, "pizza", 12, spr_peppattern3)
}
, 0, "Palettes", "pizza")
add_achievement_notify("pal_stripes", function() //gml_Script_anon@7607@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("stripes_count", 0, 1, 0)
}
, function(argument0) //gml_Script_anon@7686@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (35 << 0))
    {
        achievement_get_variable("stripes_count").value = (achievement_get_variable("stripes_count").value + 1)
        if (achievement_get_variable("stripes_count").value >= 30)
            palette_unlock(name, "stripes", 12, spr_peppattern4)
    }
}
, 0, "Palettes", "stripes")
add_achievement_notify("pal_goldemanne", -4, function(argument0) //gml_Script_anon@8034@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (51 << 0))
    {
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface", "sranks1", "sranks2", "sranks3", "sranks4", "sranks5"]
        for (i = 0; i < array_length(lvl); i++)
        {
            var b = lvl[i]
            for (j = 0; j < 3; j++)
                array_push(ach, concat(b, (j + 1)))
        }
        _found = 0
        ini_open_from_string(obj_savesystem.ini_str)
        i = 0
        while (i < array_length(ach))
        {
            if (ini_read_real("achievements", ach[i], 0) == 0)
            {
                _found = 1
                break
            }
            else
            {
                i++
                continue
            }
        }
        ini_close()
        if (!_found)
            palette_unlock(name, "goldemanne", 12, spr_peppattern5)
    }
}
, 0, "Palettes", "goldemanne")
add_achievement_notify("pal_badbones", function() //gml_Script_anon@9018@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("badbones_count", 0, 1, 0)
}
, function(argument0) //gml_Script_anon@9098@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (7 << 0))
    {
        achievement_get_variable("badbones_count").value = (achievement_get_variable("badbones_count").value + 1)
        if (achievement_get_variable("badbones_count").value >= 50)
            palette_unlock(name, "bones", 12, spr_peppattern6)
    }
}
, 0, "Palettes", "bones")
add_achievement_notify("pal_pp", -4, function(argument0) //gml_Script_anon@9433@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (53 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        var n = ini_read_real("Game", "beaten", 0)
        n++
        ini_write_real("Game", "beaten", n)
        gamesave_async_save_options()
        obj_savesystem.ini_str_options = ini_close()
        if (n >= 2)
            palette_unlock(name, "pp", 12, spr_peppattern7)
    }
}
, 0, "Palettes", "pp")
add_achievement_notify("pal_war", -4, function(argument0) //gml_Script_anon@9897@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (5 << 0) && arr[0] == "war")
    {
        ini_open_from_string(obj_savesystem.ini_str)
        n = ini_read_real("Attempts", "war", 0)
        ini_close()
        if (n <= 1)
            palette_unlock(name, "war", 12, spr_peppattern8)
    }
}
, 0, "Palettes", "war")
add_achievement_notify("pal_john", -4, function(argument0) //gml_Script_anon@10275@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (55 << 0) && global.file_minutes < 135)
        palette_unlock(name, "john", 12, spr_peppattern9)
}
, 0, "Palettes", "john")
var pats = [["candy", 5, spr_peppattern10], ["bloodstained", 10, spr_peppattern11], ["bat", 15, spr_peppattern12], ["pumpkin", 20, spr_peppattern13], ["fur", 25, spr_peppattern14], ["flesh", 30, spr_peppattern15]]
for (i = 0; i < array_length(pats); i++)
{
    var pat = pats[i]
    var p = add_achievement_notify(concat("pal_", pat[0]), -4, function(argument0) //gml_Script_anon@10870@gml_Object_obj_achievementtracker_Create_0
    {
        type = argument0[0]
        arr = argument0[1]
        if (type == (58 << 0) && arr[0] >= pattern[1])
        {
            trace("PATTERN: ", pattern, " ARR: ", arr)
            palette_unlock(name, pattern[0], 12, pattern[2])
        }
    }
, 0, "Palettes", pat[0])
    if ((!is_undefined(p)) && (!p.unlocked))
        p.pattern = pat
}
add_achievement_notify("halloween1", -4, function(argument0) //gml_Script_anon@11246@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (58 << 0) && arr[0] >= 30)
        achievement_unlock(name, "Pumpkin Munchkin", spr_achievement_halloween, 0)
}
)
add_achievement_notify("halloween2", function() //gml_Script_anon@11483@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("hw2count", 0, 0, 1)
    achievement_add_variable("hw2start", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@11617@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    switch type
    {
        case (59 << 0):
            if (arr[0] == trickytreat_1)
            {
                if (achievement_get_variable("hw2count").value >= 10)
                {
                    achievement_unlock(name, "Tricksy", spr_achievement_halloween, 1)
                    with (obj_achievementviewer)
                        event_perform(ev_other, ev_room_start)
                }
                else
                    trace("Couldn't get the achievement!, max count: ", achievement_get_variable("hw2count").value)
                achievement_get_variable("hw2count").value = 0
            }
            break
        case (60 << 0):
            achievement_get_variable("hw2count").value = 0
            break
        case (58 << 0):
            var r = string_letters(room_get_name(room))
            if (r == "trickytreat" || r == "trickytreatb")
            {
                trace("Found pumpkin at: ", room_get_name(room))
                achievement_get_variable("hw2count").value = (achievement_get_variable("hw2count").value + 1)
            }
            break
    }

}
)
add_achievement_notify("entrance1", function() //gml_Script_anon@12618@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("entr1count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@12694@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (14 << 0) && global.leveltosave == "entrance" && arr[0] == 63)
    {
        achievement_get_variable("entr1count").value = (achievement_get_variable("entr1count").value + 1)
        if (achievement_get_variable("entr1count").value >= 16)
            achievement_unlock(name, "John Gutted", spr_achievement_entrance, 0)
    }
}
)
add_achievement_notify("entrance2", function() //gml_Script_anon@13085@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@13100@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (5 << 0) && arr[0] == "entrance" && (arr[2] < 2 || (arr[2] == 2 && arr[3] <= 0)))
        achievement_unlock(name, "Let's Make This Quick", spr_achievement_entrance, 1)
}
)
add_achievement_notify("entrance3", function() //gml_Script_anon@13392@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("entr3count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@13467@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if ((type == (50 << 0) && arr[0] >= 99 && global.leveltosave == "entrance") || (type == (2 << 0) && global.combo >= 99 && global.leveltosave == "entrance"))
        achievement_unlock(name, "Primate Rage", spr_achievement_entrance, 2)
}
)
add_achievement_notify("medieval1", function(argument0) //gml_Script_anon@13854@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("med1count", 0, 0, 1)
    achievement_add_variable("med1hurt", 0, 0, 1)
    achievement_add_variable("med1start", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@14055@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (global.leveltosave == "medieval")
    {
        if (type == (56 << 0))
            achievement_get_variable("med1start").value = 1
        else if (type == (32 << 0))
            achievement_get_variable("med1hurt").value = 1
        else if (type == (25 << 0))
        {
            if (achievement_get_variable("med1start").value == 1 && achievement_get_variable("med1hurt").value == 0)
                achievement_get_variable("med1count").value = (achievement_get_variable("med1count").value + 1)
            if (achievement_get_variable("med1count").value >= 5)
                achievement_unlock(name, "Shining Armor", spr_achievement_medieval, 0)
            achievement_get_variable("med1hurt").value = 0
        }
    }
}
)
add_achievement_notify("medieval2", function(argument0) //gml_Script_anon@14811@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("med2count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@14890@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (4 << 0) && global.leveltosave == "medieval" && arr[1] == obj_forknight)
    {
        achievement_get_variable("med2count").value = (achievement_get_variable("med2count").value + 1)
        if (achievement_get_variable("med2count").value >= 10)
            achievement_unlock(name, "Spoonknight", spr_achievement_medieval, 1)
    }
}
)
add_achievement_notify("medieval3", function(argument0) //gml_Script_anon@15279@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@15299@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (2 << 0) && global.leveltosave == "medieval" && (obj_player1.state == states.tumble || (obj_player1.tauntstoredstate == states.tumble && obj_player1.state == states.chainsaw)) && (obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend || obj_player1.sprite_index == obj_player1.spr_tumble))
        achievement_unlock(name, "Spherical", spr_achievement_medieval, 2)
}
)
add_achievement_notify("ruin1", function(argument0) //gml_Script_anon@15851@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ruin1hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@15934@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "ruin" && arr[2] == obj_canonexplosion)
        achievement_get_variable("ruin1hurt").value = 1
    else if (type == 5 && arr[0] == "ruin" && achievement_get_variable("ruin1hurt").value == 0)
        achievement_unlock(name, "Thrill Seeker", spr_achievement_ruin, 0)
}
)
add_achievement_notify("ruin2", function(argument0) //gml_Script_anon@16351@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@16376@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (34 << 0) && global.leveltosave == "ruin")
        achievement_unlock(name, "Volleybomb", spr_achievement_ruin, 1)
}
)
add_achievement_notify("ruin3", function(argument0) //gml_Script_anon@16593@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ruin3count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@16673@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (33 << 0) && global.leveltosave == "ruin")
    {
        achievement_get_variable("ruin3count").value = (achievement_get_variable("ruin3count").value + 1)
        if (achievement_get_variable("ruin3count").value >= 350)
            achievement_unlock(name, "Delicacy", spr_achievement_ruin, 2)
    }
}
)
add_achievement_notify("dungeon1", function(argument0) //gml_Script_anon@17074@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("dun1hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@17156@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (37 << 0) && global.leveltosave == "dungeon")
        achievement_get_variable("dun1hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "dungeon" && achievement_get_variable("dun1hurt").value == 0)
        achievement_unlock(name, "Very Very Hot Sauce", spr_achievement_dungeon, 0)
}
)
add_achievement_notify("dungeon2", function(argument0) //gml_Script_anon@17573@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@17593@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.panic && type == (42 << 0) && global.leveltosave == "dungeon" && arr[0] >= 120)
        achievement_unlock(name, "Eruption Man", spr_achievement_dungeon, 1)
}
)
add_achievement_notify("dungeon3", function(argument0) //gml_Script_anon@17876@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("dun3hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@17958@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "dungeon" && arr[2] == obj_pizzacutter2)
        achievement_get_variable("dun3hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "dungeon" && achievement_get_variable("dun3hurt").value == 0)
        achievement_unlock(name, "Unsliced Pizzaman", spr_achievement_dungeon, 2)
}
)
add_achievement_notify("badland1", function(argument0) //gml_Script_anon@18441@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@18466@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (48 << 0) && global.leveltosave == "badland")
        achievement_unlock(name, "Peppino's Rain Dance", spr_achievement_badland, 0)
}
)
add_achievement_notify("badland2", function(argument0) //gml_Script_anon@18700@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bad2count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@18779@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (2 << 0) && global.leveltosave == "badland" && arr[2] == obj_clerk)
    {
        achievement_get_variable("bad2count").value = (achievement_get_variable("bad2count").value + 1)
        if (achievement_get_variable("bad2count").value >= 5)
            achievement_unlock(name, "Unnecessary Violence", spr_achievement_badland, 1)
    }
}
)
add_achievement_notify("badland3", function(argument0) //gml_Script_anon@19175@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bad3hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@19257@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (38 << 0) && global.leveltosave == "badland")
        achievement_get_variable("bad3hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "badland" && achievement_get_variable("bad3hurt").value == 0)
        achievement_unlock(name, "Alien Cow", spr_achievement_badland, 2)
}
)
add_achievement_notify("graveyard1", function(argument0) //gml_Script_anon@19697@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav1hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@19780@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (40 << 0) && global.leveltosave == "graveyard")
        achievement_get_variable("grav1hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "graveyard" && achievement_get_variable("grav1hurt").value == 0)
        achievement_unlock(name, "Ghosted", spr_achievement_graveyard, 0)
}
)
add_achievement_notify("graveyard2", function(argument0) //gml_Script_anon@20202@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav2count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@20286@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (global.leveltosave == "graveyard")
    {
        if (type == (2 << 0) && (obj_player1.state == states.ghost || (obj_player1.state == states.chainsaw && obj_player1.tauntstoredstate == states.ghost)))
        {
            achievement_get_variable("grav2count").value = (achievement_get_variable("grav2count").value + 1)
            if (achievement_get_variable("grav2count").value >= 20)
                achievement_unlock(name, "Pretend Ghost", spr_achievement_graveyard, 1)
        }
    }
}
)
add_achievement_notify("graveyard3", function(argument0) //gml_Script_anon@20810@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav3count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@20890@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (39 << 0) && global.leveltosave == "graveyard")
    {
        achievement_get_variable("grav3count").value = (achievement_get_variable("grav3count").value + 1)
        if (achievement_get_variable("grav3count").value >= 10)
            achievement_unlock(name, "Alive and Well", spr_achievement_graveyard, 2)
    }
}
)
add_achievement_notify("farm1", function(argument0) //gml_Script_anon@21290@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("f1_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@21368@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (3 << 0))
    {
        n = achievement_get_variable("f1_count")
        r = room_get_name(arr[1])
        if (obj_player.state == states.backbreaker && (string_letters(r) == "farm" || string_letters(r) == "farmb"))
        {
            n.value++
            if (n.value >= 3)
                achievement_unlock(name, "No one is safe", spr_achievement_farm, 2)
        }
    }
}
)
add_achievement_notify("farm2", -4, function(argument0) //gml_Script_anon@21835@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (6 << 0))
        achievement_unlock(name, "Cube Menace", spr_achievement_farm, 1)
}
)
add_achievement_notify("farm3", function(argument0) //gml_Script_anon@22017@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("f3_hurted", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@22100@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if ((type == (7 << 0) || type == (8 << 0)) && (arr[1] == (11 << 0) || arr[1] == (14 << 0) || arr[1] == (13 << 0) || arr[1] == (12 << 0)))
        achievement_get_variable("f3_hurted").value = 1
    if (type == (5 << 0) && arr[0] == "farm" && (!achievement_get_variable("f3_hurted").value))
        achievement_unlock(name, "Good Egg", spr_achievement_farm, 0)
}
)
add_achievement_notify("saloon1", function(argument0) //gml_Script_anon@22652@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s1_beer", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@22729@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (9 << 0) && global.leveltosave == "saloon")
    {
        achievement_get_variable("s1_beer").value = (achievement_get_variable("s1_beer").value + 1)
        if (achievement_get_variable("s1_beer").value >= 58)
            achievement_unlock(name, "Non-Alcoholic", spr_achievement_saloon, 0)
    }
}
)
add_achievement_notify("saloon2", function(argument0) //gml_Script_anon@23069@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@23147@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (10 << 0) && global.leveltosave == "saloon")
        achievement_get_variable("s2_count").value = (achievement_get_variable("s2_count").value + 1)
    else if (type == (5 << 0))
    {
        arr = argument0[1]
        if (arr[0] == "saloon" && achievement_get_variable("s2_count").value == 9)
            achievement_unlock(name, "Already Pressed", spr_achievement_saloon, 1)
    }
}
)
add_achievement_notify("saloon3", function(argument0) //gml_Script_anon@23573@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s3_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@23651@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (11 << 0) && global.leveltosave == "saloon")
    {
        achievement_get_variable("s3_count").value = (achievement_get_variable("s3_count").value + 1)
        if (achievement_get_variable("s3_count").value >= 8)
            achievement_unlock(name, "Royal Flush", spr_achievement_saloon, 2)
    }
}
)
add_achievement_notify("plage1", function(argument0) //gml_Script_anon@24013@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@24033@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (12 << 0) && global.leveltosave == "plage" && arr[1] == obj_canongoblin && arr[3] == obj_canongoblinbomb)
        achievement_unlock(name, "Blowback", spr_achievement_beach, 0)
}
)
add_achievement_notify("plage2", function(argument0) //gml_Script_anon@24338@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("b2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@24417@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (13 << 0) && global.leveltosave == "plage" && arr[1] == obj_treasureguy)
    {
        achievement_get_variable("b2_count").value = (achievement_get_variable("b2_count").value + 1)
        if (achievement_get_variable("b2_count").value >= 7)
            achievement_unlock(name, "X Marks The Spot", spr_achievement_beach, 1)
    }
}
)
add_achievement_notify("plage3", function(argument0) //gml_Script_anon@24814@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("b3_hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@24896@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "plage" && arr[2] == obj_canonexplosion)
        achievement_get_variable("b3_hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "plage" && achievement_get_variable("b3_hurt").value == 0)
        achievement_unlock(name, "Demolition Expert", spr_achievement_beach, 2)
}
)
add_achievement_update("forest1", 5, -4, function(argument0) //gml_Script_anon@25379@gml_Object_obj_achievementtracker_Create_0
{
    if (global.leveltosave == "forest")
    {
        b = 0
        with (obj_player)
        {
            if ((!b) && state == states.backbreaker && distance_to_object(obj_beedeco) < 300)
                b = 1
        }
        if b
            achievement_unlock(name, "Bee Nice", spr_achievement_forest, 0)
    }
}
)
add_achievement_notify("forest2", function(argument0) //gml_Script_anon@25712@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fo2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@25792@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (14 << 0) && global.leveltosave == "forest" && (arr[0] == obj_smallforestblock || arr[0] == obj_bigforestblock))
    {
        achievement_get_variable("fo2_count").value = (achievement_get_variable("fo2_count").value + 1)
        if (achievement_get_variable("fo2_count").value >= 183)
            achievement_unlock(name, "Lumberjack", spr_achievement_forest, 1)
    }
}
)
add_achievement_notify("forest3", function() //gml_Script_anon@26227@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@26243@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (12 << 0) && global.leveltosave == "forest" && arr[1] == obj_noisegoblin && arr[3] == obj_noisegoblin_arrow)
        achievement_unlock(name, "Bullseye", spr_achievement_forest, 2)
}
)
add_achievement_update("space1", 1, function(argument0) //gml_Script_anon@26584@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sp1_hit", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@26666@gml_Object_obj_achievementtracker_Create_0
{
    if (room == space_10)
    {
        if instance_exists(obj_fadeout)
        {
            if (obj_player1.targetDoor == "B")
                achievement_get_variable("sp1_hit").value = 0
        }
        b = 0
        with (obj_antigravbubble)
        {
            if (sprite_index == spr_antigrav_bubblesquish)
                b = 1
        }
        if b
            achievement_get_variable("sp1_hit").value = 1
        var _q = 0
        with (obj_player1)
        {
            if (y < 608)
                _q = 1
        }
        if (_q && achievement_get_variable("sp1_hit").value == 0)
            achievement_unlock(name, "Turbo Tunnel", spr_achievement_space, 0)
    }
}
)
add_achievement_notify("space2", function(argument0) //gml_Script_anon@27303@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sp2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@27382@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (14 << 0) && global.leveltosave == "space" && arr[0] == obj_asteroid)
    {
        achievement_get_variable("sp2_count").value = (achievement_get_variable("sp2_count").value + 1)
        if (achievement_get_variable("sp2_count").value >= 18)
            achievement_unlock(name, "Blast Em Asteroids", spr_achievement_space, 2)
    }
}
)
add_achievement_notify("space3", function(argument0) //gml_Script_anon@27777@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("space3count", 0, 0, 1)
    achievement_add_variable("space3start", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@27921@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "space")
    {
        if (type == (0 << 0))
            achievement_get_variable("space3start").value = 1
        else if (achievement_get_variable("space3start").value == 1 && type == (2 << 0) && arr[2] == obj_miniufo)
        {
            achievement_get_variable("space3count").value = (achievement_get_variable("space3count").value + 1)
            trace("Meteor Man Count: ", achievement_get_variable("space3count").value)
            if (achievement_get_variable("space3count").value >= 5)
                achievement_unlock(name, "Man Meteor", spr_achievement_space, 1)
        }
        else if (type == (1 << 0))
        {
            achievement_get_variable("space3start").value = 0
            achievement_get_variable("space3count").value = 0
        }
    }
}
)
add_achievement_notify("minigolf1", function(argument0) //gml_Script_anon@28760@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g1_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@28838@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (18 << 0) && arr[0] == spr_pizzaball_rank1)
    {
        achievement_get_variable("g1_count").value = (achievement_get_variable("g1_count").value + 1)
        if (achievement_get_variable("g1_count").value >= 9)
            achievement_unlock(name, "Primo Golfer", spr_achievement_golf, 0)
    }
}
)
add_achievement_notify("minigolf2", function(argument0) //gml_Script_anon@29198@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@29276@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (16 << 0) && (arr[0] == obj_player1 || arr[0] == obj_player1))
        achievement_get_variable("g2_count").value = 0
    else if (type == (17 << 0))
    {
        achievement_get_variable("g2_count").value = (achievement_get_variable("g2_count").value + 1)
        if (achievement_get_variable("g2_count").value >= 3)
            achievement_unlock(name, "Nice Shot", spr_achievement_golf, 1)
    }
}
)
add_achievement_notify("minigolf3", function(argument0) //gml_Script_anon@29745@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g3_hit", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@29825@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (16 << 0))
    {
        if (arr[0] == obj_golfburger)
            achievement_get_variable("g3_hit").value = 1
        else
            achievement_get_variable("g3_hit").value = 0
    }
    else if (type == (18 << 0) && achievement_get_variable("g3_hit").value == 1)
        achievement_unlock(name, "Helpful Burger", spr_achievement_golf, 2)
}
)
add_achievement_update("street1", 60, -4, function(argument0) //gml_Script_anon@30322@gml_Object_obj_achievementtracker_Create_0
{
    if (room == street_bacon)
        achievement_unlock(name, "Pan Fried", spr_achievement_street, 0)
}
)
add_achievement_notify("street2", function(argument0) //gml_Script_anon@30477@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("st2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@30556@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (global.leveltosave == "street")
    {
        if (type == (19 << 0))
            achievement_get_variable("st2_count").value = 0
        else if (type == (21 << 0))
        {
            achievement_get_variable("st2_count").value = (achievement_get_variable("st2_count").value + 1)
            if (achievement_get_variable("st2_count").value >= 3)
                achievement_unlock(name, "Strike!", spr_achievement_street, 1)
        }
    }
}
)
add_achievement_notify("street3", function(argument0) //gml_Script_anon@31003@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("st3_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@31082@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (22 << 0))
    {
        achievement_get_variable("st3_count").value = (achievement_get_variable("st3_count").value + 1)
        if (achievement_get_variable("st3_count").value >= 14)
            achievement_unlock(name, "Say Oink!", spr_achievement_street, 2)
    }
}
)
add_achievement_notify("sewer1", function(argument0) //gml_Script_anon@31420@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw1_killed", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@31504@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (23 << 0))
        achievement_get_variable("sw1_killed").value = 1
    else if (type == (5 << 0) && arr[0] == "sewer" && achievement_get_variable("sw1_killed").value == 0)
        achievement_unlock(name, "Can't Fool Me", spr_achievement_sewer, 0)
}
)
add_achievement_notify("sewer2", function(argument0) //gml_Script_anon@31879@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@31958@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "sewer" && type == (4 << 0) && arr[1] == obj_ninja)
    {
        achievement_get_variable("sw2_count").value = (achievement_get_variable("sw2_count").value + 1)
        if (achievement_get_variable("sw2_count").value >= 10)
            achievement_unlock(name, "Food Clan", spr_achievement_sewer, 1)
    }
}
)
add_achievement_notify("sewer3", function(argument0) //gml_Script_anon@32330@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw3_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@32409@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "sewer" && global.panic && type == (24 << 0))
        achievement_get_variable("sw3_count").value = (achievement_get_variable("sw3_count").value + 1)
    else if (type == (5 << 0) && arr[0] == "sewer" && achievement_get_variable("sw3_count").value <= 0)
        achievement_unlock(name, "Penny Pincher", spr_achievement_sewer, 2)
}
)
add_achievement_notify("industrial1", function(argument0) //gml_Script_anon@32871@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i1_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@32949@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "industrial" && type == (25 << 0) && (arr[2] == (33 << 0) || arr[2] == (35 << 0) || arr[2] == (34 << 0)))
    {
        achievement_get_variable("i1_count").value = (achievement_get_variable("i1_count").value + 1)
        if (achievement_get_variable("i1_count").value >= 4)
            achievement_unlock(name, "Unflattenning", spr_achievement_industrial, 0)
    }
}
)
add_achievement_notify("industrial2", function(argument0) //gml_Script_anon@33434@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i2_count", 0, 0, 1)
    achievement_add_variable("i2_hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@33571@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (room == industrial_secret1)
    {
        if (type == (2 << 0) && arr[2] == obj_sausageman)
            achievement_get_variable("i2_count").value = (achievement_get_variable("i2_count").value + 1)
        else if (type == (7 << 0))
            achievement_get_variable("i2_hurt").value = 1
    }
    if (type == (27 << 0) && arr[0] == industrial_secret1 && achievement_get_variable("i2_hurt").value == 0 && achievement_get_variable("i2_count").value >= 11)
        achievement_unlock(name, "Whoop This", spr_achievement_industrial, 1)
}
)
add_achievement_notify("industrial3", function(argument0) //gml_Script_anon@34170@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i3_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@34248@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "industrial" && type == (2 << 0) && arr[2] == obj_robot)
    {
        achievement_get_variable("i3_count").value = (achievement_get_variable("i3_count").value + 1)
        if (achievement_get_variable("i3_count").value >= 31)
            achievement_unlock(name, "There Can Be Only One", spr_achievement_industrial, 2)
    }
}
)
add_achievement_notify("freezer1", function(argument0) //gml_Script_anon@34681@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr1_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@34760@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (global.leveltosave == "freezer" && type == (28 << 0))
    {
        achievement_get_variable("fr1_count").value = (achievement_get_variable("fr1_count").value + 1)
        if (achievement_get_variable("fr1_count").value >= 13)
            achievement_unlock(name, "Frozen Nuggets", spr_achievement_freezer, 0)
    }
}
)
add_achievement_notify("freezer2", function(argument0) //gml_Script_anon@35110@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@35189@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "freezer" && type == (2 << 0) && arr[2] == obj_fakesanta)
    {
        achievement_get_variable("fr2_count").value = (achievement_get_variable("fr2_count").value + 1)
        if (achievement_get_variable("fr2_count").value >= 5)
            achievement_unlock(name, "Frozen Nuggets", spr_achievement_freezer, 1)
    }
}
)
add_achievement_notify("freezer3", function(argument0) //gml_Script_anon@35581@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr3_fall", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@35663@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (8 << 0) && global.leveltosave == "freezer")
        achievement_get_variable("fr3_fall").value = 1
    else if (type == (5 << 0) && arr[0] == "freezer" && achievement_get_variable("fr3_fall").value == 0)
        achievement_unlock(name, "Ice Climber", spr_achievement_freezer, 2)
}
)
add_achievement_notify("chateau1", function(argument0) //gml_Script_anon@36111@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch1_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@36190@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "chateau" && type == (2 << 0) && arr[2] == obj_ghostknight)
    {
        achievement_get_variable("ch1_count").value = (achievement_get_variable("ch1_count").value + 1)
        if (achievement_get_variable("ch1_count").value >= 30)
            achievement_unlock(name, "Cross To Bare", spr_achievement_chateau, 0)
    }
}
)
add_achievement_notify("chateau2", function(argument0) //gml_Script_anon@36584@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch2_hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@36666@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && (arr[2] == obj_anchortrap || arr[2] == obj_knighttrap))
        achievement_get_variable("ch2_hurt").value = 1
    if (type == (5 << 0) && arr[0] == "chateau" && (!achievement_get_variable("ch2_hurt").value))
        achievement_unlock(name, "Haunted Playground", spr_achievement_chateau, 1)
}
)
add_achievement_notify("chateau3", function(argument0) //gml_Script_anon@37095@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch3_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@37174@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (15 << 0) && global.leveltosave == "chateau")
    {
        achievement_get_variable("ch3_count").value = (achievement_get_variable("ch3_count").value + 1)
        if (achievement_get_variable("ch3_count").value >= 10)
            achievement_unlock(name, "Skullsplitter", spr_achievement_chateau, 2)
    }
}
)
add_achievement_notify("kidsparty1", function(argument0) //gml_Script_anon@37559@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp1_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@37638@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (29 << 0) && global.leveltosave == "kidsparty" && global.panic && room != kidsparty_secret1)
    {
        achievement_get_variable("kp1_count").value = (achievement_get_variable("kp1_count").value + 1)
        if (achievement_get_variable("kp1_count").value >= 9)
            achievement_unlock(name, "And This... Is My Gun-On-A-Stick!", spr_achievement_kidsparty, 0)
    }
}
)
add_achievement_notify("kidsparty2", function(argument0) //gml_Script_anon@38053@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp2_count", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@38132@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (30 << 0) && global.leveltosave == "kidsparty" && (!global.panic))
        achievement_get_variable("kp2_count").value = (achievement_get_variable("kp2_count").value + 1)
    else if (type == (20 << 0) && arr[0] == kidsparty_john)
    {
        if (achievement_get_variable("kp2_count").value <= 6)
            achievement_unlock(name, "Let Them Sleep", spr_achievement_kidsparty, 1)
    }
}
)
add_achievement_notify("kidsparty3", function(argument0) //gml_Script_anon@38598@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp3_hurted", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@38682@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (31 << 0) && global.leveltosave == "kidsparty")
        achievement_get_variable("kp3_hurted").value = 1
    else if (type == (5 << 0) && arr[0] == "kidsparty")
    {
        if (achievement_get_variable("kp3_hurted").value == 0)
            achievement_unlock(name, "Jumpspared", spr_achievement_kidsparty, 2)
    }
}
)
add_achievement_notify("war1", function(argument0) //gml_Script_anon@39144@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("war1hurt", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@39222@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "war")
        achievement_get_variable("war1hurt").value = (achievement_get_variable("war1hurt").value + 1)
    else if (type == (5 << 0) && arr[0] == "war" && achievement_get_variable("war1hurt").value <= 3)
        achievement_unlock(name, "Decorated Veteran", spr_achievement_war, 0)
}
)
add_achievement_notify("war2", function(argument0) //gml_Script_anon@39618@gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("war2_missed", 0, 0, 1)
    achievement_add_variable("war2_hit", 0, 0, 1)
    achievement_add_variable("war2_start", 0, 0, 1)
}
, function(argument0) //gml_Script_anon@39821@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "war")
    {
        if (type == (43 << 0))
        {
            achievement_get_variable("war2_hit").value = 0
            achievement_get_variable("war2_start").value = 1
        }
        else if ((type == (2 << 0) || type == (3 << 0) || type == (45 << 0) || type == (46 << 0)) && achievement_get_variable("war2_start").value == 1)
            achievement_get_variable("war2_hit").value = 1
        else if (type == (44 << 0))
        {
            var val = achievement_get_variable("war2_hit").value
            achievement_get_variable("war2_start").value = 0
            if (!val)
            {
                achievement_get_variable("war2_missed").value = (achievement_get_variable("war2_missed").value + 1)
                trace("Shot missed!")
            }
        }
    }
    if (type == (5 << 0) && arr[0] == "war" && achievement_get_variable("war2_missed").value <= 3)
        achievement_unlock(name, "Sharpshooter", spr_achievement_war, 1)
}
)
add_achievement_notify("war3", function(argument0) //gml_Script_anon@40828@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //gml_Script_anon@40853@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (47 << 0) && arr[0] >= 1)
        achievement_unlock(name, "Trip to the Warzone", spr_achievement_war, 2)
}
)
add_achievement_notify("pal_grinch", -4, function(argument0) //gml_Script_anon@41168@gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (5 << 0) && arr[0] == "grinch")
    {
        if (!global.MOD.EasyMode)
            palette_unlock(name, "grinch", 12, spr_pattern_grinch)
    }
}
, 0, "Palettes", "grinch")
