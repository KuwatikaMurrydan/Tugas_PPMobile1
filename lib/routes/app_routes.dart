import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/onboarding_screen.dart'; 
import '../screens/register_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding'; 
  static const String login = '/login';
  static const String register = '/register';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnboardingScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
  };
}
