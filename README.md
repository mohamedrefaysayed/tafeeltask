# Tafeel Task - Flutter User Management App# Tafeel Task - Users List App

A Flutter application built with Clean Architecture and Cubit state management that displays a list of users from the ReqRes API.A Flutter application that displays a list of users from a mock API with Clean Architecture and Cubit state management.

## 🚀 Features## Features

- ✅ **User List** with pagination and infinite scroll- ✅ Display list of users from mock API

- ✅ **User Details** page with comprehensive information- ✅ Infinite scroll with pagination

- ✅ **Pull-to-refresh** functionality- ✅ Pull to refresh

- ✅ **Shimmer loading** effects for better UX- ✅ Tap on user to see detailed information

- ✅ **Error handling** with retry functionality- ✅ Clean Architecture implementation

- ✅ **Clean Architecture** implementation- ✅ Cubit for state management

- ✅ **State Management** with Cubit (flutter_bloc)- ✅ Error handling and loading states

- ✅ **Modern UI** with Material Design 3- ✅ Cached network images

- ✅ **Component-based** architecture for easy maintenance- ✅ Material Design UI/UX

## 📱 Screenshots## Architecture

The app displays:This project follows **Clean Architecture** principles with clear separation of concerns:

- Team members list with avatar, name, email, and ID

- Smooth scrolling with pagination### 📁 Project Structure

- Beautiful gradient UI elements

- Detailed user profile pages```

lib/

## 🏗️ Architecture├── core/

│ ├── di/ # Dependency Injection

This project follows **Clean Architecture** principles:│ │ └── injection_container.dart

│ ├── error/ # Error handling

````│ │   ├── exceptions.dart

lib/│   │   └── failures.dart

├── core/                    # Core utilities and shared code│   ├── network/                 # Network layer

│   ├── di/                  # Dependency Injection│   │   └── api_client.dart

│   ├── error/               # Error handling│   ├── usecases/               # Base use case

│   ├── network/             # API client│   │   └── usecase.dart

│   └── usecases/            # Base use case classes│   └── utils/                   # Utilities

└── features/│       └── constants.dart

    └── users/│

        ├── data/            # Data layer (API, models, repositories)└── features/

        ├── domain/          # Business logic (entities, use cases)    └── users/

        └── presentation/    # UI layer (pages, widgets, cubits)        ├── data/                # Data Layer

```        │   ├── datasources/

        │   │   └── user_remote_data_source.dart

## 🛠️ Tech Stack        │   ├── models/

        │   │   ├── user_model.dart

- **Flutter SDK** ^3.8.1        │   │   └── users_response_model.dart

- **State Management:** flutter_bloc ^8.1.3        │   └── repositories/

- **Networking:** dio ^5.4.0        │       └── user_repository_impl.dart

- **Dependency Injection:** get_it ^7.6.4        │

- **Functional Programming:** dartz ^0.10.1        ├── domain/              # Domain Layer

- **Image Caching:** cached_network_image ^3.3.0        │   ├── entities/

- **Loading Effects:** shimmer ^3.0.0        │   │   ├── user.dart

        │   │   └── users_response.dart

## 🔧 Setup & Installation        │   ├── repositories/

        │   │   └── user_repository.dart

### Prerequisites        │   └── usecases/

- Flutter SDK (^3.8.1)        │       ├── get_users.dart

- Dart SDK        │       └── get_user_by_id.dart

- iOS Simulator / Android Emulator / Physical Device        │

        └── presentation/        # Presentation Layer

### Installation Steps            ├── cubit/

            │   ├── users_cubit.dart

1. **Clone the repository**            │   ├── users_state.dart

   ```bash            │   ├── user_detail_cubit.dart

   git clone https://github.com/YOUR_USERNAME/tafeeltask.git            │   └── user_detail_state.dart

   cd tafeeltask            ├── pages/

   ```            │   ├── users_list_page.dart

            │   └── user_detail_page.dart

2. **Install dependencies**            └── widgets/

   ```bash                ├── user_card.dart

   flutter pub get                ├── loading_indicator.dart

   ```                └── error_display.dart

````

3. **Run the app**

   ````bash### 🏗️ Architecture Layers

   flutter run

   ```#### 1. **Presentation Layer**
   ````

## 📦 Project Structure- **Cubits**: Manage UI state using BLoC pattern

- `UsersCubit`: Handles users list state and pagination

### Features - `UserDetailCubit`: Handles single user details state

- **Users List**: Displays paginated list of users with infinite scroll- **Pages**: UI screens

- **User Details**: Shows comprehensive user information - `UsersListPage`: Displays scrollable list of users

- **Shimmer Loading**: Professional loading placeholders - `UserDetailPage`: Shows detailed user information

- **Error Handling**: Graceful error messages with retry options- **Widgets**: Reusable UI components

  - `UserCard`: Card widget for each user

### Components - `LoadingIndicator`: Loading spinner

The app uses a modular component-based approach: - `ErrorDisplay`: Error message display

- `UsersAppBar` - Custom app bar for users list

- `UsersListBuilder` - List rendering with pagination#### 2. **Domain Layer**

- `UserCard` - Individual user card with gradient design

- `UserDetailAppBar` - Detail page header- **Entities**: Pure business objects

- `UserEmailCard` - Email display component - `User`: User entity

- `UserInfoCard` - Reusable information card - `UsersResponse`: Paginated users response

- `UserInformationSection` - Groups all info cards- **Repositories**: Abstract contracts

  - `UserRepository`: Interface for user data operations

## 🌐 API- **Use Cases**: Business logic

- `GetUsers`: Fetch paginated users

The app uses the [ReqRes API](https://reqres.in/): - `GetUserById`: Fetch single user details

- GET `/api/users?page={page}` - List users

- GET `/api/users/{id}` - Get user details#### 3. **Data Layer**

## 🧪 Testing- **Models**: Data transfer objects

- `UserModel`: JSON serializable user model

```bash  - `UsersResponseModel`: JSON serializable response model

# Run tests- **Data Sources**: API communication

flutter test - `UserRemoteDataSource`: Remote API calls

- **Repository Implementation**: Concrete repository

# Run with coverage - `UserRepositoryImpl`: Implements domain repository

flutter test --coverage

````#### 4. **Core Layer**



## 📱 Build- **Dependency Injection**: GetIt setup

- **Network**: Dio API client

### Android- **Error Handling**: Exceptions and failures

```bash- **Use Cases**: Base use case interface

flutter build apk --release

```## Dependencies



### iOS```yaml

```bashdependencies:

flutter build ios --release  # State Management

```  flutter_bloc: ^8.1.3 # BLoC/Cubit pattern

  equatable: ^2.0.5 # Value equality

## 🎨 Design Patterns

  # Networking

- **Repository Pattern** - Abstracts data sources  dio: ^5.4.0 # HTTP client

- **BLoC Pattern** - State management with Cubit

- **Dependency Injection** - Loose coupling with get_it  # Dependency Injection

- **Clean Architecture** - Separation of concerns  get_it: ^7.6.4 # Service locator

- **Component-Based UI** - Reusable widgets

  # Utils

## 🤝 Contributing  dartz: ^0.10.1 # Functional programming

  cached_network_image: ^3.3.0 # Image caching

Contributions are welcome! Please feel free to submit a Pull Request.```



## 📄 License## API Endpoints



This project is open source and available under the [MIT License](LICENSE).- **Get Users (Paginated)**: `GET https://reqres.in/api/users?page={page}`

- **Get Single User**: `GET https://reqres.in/api/users/{id}`

## 👨‍💻 Author

## Design Patterns Used

Created with ❤️ by [Your Name]

1. **Clean Architecture**: Separation of concerns across layers

## 🙏 Acknowledgments2. **Repository Pattern**: Abstract data sources

3. **BLoC/Cubit Pattern**: State management

- [ReqRes API](https://reqres.in/) for providing the mock user data4. **Dependency Injection**: Loose coupling via GetIt

- Flutter team for the amazing framework5. **Either Pattern**: Functional error handling with Dartz

- All the open-source packages used in this project6. **Factory Pattern**: Model creation from JSON


## Key Features Implementation

### Pagination & Infinite Scroll

- Automatically loads more users when scrolling near bottom (90% threshold)
- Tracks current page and total pages
- Shows loading indicator while fetching

### Pull to Refresh

- Swipe down to refresh the entire list
- Resets pagination to page 1

### Error Handling

- Network errors handled gracefully
- Server errors displayed with retry option
- Offline capability with cached images

### State Management

- **UsersInitial**: Initial state
- **UsersLoading**: First load
- **UsersLoadingMore**: Loading additional pages
- **UsersLoaded**: Successfully loaded with data
- **UsersError**: Error state with current data

## Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code
- Device or Emulator

### Installation

1. Clone the repository

```bash
git clone <repository-url>
cd tafeeltask
````

2. Install dependencies

```bash
flutter pub get
```

3. Run the app

```bash
flutter run
```

## Testing

Run tests:

```bash
flutter test
```

## Building

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

## Code Quality

- Follows Flutter/Dart best practices
- Clean Architecture principles
- SOLID principles
- DRY (Don't Repeat Yourself)
- Proper error handling
- Type safety

## Future Enhancements

- [ ] Unit tests for all layers
- [ ] Widget tests
- [ ] Integration tests
- [ ] Local caching with Hive/SQLite
- [ ] Search functionality
- [ ] User filtering
- [ ] Dark theme support
- [ ] Internationalization

## License

This project is created for educational purposes.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
