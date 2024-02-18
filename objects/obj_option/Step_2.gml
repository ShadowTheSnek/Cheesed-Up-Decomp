var j = 0
var m = menus[menu]
if instance_exists(obj_keyconfig)
    j = 4
if (m.menu_id >= (7 << 0) && m.menu_id <= (11 << 0))
    j = 4
else if (m.menu_id >= (2 << 0) && m.menu_id <= (5 << 0))
    j = 2
else if (m.menu_id == (1 << 0))
    j = 1
else if (m.menu_id == (6 << 0))
    j = 3
else if (m.menu_id == (12 << 0))
    j = 4
else if (m.menu_id == (13 << 0))
    j = 3
if safe_get(obj_modconfig, "visible")
    j = 5
for (var i = 0; i < array_length(bg_alpha); i++)
{
    if (i == j)
        bg_alpha[i] = Approach(bg_alpha[i], 1, 0.1)
    else
        bg_alpha[i] = Approach(bg_alpha[i], 0, 0.05)
}
bg_x -= 1
bg_y -= 1
if (instance_exists(obj_keyconfig) || instance_exists(obj_screenconfirm) || safe_get(obj_modconfig, "visible"))
    return;
scr_menu_getinput()
if (backbuffer > 0)
{
    backbuffer--
    key_jump = 0
    key_back = 0
}
var move = (key_down2 - key_up2)
if (move != 0)
{
    slidebuffer = 0
    slidecount = 0
}
var os = optionselected
optionselected += move
optionselected = clamp(optionselected, 0, (array_length(m.options) - 1))
if (os != optionselected)
    fmod_event_one_shot("event:/sfx/ui/step")
var option = m.options[optionselected]
var move2 = (key_left2 + key_right2)
switch option.type
{
    case (2 << 0):
        if (key_jump && is_callable(option.func))
        {
            fmod_event_one_shot("event:/sfx/ui/select")
            option.option.func()
        }
        break
    case (0 << 0):
        if (key_jump || (-key_left2) || key_right2)
        {
            with (option)
            {
                fmod_event_one_shot("event:/sfx/ui/select")
                value = (!value)
                if is_callable(on_changed)
                    self.on_changed(value)
            }
        }
        break
    case (1 << 0):
        if (move2 != 0)
        {
            with (option)
            {
                fmod_event_one_shot("event:/sfx/ui/step")
                value += move2
                if (value > (array_length(values) - 1))
                    value = 0
                if (value < 0)
                    value = (array_length(values) - 1)
                if is_callable(on_changed)
                    self.on_changed(values[value].value)
            }
        }
        break
    case (3 << 0):
        move2 = (key_left + key_right)
        if (move2 != 0 && slidebuffer <= 0)
        {
            option.moved = 1
            option.value += move2
            option.value = clamp(option.value, 0, 100)
            slidebuffer = 1
        }
        if (move2 != 0)
            option.moving = 1
        if (move2 == 0)
        {
            slidecount = 0
            option.moving = 0
        }
        break
}

for (i = 0; i < array_length(m.options); i++)
{
    var b = m.options[i]
    if (b.type == (3 << 0))
    {
        if (b.moved && (move2 == 0 || optionselected != i))
        {
            b.moved = 0
            b.moving = 0
            if is_callable(b.on_changed)
                b.value.b.value.on_changed(b)
        }
        if (is_callable(b.on_move) && b.moving)
            b.value.b.value.on_move(b)
        if (b.sound != -4)
        {
            if b.moving
            {
                if (!(struct_get(b, "playing_sound")))
                {
                    fmod_event_instance_play(b.sound)
                    b.playing_sound = 1
                }
            }
            else
            {
                fmod_event_instance_stop(b.sound, 1)
                b.playing_sound = 0
            }
        }
    }
}
if (menu == (0 << 0))
    scr_pauseicons_update(optionselected)
else
    scr_pauseicons_update(-1)
if (slidebuffer > 0)
    slidebuffer--
if ((key_back || key_slap2 || keyboard_check_pressed(vk_escape)) && (!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)))
{
    fmod_event_one_shot("event:/sfx/ui/back")
    if (menu == (0 << 0))
    {
        if instance_exists(obj_mainmenuselect)
            obj_mainmenuselect.selected = 0
        if instance_exists(obj_mainmenu)
            obj_mainmenu.optionbuffer = 10
        instance_destroy()
    }
    else
    {
        var emptyhanded = 1
        i = 0
        while (i < array_length(m.options))
        {
            with (m.options[i])
            {
                if (name == "option_back" && is_callable(func))
                {
                    emptyhanded = 0
                    self.func()
                }
            }
            if (!emptyhanded)
                break
            else
            {
                i++
                continue
            }
        }
        if emptyhanded
        {
            for (i = 0; i < array_length(m.options); i++)
            {
                b = m.options[i]
                if (b.type == (3 << 0))
                {
                    if (b.sound != -4)
                        fmod_event_instance_stop(b.sound, 1)
                }
            }
            menu_goto(m.backmenu)
        }
    }
}
