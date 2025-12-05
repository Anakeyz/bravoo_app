# Technical Notes

## Design Implementation

Followed the Figma designs closely, paying attention to:
- Purple gradient theme (#7C3AED to #6D28D9)
- 3D button effects with multi-layer shadows
- Spacing and typography from designs
- Used flutter_screenutil for responsive scaling

## Architecture Decisions

**Clean Architecture with feature-based folders:**
- Keeps code organized and maintainable
- Easy to find and update features
- Separation between UI and business logic

**Riverpod for state management:**
- Chose over Provider for better type safety
- Simpler testing setup
- No BuildContext required for state access

**Supabase for backend:**
- Quick setup compared to Firebase
- Built-in auth with social providers
- PostgreSQL database if we need complex queries later

## Authentication Flow

Used Supabase's email/password auth as the main flow. Google and Apple sign-in are configured but need OAuth credentials to work properly.

Added validation to check if users actually logged in successfully before navigating - initially missed this and users could navigate even on failed login.

## UI Components

Created a reusable `ElevatedButton3D` widget with three styles:
- `elevated3D` - Full 3D effect with shadows
- `bottomBorder` - Simpler version for social auth buttons
- `plain` - Basic button without effects

The 3D effect uses multiple BoxShadow layers to create depth. Adjusted opacity and offsets to match the Figma design.

## Known Limitations

- Google Sign-In needs OAuth client ID configured
- Apple Sign-In only works on physical iOS devices
- Countdown timer uses a hardcoded date (Dec 30, 2025)
- No database models yet, just auth implemented

## Testing

Tested on:
- Android emulator (Pixel 5, API 33)
- Email/password auth works
- Social auth buttons present but need configuration

## What I'd improve with more time

- Add proper error handling with custom exceptions
- Implement the referral system with actual database
- Add loading states for all async operations
- Write unit tests for auth flow
- Add integration tests
- Implement proper form validation beyond basic checks
