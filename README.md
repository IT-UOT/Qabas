

# IT mentor

IT Mentor is a Flutter-based mobile application designed to provide a platform for students to browse and select courses from a list of departments. The main screen of the app displays a list of departments, which the user can tap on to see a list of courses offered by that department.

IT Mentor makes use of the popular BLoC (Business Logic Component) pattern for state management, with one bloc per screen or feature. This allows for a clear separation of concerns between the UI and the logic, making it easier to maintain and test the code.

IT Mentor uses repository classes to fetch data from external sources, such as APIs or local databases. There are separate repository classes for each data entity, such as DepartmentRepository and CourseRepository.

In addition, IT Mentor uses service classes for various app-level features, such as authentication, navigation, and analytics. For example, the AuthenticationService handles user authentication and authorization, while the NavigationService provides a centralized way to navigate between screens.

IT Mentor uses model classes to represent data entities and simplify data handling. There are separate model classes for each data entity, such as Department and Course, with corresponding properties and methods.

Finally, IT Mentor includes a database service class that allows for local data caching and offline access. This service uses the popular SQLite database engine to store data locally on the device.

Overall, IT Mentor is a useful reference or starting point for your own Flutter projects, and demonstrates various app development concepts and techniques, such as state management, data handling, and app services.

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

