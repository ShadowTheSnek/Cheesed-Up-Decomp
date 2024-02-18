if (other.character == "V")
    return;
if other.key_up2
{
    if other.ispeppino
    {
        with (other)
        {
            with (gml_Script_instance_create(x, y, obj_sausageman_dead))
            {
                sound_play_3d("event:/sfx/misc/clotheswitch", x, y)
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                usepalette = 1
                sprite_index = spr_palettedresserdebris
                spr_palette = spr_peppalette
                paletteselect = other.paletteselect
                oldpalettetexture = global.palettetexture
            }
        }
        paletteselect++
        if (paletteselect >= array_length(palettes))
            paletteselect = 0
        while (palettes[paletteselect][1] == 0)
        {
            paletteselect++
            if (paletteselect >= array_length(palettes))
                paletteselect = 0
        }
        var arr = palettes[paletteselect]
        other.paletteselect = arr[2]
        if (arr[2] == 12)
            global.palettetexture = arr[3]
        else
            global.palettetexture = -4
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Game", "palette", other.paletteselect)
        ini_write_string("Game", "palettetexture", arr[0])
        obj_savesystem.ini_str = ini_close()
        palettetitle = gml_Script_lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"))
        palettedesc = gml_Script_lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]))
    }
    else
    {
        with (other)
        {
            with (gml_Script_instance_create(x, y, obj_sausageman_dead))
            {
                sound_play_3d("event:/sfx/misc/clotheswitch", x, y)
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                usepalette = 1
                sprite_index = spr_palettedresserdebris
                spr_palette = spr_peppalette
                paletteselect = other.paletteselect
                oldpalettetexture = global.palettetexture
            }
        }
        paletteselect++
        if (paletteselect >= array_length(palettes_noise))
            paletteselect = 0
        while (palettes_noise[paletteselect][1] == 0)
        {
            paletteselect++
            if (paletteselect >= array_length(palettes_noise))
                paletteselect = 0
        }
        arr = palettes_noise[paletteselect]
        other.paletteselect = arr[2]
        if (arr[2] == 12)
            global.palettetexture = arr[3]
        else
            global.palettetexture = -4
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Game", "palette", other.paletteselect)
        ini_write_string("Game", "palettetexture", arr[0])
        obj_savesystem.ini_str = ini_close()
        palettetitle = gml_Script_lang_get_value(concat("dresser_", palettes_noise[paletteselect][0], "title"))
        palettedesc = gml_Script_lang_get_value_newline(concat("dresser_", palettes_noise[paletteselect][0]))
    }
}
