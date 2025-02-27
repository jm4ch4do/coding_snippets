' --------------------------- ZOMBIE PROCESS ------------------------- '
# A zombie process is a child process that has finished its execution
# but is still waiting for the parent to read its exit state. The most
# common scenario where a zombie process appears is when the parent has
# died unexpectedly.

ps  # used to display process

# a zombie process has a z as the STAT column
ps -elf | grep z


# An orphaned process is still active but his parent has died. Unlike zombies
# orphaned process will be reclaimed or adopted by the init process.