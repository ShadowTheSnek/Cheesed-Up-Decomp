targetplayer = obj_player1.id
mask_index = spr_player_mask
switch state
{
    case states.transitioncutscene:
        scr_fakepepclone_transitioncutscene()
        break
    case (134 << 0):
        scr_fakepepclone_walk()
        break
    case (276 << 0):
        scr_fakepepboss_grabdash()
        break
    case (277 << 0):
        scr_fakepepboss_grabthrow()
        break
    case (92 << 0):
        scr_fakepepboss_jump()
        break
    case (108 << 0):
        scr_fakepepboss_freefall()
        break
    case (104 << 0):
        scr_fakepepboss_mach2()
        break
    case (99 << 0):
        scr_fakepepclone_Sjumpprep()
        break
    case (97 << 0):
        scr_fakepepclone_Sjump()
        break
    case (74 << 0):
        scr_fakepepclone_throwing()
        break
    case (84 << 0):
        scr_fakepepboss_backbreaker()
        break
}

if (state == states.Sjump)
{
    if (!instance_exists(hitboxID))
    {
        with (gml_Script_instance_create(x, y, obj_forkhitbox))
        {
            ID = other.id
            other.hitboxID = id
            sprite_index = other.sprite_index
        }
    }
}
if ((state == states.grabdash || (state == states.mach2 && attackspeed >= 10) || (state == states.throwing && sprite_index == spr_fakepeppino_flailing) || state == states.freefall) && alarm[0] == -1)
{
    alarm[0] = 10
    if (state == states.freefall)
        alarm[0] = 5
}
if (state == states.jump)
    grav = 0.4
else
    grav = 0.5
scr_collide()
scr_fakepep_update_sounds()
