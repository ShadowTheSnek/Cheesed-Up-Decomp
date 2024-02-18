spawned_in = 0
if (room != editor_entrance)
{
    spawned_in = 1
    instance_destroy(id, false)
    return;
}
with (obj_player1)
{
    if (cyop_backtohubroom == -4)
    {
        cyop_backtohubroom = backtohubroom
        cyop_backtohubx = backtohubstartx
        cyop_backtohuby = backtohubstarty
    }
    else
    {
        gamesave_async_load()
        trace("Switched savefiles: ", get_savefile_ini())
        backtohubroom = cyop_backtohubroom
        backtohubstartx = cyop_backtohubx
        backtohubstarty = cyop_backtohuby
    }
    if (is_string(backtohubroom) || backtohubroom == editor_entrance)
        backtohubroom = tower_extra2
    state = states.titlescreen
}
global.leveltorestart = -4
towers = []
root_folder = (environment_get_variable("APPDATA") + "\\PizzaTower_GM2")
towers_folder = (root_folder + "\\towers")
function anon@858@gml_Object_obj_editormenu_Create_0(argument0, argument1) //gml_Script_anon@858@gml_Object_obj_editormenu_Create_0
{
    if (argument1 == undefined)
        argument1 = 0
    ini_open(argument0)
    var type = ini_read_real("properties", "type", 0)
    var mainlevel = ini_read_string("properties", "mainlevel", "")
    var name = ini_read_string("properties", "name", (type ? "Unnamed Level" : "Unnamed Tower"))
    var struct = 
    {
        type: type,
        name: name,
        file: argument0,
        collect: 0,
        secrets: 0,
        treasure: 0,
        rank: "",
        toppin: [0, 0, 0, 0, 0],
        corrupt: 0,
        fresh: argument1
    }

    if (!(file_exists(string("{0}\\levels\\{1}\\level.ini", filename_dir(argument0), mainlevel))))
        struct.corrupt = 1
    if (!((type == 0 || type == 1)))
        struct.corrupt = 1
    ini_close()
    if (type == 1)
    {
        ini_open(string("{0}\\custom{1}\\{2}.ini", get_save_folder(), global.currentsavefile, filename_name(filename_dir(argument0))))
        struct.collect = ini_read_real("Highscore", mainlevel, 0)
        struct.treasure = ini_read_real("Treasure", mainlevel, 0)
        struct.toppin = [ini_read_real("Toppin", (mainlevel + "1"), 0), ini_read_real("Toppin", (mainlevel + "2"), 0), ini_read_real("Toppin", (mainlevel + "3"), 0), ini_read_real("Toppin", (mainlevel + "4"), 0), ini_read_real("Toppin", (mainlevel + "5"), 0)]
        struct.secrets = ini_read_real("Secret", mainlevel, 0)
        struct.rank = ini_read_string("Ranks", mainlevel, "")
        ini_close()
    }
    array_push(towers, struct)
}

function anon@2270@gml_Object_obj_editormenu_Create_0() //gml_Script_anon@2270@gml_Object_obj_editormenu_Create_0
{
    towers = []
    has_pizzatower = find_files_recursive(towers_folder, function(argument0) //gml_Script_anon@2354@anon@2270_gml_Object_obj_editormenu_Create_0
    {
        if (filename_name(filename_dir(argument0)) != "towers")
        {
            self.add_tower(argument0)
            return 1;
        }
    }
, ".tower.ini")
}

self.refresh_list()
sel = 
{
    x: 0,
    y: 0
}

cam = 
{
    x: 0,
    y: 0
}

textscroll = 0
movehold = -1
state = states.normal
menu = 0
smooth_buffer = 2
scr_init_input()
pto_textbox_init()
controls = 
{
    text: "",
    text_prev: "",
    compiled: -4
}

fader = 1
shake = 0
remote_towers = []
page = 1
filter = 0
last_page = 0
request = -4
scroll = 0
downloads = []
download_count = 0
function anon@3029@gml_Object_obj_editormenu_Create_0(argument0) //gml_Script_anon@3029@gml_Object_obj_editormenu_Create_0
{
    if (argument0 == undefined)
        argument0 = 1
    if (download_count > 0)
    {
        message_show("There are pending downloads!")
        return;
    }
    scroll = 0
    self.image_cleanup()
    var count = 18
    remote_towers = []
    downloads = array_create(count, -4)
    menu = 1
    state = states.normal
    var url = string("https://gamebanana.com/apiv11/Mod/Index?_nPerpage={0}&_aFilters[Generic_Category]=22962", count)
    url += string("&_nPage={0}", argument0)
    switch filter
    {
        case (1 << 0):
            url += "&_sSort=Generic_MostDownloaded"
            break
        case (2 << 0):
            url += "&_sSort=Generic_MostLiked"
            break
        case (3 << 0):
            url += "&_sSort=Generic_MostViewed"
            break
    }

    request = http_get(url)
}

function anon@3762@gml_Object_obj_editormenu_Create_0(argument0) //gml_Script_anon@3762@gml_Object_obj_editormenu_Create_0
{
    url = remote_towers[argument0].imagelink
    if (!sprite_exists(remote_towers[argument0].image))
        remote_towers[argument0].image = sprite_add(url, 0, false, false, 0, 0)
}

function anon@3972@gml_Object_obj_editormenu_Create_0(argument0) //gml_Script_anon@3972@gml_Object_obj_editormenu_Create_0
{
    if (menu != 1)
        return;
    if (downloads[argument0] == -4)
    {
        var this = remote_towers[argument0]
        url = string("https://gamebanana.com/apiv11/Mod/{0}/Files", this.modid)
        download_count++
        downloads[argument0] = 
        {
            state: states.normal,
            request: http_get(url),
            file: -4,
            progress: 0
        }

    }
}

function anon@4312@gml_Object_obj_editormenu_Create_0() //gml_Script_anon@4312@gml_Object_obj_editormenu_Create_0
{
    for (var i = 0; i < array_length(remote_towers); i++)
    {
        if (remote_towers[i].image != -4)
        {
            trace(string("Deleted image for tower {0}", remote_towers[i].modid))
            sprite_delete(remote_towers[i].image)
        }
    }
}

with (obj_shell)
    WC_bindsenabled = 0
