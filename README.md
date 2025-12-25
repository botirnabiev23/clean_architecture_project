# Random Facts App

A Flutter application demonstrating **Clean Architecture** principles with BLoC pattern, showcasing random interesting facts from the Useless Facts API.

## 🎯 Features

- **Random Fact Generation**: Get interesting random facts with source attribution
- **Offline Support**: Smart list-based caching system that stores up to 50 facts
- **Clean Architecture**: Well-structured, maintainable, and testable codebase
- **State Management**: BLoC pattern for predictable state management
- **Dependency Injection**: Using GetIt for dependency management

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                      # Core utilities and error handling
│   ├── error/                 # Exceptions and failures
│   ├── network/              # Network connectivity checker
│   └── use_cases/            # Base use case interface
│
├── feature/
│   └── number_trivia/
│       ├── data/             # Data Layer
│       │   ├── data_sources/ # Remote & local data sources
│       │   ├── models/       # Data models
│       │   └── repositories/ # Repository implementations
│       │
│       ├── domain/           # Domain Layer (Business Logic)
│       │   ├── entities/     # Business entities
│       │   ├── repositories/ # Repository interfaces
│       │   └── use_cases/    # Use cases
│       │
│       └── presentation/     # Presentation Layer
│           ├── bloc/         # BLoC (Business Logic Component)
│           ├── pages/        # UI screens
│           └── widgets/      # Reusable widgets
│
└── injection_container.dart  # Dependency injection setup
```

### Architecture Layers

1. **Presentation Layer**: UI components and state management using BLoC
2. **Domain Layer**: Business logic, entities, and use cases (framework-independent)
3. **Data Layer**: Data sources (remote API & local cache) and repository implementations

## 📦 Tech Stack

- **Flutter** - UI framework
- **flutter_bloc** - State management
- **get_it** - Dependency injection
- **dartz** - Functional programming (Either, Option)
- **dio** - HTTP client
- **shared_preferences** - Local storage
- **connectivity_plus** - Network connectivity
- **equatable** - Value equality

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: `>=3.6.0`
- Dart SDK: `>=3.6.0`

### Installation

1. Clone the repository
```bash
git clone https://github.com/botirnabiev23/clean_architecture_project.git
cd clean_architecture_project
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 🔌 API

This app uses the [Useless Facts API](https://uselessfacts.jsph.pl/) to fetch random interesting facts.

**Endpoint**: `https://uselessfacts.jsph.pl/random.json`

**Response Example**:
```json
{
  "id": "1b35328ffa945c5a6af1f8ada5f690d0",
  "text": "A rat can last longer without water than a camel.",
  "source": "djtech.net",
  "source_url": "https://www.djtech.net/humor/shorty_useless_facts.htm",
  "language": "en",
  "permalink": "https://uselessfacts.jsph.pl/api/v2/facts/..."
}
```

## 💾 Caching Strategy

The app implements an intelligent **list-based caching system**:

- **Stores up to 50 facts** in local storage using SharedPreferences
- **Returns random cached facts** when offline
- **Prevents duplicates** by checking fact IDs
- **FIFO queue**: Keeps the most recent 50 facts
- **Better UX**: Users can browse different facts even when offline

### How it works

1. **Online Mode**: Fetches facts from API and adds them to cache
2. **Offline Mode**: Randomly selects from cached facts
3. **Cache Limit**: Automatically maintains only 50 most recent facts

## 🎨 UI Features

- **Clean, minimal interface** with Material Design
- **Loading states** with proper feedback
- **Error handling** with user-friendly messages
- **Source attribution** displayed with each fact
- **Rounded button design** for better aesthetics

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📝 Project Highlights

### Clean Architecture Benefits

1. **Testability**: Each layer can be tested independently
2. **Maintainability**: Clear separation of concerns
3. **Scalability**: Easy to add new features
4. **Independence**: Business logic independent of frameworks and UI

### BLoC Pattern

- **Separation of UI and business logic**
- **Reactive programming** with streams
- **Easy state management**
- **Predictable state changes**

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Botir Nabiev** - [GitHub](https://github.com/botirnabiev23)

## 🙏 Acknowledgments

- [ResoCoder's Clean Architecture Tutorial](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Useless Facts API](https://uselessfacts.jsph.pl/)
- Flutter and Dart teams for the amazing framework

---

⭐ Star this repo if you found it helpful!
