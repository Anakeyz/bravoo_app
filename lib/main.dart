import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bravoo_app/core/config/supabase_config.dart';
import 'package:bravoo_app/core/theme/app_theme.dart';
import 'package:bravoo_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:bravoo_app/features/auth/presentation/pages/login_screen.dart';
import 'package:bravoo_app/features/home/presentation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (SupabaseConfig.isConfigured) {
    try {
      await Supabase.initialize(
        url: SupabaseConfig.supabaseUrl,
        anonKey: SupabaseConfig.supabaseAnonKey,
      );
    } catch (e) {
      debugPrint('Supabase initialization error: $e');
    }
  } else {
    debugPrint(
      '⚠️ Supabase not configured. Please update credentials in lib/core/config/supabase_config.dart',
    );
  }

  runApp(
    const ProviderScope(
      child: BravooApp(),
    ),
  );
}

class BravooApp extends StatelessWidget {
  const BravooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Bravoo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
