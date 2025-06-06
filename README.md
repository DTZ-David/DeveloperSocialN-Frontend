# DeveloperSocialN-Frontend

A modern social network platform designed specifically for developers to connect, share knowledge, and collaborate on projects. This repository contains the frontend implementation built with Flutter.

## 📋 Project Overview

DevInsight is a cross-platform application that provides developers with a dedicated space to:
- Share code snippets and projects
- Connect with other developers
- Discover trending technologies and discussions
- Collaborate on open-source initiatives
- Build a professional developer portfolio

## 🚀 Features

- Cross-platform support (iOS, Android, Web, Windows)
- Responsive UI with Material Design
- User authentication and profile management
- Social interactions (posts, comments, likes)
- Code snippet sharing with syntax highlighting
- Real-time notifications and messaging
- Dark/Light theme support

## 🛠️ Technologies Used

- **Flutter**: UI framework for cross-platform development
- **Dart**: Programming language
- **Riverpod**: State management solution
- **Go Router**: Navigation and routing
- **Supabase**: Backend as a Service for authentication and database
- **Freezed**: Code generation for immutable classes
- **JSON Serializable**: JSON serialization/deserialization

## 🔧 Setup Instructions

### Prerequisites

- Flutter SDK (version 3.5.4 or higher)
- Dart SDK (compatible with Flutter version)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/DeveloperSocialN-Frontend.git
   cd DeveloperSocialN-Frontend
   ```

2. Navigate to the project directory:
   ```bash
   cd devinsight
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the code generation:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## 📁 Project Structure

```
devinsight/
├── android/            # Android platform specific code
├── ios/                # iOS platform specific code
├── web/                # Web platform specific code
├── windows/            # Windows platform specific code
├── lib/                # Source code
├── assets/             # Static assets (icons, fonts, etc.)
│   ├── data/
│   ├── icons/
│   └── fonts/
├── test/               # Test files
└── pubspec.yaml        # Project configuration and dependencies
```

## 📦 Dependencies

### Core Dependencies
- `flutter_riverpod`: ^2.6.1 - State management
- `go_router`: ^14.6.0 - Navigation and routing
- `supabase_flutter`: ^2.9.0 - Backend services
- `http`: ^1.3.0 - HTTP requests
- `freezed_annotation`: ^2.4.1 - Immutable classes
- `json_annotation`: ^4.9.0 - JSON serialization

### UI Dependencies
- `flutter_svg`: ^2.0.17 - SVG rendering
- `font_awesome_flutter`: ^10.6.0 - Icon pack
- `flutter_staggered_grid_view`: ^0.7.0 - Grid layouts
- `timeago`: ^3.7.1 - Relative time formatting

### Development Dependencies
- `build_runner`: ^2.4.6 - Code generation
- `freezed`: ^2.4.6 - Code generation for immutable classes
- `json_serializable`: ^6.7.1 - JSON serialization
- `flutter_lints`: ^4.0.0 - Linting rules
- `flutter_highlight`: ^0.7.0 - Code syntax highlighting

## 🔍 Environment Configuration

Before running the project, you need to set up your environment variables:

1. Create a `.env` file in the `devinsight` directory:
   ```
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

2. For development purposes, you can also create a `.env.development` file with development-specific configurations.

## 🏃‍♂️ Running the Project

### Development Mode

```bash
flutter run
```

This will launch the app on your connected device or emulator.

### Build for Production

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

#### Web
```bash
flutter build web --release
```

#### Windows
```bash
flutter build windows --release
```

## 🧪 Testing

Run the tests with:

```bash
flutter test
```

For widget tests with coverage:

```bash
flutter test --coverage
```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS 
- ✅ Web
- ✅ Windows
- ✅ macOS (experimental)
- ✅ Linux (experimental)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Workflow

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

