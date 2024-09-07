# Task Management App

## Features

- **Stunning UI**: Immerse yourself in a visually captivating user interface designed to enhance your task management experience.
  
- **Optimized Backend**: The app's backend is finely tuned for optimal performance, ensuring smooth navigation and operation.

- **Offline Access**: With Sqflite integration, the app remains fully functional even when offline, so you can manage tasks without interruptions.

- **Real-time Sync**: The Firebase Realtime Database powers real-time synchronization of tasks across multiple devices, making sure your tasks are up-to-date everywhere.

- **Multi-Device Experience**: Create, update, or delete tasks on one device and see the changes instantly reflected on all devices linked to your account.

- **Secure Authentication**: Firebase Authentication ensures the security of your tasks and data, allowing you to manage your to-dos with peace of mind.

- **Authentication and Session Management**: Utilizing Firebase Authentication and the firebase_auth package, the app provides a robust user authentication system. The session management is handled seamlessly, allowing users to securely access their tasks.

## Installation
Clone this repository using:
git clone https://github.com/sabonaterefe/TaskManagement.git

   
Navigate to the project directory:
cd TaskManagement

Then run this command:
git checkout -b master origin/master

Install dependencies: 
flutter pub get

Add google-services.json: For Firebase setup, each developer needs to add their own google-services.json file obtained from their Firebase project. Place this file in the android/app directory.
Set Up Firebase Authentication:
Go to the Firebase Console and create a project.
Enable the Email/Password sign-in method.
Add your Android app to the project and download the google-services.json file.
Add your iOS app if needed and download the GoogleService-Info.plist file.
Set Up Firebase Realtime Database:
In the Firebase Console, create a Realtime Database.
Set up security rules as per your requirements.
Update the Firebase configuration in your Flutter app code.
Run the app: 
flutter run
