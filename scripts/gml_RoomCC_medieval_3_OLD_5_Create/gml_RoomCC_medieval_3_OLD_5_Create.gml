function anon_gml_RoomCC_medieval_3_5_Create_19_gml_RoomCC_medieval_3_5_Create@gml_RoomCC_medieval_3_OLD_5_Create() //gml_Script_anon_gml_RoomCC_medieval_3_5_Create_19_gml_RoomCC_medieval_3_5_Create@gml_RoomCC_medieval_3_OLD_5_Create
{
    with (obj_player)
    {
        if (state == states.boxxedpep || state == states.cheesepepfling || state == states.boxxedpepspin)
            return 1;
    }
    return 0;
}

prompt_array[0] = tv_create_prompt("Wow! It seems that thunder has turned a seemingly-unknown-as-of-now fat man into a valiant and more easily identifiable knight!", 0, 589, 3)
prompt_array[1] = tv_create_prompt("What mighty stead will he ride? What epic quest will he accomplish?", 1, 1052, 3)
prompt_array[2] = tv_create_prompt("Maybe he will just slam into a wall and become incredibly boring again?", 1, 487, 3)
