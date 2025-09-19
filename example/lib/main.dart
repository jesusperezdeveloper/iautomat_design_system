import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const DesignSystemExampleApp(),
    ),
  );
}

class DesignSystemExampleApp extends StatelessWidget {
  const DesignSystemExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'IAutomat Design System - 20 Temas Profesionales 2025',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.buildThemeData(themeProvider.selectedTheme, false),
          darkTheme: themeProvider.buildThemeData(themeProvider.selectedTheme, true),
          themeMode: themeProvider.themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}