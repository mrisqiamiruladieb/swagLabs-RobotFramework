# swagLabs-RobotFramework
Web Automation

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