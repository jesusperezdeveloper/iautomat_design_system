/// IAutomat Design System
///
/// A comprehensive Flutter design system package that provides:
/// - Complete theme system with Material 3 integration
/// - Reusable UI components (buttons, inputs, cards)
/// - Responsive utilities and breakpoints
/// - Consistent design tokens (colors, typography, spacing)
///
/// Usage:
/// ```dart
/// import 'package:iautomat_design_system/iautomat_design_system.dart';
///
/// MaterialApp(
///   theme: DSTheme.lightTheme,
///   darkTheme: DSTheme.darkTheme,
///   home: MyApp(),
/// )
/// ```
library;

// Theme exports - complete theming system
export 'src/theme/app_theme.dart';
export 'src/theme/colors.dart';
export 'src/theme/spacing.dart';
export 'src/theme/theme.dart';
export 'src/theme/typography.dart';

// Component exports - all UI components
export 'src/components/components.dart';

// Utility exports - responsive and helper utilities
export 'src/utils/utils.dart';
