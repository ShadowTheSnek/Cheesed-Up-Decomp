function Vector2(argument0, argument1) constructor //gml_Script_Vector2
{
    if 1
    {
    }
    else
    {
        function anon@221@Vector2_scr_mathlibs(argument0, argument1) //gml_Script_anon@221@Vector2_scr_mathlibs
        {
            x = argument0
            y = argument1
        }

        function anon@293@Vector2_scr_mathlibs(argument0) //gml_Script_anon@293@Vector2_scr_mathlibs
        {
            x = argument0.x
            y = argument0.y
        }

        function anon@371@Vector2_scr_mathlibs(argument0, argument1) //gml_Script_anon@371@Vector2_scr_mathlibs
        {
            x += argument0
            y += argument1
        }

        function anon@442@Vector2_scr_mathlibs(argument0) //gml_Script_anon@442@Vector2_scr_mathlibs
        {
            x += argument0.x
            y += argument0.y
        }

        function anon@527@Vector2_scr_mathlibs(argument0, argument1) //gml_Script_anon@527@Vector2_scr_mathlibs
        {
            x *= argument0
            y *= argument1
        }

        function anon@595@Vector2_scr_mathlibs(argument0, argument1) //gml_Script_anon@595@Vector2_scr_mathlibs
        {
            x /= argument0
            y /= argument1
        }

        function anon@671@Vector2_scr_mathlibs(argument0) //gml_Script_anon@671@Vector2_scr_mathlibs
        {
            x *= argument0.x
            y *= argument0.y
        }

        function anon@760@Vector2_scr_mathlibs(argument0) //gml_Script_anon@760@Vector2_scr_mathlibs
        {
            x /= argument0.x
            y /= argument0.y
        }

    }
    x = argument0
    y = argument1
}

function magnitude(argument0, argument1) //gml_Script_magnitude
{
    return sqrt((abs(argument0) + abs(argument1)));
}

function cycle(argument0, argument1, argument2) //gml_Script_cycle
{
    var delta = (argument2 - argument1)
    var result = ((argument0 - argument1) % delta)
    if (result < 0)
        result += delta
    return (result + argument1);
}

function angle_rotate(argument0, argument1, argument2) //gml_Script_angle_rotate
{
    var diff = cycle((argument1 - argument0), -180, 180)
    if (diff < (-argument2))
        return (argument0 - argument2);
    if (diff > argument2)
        return (argument0 + argument2);
    return argument1;
}

function get_velocity(argument0, argument1) //gml_Script_get_velocity
{
    return (argument0 / argument1);
}

function Wave(argument0, argument1, argument2, argument3, argument4) //gml_Script_Wave
{
    if (argument4 == undefined)
        argument4 = -4
    var a4 = ((argument1 - argument0) * 0.5)
    var t = scr_current_time()
    if (argument4 != -4)
        t = argument4
    return ((argument0 + a4) + (sin(((((t * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi))) * a4));
}

function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_distance_to_pos
{
    return (abs((argument0 - argument2)) <= argument4 && abs((argument1 - argument3)) <= argument5);
}

function distance_between_points(argument0, argument1, argument2, argument3) //gml_Script_distance_between_points
{
    return sqrt((sqr((argument2 - argument0)) + sqr((argument3 - argument1))));
}

function calculate_jump_velocity_alt(argument0, argument1, argument2, argument3) //gml_Script_calculate_jump_velocity_alt
{
    var xx = (argument0 - x)
    var yy = (argument1 - y)
    var g = argument3
    var tmp = (power(argument2, 4) - (g * ((g * power(xx, 2)) + ((2 * yy) * power(argument2, 2)))))
    if (tmp > 0)
    {
        if (xx == 0)
        {
            var a1 = 1.5707963267948966
            if (yy < 0)
                var a2 = -1.5707963267948966
            else
                a2 = 1.5707963267948966
        }
        else
        {
            a1 = arctan2((power(argument2, 2) + sqrt(tmp)), (g * xx))
            a2 = arctan2((power(argument2, 2) - sqrt(tmp)), (g * xx))
        }
        hsp = ((cos(a1) * argument2) * 1.2)
        vsp = (cos(a2) * argument2)
        if (vsp > 0)
            vsp *= -1
        hsp = (abs(hsp) * sign(xx))
    }
}

function calculate_jump_velocity(argument0, argument1, argument2, argument3) //gml_Script_calculate_jump_velocity
{
    var a = get_projectile_angle(x, y, argument0, argument1, argument2, argument3)
    hsp = lengthdir_x(argument2, a)
    vsp = lengthdir_y(argument2, a)
}

function get_projectile_angle(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_get_projectile_angle
{
    var xt = floor((argument2 - argument0))
    var yt = (-(floor((argument3 - argument1))))
    var root = (power(argument4, 4) - (argument5 * ((argument5 * sqr(xt)) + ((2 * sqr(argument4)) * yt))))
    var angle = 0
    if (root > 0)
    {
        angle = radtodeg(arctan(((sqr(argument4) + sqrt(root)) / (argument5 * xt))))
        if (xt < 0)
            angle -= 180
    }
    else if (xt > 0)
        angle = 45
    else
        angle = 135
    return angle;
}

