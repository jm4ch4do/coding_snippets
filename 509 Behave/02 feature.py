''' ------------------- GHERKIN STRUCTURE ---------------- '''
# Given 
# we put the system in a known state before the user 
# starts interacting with the system.

# When
# we take key actions the user performs. 
# This is the interaction with your system which should 
# cause some state to change.

# Then 
# we observe outcomes.

# And, But
# Are renamed to the previous step


''' ------------------- GHERKIN EXAMPLE ---------------- '''
Feature: Fight or flight
  In order to increase the ninja survival rate,
  As a ninja commander
  I want my ninjas to decide whether to take on an
  opponent based on their skill levels

  Scenario: Weaker opponent
    Given the ninja has a third level black-belt
     When attacked by a samurai
     Then the ninja should engage the opponent

  Scenario: Stronger opponent
    Given the ninja has a third level black-belt
     When attacked by Chuck Norris
     Then the ninja should run for his life
      And keep running until escapes

        
''' ------------------- GHERKIN VARIABLES ---------------- '''
# Sometimes a scenario should be run with a number of variables
# giving a set of known states
# behave runs the scenario for each line

Scenario Outline: Blenders
   Given I put <thing> in a blender,
    when I switch the blender on
    then it should transform into <other thing>

 Examples: Amphibians
   | thing         | other thing |
   | Red Tree Frog | mush        |

 Examples: Consumer Electronics
   | thing         | other thing |
   | iPhone        | toxic waste |
   | Galaxy Nexus  | toxic waste |


''' ------------------- PASSING VALUES TO STEPS ---------------- '''
# Values are passed to the Given step in the variable context.table

Scenario: some scenario
  Given a set of specific users
     | name      | department  |
     | Barry     | Beer Cans   |
     | Pudey     | Silly Walks |
     | Two-Lumps | Silly Walks |

 When we count the number of people in each department
 Then we will find two people in "Silly Walks"
  But we will find one person in "Beer Cans"

@given('a set of specific users')
def step_impl(context):
    for row in context.table:
        model.add_user(name=row['name'], department=row['department'])
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
''' ------------------- STEPS FILE ---------------- '''
# Features/steps/GoogleSearchTest.py

from behave import *

use_step_matcher("re")

@given("I am on google search page")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("I am on google search page")

@when("I type in text to search")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("I type in text to search")

@step("I hit search button")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("I hit search button")

@then("I should be on the search results page")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("I should be on the search results page")