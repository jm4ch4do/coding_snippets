# examples of recursive
# SUPERDIGIT
# superdigit is the number itself if it has one digit
# otherwise is the sum of the digits in the number
# ex. 9875 = 9 + 8 +7 +5 = 29 = 2 + 9 = 11 = 1 + 1 = 2 So 2 is the superdigit of 9875

def superDigit(number):

    split_number = list(str(number))
    if len(split_number) == 1:
        return split_number[0]

    else:
        ch_sum = 0
        for ch in split_number:
            ch_sum += int(ch)

    return superDigit(ch_sum)


my_number = 9875
result = superDigit(my_number)
print(result)
