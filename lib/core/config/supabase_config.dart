/// Supabase Configuration
///
/// This file contains the Supabase URL and Anonymous Key needed to connect your app to Supabase.
/// You'll need to replace these placeholder values with your actual Supabase project credentials.
///
/// HOW TO GET YOUR CREDENTIALS:
/// 1. Go to https://supabase.com and sign in
/// 2. Create a new project or select your existing project
/// 3. Go to Project Settings > API
/// 4. Copy the "Project URL" and "anon public" key
/// 5. Replace the values below
class SupabaseConfig {
  // Supabase project URL
  // Get this from: https://supabase.com > Your Project > Settings > API > Project URL
  static const String supabaseUrl = 'https://ajrvxlhryvhmjbgzrqau.supabase.co';

  // Supabase anonymous key
  // Get this from: https://supabase.com > Your Project > Settings > API > Project API keys > anon public
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFqcnZ4bGhyeXZobWpiZ3pycWF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ4NTM5NjgsImV4cCI6MjA4MDQyOTk2OH0.sU_HK52JLENMB0-IpBQaqVlBTAFyoUuRMVr7bapJzlw';

  // Validation: Check if credentials are set
  static bool get isConfigured =>
      supabaseUrl != 'YOUR_SUPABASE_URL' &&
      supabaseAnonKey != 'YOUR_SUPABASE_ANON_KEY' &&
      supabaseUrl.isNotEmpty &&
      supabaseAnonKey.isNotEmpty;
}
