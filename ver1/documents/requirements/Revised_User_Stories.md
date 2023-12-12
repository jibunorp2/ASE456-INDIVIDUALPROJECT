# User Story

**Epic: Time Management App**

As a user named Jack, I want to efficiently manage my time by recording and tracking my activities using a mobile application that supports both iPhone and Android platforms. The app should provide a user-friendly graphical interface for seamless interaction.

**User Stories:**

**Record Time Entry:**

As a user, I want to record my activities by entering the date, start time (FROM), end time (TO), task description, and associated tags (TAG) on a GUI screen.

**Flexible Time Entry Format:**

As a user, I want the flexibility to enter dates in different formats (e.g., YYYY/MM/DD) and specify AM or PM for the start and end times.

**Query Time Usage:**

As a user, I want to query my time usage from the database by specifying parameters such as date, task, and tag. This includes opening a query screen to filter activities based on input.

**Date-Based Query:**

As a user, I want to retrieve all activities for a specific date by entering that date in the query screen.

**Task-Based Query:**

As a user, I want to retrieve all activities related to a specific task by entering the task name in the query screen.

**Tag-Based Query:**

As a user, I want to retrieve all activities with a specific tag by entering the tag name in the query screen.

**Implement Flutter Framework:**

As a software engineer, I need to develop the application using the Flutter framework to ensure compatibility with both iPhone and Android platforms.

**Integrate Firebase for Database:**

As a software engineer, I need to integrate Firebase as the backend database for storing and retrieving user time entries.

**Secure User Data:**

As a software engineer, I need to implement security measures to ensure the confidentiality and integrity of user data stored on Firebase.

**Optimize User Interface:**

As a software engineer, I need to design an intuitive and user-friendly GUI for the time management app, considering the input requirements for recording and querying time entries.

**Testing and Quality Assurance:**

As a software engineer, I need to conduct thorough testing to ensure the app functions correctly, meets user requirements, and adheres to quality standards.

### **User Requirements:**

1. **Time Usage Reporting:**
    - The system should allow users to generate a time usage report based on a specified date range.
    - Users should be able to input the start and end dates for the report.
2. **Activity Overview:**
    - The generated report should provide a comprehensive overview of all activities conducted by the user within the specified date range.
3. **Time Priority Analysis:**
    - Users should have the ability to analyze and identify the activities they spend the most time on.
    - A priority command should be available to retrieve a list of activities ranked by the time spent on each.
    
    ### Revised / Added User Stories
    
    1. **Generating Time Report:**
        - As a user, I want to input a date range (start and end dates) to generate a detailed report of all activities I performed during that period.
    2. **Viewing Activity Details:**
        - As a user, I want to view a detailed list of activities in the generated report, including the date, time, and description of each activity.
    3. **Analyzing Time Usage:**
        - As a user, I want to use a priority command to obtain a list of activities sorted by the time spent, so I can identify the ones consuming the most time.
    4. **Customizing Report Output:**
        - As a user, I want the option to customize the output of the time report, such as filtering activities based on categories or excluding specific types of activities.