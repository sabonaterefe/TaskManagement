 Task Management App

Welcome to the **Task Management App** repository! This Flutter-based application is designed to help users efficiently manage their tasks. It combines elegant design with a robust backend, ensuring a seamless and organized task management experience. From a stunning UI to real-time synchronization, this app has you covered.

## About the Project

The Task Management App allows users to create, edit, and organize their tasks effectively. It features a user-friendly interface, local storage for task persistence using SQLite, and integration with an external API to provide motivational quotes, enhancing the overall user experience.

## Features

- **User-Friendly UI**: A responsive interface designed for ease of use.
- **Task Management**: Create, edit, and delete tasks with due dates and statuses.
- **SQLite Integration**: Local storage using SQLite ensures tasks persist when the app is closed and reopened.
- **Motivational Quotes**: Fetch and display random quotes from an external API.
- **Local Notifications**: Remind users of tasks that are due soon using local notifications.
- **State Management**: Utilizes a state management solution for data integrity and consistency.

## Installation

1. Clone this repository using:
https://github.com/sabonaterefe/TaskManagement/tree/master

Navigate to the project directory:
cd task_management_app

Install dependencies:
flutter pub get

Add google-services.json: For Firebase setup, add your own google-services.json file obtained from your Firebase project to the android/app directory.
Set Up Firebase:
Create a Firebase project and enable the necessary services.
Configure the Realtime Database and Authentication.

Run the app:
flutter run

Dependencies

This app utilizes the following dependencies:

google_fonts: ^5.1.0: Provides access to a wide range of Google Fonts for consistent typography.
get: ^4.6.5: A clean state management solution for Flutter apps.
firebase_core: ^2.15.1: Initializes and connects your Flutter app with Firebase services.
firebase_auth: ^4.7.3: Enables user authentication using various methods.
firebase_database: ^10.2.5: Integrates with Firebase Realtime Database for task synchronization.
flutter_local_notifications: ^9.5.0: For local notifications to remind users of upcoming tasks.
sqflite: ^2.3.0: For local database capabilities, allowing tasks to be stored persistently on the device.
http: ^0.13.3: For making API calls to fetch motivational quotes.
Contributions
Contributions are welcome! If you find a bug or want to add new features, feel free to open an issue or submit a pull request. Please follow our contribution guidelines.

Designed and developed with ❤️ by Sabona Terefe
