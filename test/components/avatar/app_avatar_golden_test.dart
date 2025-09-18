import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppAvatar Golden Tests', () {
    testWidgets('image avatar with placeholder icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.image(
                imageUrl: 'https://invalid-url.com/image.jpg',
              ),
            ),
          ),
        ),
      );

      // Wait for image loading to fail and show error widget
      await tester.pump(const Duration(seconds: 1));

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/image_placeholder.png'),
      );
    });

    testWidgets('initials avatar small', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'JD',
                size: AppAvatarSize.small,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/initials_small.png'),
      );
    });

    testWidgets('initials avatar medium', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'AB',
                size: AppAvatarSize.medium,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/initials_medium.png'),
      );
    });

    testWidgets('initials avatar large', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'LG',
                size: AppAvatarSize.large,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/initials_large.png'),
      );
    });

    testWidgets('avatar with presence online', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'ON',
                presence: AppAvatarPresence.online,
                showPresence: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/presence_online.png'),
      );
    });

    testWidgets('avatar with presence away', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'AW',
                presence: AppAvatarPresence.away,
                showPresence: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/presence_away.png'),
      );
    });

    testWidgets('avatar with presence busy', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'BS',
                presence: AppAvatarPresence.busy,
                showPresence: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/presence_busy.png'),
      );
    });

    testWidgets('avatar with presence do not disturb', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'DN',
                presence: AppAvatarPresence.doNotDisturb,
                showPresence: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/presence_do_not_disturb.png'),
      );
    });

    testWidgets('avatar sizes comparison', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppAvatar.initials(
                    initials: 'XS',
                    size: AppAvatarSize.xsmall,
                  ),
                  AppAvatar.initials(
                    initials: 'SM',
                    size: AppAvatarSize.small,
                  ),
                  AppAvatar.initials(
                    initials: 'MD',
                    size: AppAvatarSize.medium,
                  ),
                  AppAvatar.initials(
                    initials: 'LG',
                    size: AppAvatarSize.large,
                  ),
                  AppAvatar.initials(
                    initials: 'XL',
                    size: AppAvatarSize.xlarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/sizes_comparison.png'),
      );
    });

    testWidgets('avatar shapes comparison', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppAvatar.initials(
                    initials: 'CI',
                    shape: AppAvatarShape.circle,
                    size: AppAvatarSize.large,
                  ),
                  AppAvatar.initials(
                    initials: 'SQ',
                    shape: AppAvatarShape.square,
                    size: AppAvatarSize.large,
                  ),
                  AppAvatar.initials(
                    initials: 'RD',
                    shape: AppAvatarShape.rounded,
                    size: AppAvatarSize.large,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/shapes_comparison.png'),
      );
    });

    testWidgets('avatar disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'DS',
                enabled: false,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/disabled_state.png'),
      );
    });

    testWidgets('avatar skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'SK',
                skeleton: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/skeleton_state.png'),
      );
    });

    testWidgets('avatar with border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.initials(
                initials: 'BR',
                showBorder: true,
                borderWidth: 3.0,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAvatar),
        matchesGoldenFile('avatar/with_border.png'),
      );
    });

    testWidgets('avatar with custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppAvatar.initials(
                    initials: 'PR',
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  AppAvatar.initials(
                    initials: 'GR',
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  AppAvatar.initials(
                    initials: 'OR',
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/custom_colors.png'),
      );
    });

    testWidgets('group avatar with 2 members', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.group(
                groupInitials: ['AB', 'CD'],
                maxGroupCount: 2,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/group_two_members.png'),
      );
    });

    testWidgets('group avatar with 3 members', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.group(
                groupInitials: ['AB', 'CD', 'EF'],
                maxGroupCount: 3,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/group_three_members.png'),
      );
    });

    testWidgets('group avatar with overflow', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppAvatar.group(
                groupInitials: ['AB', 'CD', 'EF', 'GH', 'IJ'],
                maxGroupCount: 3,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/group_with_overflow.png'),
      );
    });

    testWidgets('initials formatting variations', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppAvatar.initials(initials: 'John Doe'),
                      AppAvatar.initials(initials: 'Jane'),
                      AppAvatar.initials(initials: 'A B C'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppAvatar.initials(initials: 'X'),
                      AppAvatar.initials(initials: 'Maria Elena Rodriguez'),
                      AppAvatar.initials(initials: 'AB'),
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
        matchesGoldenFile('avatar/initials_formatting.png'),
      );
    });

    testWidgets('avatar in dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppAvatar.initials(
                    initials: 'DK',
                    size: AppAvatarSize.large,
                  ),
                  AppAvatar.initials(
                    initials: 'PR',
                    presence: AppAvatarPresence.online,
                    showPresence: true,
                    size: AppAvatarSize.large,
                  ),
                  AppAvatar.group(
                    groupInitials: ['A', 'B', 'C'],
                    maxGroupCount: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/dark_theme.png'),
      );
    });

    testWidgets('avatar real world usage example', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Avatar Examples'),
              actions: [
                AppAvatar.initials(
                  initials: 'JP',
                  size: AppAvatarSize.small,
                  presence: AppAvatarPresence.online,
                  showPresence: true,
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: AppAvatar.initials(
                        initials: 'SC',
                        presence: AppAvatarPresence.online,
                        showPresence: true,
                      ),
                      title: const Text('Sarah Connor'),
                      subtitle: const Text('En línea'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Equipo de Proyecto',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          AppAvatar.group(
                            groupInitials: ['A', 'B', 'C', 'D', 'E'],
                            maxGroupCount: 3,
                            size: AppAvatarSize.small,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/real_world_usage.png'),
      );
    });

    testWidgets('avatar presence indicators comparison', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                children: AppAvatarPresence.values.map((presence) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppAvatar.initials(
                        initials: presence.name.substring(0, 2).toUpperCase(),
                        presence: presence,
                        showPresence: true,
                        size: AppAvatarSize.large,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        presence.label,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/presence_indicators.png'),
      );
    });

    testWidgets('avatar responsive layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tamaños de Avatar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: AppAvatarSize.values.map((size) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            AppAvatar.initials(
                              initials: 'AB',
                              size: size,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              size.name,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Formas de Avatar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: AppAvatarShape.values.map((shape) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          children: [
                            AppAvatar.initials(
                              initials: 'AB',
                              shape: shape,
                              size: AppAvatarSize.large,
                            ),
                            const SizedBox(height: 8),
                            Text(shape.name),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('avatar/responsive_layout.png'),
      );
    });
  });
}
