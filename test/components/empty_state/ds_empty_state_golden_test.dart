import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/empty_state/ds_empty_state.dart';

void main() {
  group('DSEmptyState Golden Tests', () {
    testWidgets('illustration empty state with default styling',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSEmptyState.illustration(
                title: 'No items found',
                description:
                    'There are no items to display at the moment. Try adding some or adjusting your filters.',
                actions: const [
                  EmptyStateAction(
                    text: 'Add Item',
                    isPrimary: true,
                    icon: Icons.add,
                  ),
                  EmptyStateAction(
                    text: 'Learn More',
                    icon: Icons.help_outline,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/empty_state_illustration_default.png'),
      );
    });

    testWidgets('cta empty state with default styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSEmptyState.cta(
                title: 'Start your first project',
                description: 'Create a new project to begin working.',
                actions: const [
                  EmptyStateAction(
                    text: 'Create Project',
                    isPrimary: true,
                    icon: Icons.add_circle_outline,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/empty_state_cta_default.png'),
      );
    });

    testWidgets('empty state without description', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSEmptyState.illustration(
                title: 'Empty Folder',
                actions: const [
                  EmptyStateAction(
                    text: 'Add Files',
                    isPrimary: true,
                    icon: Icons.upload_file,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/empty_state_no_description.png'),
      );
    });

    testWidgets('empty state without actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSEmptyState.illustration(
                title: 'Processing Complete',
                description: 'All tasks have been completed successfully.',
                defaultIcon: Icons.check_circle_outline,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/empty_state_no_actions.png'),
      );
    });

    group('States', () {
      testWidgets('empty state with default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Default State',
                  description: 'This is the default state',
                  state: DSEmptyStateState.defaultState,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_default.png'),
        );
      });

      testWidgets('empty state with hover state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Hover State',
                  description: 'This shows hover effects',
                  state: DSEmptyStateState.hover,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_hover.png'),
        );
      });

      testWidgets('empty state with pressed state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Pressed State',
                  description: 'This shows pressed effects',
                  state: DSEmptyStateState.pressed,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_pressed.png'),
        );
      });

      testWidgets('empty state with focus state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Focus State',
                  description: 'This shows focus border',
                  state: DSEmptyStateState.focus,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_focus.png'),
        );
      });

      testWidgets('empty state with disabled state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Disabled State',
                  description: 'This is disabled',
                  state: DSEmptyStateState.disabled,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_disabled.png'),
        );
      });

      testWidgets('empty state with selected state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Selected State',
                  description: 'This shows selection',
                  state: DSEmptyStateState.selected,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_selected.png'),
        );
      });

      testWidgets('empty state with loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Loading State',
                  description: 'Currently loading',
                  state: DSEmptyStateState.loading,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_loading.png'),
        );
      });

      testWidgets('empty state with skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Skeleton State',
                  description: 'Skeleton loading',
                  state: DSEmptyStateState.skeleton,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_state_skeleton.png'),
        );
      });
    });

    testWidgets('empty state with custom styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSEmptyState.illustration(
                title: 'Custom Styled Empty State',
                description: 'This has custom colors and spacing',
                titleColor: Colors.purple,
                descriptionColor: Colors.deepPurple,
                backgroundColor: Colors.purple.withValues(alpha: 0.1),
                spacing: 24.0,
                defaultIcon: Icons.star,
                actions: const [
                  EmptyStateAction(
                    text: 'Custom Action',
                    isPrimary: true,
                    icon: Icons.auto_awesome,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/empty_state_custom_styling.png'),
      );
    });

    testWidgets('empty state with custom illustration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSEmptyState.illustration(
                title: 'Custom Illustration',
                description: 'Features a custom illustration widget',
                illustration: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: const Icon(
                    Icons.palette,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                actions: const [
                  EmptyStateAction(
                    text: 'Create Art',
                    isPrimary: true,
                    icon: Icons.brush,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/empty_state_custom_illustration.png'),
      );
    });

    group('Alignments', () {
      testWidgets('empty state with start alignment', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(32.0),
                child: DSEmptyState.illustration(
                  title: 'Start Aligned',
                  description: 'This content is aligned to the start',
                  alignment: CrossAxisAlignment.start,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_align_start.png'),
        );
      });

      testWidgets('empty state with center alignment', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(32.0),
                child: DSEmptyState.illustration(
                  title: 'Center Aligned',
                  description: 'This content is centered',
                  alignment: CrossAxisAlignment.center,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_align_center.png'),
        );
      });

      testWidgets('empty state with end alignment', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(32.0),
                child: DSEmptyState.illustration(
                  title: 'End Aligned',
                  description: 'This content is aligned to the end',
                  alignment: CrossAxisAlignment.end,
                  actions: const [
                    EmptyStateAction(text: 'Action', isPrimary: true),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_align_end.png'),
        );
      });
    });

    group('Dark Theme', () {
      testWidgets('empty state with dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: DSEmptyState.illustration(
                  title: 'Dark Theme Empty State',
                  description: 'This demonstrates the dark theme appearance',
                  defaultIcon: Icons.nights_stay,
                  actions: const [
                    EmptyStateAction(
                      text: 'Dark Action',
                      isPrimary: true,
                      icon: Icons.brightness_2,
                    ),
                    EmptyStateAction(
                      text: 'Secondary',
                      icon: Icons.info_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_dark_theme.png'),
        );
      });

      testWidgets('cta empty state dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'Dark CTA State',
                  description: 'CTA variant in dark theme',
                  actions: const [
                    EmptyStateAction(
                      text: 'Get Started',
                      isPrimary: true,
                      icon: Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_cta_dark.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('empty state with RTL support', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: DSEmptyState.illustration(
                    title: 'حالة فارغة',
                    description:
                        'هذا مثال على الحالة الفارغة مع دعم النصوص من اليمين إلى اليسار.',
                    defaultIcon: Icons.language,
                    rtlSupport: true,
                    actions: const [
                      EmptyStateAction(
                        text: 'إضافة',
                        isPrimary: true,
                        icon: Icons.add,
                      ),
                      EmptyStateAction(
                        text: 'مساعدة',
                        icon: Icons.help_outline,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_rtl.png'),
        );
      });
    });

    group('Real World Examples', () {
      testWidgets('e-commerce empty cart', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.illustration(
                  title: 'Your cart is empty',
                  description:
                      'Looks like you haven\'t added anything to your cart yet. Start shopping to fill it up!',
                  defaultIcon: Icons.shopping_cart_outlined,
                  actions: const [
                    EmptyStateAction(
                      text: 'Start Shopping',
                      isPrimary: true,
                      icon: Icons.storefront,
                    ),
                    EmptyStateAction(
                      text: 'View Wishlist',
                      icon: Icons.favorite_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_ecommerce_cart.png'),
        );
      });

      testWidgets('social media no notifications', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'You\'re all caught up!',
                  description: 'No new notifications right now.',
                  defaultIcon: Icons.notifications_none,
                  actions: const [
                    EmptyStateAction(
                      text: 'Explore',
                      isPrimary: true,
                      icon: Icons.explore,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_social_notifications.png'),
        );
      });

      testWidgets('productivity no tasks', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.illustration(
                  title: 'No tasks for today',
                  description:
                      'You\'ve completed all your tasks! Take a break or plan ahead for tomorrow.',
                  defaultIcon: Icons.task_alt,
                  actions: const [
                    EmptyStateAction(
                      text: 'Add Task',
                      isPrimary: true,
                      icon: Icons.add_task,
                    ),
                    EmptyStateAction(
                      text: 'Plan Tomorrow',
                      icon: Icons.calendar_today,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_productivity_tasks.png'),
        );
      });

      testWidgets('error no internet connection', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSEmptyState.cta(
                  title: 'No internet connection',
                  description: 'Please check your connection and try again.',
                  defaultIcon: Icons.wifi_off,
                  state: DSEmptyStateState.disabled,
                  actions: const [
                    EmptyStateAction(
                      text: 'Retry',
                      isPrimary: true,
                      icon: Icons.refresh,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_error_no_internet.png'),
        );
      });
    });

    group('Platform Adaptive', () {
      testWidgets('empty states optimized for different platforms',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text('Desktop Style',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    DSEmptyState.illustration(
                      title: 'Welcome to Dashboard',
                      description: 'Get started by creating a project.',
                      defaultIcon: Icons.dashboard_outlined,
                      maxWidth: 400,
                      spacing: 12,
                      actions: const [
                        EmptyStateAction(
                            text: 'Create Project',
                            isPrimary: true,
                            icon: Icons.add),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('Mobile Style',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    DSEmptyState.cta(
                      title: 'No messages yet',
                      description: 'Start a conversation.',
                      maxWidth: 250,
                      spacing: 8,
                      actions: const [
                        EmptyStateAction(
                            text: 'New Message',
                            isPrimary: true,
                            icon: Icons.add),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/empty_state_platform_adaptive.png'),
        );
      });
    });
  });
}
