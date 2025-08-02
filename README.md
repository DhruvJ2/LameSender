# Lame Sender 
Flutter Firebase Chat App – Modular & Real-Time Messaging Starter

A straightforward chat app built with **Flutter**, featuring real-time messaging using **Firebase Authentication** and **Cloud Firestore**. Designed as a clean starter template for anyone interested in learning how to build modern mobile chat experiences.

## Features

- User registration & login (Firebase Authentication)
- Real-time chat messaging (Cloud Firestore)
- Clean, responsive Flutter UI
- Cloud-based persistent message storage

## Getting Started

1. **Clone This Repository**

git clone https://github.com/yourusername/flutter-chat-app.git
cd lamesender

2. **Install Dependencies**

flutter pub get

3. **Set up Firebase:**
- Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
- Add Android/iOS apps and follow instructions to download `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)
- Place the configuration files in the appropriate platform directories
- Enable **Authentication** (Email/Password) and **Cloud Firestore** in your Firebase console

4. **Run the App**

flutter run

## Project Structure

- `lib/`
  - `pages/` – App screens (e.g. login, register, chat room)
  - `components/` – Reusable UI components and widgets
  - `services/` – Handles Firebase, authentication, and Firestore logic
  - `models/` – Defines data structures (e.g., User, Message)
  - `theme/` – Colors, text styles, and general theming

This separation keeps your project organized and makes it easier to scale or add new features.


## Dependencies

- [Flutter](https://flutter.dev/)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_auth](https://pub.dev/packages/firebase_auth)
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)

## License

MIT License

---

Made with ❤️ using Flutter & Firebase.
