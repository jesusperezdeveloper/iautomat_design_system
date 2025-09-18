import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/banner/app_banner.dart';

void main() {
  group('AppBanner Golden Tests', () {
    testWidgets('info banner', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                message: 'This is an information banner',
                leading: Icon(Icons.info),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_info.png'),
      );
    });

    testWidgets('success banner with action', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.success,
                message: 'Operation completed successfully!',
                leading: const Icon(Icons.check_circle),
                actions: [
                  BannerAction(
                    label: 'View Details',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_success_with_action.png'),
      );
    });

    testWidgets('warning banner', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.warning,
                message: 'Please review your settings',
                leading: Icon(Icons.warning),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_warning.png'),
      );
    });

    testWidgets('error banner with multiple actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.error,
                message: 'Something went wrong. Please try again.',
                leading: const Icon(Icons.error),
                actions: [
                  BannerAction(
                    label: 'Retry',
                    onPressed: () {},
                    isPrimary: true,
                  ),
                  BannerAction(
                    label: 'Cancel',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_error_with_actions.png'),
      );
    });

    testWidgets('neutral banner', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.neutral,
                message: 'Neutral banner message',
                leading: Icon(Icons.info_outline),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_neutral.png'),
      );
    });

    testWidgets('banner without leading icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                message: 'Banner without leading icon',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_no_icon.png'),
      );
    });

    testWidgets('banner without dismiss button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                message: 'Banner without dismiss button',
                leading: Icon(Icons.info),
                showDismissButton: false,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_no_dismiss.png'),
      );
    });

    testWidgets('banner with custom styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.neutral,
                message: 'Custom styled banner',
                backgroundColor: Colors.purple.shade100,
                textColor: Colors.purple.shade900,
                borderColor: Colors.purple.shade300,
                borderWidth: 2.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_custom_style.png'),
      );
    });

    testWidgets('banner with long message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                message:
                    'This is a very long message that demonstrates how the banner handles text wrapping and maintains proper spacing and alignment across multiple lines of content.',
                leading: const Icon(Icons.info),
                actions: [
                  BannerAction(
                    label: 'Learn More',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_long_message.png'),
      );
    });

    testWidgets('high priority banner', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.error,
                priority: BannerPriority.critical,
                message: 'Critical priority banner',
                leading: Icon(Icons.error),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_critical_priority.png'),
      );
    });

    testWidgets('banner hover state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                state: BannerState.hover,
                message: 'Banner in hover state',
                leading: Icon(Icons.info),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_hover_state.png'),
      );
    });

    testWidgets('banner pressed state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                state: BannerState.pressed,
                message: 'Banner in pressed state',
                leading: Icon(Icons.info),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_pressed_state.png'),
      );
    });

    testWidgets('banner disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                state: BannerState.disabled,
                message: 'Banner in disabled state',
                leading: Icon(Icons.info),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_disabled_state.png'),
      );
    });

    testWidgets('banner loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                state: BannerState.loading,
                message: 'Banner in loading state',
                leading: Icon(Icons.info),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_loading_state.png'),
      );
    });

    testWidgets('banner skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: AppBanner(
                variant: BannerVariant.inline,
                type: BannerType.info,
                state: BannerState.skeleton,
                message: 'Banner in skeleton state',
                leading: Icon(Icons.info),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/banner_skeleton_state.png'),
      );
    });

    group('Dark Theme', () {
      testWidgets('info banner dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: const Scaffold(
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: AppBanner(
                  variant: BannerVariant.inline,
                  type: BannerType.info,
                  message: 'This is an information banner in dark theme',
                  leading: Icon(Icons.info),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/banner_info_dark.png'),
        );
      });

      testWidgets('error banner dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppBanner(
                  variant: BannerVariant.inline,
                  type: BannerType.error,
                  message: 'Error banner in dark theme',
                  leading: const Icon(Icons.error),
                  actions: [
                    BannerAction(
                      label: 'Retry',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/banner_error_dark.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('banner with RTL support', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AppBanner(
                    variant: BannerVariant.inline,
                    type: BannerType.info,
                    message: 'Banner with RTL support',
                    leading: Icon(Icons.info),
                    rtlSupport: true,
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/banner_rtl.png'),
        );
      });
    });
  });
}
