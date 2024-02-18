function anon_gml_RoomCC_medieval_7_5_Create_19_gml_RoomCC_medieval_7_5_Create@gml_RoomCC_medieval_7_OLD_5_Create() //gml_Script_anon_gml_RoomCC_medieval_7_5_Create_19_gml_RoomCC_medieval_7_5_Create@gml_RoomCC_medieval_7_OLD_5_Create
{
    if global.panic
    {
        tv_reset()
        return 1;
    }
    return 0;
}

prompt_array[0] = tv_create_prompt("You hate to see it! PTV Weather report is announcing an hurricane that will wipe out the entire region of this level!", 0, 1052, 3)
prompt_array[1] = tv_create_prompt("Get your umbrella ready, put on your tall rain boot and coat, it wont help!", 1, 1052, 3)
