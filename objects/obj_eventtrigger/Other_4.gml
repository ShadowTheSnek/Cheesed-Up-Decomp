if in_saveroom(id, flags.saveroom)
{
    if flags.do_save
    {
        if (!flags.do_once_per_save)
            self.output()
        activated = 1
    }
}
