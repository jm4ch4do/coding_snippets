# COMMON FOR
d = {}
for key, value in my_dict.items():
    if search_string not in name:
        continue
    d[key.capitalize] = modify(value)

# DICT_C
d = {key.capitalize(): modify(value) for item, value in my_dict.items() if seach_string in name}

# prettier
d = {
    key.capitalize(): modify(value)
    for item, value in my_dict.items()
    if seach_string in name
}
