depth = -500
ver = "0.1.2.5"
ver = string_copy(ver, 3, string_length(ver))
if string_starts_with("0.1.2.5", "0.")
    ver = string("B{0}", ver)
else if string_starts_with("0.1.2.5", "2.")
    ver = string("P{0}", ver)
else
    ver = string("V{0}", ver)
if string_ends_with(ver, ".0")
    ver = string_delete(ver, (string_length(ver) - 2), 2)
