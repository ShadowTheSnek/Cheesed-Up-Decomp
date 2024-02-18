var e, _temp_local_var_2;
if (ds_map_find_value(async_load, "id") != req)
    return;
if (ds_map_find_value(async_load, "status") != 0)
{
    message_show(string("HTTP STATUS {0}!", ds_map_find_value(async_load, "http_status")))
    return;
}
loading = 0
var json_string = ds_map_find_value(async_load, "result")
var json = json_parse(json_string)
@@try_hook@@(724, 816)
if (variable_struct_exists(json, "version") && ver != json.version)
{
    message_show("OUTDATED VERSION!")
    return;
    var _temp_local_var_2 = @@try_unhook@@()
}
if is_array(json.official)
{
    for (var i = 0; i < array_length(json.official); i++)
        array_push(officialservers, json.official[i])
}
if is_array(json.community)
{
    for (i = 0; i < array_length(json.community); i++)
        array_push(communityservers, json.community[i])
}
@@try_unhook@@()
