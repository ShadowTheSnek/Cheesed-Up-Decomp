sprite_index = spr_playerN_idle
n_dialog[0] = [dialog_create("fight the noise", -4, function() //gml_Script_anon@86@gml_RoomCC_hub_noisettecafe_3_Create
{
    if (!global.noisecutscene1)
    {
        global.noisecutscene1 = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "noise1", 1)
    }
}
)]
n_dialog[1] = [dialog_create("you fought the noise")]
function anon@321@gml_RoomCC_hub_noisettecafe_3_Create() //gml_Script_anon@321@gml_RoomCC_hub_noisettecafe_3_Create
{
    if (!global.noisecutscene2)
        do_dialog(n_dialog[0])
    else
        do_dialog(n_dialog[1])
}

