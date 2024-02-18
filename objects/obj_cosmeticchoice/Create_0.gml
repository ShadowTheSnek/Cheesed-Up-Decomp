event_inherited()
image_speed = 0.35
sel = 
{
    side: 0,
    var hat: 0,
    var pet: 0
}

hats = []
pets = []
function anon@149@gml_Object_obj_cosmeticchoice_Create_0() //gml_Script_anon@149@gml_Object_obj_cosmeticchoice_Create_0
{
    anim_con = 2
    with (obj_player)
    {
        var hatprev = hat
        var petprev = pet
        hat = other.hats[other.sel.hat].hat
        pet = other.pets[other.sel.pet].pet
        if (hatprev != hat || petprev != pet)
        {
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_string("Game", "hat", hat)
            ini_write_real("Game", "pet", pet)
            obj_savesystem.ini_str = ini_close()
            gamesave_async_save()
        }
        sound_play("event:/sfx/misc/collecttoppin")
    }
}

function anon@638@gml_Object_obj_cosmeticchoice_Create_0(argument0) //gml_Script_anon@638@gml_Object_obj_cosmeticchoice_Create_0
{
    hat = hats[sel.hat]
    pet = pets[sel.pet]
    switch sel.side
    {
        case 0:
            var sprite = hat.sprite
            break
        case 1:
            sprite = pet.sprite
            break
    }

    var col = c_white
    if (sprite == spr_nocosmetic)
    {
        col = 0
        if (sel.side == 0)
            sprite = spr_cowboyhat
        else
            sprite = spr_toppinshroom
    }
    var yoffset = (50 + (sprite_get_yoffset(sprite) - (lerp(sprite_get_bbox_bottom(sprite), sprite_get_bbox_top(sprite), 0.5) * 2)))
    draw_sprite_ext(sprite, -1, (lerp(0, obj_screensizer.actual_width, 0.5) + charshift[0]), (((obj_screensizer.actual_height / 2) + charshift[1]) + floor(yoffset)), 2, 2, 0, col, charshift[2])
    draw_set_font(gml_Script_lang_get_font("bigfont"))
    draw_set_align(0)
    var str = string_upper((sel.side == 0 ? hat.name : pet.name))
    var xx = (lerp(0, obj_screensizer.actual_width, 0.5) - (string_width(str) / 2))
    for (var i = 1; i <= string_length(str); i++)
    {
        var char = string_char_at(str, i)
        var yy = 380
        var d = ((i % 2) == 0 ? -1 : 1)
        var _dir = floor(Wave(-1, 1, 0.1, 0))
        yy += (_dir * d)
        draw_text(round(xx), yy, char)
        xx += string_width(char)
    }
    draw_set_font(gml_Script_lang_get_font("font_small"))
    draw_set_align(1)
    draw_text_ext(lerp(0, obj_screensizer.actual_width, 0.5), 420, (sel.side == 0 ? hat.desc : pet.desc), 16, 600)
    var arrow_sel = (sel.side == 0 ? sel.hat : sel.pet)
    var arrow_max = (sel.side == 0 ? array_length(hats) : array_length(pets))
    if (arrow_sel > 0)
    {
        xx = (((obj_screensizer.actual_width / 2) - 120) - (sin((current_time / 200)) * 4))
        yy = ((obj_screensizer.actual_height / 2) + 16)
        if (charshift[0] < 0)
            xx += charshift[0]
        draw_sprite_ext(spr_palettearrow, 0, xx, yy, 1, 1, 90, c_white, 1)
    }
    if (arrow_sel < (arrow_max - 1))
    {
        xx = (((obj_screensizer.actual_width / 2) + 120) + (sin((current_time / 200)) * 4))
        yy = ((obj_screensizer.actual_height / 2) + 16)
        if (charshift[0] > 0)
            xx += charshift[0]
        draw_sprite_ext(spr_palettearrow, 0, xx, yy, 1, 1, 270, c_white, 1)
    }
}

charshift = [0, 0, 1, 1]
handx = 0
function add_hat@gml_Object_obj_cosmeticchoice_Create_0(argument0, argument1, argument2) //gml_Script_add_hat@gml_Object_obj_cosmeticchoice_Create_0
{
    array_push(hats, 
    {
        hat: argument0,
        sprite: argument1,
        name: gml_Script_lang_get_value_newline(string("hat_{0}title", argument2)),
        desc: gml_Script_lang_get_value_newline(string("hat_{0}", argument2))
    }
)
}

function add_pet@gml_Object_obj_cosmeticchoice_Create_0(argument0, argument1, argument2) //gml_Script_add_pet@gml_Object_obj_cosmeticchoice_Create_0
{
    array_push(pets, 
    {
        pet: argument0,
        sprite: argument1,
        name: gml_Script_lang_get_value_newline(string("pet_{0}title", argument2)),
        desc: gml_Script_lang_get_value_newline(string("pet_{0}", argument2))
    }
)
}

add_hat(-1, spr_nocosmetic, "none")
add_hat((0 << 0), spr_cowboyhat, "cowboy")
add_hat((1 << 0), spr_duncehat, "dunce")
add_hat((4 << 0), spr_crownhat, "golden")
add_hat((5 << 0), spr_catearshat, "uwunya")
add_pet(-1, spr_nocosmetic, "none")
add_pet((0 << 0), spr_playerN_cheesedidle, "noiserat")
add_pet((1 << 0), spr_petberry_idle, "berry")
add_pet((2 << 0), spr_petsneck_idle, "sneck")
add_pet((3 << 0), spr_petboykiss_idle, "boykiss")
add_pet((5 << 0), spr_petrush_idle, "rush")
add_pet((6 << 0), spr_petvivi_idle, "vivian")
add_pet((7 << 0), spr_petgooch_idle, "gooch")
for (i = 0; i < array_length(hats); i++)
{
    if (obj_player1.hat == hats[i].hat)
        sel.hat = i
}
for (i = 0; i < array_length(pets); i++)
{
    if (obj_player1.pet == pets[i].pet)
        sel.pet = i
}
shown_tip = 0
