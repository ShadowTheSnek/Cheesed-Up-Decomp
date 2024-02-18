var forgot = 0
if ((image_index == 1 && (!sugary)) || (sugary && sprite_index != spr_sugarygateclosed && global.panic == 0 && room != war_13 && (!forgot)))
{
    with (other)
    {
        if (state == states.comingoutdoor && floor(image_index) == (image_number - 3) && other.sugary)
        {
            if (other.sprite_index != spr_sugarygateclosing)
            {
                other.image_index = 0
                other.sprite_index = spr_sugarygateclosing
            }
        }
        if (state == states.comingoutdoor && floor(image_index) == (image_number - 2))
        {
            if global.MOD.Spotlight
                global.combotime = 60
            sound_play_3d((global.MIDWAY ? "event:/modded/sfx/gatecloseBN" : "event:/sfx/pep/groundpound"), x, y)
            GamepadSetVibration(0, 1, 1, 0.9)
            GamepadSetVibration(1, 1, 1, 0.9)
            set_lastroom()
            sprite_index = (isgustavo ? spr_ratmountdoorclosed : spr_Timesup)
            image_index = 0
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            if other.sugary
            {
                other.sprite_index = spr_sugarygateclosing
                other.image_index = 1
                other.image_speed = 0.35
            }
            else
                other.image_index = 0
            ds_list_add(global.saveroom, other.id)
            if (other.direct != 0)
                xscale = other.direct
        }
    }
}
if ((drop && dropstate != states.idle) || global.modifier_failed || (global.leveltosave == "dragonlair" && (!global.giantkey)))
    return;
with (other)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == states.ratmount || state == states.normal || (state == states.Sjumpprep && (!other.sugary)) || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic || global.snickchallenge || room == war_13 || other.random_secret) && room != sucrose_1 && room != tower_finalhallway)
    {
        global.noisejetpack = 0
        global.startgate = 0
        stop_music()
        if (global.collect <= 0)
            global.collect = 10
        scr_do_rank(global.leveltosave != "snickchallenge")
    }
}
