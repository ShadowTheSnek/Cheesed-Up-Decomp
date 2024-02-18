function pto_on_connect() //gml_Script_pto_on_connect
{
    var packeter = new Packeter((2 << 0))
    11.(11).Write("0.1.2.5", packeter)
    13.(13).Write(username, packeter)
    packeter.packeter.Send()
}

