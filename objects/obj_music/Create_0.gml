var muffle = audio_effect_create((4 << 0))
muffle.bypass = 1
audio_bus_main.effects[0] = muffle
secret = 0
secretend = 0
pillar_on_camera = 0
prevpillar_on_camera = 0
music_map = ds_map_create()
music = -4
savedpillarpause = 0
savedpanicpause = 0
savedmusicpause = 0
savedsecretpause = 0
savedpanicpos = 0
savedmusicpos = 0
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic")
panicmusicID = fmod_event_create_instance("event:/music/pizzatime")
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase")
panicstart = 0
warstart = 0
global.jukebox = -4
custom_music = []
current_custom = -4
waiting = 0
cached_music = undefined
add_music(Endingroom, "event:/music/ending", -4, 0)
add_music(Creditsroom, "event:/music/credits", -4, 0)
add_music(Johnresurrectionroom, "event:/music/ending", -4, 0)
add_music(Longintro, "event:/music/intro", -4, 0, function(argument0, argument1) //gml_Script_anon@1065@gml_Object_obj_music_Create_0
{
    fmod_event_instance_set_parameter(argument1, "state", 0, 1)
}
)
add_music(Mainmenu, "event:/music/title", -4, 0, function(argument0, argument1) //gml_Script_anon@1222@gml_Object_obj_music_Create_0
{
    fmod_event_instance_set_parameter(argument1, "state", 0, 1)
}
)
add_music(tower_tutorial1, "event:/music/tutorial", "event:/music/pillarmusic", 0)
add_music(tower_entrancehall, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_johngutterhall, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_1, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_2, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_3, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_4, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_5, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_finalhallwaytitlecard, "event:/music/pillarmusic", -4, 0)
add_music(tower_pizzafacehall, "event:/music/w5/finalhallway", -4, 0)
add_music(tower_outside, "event:/sfx/misc/windloop", -4, 0)
add_music(tower_soundtest, "event:/music/pillarmusic", -4, 0)
add_music(trickytreat_1, "event:/music/halloween2023", -4, 0, function(argument0, argument1) //gml_Script_anon@2348@gml_Object_obj_music_Create_0
{
    if (argument0 == trickytreat_1)
        fmod_event_instance_set_parameter(argument1, "state", 0, 1)
    else
        fmod_event_instance_set_parameter(argument1, "state", 1, 1)
}
)
add_music(secret_entrance, "event:/music/secretworld", -4, 0)
add_music(tower_baby, "event:/modded/baby", -4, 0)
add_music(tower_1up, "event:/music/pillarmusic", -4, 0)
add_music(tower_2up, "event:/music/pillarmusic", -4, 0)
add_music(tower_3up, "event:/music/pillarmusic", -4, 0)
add_music(tower_4up, "event:/music/pillarmusic", -4, 0)
add_music(boss_vigilante, "event:/music/boss/vigilante", -4, 0)
add_music(boss_fakepep, "event:/music/boss/fakepep", -4, 0)
add_music(boss_fakepephallway, "event:/music/boss/fakepepambient", -4, 0)
add_music(boss_fakepepkey, "event:/music/pillarmusic", -4, 0)
add_music(boss_noise, "event:/music/boss/noise", -4, 0)
add_music(boss_pepperman, "event:/music/boss/pepperman", -4, 0)
add_music(boss_pizzaface, "event:/music/boss/pizzaface", -4, 0, function(argument0, argument1) //gml_Script_anon@3397@gml_Object_obj_music_Create_0
{
    if (argument0 == boss_pizzaface)
        fmod_event_instance_set_parameter(argument1, "state", 0, 1)
    else if (argument0 == boss_pizzafacehub)
        fmod_event_instance_set_parameter(argument1, "state", 5, 0)
}
)
function anon@3641@gml_Object_obj_music_Create_0(argument0, argument1, argument2) //gml_Script_anon@3641@gml_Object_obj_music_Create_0
{
    var s = 0
    var t = 0
    switch obj_player1.character
    {
        case "P":
            break
        case "N":
            s = 1
            t = 3
            break
        case "V":
            s = 2
            break
        case "SP":
            s = 3
            t = 1
            break
        case "SN":
            s = 6
            t = 4
            break
        case "BN":
            s = 5
            t = 2
            break
        default:

    }

    fmod_event_instance_set_parameter(argument1, "state", s, 1)
    fmod_event_instance_set_parameter(argument2, "state", t, 1)
}

add_music(entrance_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", 0, entrance_func)
add_music(medieval_1, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@4256@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case medieval_1:
        case medieval_2:
            s = 0
            break
        case medieval_3:
        case medieval_5:
            s = 0
            break
        case medieval_6:
            s = 2
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(ruin_1, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", 0, function(argument0, argument1) //gml_Script_anon@4722@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case ruin_1:
        case ruin_5:
            s = 0
            break
        case ruin_6:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(dungeon_1, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", 0)
add_music(badland_1, "event:/music/w2/desert", "event:/music/w2/desertsecret", 0, function(argument0, argument1) //gml_Script_anon@5194@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case badland_1:
        case badland_8b:
        case badland_10:
            s = 0
            break
        case badland_9:
        case badland_mart4:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(farm_2, "event:/music/w2/farm", "event:/music/w2/farmsecret", 0, function(argument0, argument1) //gml_Script_anon@5627@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case farm_2:
        case farm_6:
            s = 0
            break
        case farm_9:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(graveyard_1, "event:/music/w2/graveyard", "event:/music/w2/graveyardsecret", 0)
add_music(saloon_1, "event:/music/w2/saloon", "event:/music/w2/saloonsecret", 0)
add_music(plage_entrance, "event:/music/w3/beach", "event:/music/w3/beachsecret", 0)
add_music(forest_1, "event:/music/w3/forest", "event:/music/w3/forestsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@6272@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case forest_1:
        case forest_3:
            s = 0
            break
        case forest_G1b:
            s = 1
            break
        case forest_G1:
            if obj_player1.isgustavo
                s = 2
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(minigolf_1, "event:/music/w3/golf", "event:/music/w3/golfsecret", 0)
add_music(space_1, "event:/music/w3/space", "event:/music/w3/spacesecret", 0)
add_music(freezer_1, "event:/music/w4/freezer", "event:/music/w4/freezersecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@7103@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case freezer_1:
        case freezer_9:
            s = 0
            break
        case freezer_12:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(industrial_1, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@7525@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case industrial_1:
        case industrial_2:
            s = 0
            break
        case industrial_3:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(sewer_1, "event:/music/w4/sewer", "event:/music/w4/sewersecret", 0)
add_music(street_1, "event:/music/w4/street", "event:/music/w4/streetsecret", 0, function(argument0, argument1) //gml_Script_anon@7950@gml_Object_obj_music_Create_0
{
    if (argument0 == street_1 || argument0 == street_house3)
        fmod_event_instance_set_parameter(argument1, "state", 0, 1)
    else if (argument0 == street_bacon)
        fmod_event_instance_set_parameter(argument1, "state", 2, 1)
    if (argument0 == street_jail)
        fmod_set_parameter("musicmuffle", 1, 0)
    else
        fmod_set_parameter("musicmuffle", 0, 0)
}
)
add_music(chateau_1, "event:/music/w5/chateau", (global.gameplay ? "event:/music/w5/chateausecret" : "event:/music/w1/medievalsecret"), 0)
add_music(kidsparty_1, "event:/music/w5/kidsparty", "event:/music/w5/kidspartysecret", 0)
add_music(war_1, "event:/music/w5/war", "event:/music/w5/warsecret", 0)
add_music(war_lap, "event:/music/w5/war", "event:/music/w5/warsecret", 0)
add_music(editor_entrance, "event:/modded/editor", "event:/music/pillarmusic", 0)
add_music(tower_extra, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_extra2, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_freerun, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_hubroomE, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_sage, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tower_sugary, "event:/music/hub", "event:/music/pillarmusic", 0, gml_Script_hub_state)
add_music(tutorialV_1, "event:/music/tutorial", "event:/music/pillarmusic", 0)
add_music(characterselect, "event:/modded/characterselect", -4, 0)
add_music(midway_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", 0, entrance_func)
add_music(sugarytut_1, "event:/modded/sugary/tutorial", -4, 0)
add_music(entryway_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", 0, entrance_func)
add_music(steamy_1, "event:/modded/sugary/cotton", "event:/modded/sugary/cottonsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@9856@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case steamy_1:
        case steamy_7:
            s = 0
            break
        case steamy_8:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 0)
}
)
add_music(molasses_1, "event:/modded/sugary/molasses", "event:/modded/sugary/molassessecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@10318@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case molasses_1:
        case molasses_6:
            s = 0
            break
        case molasses_6b:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 0)
}
)
add_music(sucrose_1, "event:/modded/sugary/sucrose", "event:/modded/sugary/sucrosesecret", 0)
add_music(medieval_1_OLD, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@10808@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case medieval_1:
        case medieval_2:
            s = 0
            break
        case medieval_3:
        case medieval_5:
            s = 1
            break
        case medieval_6:
            s = 2
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(ruin_1_OLD, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", 0, function(argument0, argument1) //gml_Script_anon@11210@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case ruin_1:
        case ruin_5:
            s = 0
            break
        case ruin_6:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(dungeon_1_OLD, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", 0)
add_music(grinch_1, "event:/modded/level/grinch", "event:/music/w1/medievalsecret", 0)
add_music(dragonlair_1, "event:/modded/level/dragonlair", "event:/music/w1/medievalsecret", 0)
add_music(beach_1, "event:/music/w3/beach", "event:/music/w3/beachsecret", 0)
add_music(golf_room1, "event:/music/w3/golf", "event:/music/w3/golfsecret", 0)
add_music(mansion_1, "event:/modded/level/mansion", "event:/modded/level/mansionsecret", 0)
add_music(mansion_weird2, "event:/modded/level/mansion", "event:/modded/level/mansionsecret", 0)
add_music(PP_room1, "event:/modded/level/oldtutorial", "event:/music/pillarmusic", 0)
add_music(etb_1, "event:/modded/level/oldtutorial", "event:/music/w1/ruinsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@12249@gml_Object_obj_music_Create_0
{
    s = (argument0 == etb_1 ? 0 : 1)
    if (s == 1 && check_skin((0 << 0)))
        s = 2
    fmod_event_instance_set_parameter(argument1, "state", s, 0)
}
)
add_music(strongcold_10, "event:/modded/level/strongcold", "event:/modded/level/strongcoldsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@12544@gml_Object_obj_music_Create_0
{
    s = 1
    switch argument0
    {
        case strongcold_10:
        case strongcold_9:
        case strongcold_lap:
            s = 0
            break
        case strongcold_1:
            s = 2
            break
        case strongcold_secret1:
        case strongcold_secret4:
        case strongcold_secret5:
            s = -1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(oldfreezer_1, "event:/music/w4/freezer", "event:/music/w4/freezersecret", 0, -4)
add_music(oldfactory_0, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", 0, -4)
add_music(factory_1, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@13240@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case factory_1:
            s = 0
            break
        case factory_2:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(desert_1, "event:/music/w2/desert", "event:/music/w2/desertsecret", 0, function(argument0, argument1) //gml_Script_anon@13562@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case badland_1:
        case badland_8b:
        case badland_10:
            s = 0
            break
        case badland_9:
        case badland_mart4:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(e_medieval_1, "event:/modded/encore/w1/medieval", "event:/music/w1/medievalsecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@13982@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case e_medieval_1:
        case e_medieval_2:
            s = 0
            break
        case medieval_3:
        case medieval_5:
            s = 0
            break
        case medieval_6:
            s = 2
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 1)
}
)
add_music(e_molasses_1, "event:/modded/encore/sugary/swamp", "event:/modded/sugary/molassessecret", 0, function(argument0, argument1, argument2) //gml_Script_anon@14408@gml_Object_obj_music_Create_0
{
    s = -1
    switch argument0
    {
        case e_molasses_1:
        case molasses_6:
            s = 0
            break
        case molasses_6b:
            s = 1
            break
    }

    if (s != -1)
        fmod_event_instance_set_parameter(argument1, "state", s, 0)
}
)
