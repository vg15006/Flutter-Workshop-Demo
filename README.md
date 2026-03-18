### Flutter-Workshop-Demo

## Overview

This is a **Flutter login screen demo app** built for a workshop to showcase **Flutter + Dart basics**, including **widgets**, **stateful UI**, **form validation**, **navigation**, and a **mock authentication service**.  
Users can **enter an email and password**, see validation errors, simulate a **sign in**, land on a **home screen**, and then **sign out**.

---

## Features

- **Login Screen**
  - Email and password form fields
  - Inline validation messages (e.g., “Email is required”, “Min 8 characters”)
  - Loading indicator while “signing in”
  - Error message when credentials are invalid

- **Mock Authentication**
  - In-memory `AuthService` with a simple rule:
    - Accepts any email that looks valid and a password that meets a length rule (or a specific demo password you choose).
  - Simulated network delay using `Future.delayed`

- **Home Screen**
  - Displays **“Signed in as <email>”**
  - Includes a **sign out** button that returns to the login screen

- **UI/UX Extras**
  - Custom font (via `pubspec.yaml`)
  - App-wide background color using `scaffoldBackgroundColor`
  - Images on the login screen (configured through Flutter assets)

---

## Screens

1. **LoginScreen**
   - `TextFormField` for email + password
   - `Form` with `GlobalKey<FormState>` for validation
   - Uses `setState` to manage loading and error text
   - Navigates to `HomeScreen` after a successful sign in

2. **HomeScreen**
   - Shows the currently signed-in user from `AuthService`
   - “Sign out” button clears the user and navigates back to `LoginScreen`
   - Simple, centered layout suitable for explaining Flutter layout basics

---

## Code Structure

- `lib/main.dart`  
  Sets up `MaterialApp`, global `ThemeData` (colors, font, background), and starts the app at `LoginScreen` with a shared `AuthService` instance.

- `lib/screens/login_screen.dart`  
  Implements the login form, validation, error handling, and navigation to `HomeScreen`.

- `lib/screens/home_screen.dart`  
  Displays the signed-in email and provides a sign-out button.

- `lib/services/auth_service.dart`  
  Contains:
  - `AuthUser` model
  - `AuthService` with `signIn`, `signOut`, and `currentUser`
  - `AuthException` to signal failed sign-ins

- `assets/images/`  
  Holds images (e.g., a Flutter logo or profile picture) used on the login screen.  
  These are referenced in `pubspec.yaml` under `flutter: assets:`.

---

## Concepts Demonstrated

- **Widgets**
  - `StatelessWidget` vs `StatefulWidget`
  - Composing UI with `Scaffold`, `AppBar`, `Column`, `Center`, `Padding`, and `Text`

- **State & Forms**
  - Managing state with `setState`
  - `Form`, `TextFormField`, validation functions, and `GlobalKey<FormState>`
  - Handling loading state and error messages

- **Navigation**
  - Using `Navigator.pushReplacement` to move between login and home screens

- **Async & Futures**
  - `async`/`await` with `Future.delayed` to simulate network calls

- **Theming & Styling**
  - Global theming via `ThemeData` in `main.dart`
  - Custom fonts via `pubspec.yaml`
  - App-wide background color with `scaffoldBackgroundColor`
  - Image assets via `Image.asset` and `flutter: assets:` configuration

---
## Getting Started

### Prerequisites

- Flutter SDK installed  
  Check with:
  ```bash
  flutter doctor

### Installing the Demo

If you want to run this demo locally:

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd flutter_workshop_demo
2. **Navigate to the project folder**
   cd flutter_workshop_demo
3. **Install existing dependencies from the project root**
   ```bash
   flutter pub get

### Running the Demo

From the project root, choose one of the following:

- **Run on Windows desktop**
  ```bash
  flutter run -d windows

- **Let Fluter prompt you for a device**
  flutter run 
