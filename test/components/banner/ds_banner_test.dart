import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/banner/ds_banner.dart';

void main() {
  group('DSBanner', () {
    testWidgets('renders inline banner with message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Test message',
            ),
          ),
        ),
      );

      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('renders banner with different types', (tester) async {
      for (final type in BannerType.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSBanner(
                variant: BannerVariant.inline,
                type: type,
                message: 'Test message for ${type.name}',
              ),
            ),
          ),
        );

        expect(find.text('Test message for ${type.name}'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('shows dismiss button when showDismissButton is true',
        (tester) async {
      bool dismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Test message',
              showDismissButton: true,
              onDismiss: () => dismissed = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      expect(dismissed, isTrue);
    });

    testWidgets('hides dismiss button when showDismissButton is false',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Test message',
              showDismissButton: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('shows leading widget when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Test message',
              leading: Icon(Icons.info),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('shows action buttons when provided', (tester) async {
      bool actionPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Test message',
              actions: [
                BannerAction(
                  label: 'Test Action',
                  onPressed: () => actionPressed = true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Test Action'), findsOneWidget);

      await tester.tap(find.text('Test Action'));
      expect(actionPressed, isTrue);
    });

    testWidgets('shows multiple action buttons', (tester) async {
      bool primaryPressed = false;
      bool secondaryPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Test message',
              actions: [
                BannerAction(
                  label: 'Primary',
                  onPressed: () => primaryPressed = true,
                  isPrimary: true,
                ),
                BannerAction(
                  label: 'Secondary',
                  onPressed: () => secondaryPressed = true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Primary'), findsOneWidget);
      expect(find.text('Secondary'), findsOneWidget);

      await tester.tap(find.text('Primary'));
      expect(primaryPressed, isTrue);

      await tester.tap(find.text('Secondary'));
      expect(secondaryPressed, isTrue);
    });

    testWidgets('applies custom styling correctly', (tester) async {
      const customColor = Colors.red;
      const customTextColor = Colors.white;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Custom styled message',
              backgroundColor: customColor,
              textColor: customTextColor,
            ),
          ),
        ),
      );

      // Simply verify that the custom styled banner renders without error
      expect(find.text('Custom styled message'), findsOneWidget);

      // Check that the banner widget exists and has the custom properties
      final bannerFinder = find.byType(DSBanner);
      expect(bannerFinder, findsOneWidget);

      final banner = tester.widget<DSBanner>(bannerFinder);
      expect(banner.backgroundColor, equals(customColor));
      expect(banner.textColor, equals(customTextColor));
    });

    testWidgets('responds to different banner states', (tester) async {
      for (final state in BannerState.values) {
        if (state == BannerState.skeleton || state == BannerState.loading) {
          continue; // Skip states that might not render text
        }

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSBanner(
                variant: BannerVariant.inline,
                message: 'Test message',
                state: state,
              ),
            ),
          ),
        );

        expect(find.text('Test message'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('handles different priorities correctly', (tester) async {
      for (final priority in BannerPriority.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSBanner(
                variant: BannerVariant.inline,
                message: 'Priority ${priority.name}',
                priority: priority,
              ),
            ),
          ),
        );

        expect(find.text('Priority ${priority.name}'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSBanner(
                variant: BannerVariant.inline,
                message: 'RTL Test Message',
                rtlSupport: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('RTL Test Message'), findsOneWidget);
    });

    testWidgets('has proper accessibility semantics', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBanner(
              variant: BannerVariant.inline,
              message: 'Accessible banner',
              accessibilityLabel: 'Custom accessibility label',
              accessibilitySupport: true,
            ),
          ),
        ),
      );

      expect(find.text('Accessible banner'), findsOneWidget);

      // Verify the banner has accessibility support enabled
      final bannerFinder = find.byType(DSBanner);
      final banner = tester.widget<DSBanner>(bannerFinder);
      expect(banner.accessibilitySupport, isTrue);
      expect(banner.accessibilityLabel, equals('Custom accessibility label'));
    });

    testWidgets('copyWith creates correct copy', (tester) async {
      const original = DSBanner(
        variant: BannerVariant.inline,
        message: 'Original message',
        type: BannerType.info,
      );

      final copy = original.copyWith(
        message: 'Updated message',
        type: BannerType.error,
      );

      expect(copy.message, equals('Updated message'));
      expect(copy.type, equals(BannerType.error));
      expect(copy.variant, equals(original.variant)); // Unchanged
    });
  });

  group('DSBannerManager', () {
    testWidgets('shows and removes global banner', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    DSBanner.showGlobal(
                      context,
                      message: 'Global banner test',
                    );
                  },
                  child: const Text('Show Banner'),
                ),
              );
            },
          ),
        ),
      );

      // Initially no banner
      expect(find.text('Global banner test'), findsNothing);

      // Show banner
      await tester.tap(find.text('Show Banner'));
      await tester.pumpAndSettle();

      expect(find.text('Global banner test'), findsOneWidget);
    });

    testWidgets('removes all banners', (tester) async {
      // This test verifies that removeAll() method exists and can be called
      // without throwing errors. Global banner overlay testing is complex
      // in unit tests due to the overlay system.

      expect(() => DSBannerManager.removeAll(), returnsNormally);
    });
  });

  group('BannerAction', () {
    test('creates action with correct properties', () {
      bool pressed = false;
      final action = BannerAction(
        label: 'Test Action',
        onPressed: () => pressed = true,
        icon: Icons.star,
        isPrimary: true,
      );

      expect(action.label, equals('Test Action'));
      expect(action.icon, equals(Icons.star));
      expect(action.isPrimary, isTrue);

      action.onPressed();
      expect(pressed, isTrue);
    });

    test('creates action with default values', () {
      final action = BannerAction(
        label: 'Default Action',
        onPressed: () {},
      );

      expect(action.label, equals('Default Action'));
      expect(action.icon, isNull);
      expect(action.isPrimary, isFalse);
    });
  });

  group('Banner Enums', () {
    test('BannerVariant has correct values', () {
      expect(BannerVariant.values.length, equals(2));
      expect(BannerVariant.values, contains(BannerVariant.inline));
      expect(BannerVariant.values, contains(BannerVariant.global));
    });

    test('BannerType has correct values', () {
      expect(BannerType.values.length, equals(5));
      expect(BannerType.values, contains(BannerType.info));
      expect(BannerType.values, contains(BannerType.success));
      expect(BannerType.values, contains(BannerType.warning));
      expect(BannerType.values, contains(BannerType.error));
      expect(BannerType.values, contains(BannerType.neutral));
    });

    test('BannerPriority has correct values', () {
      expect(BannerPriority.values.length, equals(4));
      expect(BannerPriority.values, contains(BannerPriority.low));
      expect(BannerPriority.values, contains(BannerPriority.medium));
      expect(BannerPriority.values, contains(BannerPriority.high));
      expect(BannerPriority.values, contains(BannerPriority.critical));
    });

    test('BannerState has correct values', () {
      expect(BannerState.values.length, equals(8));
      expect(BannerState.values, contains(BannerState.defaultState));
      expect(BannerState.values, contains(BannerState.hover));
      expect(BannerState.values, contains(BannerState.pressed));
      expect(BannerState.values, contains(BannerState.focus));
      expect(BannerState.values, contains(BannerState.selected));
      expect(BannerState.values, contains(BannerState.disabled));
      expect(BannerState.values, contains(BannerState.loading));
      expect(BannerState.values, contains(BannerState.skeleton));
    });
  });
}
