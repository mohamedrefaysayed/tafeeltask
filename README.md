# Tafeel Task - Users List App

A Flutter application that displays a list of users from a mock API with Clean Architecture and Cubit state management.

## Features

- Display list of users from mock API
- Infinite scroll with pagination
- Pull to refresh
- User detail page
- Shimmer loading effects
- Error handling with retry
- Clean Architecture
- Cubit state management

## Tech Stack

- **Flutter** ^3.8.1
- **State Management:** flutter_bloc ^8.1.3
- **Networking:** dio ^5.4.0
- **Dependency Injection:** get_it ^7.6.4
- **Image Caching:** cached_network_image ^3.3.0
- **Loading Effects:** shimmer ^3.0.0
- **Functional Programming:** dartz ^0.10.1

## Architecture

Clean Architecture with 3 layers:

\`\`\`
lib/
├── core/           # Shared utilities
├── features/
    └── users/
        ├── data/        # API, models, repositories
        ├── domain/      # Entities, use cases
        └── presentation/ # UI, cubits, widgets
\`\`\`

## Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Android Studio / VS Code
- Device or Emulator

### Installation

1. Clone the repository
\`\`\`bash
git clone https://github.com/mohamedrefaysayed/tafeeltask.git
cd tafeeltask
\`\`\`

2. Install dependencies
\`\`\`bash
flutter pub get
\`\`\`

3. Run the app
\`\`\`bash
flutter run
\`\`\`

## API

Uses [ReqRes API](https://reqres.in/):
- \`GET /api/users?page={page}\` - Get users list
- \`GET /api/users/{id}\` - Get user details

## Build

### Android
\`\`\`bash
flutter build apk --release
\`\`\`

### iOS
\`\`\`bash
flutter build ios --release
\`\`\`

## License

This project is created for educathtional purposes.
