#!/usr/bin/env python3
""" Two hungry people, anxiously waiting for their turn to take soup """

import threading

slowcooker_lid = threading.Lock()
soup_servings = 11

def hungry_person(person_id):
    global soup_servings
    while soup_servings > 0:
        with slowcooker_lid:
            if (person_id == (soup_servings % 2)) and (soup_servings > 0): # check if it's your turn
                soup_servings -= 1 # it's your turn; take some soup!
                print('Person', person_id, 'took soup! Servings left:', soup_servings)
            else: # not your turn; put the lid back
                print('Person', person_id, 'checked... then put the lid back.')

if __name__ == '__main__':
    for i in range(2):
        threading.Thread(target=hungry_person, args=(i,)).start()
