if (global.leveltosave == "snickchallenge")
    activate_snickchallenge()
loading = 1
with (gml_Script_instance_create(x, y, obj_fadeout))
{
    restarttimer = 1
    if (room == tower_finalhallwaytitlecard)
        finalhallway = 1
}
with (obj_cyop_assetloader)
    self.wait()
if (group_arr != -4 || instance_exists(obj_cyop_assetloader))
{
    with (gml_Script_instance_create(x, y, obj_loadingscreen))
    {
        offload_arr = other.offload_arr
        group_arr = other.group_arr
    }
}
