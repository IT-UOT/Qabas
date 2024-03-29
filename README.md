

# Qabas

Qabas is a Flutter-based mobile application designed to provide a platform for students to browse and select courses from a list of departments. The main screen of the app displays a list of departments, which the user can tap on to see a list of courses offered by that department.

Qabas makes use of the popular BLoC (Business Logic Component) pattern for state management, with one bloc per screen or feature. This allows for a clear separation of concerns between the UI and the logic, making it easier to maintain and test the code.

Qabas uses repository classes to fetch data from external sources, such as APIs or local databases. There are separate repository classes for each data entity, such as DepartmentRepository and CourseRepository.

In addition, Qabas uses service classes for various app-level features, such as authentication, navigation, and analytics. For example, the AuthenticationService handles user authentication and authorization, while the NavigationService provides a centralized way to navigate between screens.

Qabas uses model classes to represent data entities and simplify data handling. There are separate model classes for each data entity, such as Department and Course, with corresponding properties and methods.

Finally, Qabas includes a database service class that allows for local data caching and offline access. This service uses the popular SQLite database engine to store data locally on the device.

Overall, Qabas is a useful reference or starting point for your own Flutter projects, and demonstrates various app development concepts and techniques, such as state management, data handling, and app services.

## Features

- Home screen that displays a list of departments and courses
- Uses blocs for state management and logic, with one bloc per feature or screen
- Uses repositories to fetch data from external sources, such as APIs or local databases
- Uses services for various app-level features, such as authentication, navigation, and analytics
- Uses models to represent data entities and simplify data handling

## Project Structure

The project structure follows the conventions of a typical Flutter app, with the following directories:

- `lib/`: Contains the main code for the app.
- `screens/`: Contains the UI code for each screen of the app.
- `bloc/`: Contains the logic and state management code for each screen or feature of the app.
- `data/`: Contains repository classes for each data entity, such as `DepartmentRepository` and `CourseRepository`.
- `services/`: Contains classes for various app services, such as authentication, navigation, and analytics.
- `models/`: Contains classes for each data entity, such as `Department` and `Course`.
- `database/`: Contains a service class for accessing a local database.

## Getting Started

To get started with the app, follow these instructions:

1. Clone the repository to your local machine.
2. Open the project in your preferred IDE or code editor.
3. Run `flutter pub get` to install the app dependencies.
4. Run `flutter pub run build_runner build` or `flutter pub run build_runner build -watch`
5. Run the app using `flutter run`.

## Contributing

Contributions to the project are welcome and encouraged! If you find a bug or have a feature request, please submit an issue. If you'd like to contribute code, please fork the repository and submit a pull request.

## Change Log
* `3-may-2023:` added "Department Map" & "Department Requirements" to the department screen
* `7-may-2023:` added "News" tab and almost everything related to it
* `8-may-2023:` added "About" tab and almost everything related to it, also added "The dashboard" empty screen, some changes to the way themes work, added consts file
* `9-may-2023:` switch departments from firebase realtime database to firebase firestore
* `11-may-2023:`
    - fix bug when loading the departments
    - add NavigationRail to the dashboard screen
* `12-may-2023`
    - showing the news and departments in the dashboard screen
 