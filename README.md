# Bravoo App

Flutter mobile app implementing the provided Figma designs with Supabase authentication.

## Setup

### Prerequisites
- Flutter 3.9.2+
- Supabase account

### Installation

```bash
flutter pub get
```

### Supabase Configuration

1. Create a project at https://supabase.com
2. Get your URL and anon key from Project Settings > API
3. Update `lib/core/config/supabase_config.dart`:

```dart
class SupabaseConfig {
  static const String supabaseUrl = 'YOUR_URL_HERE';
  static const String supabaseAnonKey = 'YOUR_KEY_HERE';
  static bool get isConfigured => supabaseUrl != 'YOUR_URL_HERE';
}
```

### Running the App

```bash
flutter run
```

## Features Implemented

- Splash screen
- Login / Signup with email & password
- Password reset
- Home screen with countdown timer
- Social sharing (WhatsApp, Twitter, LinkedIn)
- Referral link copying

## Project Structure

```
lib/
├── core/
│   ├── config/        # Supabase config
│   ├── constants/     # Colors & assets
│   ├── theme/         # App theme
│   └── widgets/       # Reusable widgets
├── features/
│   ├── auth/          # Authentication
│   ├── splash/        # Splash screen
│   └── home/          # Home screen
└── main.dart
```

## Building APK

```bash
flutter build apk --release
```

The APK will be at `build/app/outputs/flutter-apk/app-release.apk`

## Tech Stack

- Flutter
- Supabase (auth)
- Riverpod (state management)
- flutter_screenutil (responsive design)

## Notes

- Google/Apple sign-in configured but requires OAuth setup
- Social sharing uses share_plus package
- Design matches Figma specs with 3D button effects
# bravoo_app
