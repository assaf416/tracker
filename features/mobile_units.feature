

# test ride and locations

Given  I have a ride 
And I generate route request
Then the ride distance should be > 0


# running devices with data
Given I run a mobile-unit from file "my-file-3.json" 
then the activites count for the device should be > 9


# WEB UI
Given I login as admin with user123 pass123
Then I should be in the home page
and I should see admin in the toolbar 


# API TEST 
Given I post to /api/v1/version 
Then I should see "documentation" in the page 

# BAD TOKEN
Given I post to /api/v1/version?token=bad 
Then I should be redirected to "/api/v1/404" 


# Mobile unit tests
Given a have a device simulator client 
And I start the simulator with config file docs/config.json
When I ask for location 