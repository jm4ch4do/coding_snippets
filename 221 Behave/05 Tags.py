''' ------------------- TAGS ---------------- '''
  @slow
  Scenario: Weaker opponent
    Given the ninja has a third level black-belt
    When attacked by a samurai
    Then the ninja should engage the opponent
    
# run only scenarios tagged with @slow
behave --tags=slow

# common practice to target work in progress
behave --tags=wip

# wip or slow
--tags=wip,slow

# wip and slow
--tags=wip --tags=slow