global.longintro = 1
global.holiday = (0 << 0)
var date = date_current_datetime()
var month = date_get_month(date)
var day = date_get_day(date)
if (month == 10 || (month == 11 && day <= 14))
    global.holiday = (1 << 0)
