''' ------------------- ENV CONTROLS ---------------- '''
# These run before and after every step.
before_step(context, step), after_step(context, step)

# These run before and after each scenario is run.
before_scenario(context, scenario), after_scenario(context, scenario)

# These run before and after each feature file is exercised.
before_feature(context, feature), after_feature(context, feature)

# These run before and after a section tagged with the given name. 
# They are invoked for each tag encountered in the order they’re  
# found in the feature file. See controlling things with tags.
before_tag(context, tag), after_tag(context, tag)

# These run before and after the whole shooting match.
before_all(context), after_all(context)
