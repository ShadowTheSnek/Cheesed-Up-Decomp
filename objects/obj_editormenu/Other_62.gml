if (menu != 1)
    return;
function anon@57@gml_Object_obj_editormenu_Other_62(argument0) //gml_Script_anon@57@gml_Object_obj_editormenu_Other_62
{
    downloads[argument0] = noone
    download_count--
}

var i = 0
while (i < array_length(downloads) && i < array_length(remote_towers))
{
    var this = downloads[i]
    var tower = remote_towers[i]
    if (downloads[i] == noone)
    {
    }
    else if (ds_map_find_value(async_load, "id") != this.request)
    {
    }
    else
    {
        if (this.state == states.normal)
        {
            var data = json_parse(ds_map_find_value(async_load, "result"))
            if ((!is_array(data)) || array_length(data) == 0)
            {
                message_show("Gamebanana messed up! Try again!")
                self.done_download(i)
                return;
            }
            array_sort(data, function(argument0, argument1) //gml_Script_anon@640@gml_Object_obj_editormenu_Other_62
            {
                return (argument0._tsDateAdded < argument1._tsDateAdded && string_ends_with(argument0._sFile, ".zip"));
            }
)
            this.file = data[0]
            if (!(string_ends_with(this.file._sFile, ".zip")))
            {
                tower.corrupt = 1
                if string_ends_with(this.file._sFile, ".rar")
                    message_show("Can't extract .rar mods!")
                else if string_ends_with(this.file._sFile, ".json")
                    message_show("Not a tower!")
                else
                    message_show(string("Unknown format {0}!", filename_ext(this.file._sFile)))
                self.done_download(i)
                return;
            }
            this.file.path = string("{0}\\temp_{1}\\download.zip", towers_folder, tower.modid)
            this.request = http_get_file(this.file._sDownloadUrl, this.file.path)
            this.state = states.revolver
        }
        else if (this.state == states.revolver)
        {
            if (ds_map_find_value(async_load, "status") == 0)
            {
                this.file.path = ds_map_find_value(async_load, "result")
                this.request = zip_unzip(this.file.path, filename_dir(this.file.path))
                this.state = states.dynamite
                this.progress = 1
                file_delete(this.file.path)
                if (this.request < 0)
                {
                    message_show("Failed to extract a ZIP!")
                    self.done_download(i)
                    return;
                }
                var target = filename_dir(this.file.path)
                _found = ""
                find_files_recursive(target, function(argument0) //gml_Script_anon@2047@gml_Object_obj_editormenu_Other_62
                {
                    _found = argument0
                    return 1;
                }
, ".tower.ini")
                if (_found == "")
                    message_show("This mod is not a CYOP tower!")
                else
                {
                    var finaltarget = (towers_folder + string("\\{0}", tower.modid))
                    folder_destroy(finaltarget)
                    if (folder_move(filename_dir(_found), finaltarget) == 0)
                        message_show("Couldn't move directory?")
                    tower.downloaded = 1
                    sound_play("event:/modded/sfx/downloaded")
                    self.add_tower(string("{0}\\{1}", finaltarget, filename_name(_found)), 1)
                }
                folder_destroy(target)
                self.done_download(i)
            }
            else if (ds_map_find_value(async_load, "status") == 1)
            {
                this.progress = (ds_map_find_value(async_load, "sizeDownloaded") / ds_map_find_value(async_load, "contentLength"))
                trace("Download: ", (this.progress * 100), "%")
            }
            else
            {
                message_show("Could not download tower.")
                self.done_download(i)
            }
        }
        return;
    }
    i++
}
if (ds_map_find_value(async_load, "status") != 0)
    return;
if (ds_map_find_value(async_load, "id") != request)
    return;
if (state == states.normal)
{
    sel.y = -1
    data = json_parse(ds_map_find_value(async_load, "result"))
    if ((!(variable_struct_exists(data, "_aRecords"))) || array_length(data._aRecords) == 0)
    {
        message_show("Page not found!")
        state = states.revolver
        return;
    }
    last_page = data._aMetadata._bIsComplete
    for (i = 0; i < array_length(data._aRecords); i++)
    {
        this = data._aRecords[i]
        if (this._idRow == 450677 || this._idRow == 470390 || this._idRow == 448568)
        {
        }
        else
        {
            var likes = 0
            var posts = 0
            var views = 0
            if variable_struct_exists(this, "_nLikeCount")
                likes = this._nLikeCount
            if variable_struct_exists(this, "_nPostCount")
                posts = this._nPostCount
            if variable_struct_exists(this, "_nViewCount")
                views = this._nViewCount
            var name = this._sName
            if (string_pos("cyop", string_lower(name)) != 0)
            {
                name = string_replace(name, "(cyop)", "")
                name = string_replace(name, "(CYOP)", "")
                name = string_replace(name, "(Cyop)", "")
                name = string_replace(name, "[CYOP]", "")
                name = string_replace(name, "(CYOP Level)", "")
                name = string_replace(name, "(CYOP level)", "")
                name = string_replace(name, "(CYOP Tower)", "")
                name = string_replace(name, "(CYOP tower)", "")
                name = string_replace(name, "CYOP, ", "")
                name = string_replace(name, "CYOP: ", "")
            }
            name = string_trim(name)
            var downloaded = 0
            if directory_exists(string("{0}\\{1}", towers_folder, this._idRow))
                downloaded = 1
            var base_image = this._aPreviewMedia._aImages[0]
            var struct = 
            {
                name: name,
                imagelink: ((base_image._sBaseUrl + "/") + base_image._sFile530),
                author: this._aSubmitter._sName,
                image: -4,
                modid: this._idRow,
                url: this._sProfileUrl,
                likes: likes,
                posts: posts,
                views: views,
                downloaded: downloaded,
                corrupt: 0
            }

            array_push(remote_towers, struct)
            self.fetch_tower_image((array_length(remote_towers) - 1))
        }
    }
    state = states.revolver
}
