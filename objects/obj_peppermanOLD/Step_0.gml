targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (obj_bosscontroller.state == states.arenaintro)
    return;
if (hp <= 0 && state != (145 << 0) && state != (162 << 0))
{
    if ((!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
if (chooseparry_buffer > 0)
    chooseparry_buffer--
switch phase
{
    case states.revolver:
    case states.dynamite:
        normal_func = gml_Script_boss_pepperman_normal
        break
    case states.boots:
    case states.grabbed:
    case states.tumble:
    case states.finishingblow:
        normal_func = gml_Script_boss_pepperman_phase3normal
        break
}

switch state
{
    case (145 << 0):
        grav = 0.5
        state_boss_arenaround()
        break
    case (0 << 0):
        grav = 0.5
        self.normal_func()
        break
    case (92 << 0):
        grav = 0.5
        boss_pepperman_jump()
        invincible = 1
        inv_timer = 2
        break
    case (108 << 0):
        grav = 0.5
        boss_pepperman_freefall()
        break
    case (111 << 0):
        grav = 0.5
        boss_pepperman_freefallland()
        break
    case (122 << 0):
        grav = 0.5
        boss_pepperman_freefallprep()
        break
    case (153 << 0):
        grav = 0.5
        boss_pepperman_shoulderbash()
        break
    case (157 << 0):
        grav = 0.5
        boss_pepperman_supershoulderbash()
        break
    case (158 << 0):
        grav = 0.5
        boss_pepperman_superattackstart()
        break
    case (159 << 0):
        grav = 0.5
        boss_pepperman_superattackcharge()
        break
    case (76 << 0):
        grav = 0.5
        boss_pepperman_superslam()
        break
    case (162 << 0):
        grav = 0.5
        boss_pepperman_fistmatch()
        break
    case (163 << 0):
        grav = 0.5
        boss_pepperman_fistmatchend()
        break
    case (83 << 0):
        grav = 0.5
        boss_pepperman_shoulder()
        break
    case (161 << 0):
        grav = 0.5
        boss_pepperman_shoulderturn()
        break
    case (134 << 0):
        grav = 0.5
        state_boss_walk(gml_Script_boss_pepperman_decide_attack)
        invincible = 1
        inv_timer = 2
        break
    case (128 << 0):
        grav = 0.5
        boss_pepperman_charge()
        invincible = 1
        inv_timer = 2
        break
    case (61 << 0):
        grav = 0.5
        state_boss_chainsaw()
        break
    case (84 << 0):
        grav = 0.5
        state_boss_taunt()
        invincible = 1
        inv_timer = 2
        break
    case (147 << 0):
        grav = 0.5
        state_boss_parry()
        invincible = 1
        inv_timer = 2
        break
    case (137 << 0):
        grav = 0.5
        scr_enemy_hit()
        stunned = targetstunned
        break
    case (138 << 0):
        grav = 0.5
        state_boss_stun()
        break
}

xscale = image_xscale
colliding = (!((state == states.superslam || state == (162 << 0) || state == (158 << 0) || state == (159 << 0))))
attacking = (state == states.shoulderbash || state == states.freefall || state == states.freefallprep || state == (157 << 0) || state == states.shoulder || state == states.superslam || state == (162 << 0) || state == (158 << 0) || state == (159 << 0) || state == states.walk)
