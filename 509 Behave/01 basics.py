''' ------------------- INSTALL ---------------- '''
pip install behave  # fresh install
pip install -U behave  # upgrade

''' ------------------- RUN FEATURE ---------------- '''
>> behave # runs all features
>> behave -v  # verbose mode outputing more info
>> behave features\orangehrm.feature # run specific feature


''' ------------------- SIMPLE FILE STRUCTURE ---------------- '''
features/
features/everything.feature
features/steps/
features/steps/steps.py


''' ------------------- COMPLEX FILE STRUCTURE ---------------- '''
features/
features/signup.feature
features/login.feature
features/account_details.feature
features/environment.py
features/steps/
features/steps/website.py
features/steps/utils.py