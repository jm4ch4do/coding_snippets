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