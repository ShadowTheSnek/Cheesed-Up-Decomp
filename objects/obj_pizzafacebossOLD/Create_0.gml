event_inherited()
ds_map_set(player_hurtstates, (42 << 0), 30)
ds_map_set(player_hurtstates, (41 << 0), 50)
ds_map_set(player_hurtstates, (104 << 0), 20)
ds_map_set(player_hurtstates, (121 << 0), 30)
ds_map_set(player_hurtstates, (47 << 0), 60)
ds_map_set(boss_hurtstates, (244 << 0), 60)
ds_map_set(boss_hurtstates, (245 << 0), 50)
ds_map_set(boss_hurtstates, (246 << 0), 50)
ds_map_set(boss_hurtstates, (248 << 0), 50)
ds_map_set(boss_hurtstates, (249 << 0), 50)
hitlist = ds_list_create()
image_speed = 0.35
max_hp = 3600
hp = max_hp
shot = 0
phase = 0
has_attacked = 0
floatdir = 1
attackbuffermax = 180
attackbuffer = attackbuffermax
phase1attacks = [(226 << 0), (228 << 0), (227 << 0), (229 << 0)]
lostattacks = array_length(phase1attacks)
parrycount = 0
transitionstate = 0
bombtimer = 0
hasbomb = 0
bombgrabID = -4
knightbuffer = 0
spawnpool = [obj_forknight, obj_cheeseslime]
hitplayer = 0
function player_hurt@gml_Object_obj_pizzafacebossOLD_Create_0(argument0, argument1) //gml_Script_player_hurt@gml_Object_obj_pizzafacebossOLD_Create_0
{
    var _prevstate = state
    if (phase < 2)
        self.SUPER_player_hurt(argument0, argument1)
    else if ((argument1.state != states.backbreaker || argument1.parry_inst == -4) && argument1.state != states.parry && ds_list_find_index(hitlist, argument1) == -1)
    {
        ds_list_add(hitlist, argument1)
        self.SUPER_player_hurt(argument0, argument1)
        state = _prevstate
        hitplayer = 1
    }
}

function boss_hurt@gml_Object_obj_pizzafacebossOLD_Create_0(argument0, argument1) //gml_Script_boss_hurt@gml_Object_obj_pizzafacebossOLD_Create_0
{
    if (phase == 0)
        self.SUPER_boss_hurt(argument0, argument1)
    else
    {
        var _removehp = 1
        with (argument1)
        {
            if (state != states.lungeattack && state != states.knightpep)
                scr_pummel()
            else if (state == states.knightpep && vsp > 0 && y < (other.y - 30))
            {
                sprite_index = spr_knightpepdoublejump
                image_index = 0
                vsp = -11
                movespeed = 6
            }
            else if (state != states.lungeattack && state != states.parry)
                _removehp = 0
            if (state == states.lungeattack)
                movespeed = 4
        }
        if _removehp
            hp -= argument0
    }
}

function boss_hurt_noplayer@gml_Object_obj_pizzafacebossOLD_Create_0(argument0) //gml_Script_boss_hurt_noplayer@gml_Object_obj_pizzafacebossOLD_Create_0
{
    if (inv_timer <= 0)
    {
        hp -= argument0
        inv_timer = 10
    }
}

