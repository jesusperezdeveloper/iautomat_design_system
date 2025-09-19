import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DSThemeProvider()..applyDemoConfiguration(),
      child: const DesignSystemExampleApp(),
    ),
  );
}

class DesignSystemExampleApp extends StatelessWidget {
  const DesignSystemExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DSThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'IAutomat Design System - 100 Temas Profesionales 2025',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.lightThemeData,
          darkTheme: themeProvider.darkThemeData,
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}