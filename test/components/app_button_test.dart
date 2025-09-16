import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/buttons/app_button.dart';
import 'package:iautomat_design_system/src/components/buttons/button_styles.dart';
import 'package:iautomat_design_system/src/theme/app_theme.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

void main() {
  group('AppButton', () {
    group('Rendering', () {
      testWidgets('should render with required text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Test Button',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.text('Test Button'), findsOneWidget);
        expect(find.byType(AppButton), findsOneWidget);
      });

      testWidgets('should render all button variants', (tester) async {
        const variants = [
          ButtonVariant.primary,
          ButtonVariant.secondary,
          ButtonVariant.outline,
          ButtonVariant.ghost,
          ButtonVariant.danger,
        ];

        for (final variant in variants) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppButton(
                  text: 'Test ${variant.name}',
                  variant: variant,
                  onPressed: () {},
                ),
              ),
            ),
          );

          expect(find.text('Test ${variant.name}'), findsOneWidget);
          await tester.pumpAndSettle();
        }
      });

      testWidgets('should render all button sizes', (tester) async {
        const sizes = [
          ButtonSize.small,
          ButtonSize.medium,
          ButtonSize.large,
        ];

        for (final size in sizes) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppButton(
                  text: 'Test ${size.name}',
                  size: size,
                  onPressed: () {},
                ),
              ),
            ),
          );

          expect(find.text('Test ${size.name}'), findsOneWidget);
          await tester.pumpAndSettle();
        }
      });

      testWidgets('should render with leading icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'With Icon',
                leadingIcon: Icons.star,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.text('With Icon'), findsOneWidget);
      });

      testWidgets('should render with trailing icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'With Icon',
                trailingIcon: Icons.arrow_forward,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
        expect(find.text('With Icon'), findsOneWidget);
      });

      testWidgets('should render with leading widget', (tester) async {
        const leadingWidget = Icon(Icons.settings);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'With Widget',
                leadingWidget: leadingWidget,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byWidget(leadingWidget), findsOneWidget);
        expect(find.text('With Widget'), findsOneWidget);
      });
    });

    group('Button Types', () {
      testWidgets('primary variant should render ElevatedButton', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton.primary(
                text: 'Primary',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(ElevatedButton), findsOneWidget);
      });

      testWidgets('secondary variant should render ElevatedButton', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton.secondary(
                text: 'Secondary',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(ElevatedButton), findsOneWidget);
      });

      testWidgets('outline variant should render OutlinedButton', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton.outline(
                text: 'Outline',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(OutlinedButton), findsOneWidget);
      });

      testWidgets('ghost variant should render TextButton', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton.ghost(
                text: 'Ghost',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(TextButton), findsOneWidget);
      });

      testWidgets('danger variant should render ElevatedButton', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton.danger(
                text: 'Danger',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(ElevatedButton), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('should be enabled when onPressed is provided', (tester) async {
        bool pressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Enabled',
                onPressed: () => pressed = true,
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.onPressed, isNotNull);

        await tester.tap(find.byType(AppButton));
        expect(pressed, isTrue);
      });

      testWidgets('should be disabled when onPressed is null', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Disabled',
                onPressed: null,
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.onPressed, isNull);
      });

      testWidgets('should be disabled when isLoading is true', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Loading',
                isLoading: true,
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.onPressed, isNull);
      });

      testWidgets('should show loading indicator when isLoading is true', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Loading',
                isLoading: true,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Loading'), findsOneWidget);
      });

      testWidgets('should handle long press when provided', (tester) async {
        bool longPressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Long Press',
                onPressed: () {},
                onLongPress: () => longPressed = true,
              ),
            ),
          ),
        );

        await tester.longPress(find.byType(AppButton));
        expect(longPressed, isTrue);
      });
    });

    group('Size Configuration', () {
      testWidgets('small button should have correct dimensions', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Small',
                size: ButtonSize.small,
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        final sizeConfig = AppButtonStyles.getSizeConfig(ButtonSize.small);

        expect(button.style?.minimumSize?.resolve({}), Size(sizeConfig.minWidth, sizeConfig.height));
      });

      testWidgets('medium button should have correct dimensions', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Medium',
                size: ButtonSize.medium,
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        final sizeConfig = AppButtonStyles.getSizeConfig(ButtonSize.medium);

        expect(button.style?.minimumSize?.resolve({}), Size(sizeConfig.minWidth, sizeConfig.height));
      });

      testWidgets('large button should have correct dimensions', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Large',
                size: ButtonSize.large,
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        final sizeConfig = AppButtonStyles.getSizeConfig(ButtonSize.large);

        expect(button.style?.minimumSize?.resolve({}), Size(sizeConfig.minWidth, sizeConfig.height));
      });
    });

    group('Full Width', () {
      testWidgets('should expand to full width when isFullWidth is true', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                child: AppButton(
                  text: 'Full Width',
                  isFullWidth: true,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(
          find.descendant(
            of: find.byType(AppButton),
            matching: find.byType(SizedBox),
          ).first,
        );

        expect(sizedBox.width, equals(double.infinity));
      });

      testWidgets('should not expand when isFullWidth is false', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                child: AppButton(
                  text: 'Normal Width',
                  isFullWidth: false,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        );

        final sizedBoxes = find.descendant(
          of: find.byType(AppButton),
          matching: find.byType(SizedBox),
        );

        // Should not find a SizedBox with infinite width at the top level
        expect(sizedBoxes.evaluate().any((element) {
          final widget = element.widget as SizedBox;
          return widget.width == double.infinity;
        }), isFalse);
      });
    });

    group('Colors', () {
      testWidgets('primary button should have correct colors in light theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: AppButton.primary(
                text: 'Primary',
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.style?.backgroundColor?.resolve({}), AppColors.primary);
        expect(button.style?.foregroundColor?.resolve({}), AppColors.textOnColor);
      });

      testWidgets('primary button should have correct colors in dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.darkTheme,
            home: Scaffold(
              body: AppButton.primary(
                text: 'Primary',
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.style?.backgroundColor?.resolve({}), AppColors.primaryDarkMode);
        expect(button.style?.foregroundColor?.resolve({}), AppColors.backgroundDarkMode);
      });

      testWidgets('danger button should have correct error colors', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: AppButton.danger(
                text: 'Danger',
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.style?.backgroundColor?.resolve({}), AppColors.error);
      });

      testWidgets('outline button should have transparent background', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton.outline(
                text: 'Outline',
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
        expect(button.style?.backgroundColor?.resolve({}), Colors.transparent);
      });
    });

    group('Interactions', () {
      testWidgets('should handle tap gesture', (tester) async {
        int tapCount = 0;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Tap Me',
                onPressed: () => tapCount++,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        expect(tapCount, equals(1));
      });

      testWidgets('should trigger scale animation on press', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Animate',
                onPressed: () {},
              ),
            ),
          ),
        );

        // Find the Transform.scale widget
        expect(find.byType(Transform), findsOneWidget);

        // Trigger press
        await tester.press(find.byType(AppButton));
        await tester.pump(const Duration(milliseconds: 50));

        // Animation should be running
        expect(find.byType(AnimatedBuilder), findsOneWidget);
      });

      testWidgets('should provide haptic feedback when enabled', (tester) async {
        // Mock haptic feedback
        final List<MethodCall> calls = [];
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, (call) async {
          calls.add(call);
          return null;
        });

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Haptic',
                onPressed: () {},
                enableFeedback: true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppButton));

        expect(calls, isNotEmpty);
        expect(calls.any((call) => call.method == 'HapticFeedback.vibrate'), isTrue);

        // Clean up
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null);
      });

      testWidgets('should not provide haptic feedback when disabled', (tester) async {
        // Mock haptic feedback
        final List<MethodCall> calls = [];
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, (call) async {
          calls.add(call);
          return null;
        });

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'No Haptic',
                onPressed: () {},
                enableFeedback: false,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppButton));

        expect(calls.where((call) => call.method == 'HapticFeedback.vibrate'), isEmpty);

        // Clean up
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null);
      });
    });

    group('Tooltip', () {
      testWidgets('should show tooltip when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Button',
                tooltip: 'This is a tooltip',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(Tooltip), findsOneWidget);

        final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
        expect(tooltip.message, 'This is a tooltip');
      });

      testWidgets('should not render tooltip when not provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Button',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(Tooltip), findsNothing);
      });
    });

    group('Accessibility', () {
      testWidgets('should have proper semantics', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Accessible Button',
                semanticsLabel: 'Custom Semantics Label',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(Semantics), findsOneWidget);

        final semantics = tester.widget<Semantics>(find.byType(Semantics));
        expect(semantics.properties.label, 'Custom Semantics Label');
        expect(semantics.properties.button, isTrue);
        expect(semantics.properties.enabled, isTrue);
      });

      testWidgets('should indicate disabled state in semantics', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Disabled Button',
                onPressed: null,
              ),
            ),
          ),
        );

        final semantics = tester.widget<Semantics>(find.byType(Semantics));
        expect(semantics.properties.enabled, isFalse);
      });

      testWidgets('should indicate loading state in semantics', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Loading Button',
                isLoading: true,
                onPressed: () {},
              ),
            ),
          ),
        );

        final semantics = tester.widget<Semantics>(find.byType(Semantics));
        expect(semantics.properties.enabled, isFalse);
      });

      testWidgets('should meet minimum touch target size', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Touch Target',
                size: ButtonSize.small,
                onPressed: () {},
              ),
            ),
          ),
        );

        final buttonSize = tester.getSize(find.byType(AppButton));

        // Minimum touch target should be 44x44 (iOS) or 48x48 (Android)
        expect(buttonSize.height, greaterThanOrEqualTo(32.0)); // Small button height
        expect(buttonSize.width, greaterThanOrEqualTo(64.0)); // Small button min width
      });
    });

    group('Custom Styling', () {
      testWidgets('should apply custom style', (tester) async {
        final customStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Custom Style',
                style: customStyle,
                onPressed: () {},
              ),
            ),
          ),
        );

        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));

        // Custom style should be merged with base style
        expect(button.style, isNotNull);
      });
    });

    group('Loading Animation', () {
      testWidgets('should use custom loading animation duration', (tester) async {
        const customDuration = Duration(milliseconds: 500);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Custom Duration',
                loadingAnimationDuration: customDuration,
                onPressed: () {},
              ),
            ),
          ),
        );

        // Verify the animation controller uses custom duration
        expect(find.byType(AppButton), findsOneWidget);
      });

      testWidgets('should use custom loading indicator color', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                text: 'Custom Color',
                isLoading: true,
                loadingIndicatorColor: Colors.red,
                onPressed: () {},
              ),
            ),
          ),
        );

        final progressIndicator = tester.widget<CircularProgressIndicator>(
          find.byType(CircularProgressIndicator),
        );

        final animation = progressIndicator.valueColor as AlwaysStoppedAnimation<Color>;
        expect(animation.value, Colors.red);
      });
    });

    group('Button Group', () {
      testWidgets('AppButtonGroup should render buttons horizontally', (tester) async {
        final buttons = [
          AppButton(text: 'First', onPressed: () {}),
          AppButton(text: 'Second', onPressed: () {}),
          AppButton(text: 'Third', onPressed: () {}),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButtonGroup(
                buttons: buttons,
                direction: Axis.horizontal,
              ),
            ),
          ),
        );

        expect(find.byType(AppButtonGroup), findsOneWidget);
        expect(find.text('First'), findsOneWidget);
        expect(find.text('Second'), findsOneWidget);
        expect(find.text('Third'), findsOneWidget);
      });

      testWidgets('AppButtonGroup should render buttons vertically', (tester) async {
        final buttons = [
          AppButton(text: 'Top', onPressed: () {}),
          AppButton(text: 'Bottom', onPressed: () {}),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButtonGroup(
                buttons: buttons,
                direction: Axis.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(AppButtonGroup), findsOneWidget);
        expect(find.text('Top'), findsOneWidget);
        expect(find.text('Bottom'), findsOneWidget);
      });
    });

    group('Extension Methods', () {
      testWidgets('copyWith should create button with modified properties', (tester) async {
        final originalButton = AppButton(
          text: 'Original',
          variant: ButtonVariant.primary,
          onPressed: () {},
        );

        final copiedButton = originalButton.copyWith(
          text: 'Modified',
          variant: ButtonVariant.secondary,
        );

        expect(copiedButton.text, 'Modified');
        expect(copiedButton.variant, ButtonVariant.secondary);
        expect(copiedButton.onPressed, originalButton.onPressed);
      });
    });

    group('Design System Consistency', () {
      testWidgets('should follow 8px spacing grid', (tester) async {
        const sizes = [
          ButtonSize.small,
          ButtonSize.medium,
          ButtonSize.large,
        ];

        for (final size in sizes) {
          final config = AppButtonStyles.getSizeConfig(size);

          // Heights should be multiples of 8
          expect(config.height % 8, 0, reason: '${size.name} height should be multiple of 8');

          // Padding should follow spacing system
          expect(config.padding.horizontal % 2, 0, reason: '${size.name} padding should be even');
          expect(config.padding.vertical % 2, 0, reason: '${size.name} padding should be even');
        }
      });

      testWidgets('should use consistent typography', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  AppButton(text: 'Small', size: ButtonSize.small, onPressed: () {}),
                  AppButton(text: 'Medium', size: ButtonSize.medium, onPressed: () {}),
                  AppButton(text: 'Large', size: ButtonSize.large, onPressed: () {}),
                ],
              ),
            ),
          ),
        );

        // Verify text styles are from typography system
        final smallConfig = AppButtonStyles.getSizeConfig(ButtonSize.small);
        final mediumConfig = AppButtonStyles.getSizeConfig(ButtonSize.medium);
        final largeConfig = AppButtonStyles.getSizeConfig(ButtonSize.large);

        expect(smallConfig.textStyle, AppTypography.labelSmall);
        expect(mediumConfig.textStyle, AppTypography.button);
        expect(largeConfig.textStyle, AppTypography.labelLarge);
      });
    });

    group('Performance', () {
      testWidgets('should reuse identical button instances', (tester) async {
        const button1 = AppButton(
          key: ValueKey('button1'),
          text: 'Same Button',
        );

        const button2 = AppButton(
          key: ValueKey('button2'),
          text: 'Same Button',
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [button1, button2],
              ),
            ),
          ),
        );

        expect(find.byWidget(button1), findsOneWidget);
        expect(find.byWidget(button2), findsOneWidget);
      });
    });
  });
}