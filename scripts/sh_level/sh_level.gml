function sh_level(argument0) //gml_Script_sh_level
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Level argument missing";
    isOpen = 0
    var level = argument0[1]
    var targetRoom = -1
    if instance_exists(obj_cyop_loader)
    {
        level = self.WCscr_allargs(argument0, 1)
        var targetLevel = concat(global.custom_path, "/levels/", level, "/level.ini")
        if (!file_exists(targetLevel))
            return string("{0} level doesn't exist", level);
        else
            cyop_load_level(targetLevel)
    }
    else
    {
        switch level
        {
            case "farm":
                targetRoom = farm_2
                break
            case "plage":
                targetRoom = plage_entrance
                break
            case "street":
                targetRoom = street_intro
                break
            case "exit":
                targetRoom = tower_finalhallway
                break
            case "secretworld":
                targetRoom = secret_entrance
                break
            case "oldexit":
                targetRoom = exit_1
                break
            case "strongcold":
                targetRoom = strongcold_10
                break
            case "snickchallenge":
                targetRoom = medieval_1
                activate_snickchallenge()
                break
            default:
                targetRoom = asset_get_index((level + "_1"))
                break
        }

        if room_exists(targetRoom)
        {
            with (obj_player1)
            {
                global.startgate = 1
                global.leveltosave = level
                global.leveltorestart = targetRoom
                global.levelattempts = 0
                backtohubstartx = x
                backtohubstarty = y
                backtohubroom = room
                targetDoor = "A"
            }
            scr_room_goto(targetRoom)
        }
    }
}

function meta_level() //gml_Script_meta_level
{
    return 
    {
        description: "travel to a level",
        var arguments: ["level"],
        suggestions: [function() //gml_Script_anon@1576@___struct___247_meta_level_sh_level
        {
            if instance_exists(obj_cyop_loader)
            {
                var levels = []
                for (var file = file_find_first(concat(global.custom_path, "/levels/*"), 16); file != ""; file = file_find_next())
                {
                    if directory_exists(concat(global.custom_path, "/levels/", file))
                        array_push(levels, file)
                }
                file_find_close()
                return levels;
            }
            else
                return ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "kidsparty", "chateau", "war", "exit", "secretworld", "oldexit", "beach", "mansion", "strongcold", "dragonlair", "etb", "ancient", "grinch", "snickchallenge", "midway", "entryway", "steamy", "molasses", "sucrose"];
        }]
    };
}

