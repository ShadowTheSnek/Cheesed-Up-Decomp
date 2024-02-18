var ach = achievement_get_struct(achievement)
if (ach != noone)
{
    if ach.unlocked
    {
        hidden = 0
        image_index = index
    }
    else
        image_index = (index + secretplus)
}
else
{
    trace("Not found secret: ", achievement)
    image_index = (index + secretplus)
}
textfont = gml_Script_lang_get_font("creditsfont")
if hidden
    texttitle = gml_Script_lang_get_value("achievement_hiddentitle")
else
    texttitle = gml_Script_lang_get_value(concat("achievement_", achievement, "title"))
textdesc = gml_Script_lang_get_value(concat("achievement_", achievement))
if is_string(textdesc)
    textdesc = string_replace_all(textdesc, "\\n", "\n")
