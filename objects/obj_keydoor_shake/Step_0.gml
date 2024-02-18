image_angle = Wave(shake, (-shake), 0.1, 1.5707963267948966)
shake = Approach(shake, 0, 0.75)
if (shake == 0)
    instance_destroy()
