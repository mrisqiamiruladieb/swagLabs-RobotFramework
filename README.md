# swagLabs-RobotFramework
Web Automation
<br>
**Test sites:** https://saucedemo.com/
<br>
**Note:** Branch Information
<br>
- **main:** utama
- **POM:** Page Object Modelling
  
## Problem and Solving
---
1. **Element not found:** The distance between keywords and arguments must be more than 1 space/tab is recommended 
2. Can directly put **locators (xpath, etc.)** in **arguments** in **test cases** without having to declare in variables
3. [**How to run specific test cases from a test suite using Robot Framework**](https://stackoverflow.com/questions/25005277/how-to-run-specific-test-cases-from-a-test-suite-using-robot-framework)
   - *Run single test case in Robot Framework*
     - Syntax: `robot -t "Test Case Name" Test Suite Name`
     - Example: `robot - t "PON Type Test Case" Aquarium_Project.robot`
   - *Run all the test cases in Robot Framework*
     - Syntax: `robot  Test Suite Name`
     - Example: `robot Aquarium_Project.robot`
4. **Check the window url** - User verify about button result (actionOpenMenu.robot)
   - Example: `Wait For Expected Condition`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`Url To Be`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`www.url.com`
   - [Wait For Expected Condition](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Wait%20For%20Expected%20Condition)     
   - [Url To Be](https://www.selenium.dev/selenium/docs/api/py/webdriver_support/selenium.webdriver.support.expected_conditions.html#selenium.webdriver.support.expected_conditions.url_to_be)
5. **Switch window** - User verify twitter link result (footerLinks.robot)
   - Example: `Switch Window`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`NEW`
   - [Switch Window](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Switch%20Window)