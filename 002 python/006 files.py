
''' ----------------------------------- BASICS ----------------------------------  '''
import os # module for handling the operative system

print(dir(os)) # shows all attributes and methods inside module


''' ----------------------------------- EXPLORE ---------------------------------  '''
currentWorkingDir = os.getcwd()
newWorkingDir = os.chdir('Users/coreyschafer/Desktop')
print(os.getcwd()) # prints workingDirectory
os.environ.get('HOME') # home folder of the current user

os.sep # returns the folder separator for the operative system

listFilesCurrentDir = os.listdir()
listFilesInSpecifiedDir = os.listdir('Users/coreyschafer/Desktop')

# printing all files and subfiles
for dirpath, dirnames, filenames in os.walk('Users/coreyschafer/Desktop'):
    print('Current Path:', dirpath)
    print('Directories:', dirnames)
    print('Files:', filenames)
    print()

# printing files and folder with only 1 level depth
dirpath, dirnames, filenames = next(os.walk(cwd))
print(dirpath)
print(dirnames)
print(filenames)


''' ------------------------------- CREATE REMOVE -------------------------------  '''
os.mkdir('OS-Demo') # creates folder
os.makedirs('OS-Demo/another-folder') # creates 'OS-Demo' and then 'another-folder' inside it

os.rmdir('OS-Demo/another-folder') # deletes 'another-folder'
os.removedirs('OS-Demo/another-folder') # deleter both 'another-folder' amd 'OS-Demo'

os.rename('test.txt', 'demo.txt') # renames 'test.txt' to 'demo.txt '


''' ------------------------------- ATTRIBUTES -------------------------------  '''
os.stat('demo.txt') # data about file
os.stat('demo.txt').st_size  # size in bytes
os.stat('demo.txt').st_mtime # modification date in timestamp

os.path.getsize('string') # returns size of file in bytes


''' ------------------------------ BUILDING PATH -----------------------------  '''
# combining Path
filePath = os.path.join(os.environ.get('HOME'), 'test.txt') # stores in filePath 'Users/jose/test.txt'
filePath = os.path.join('folder1','folder2','file.png') # returns 'folder1\\folder2\\file.png' for Windows (\\ is a escape character for \)
                                                        # for linux and mac it will use / instead

base = os.path.basename('/tmp/test.txt') # returns 'test.txt'
dirName = os.path.dirname('/tmp/test.txt') # returns '/tmp'
All = os.path.split('/tmp/test.txt') # returns ('/tmp', 'test.txt')

os.path.abspath('spam.png') # returns the absolute path for 'spam.png'
os.path.abspath('..\\..\\spam.png') # returns the absolute path for the granpa folder of 'spam.png'
os.path.relpath('c:\\folder1\\folder2\\spam.png', 'c:\\folder1') # returns the relative path of string1 from string2

os.path.exist('string') # returns True if exist
os.path.isfile('string')
os.path.isdir('string')
os.path.isabs('spam.png') # returns False because is not an absolute path


''' ----------------------------- OPEN WRITE FILES ---------------------------  '''
fileRead = open('c:\\users\\jose\\hello.txt') # opens file in read mode
fileRead.read() # returns string with file content
fileRead.close() # kills the fileRead object, you need to use open again if want to read

fileRead.readlines() # returns each line in a list index

fileRead = open('c:\\users\\jose\\hello.txt', 'r') # open in read mode which is the default choice
fileRead = open('c:\\users\\jose\\hello.txt', 'w') # open in write mode which erases everything an start writing from scratch
                                                   # (both create file if doesn't exist)
fileRead = open('c:\\users\\jose\\hello.txt', 'a') # open in append mode for writing at the end of file

fileRead.write('Hello') # writes to opened file (returns written bytes)

# best way to read file line by line
with open('my_file.txt') as file:
    for line in file:
        print(line)

''' -------------------------------- COPY FILES ------------------------------  '''
import shutil

shutil.copy('c:\\spam.txt','c:\\delicious') # just copy

shutil.copy('c:\\spam.txt','c:\\delicious\\spam2.txt') # copy and rename

shutil.copytree('c:\\fol1\\', 'c:\\fol1-backup\\') # copy entire content of folder

shutil.move('c:\\spam.txt', 'c:\\delicious\\walnut') # move (if want to rename just move to same place with different name)


''' ------------------------------- DELETE FILES -----------------------------  '''
os.unlink('spam.txt') # remove file
os.rmdir('c:\\delicious') # deletes folder if it's empty
shutil.rmtree('c:\\folder1') # deletes folder and all of its content

# deletes files having a pattern
for filename in os.listdir():
    if filename.endswith('.rxt'):
        # os.unlink(filename)
        print(filename) # first run this to make a dry run
