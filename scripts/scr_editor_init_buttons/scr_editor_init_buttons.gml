function scr_editor_init_buttons() //gml_Script_scr_editor_init_buttons
{
    with (instance_create_depth(0, 0, -100, obj_button))
    {
        sprite_index = spr_bigbutton
        spr_icon = spr_menuicon
        function anon@172@scr_editor_init_buttons_scr_editor_init_buttons() //gml_Script_anon@172@scr_editor_init_buttons_scr_editor_init_buttons
        {
            var a = [["SAVE", -4, -4], ["LOAD LEVEL", -4, -4], ["EXIT EDITOR", -4, -4]]
            create_buttons_array(0, 64, 32, 24, a)
        }

        function anon@353@scr_editor_init_buttons_scr_editor_init_buttons() //gml_Script_anon@353@scr_editor_init_buttons_scr_editor_init_buttons
        {
            with (obj_button)
            {
                if (parent == other.id)
                    instance_destroy()
            }
        }

    }
    with (instance_create_depth(64, 0, -100, obj_button))
    {
        sprite_index = spr_bigbutton
        spr_icon = spr_playicon
    }
    with (instance_create_depth(128, 0, -100, obj_button))
    {
        sprite_index = spr_bigbutton
        spr_icon = spr_objecticon
        selectedid = 0
        function anon@750@scr_editor_init_buttons_scr_editor_init_buttons() //gml_Script_anon@750@scr_editor_init_buttons_scr_editor_init_buttons
        {
            function anon@785@anon@750_scr_editor_init_buttons_scr_editor_init_buttons() //gml_Script_anon@785@anon@750_scr_editor_init_buttons_scr_editor_init_buttons
            {
                with (parent)
                    selectedid = other.buttonid
                with (obj_objectlist)
                {
                    object_list = obj_editor.object_list[other.buttonid]
                    objectlist_calculate_scrollsize()
                    scroll_y = 0
                }
            }

            a = [["SCENERY", onselect, -4], ["ENEMIES", onselect, -4], ["TRIGGERS", onselect, -4]]
            create_buttons_array(0, 64, 32, 24, a)
            var t = 0
            with (obj_textbutton)
            {
                if (parent == other.id && buttonid == other.selectedid)
                {
                    selected = 1
                    t = (image_xscale * sprite_get_width(sprite_index))
                }
            }
            with (instance_create_depth(t, 64, depth, obj_objectlist))
            {
                sprite_index = spr_bigbutton
                parent = other.id
                object_list = obj_editor.object_list[other.selectedid]
                sprite_set_size(640, 384)
                objectlist_calculate_scrollsize()
            }
        }

        function anon@1671@scr_editor_init_buttons_scr_editor_init_buttons() //gml_Script_anon@1671@scr_editor_init_buttons_scr_editor_init_buttons
        {
            with (obj_button)
            {
                if (parent == other.id)
                    instance_destroy()
            }
        }

    }
}

