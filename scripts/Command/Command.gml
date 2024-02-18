var _temp_local_var_3, _temp_local_var_4;
function Command() constructor //gml_Script_Command
{
    if 1
    {
    }
    else
    {
        function anon@48@Command_Command() //gml_Script_anon@48@Command_Command
        {
        }

        function anon@88@Command_Command() //gml_Script_anon@88@Command_Command
        {
        }

        function anon@132@Command_Command() //gml_Script_anon@132@Command_Command
        {
        }

    }
    state = states.revolver
}

function PlaceCommand(argument0, argument1, argument2) constructor //gml_Script_PlaceCommand
{
    var _temp_local_var_3 = @@CopyStatic@@(gml_Script_Command)
    var _temp_local_var_4 = Command()
    if 1
    {
    }
    else
    {
        function anon@253@PlaceCommand_Command() //gml_Script_anon@253@PlaceCommand_Command
        {
            if (instance == noone)
            {
                instance = gml_Script_instance_create((snap_tile(x, 32) + object.place_xoffset), (snap_tile(y, 32) + object.place_yoffset), obj_fakeobject)
                with (instance)
                {
                    sprite_index = other.object.sprite_index
                    object = other.object.object_index
                }
                with (obj_editor)
                {
                    scr_editor_clear_selectedobjects()
                    ds_list_add(selectedobjects, other.instance)
                }
            }
            else
                instance_activate_object(instance)
        }

        function anon@749@PlaceCommand_Command() //gml_Script_anon@749@PlaceCommand_Command
        {
            instance_deactivate_object_hook(instance)
        }

        function anon@830@PlaceCommand_Command() //gml_Script_anon@830@PlaceCommand_Command
        {
            if (state == states.normal)
            {
                instance_activate_object(instance)
                instance_destroy(instance)
            }
        }

    }
    x = argument0
    y = argument1
    object = argument2
    instance = noone
}

