event_inherited()
dmg = 30
parryable = 1
function anon@70@gml_Object_obj_pizzahead_attackhitbox_Create_0(argument0, argument1) //gml_Script_anon@70@gml_Object_obj_pizzahead_attackhitbox_Create_0
{
    if (!argument1.collisioned)
    {
        self.SUPER_parry()
        with (obj_pizzafaceboss)
            self.SUPER_boss_hurt(30, argument0)
        with (argument1)
            event_user(0)
    }
}

