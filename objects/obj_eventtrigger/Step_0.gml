if (!instance_exists(obj_player))
    return;
if (condition != -4)
{
    var input = self.condition()
    if (reverse_output != -4 && (!input) && (activated || (!flags.do_once)))
    {
        self.reverse_output(input)
        activated = 0
    }
    else if (input && ((!activated) || (!flags.do_once)))
    {
        self.output(input)
        if (flags.do_save && (!(in_saveroom(id, flags.saveroom))))
            ds_list_add(flags.saveroom, id)
        activated = 1
    }
}
if (activated && flags.do_once)
    instance_destroy()
