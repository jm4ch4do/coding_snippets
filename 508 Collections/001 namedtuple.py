''' ------------------- IMPORT ---------------- '''
from collections import namedtuple as nt


''' ------------------- DEFINE ---------------- '''
Medal = nt(
    'Medal',
    [
        'year',
        'athlete',
        'team',
        'event'
    ]
)


''' ------------------- INSTANCE ---------------- '''
m = Medal('1986', 'Thomas Burke', 'USA', '100m men')


''' ---------------- GET VALUES BACK ------------- '''
m[0], m[1]
m.year, m.athlete

''' ---------------- ITERATE ------------- '''
for field in m._fields:
    value = getattr(m, field)
    print('field:', field, 'value:', value)