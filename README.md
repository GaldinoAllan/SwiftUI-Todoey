# To Do application made using SwiftUI.

### Mock API

It consumes a mockAPI generated automatically with the ToDo's the user register inside the app. To see it follow the steps below:

1. Open the application
2. Click on the plus button on the top of the screen,
3. Write a to do item (you can leave the completed field the way you want)
4. Click on "save" on the top of the screen
5. Stop the application and run again, this step will print in the console a path
6. Copy the path logged in the console,
7. Open the finder application
8. Use the shortcut Command + Shift + G and paste the path you copied earlier
9. Open the file named: "mockAPI.json"

obs.: I made it like that, because now to use a real API, just need to change the place where it calls this file and put the API call.

### Input Validation

The validation of the Input is on demand, disabling the save button if the input field has nothing written.

### Error handling

The error handling you can check by changing the mock API file.

To test this follow the steps:

1. Open the mockAPI file again
2. Change the "id" field to "id1"
3. Save the file
4. Run the application