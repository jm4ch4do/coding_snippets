''' ------------------------------- GENERATOR EXAMPLE ---------------------------  '''
def scramble(_chs, _word):
    """
    (string, string) -> (string)
    :param _chs: string with a sequence of characters
    :param _word: string with a word
    :return: True if characters (_chs) can put together the _word

    :examples:
    ('rkqodlw', 'world') -> True
    ('cedewaraaossoqqyt', 'codewars') -> True
    ('katas', 'steak') -> False
    ('scriptjava', 'javascript') -> True
    ('scriptingjava', 'javascript') -> True

    :algorithm:
    (The algorithm should be fast for passing tests)

    .Sort both input lists
    .Create two generators to return values for both input lists
        .Get the first value from both generators
        .Infinity loop
            .If both values match -> get new value from _word
            .Always -> get new value from _chs

            .The first generator to end iteration will signal the winner
                .gen_word ends first -> Return True
                .gen_chs ends first -> Return False

    """
    # sort inputs lists
    s_chs = sorted(_chs)
    s_word = sorted(_word)

    # create generators
    gen_chs = take_one(s_chs)
    gen_word = take_one(s_word)

    # load initial values
    ch_chs = next(gen_chs)
    ch_word = next(gen_word)

    # infinity loop
    while True:
        if ch_chs == ch_word:
            try:
                ch_word = next(gen_word)
            except StopIteration:
                return True
        try:
            ch_chs = next(gen_chs)
        except StopIteration:
            return False


# Generator function generator
def take_one(_list):
    for value in _list:
        yield value


my_chs = 'rkqodlw'
my_word = 'world'
result = scramble(my_chs, my_word)
print(result)


''' --------------------------- LISTS COMP FOR GENERATOR ------------------------  '''
my_nums = (x*x for x in [1, 2, 3, 4, 5])

for num in my_nums:
    print(num)