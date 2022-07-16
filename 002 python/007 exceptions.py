''' ---------------------------- TRY --------------------------  '''
# regular try
print('Converting!')
try:
    print((int('x')))
except:
    print('Conversion failed!')
else: # If no-except
    print('Conversion successful!')
finally: # execute always
    print('Done!')
    
    
''' ---------------------------- RAISE --------------------------  '''
# Raise an error and stop the program if x is lower than 0:
x = -1

if x < 0:
  raise Exception("Sorry, no numbers below zero")


''' ------------------- CATCH SPECIFIC EXCEPTION -----------------  '''
try:
    linux_interaction()
except AssertionError as error:
    print(error)
    print('The linux_interaction() function was not executed')