import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppAvatar', () {
    testWidgets('should render image avatar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.image(
              imageUrl: 'https://example.com/image.jpg',
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should render initials avatar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'JD',
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('should render group avatar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.group(
              groupImageUrls: ['url1', 'url2', 'url3'],
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should handle tap interactions', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppAvatar));
      expect(tapped, isTrue);
    });

    testWidgets('should handle long press interactions', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'CD',
              onLongPress: () => longPressed = true,
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(AppAvatar));
      expect(longPressed, isTrue);
    });

    testWidgets('should not show avatar when visible is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'EF',
              visible: false,
            ),
          ),
        ),
      );

      expect(find.text('EF'), findsNothing);
    });

    testWidgets('should respect different sizes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppAvatar.initials(
                  initials: 'S',
                  size: AppAvatarSize.small,
                ),
                AppAvatar.initials(
                  initials: 'M',
                  size: AppAvatarSize.medium,
                ),
                AppAvatar.initials(
                  initials: 'L',
                  size: AppAvatarSize.large,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('S'), findsOneWidget);
      expect(find.text('M'), findsOneWidget);
      expect(find.text('L'), findsOneWidget);
    });

    testWidgets('should render different avatar shapes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppAvatar.initials(
                  initials: 'C',
                  shape: AppAvatarShape.circle,
                ),
                AppAvatar.initials(
                  initials: 'S',
                  shape: AppAvatarShape.square,
                ),
                AppAvatar.initials(
                  initials: 'R',
                  shape: AppAvatarShape.rounded,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('C'), findsOneWidget);
      expect(find.text('S'), findsOneWidget);
      expect(find.text('R'), findsOneWidget);
    });

    testWidgets('should show presence indicator when enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              presence: AppAvatarPresence.online,
              showPresence: true,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should not interact when disabled', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              enabled: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppAvatar));
      expect(tapped, isFalse);
    });

    testWidgets('should show loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              loading: true,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should show skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              skeleton: true,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should handle tooltip', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              tooltip: 'Avatar tooltip',
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should format initials correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppAvatar.initials(initials: 'John Doe'),
                AppAvatar.initials(initials: 'Jane'),
                AppAvatar.initials(initials: 'A B C'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
      expect(find.text('JA'), findsOneWidget);
      expect(find.text('AB'), findsOneWidget);
    });

    testWidgets('should handle custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              borderColor: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should handle border settings', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              showBorder: true,
              borderWidth: 3.0,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should handle group with initials', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.group(
              groupInitials: ['AB', 'CD', 'EF'],
              maxGroupCount: 2,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should show remaining count in group', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.group(
              groupInitials: ['AB', 'CD', 'EF', 'GH', 'IJ'],
              maxGroupCount: 3,
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });

    testWidgets('should handle animation configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar.initials(
              initials: 'AB',
              animation: AppAvatarAnimation(
                enabled: true,
                type: AppAvatarAnimationType.pulse,
                pulse: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppAvatar), findsOneWidget);
    });
  });

  group('AppAvatarConfig', () {
    test('should have correct default values', () {
      const config = AppAvatarConfig();

      expect(config.variant, AppAvatarVariant.image);
      expect(config.state, AppAvatarState.defaultState);
      expect(config.size, AppAvatarSize.medium);
      expect(config.shape, AppAvatarShape.circle);
      expect(config.enabled, isTrue);
      expect(config.loading, isFalse);
      expect(config.skeleton, isFalse);
      expect(config.visible, isTrue);
      expect(config.maxGroupCount, 2);
      expect(config.showPresence, isFalse);
      expect(config.showBorder, isFalse);
    });

    test('should detect interactive state correctly', () {
      const interactiveConfig = AppAvatarConfig(onTap: _mockCallback);
      const nonInteractiveConfig = AppAvatarConfig();

      expect(interactiveConfig.isInteractive, isTrue);
      expect(nonInteractiveConfig.isInteractive, isFalse);
    });

    test('should detect disabled state correctly', () {
      const disabledConfig = AppAvatarConfig(enabled: false);
      const enabledConfig = AppAvatarConfig(enabled: true);

      expect(disabledConfig.isDisabled, isTrue);
      expect(enabledConfig.isDisabled, isFalse);
    });

    test('should detect loading state correctly', () {
      const loadingConfig = AppAvatarConfig(loading: true);
      const normalConfig = AppAvatarConfig(loading: false);

      expect(loadingConfig.isLoading, isTrue);
      expect(normalConfig.isLoading, isFalse);
    });

    test('should detect skeleton state correctly', () {
      const skeletonConfig = AppAvatarConfig(skeleton: true);
      const normalConfig = AppAvatarConfig(skeleton: false);

      expect(skeletonConfig.isSkeleton, isTrue);
      expect(normalConfig.isSkeleton, isFalse);
    });

    test('should determine if can interact correctly', () {
      const canInteractConfig = AppAvatarConfig(
        onTap: _mockCallback,
        enabled: true,
        loading: false,
        skeleton: false,
      );
      const cannotInteractConfig = AppAvatarConfig(
        onTap: _mockCallback,
        enabled: false,
      );

      expect(canInteractConfig.canInteract, isTrue);
      expect(cannotInteractConfig.canInteract, isFalse);
    });

    test('should detect content properties correctly', () {
      const configWithImageUrl = AppAvatarConfig(imageUrl: 'http://example.com');
      const configWithInitials = AppAvatarConfig(initials: 'AB');
      const configWithGroupImages = AppAvatarConfig(groupImageUrls: ['url1']);
      const configWithGroupInitials = AppAvatarConfig(groupInitials: ['AB']);
      const configWithPresence = AppAvatarConfig(
        presence: AppAvatarPresence.online,
        showPresence: true,
      );
      const emptyConfig = AppAvatarConfig();

      expect(configWithImageUrl.hasImageUrl, isTrue);
      expect(configWithInitials.hasInitials, isTrue);
      expect(configWithGroupImages.hasGroupImages, isTrue);
      expect(configWithGroupInitials.hasGroupInitials, isTrue);
      expect(configWithPresence.hasPresence, isTrue);
      expect(emptyConfig.hasImageUrl, isFalse);
      expect(emptyConfig.hasInitials, isFalse);
      expect(emptyConfig.hasGroupImages, isFalse);
      expect(emptyConfig.hasGroupInitials, isFalse);
      expect(emptyConfig.hasPresence, isFalse);
    });

    test('should format display initials correctly', () {
      const singleName = AppAvatarConfig(initials: 'John');
      const fullName = AppAvatarConfig(initials: 'John Doe');
      const threeName = AppAvatarConfig(initials: 'John Michael Doe');
      const singleLetter = AppAvatarConfig(initials: 'A');
      const emptyInitials = AppAvatarConfig(initials: '');

      expect(singleName.displayInitials, 'JO');
      expect(fullName.displayInitials, 'JD');
      expect(threeName.displayInitials, 'JM');
      expect(singleLetter.displayInitials, 'A');
      expect(emptyInitials.displayInitials, '');
    });

    test('should calculate remaining group count correctly', () {
      const normalGroup = AppAvatarConfig(
        variant: AppAvatarVariant.group,
        groupInitials: ['A', 'B', 'C'],
        maxGroupCount: 2,
      );
      const smallGroup = AppAvatarConfig(
        variant: AppAvatarVariant.group,
        groupInitials: ['A', 'B'],
        maxGroupCount: 3,
      );
      const nonGroup = AppAvatarConfig(
        variant: AppAvatarVariant.initials,
        groupInitials: ['A', 'B', 'C'],
        maxGroupCount: 2,
      );

      expect(normalGroup.remainingGroupCount, 1);
      expect(smallGroup.remainingGroupCount, 0);
      expect(nonGroup.remainingGroupCount, 0);
    });

    test('should return correct border width', () {
      const withBorder = AppAvatarConfig(showBorder: true);
      const withCustomBorderWidth = AppAvatarConfig(borderWidth: 5.0);
      const noBorder = AppAvatarConfig(showBorder: false);

      expect(withBorder.getEffectiveBorderWidth(), AppAvatarConstants.defaultBorderWidth);
      expect(withCustomBorderWidth.getEffectiveBorderWidth(), 5.0);
      expect(noBorder.getEffectiveBorderWidth(), 0.0);
    });
  });

  group('AppAvatarVariant', () {
    test('should have correct extension properties', () {
      expect(AppAvatarVariant.image.isImage, isTrue);
      expect(AppAvatarVariant.image.isInitials, isFalse);
      expect(AppAvatarVariant.image.isGroup, isFalse);

      expect(AppAvatarVariant.initials.isImage, isFalse);
      expect(AppAvatarVariant.initials.isInitials, isTrue);
      expect(AppAvatarVariant.initials.isGroup, isFalse);

      expect(AppAvatarVariant.group.isImage, isFalse);
      expect(AppAvatarVariant.group.isInitials, isFalse);
      expect(AppAvatarVariant.group.isGroup, isTrue);
    });
  });

  group('AppAvatarPresence', () {
    test('should have correct labels', () {
      expect(AppAvatarPresence.online.label, 'En línea');
      expect(AppAvatarPresence.offline.label, 'Desconectado');
      expect(AppAvatarPresence.away.label, 'Ausente');
      expect(AppAvatarPresence.busy.label, 'Ocupado');
      expect(AppAvatarPresence.doNotDisturb.label, 'No molestar');
    });

    test('should have correct icons', () {
      expect(AppAvatarPresence.online.icon, Icons.circle);
      expect(AppAvatarPresence.offline.icon, Icons.circle_outlined);
      expect(AppAvatarPresence.away.icon, Icons.schedule);
      expect(AppAvatarPresence.busy.icon, Icons.circle);
      expect(AppAvatarPresence.doNotDisturb.icon, Icons.do_not_disturb_on);
    });
  });

  group('AppAvatarSize', () {
    test('should have correct sizes', () {
      expect(AppAvatarSize.xxsmall.size, 20.0);
      expect(AppAvatarSize.xsmall.size, 24.0);
      expect(AppAvatarSize.small.size, 32.0);
      expect(AppAvatarSize.medium.size, 40.0);
      expect(AppAvatarSize.large.size, 48.0);
      expect(AppAvatarSize.xlarge.size, 56.0);
      expect(AppAvatarSize.xxlarge.size, 64.0);
    });

    test('should have correct font sizes', () {
      expect(AppAvatarSize.xxsmall.fontSize, 8.0);
      expect(AppAvatarSize.xsmall.fontSize, 10.0);
      expect(AppAvatarSize.small.fontSize, 12.0);
      expect(AppAvatarSize.medium.fontSize, 16.0);
      expect(AppAvatarSize.large.fontSize, 18.0);
      expect(AppAvatarSize.xlarge.fontSize, 20.0);
      expect(AppAvatarSize.xxlarge.fontSize, 24.0);
    });

    test('should have correct icon sizes', () {
      expect(AppAvatarSize.xxsmall.iconSize, 10.0);
      expect(AppAvatarSize.xsmall.iconSize, 12.0);
      expect(AppAvatarSize.small.iconSize, 16.0);
      expect(AppAvatarSize.medium.iconSize, 20.0);
      expect(AppAvatarSize.large.iconSize, 24.0);
      expect(AppAvatarSize.xlarge.iconSize, 28.0);
      expect(AppAvatarSize.xxlarge.iconSize, 32.0);
    });

    test('should have correct presence sizes', () {
      expect(AppAvatarSize.xxsmall.presenceSize, 6.0);
      expect(AppAvatarSize.xsmall.presenceSize, 8.0);
      expect(AppAvatarSize.small.presenceSize, 10.0);
      expect(AppAvatarSize.medium.presenceSize, 12.0);
      expect(AppAvatarSize.large.presenceSize, 14.0);
      expect(AppAvatarSize.xlarge.presenceSize, 16.0);
      expect(AppAvatarSize.xxlarge.presenceSize, 18.0);
    });

    test('should calculate group overlap correctly', () {
      expect(AppAvatarSize.medium.groupOverlap, 10.0); // 40 * 0.25
      expect(AppAvatarSize.large.groupOverlap, 12.0); // 48 * 0.25
    });
  });

  group('AppAvatarShape', () {
    test('should generate correct border radius', () {
      final circleRadius = AppAvatarShape.circle.getBorderRadius(40.0);
      expect(circleRadius, BorderRadius.circular(20.0));

      final squareRadius = AppAvatarShape.square.getBorderRadius(40.0);
      expect(squareRadius, BorderRadius.zero);

      final roundedRadius = AppAvatarShape.rounded.getBorderRadius(40.0);
      expect(roundedRadius, BorderRadius.circular(5.0)); // 40 * 0.125
    });

    test('should have correct box shapes', () {
      expect(AppAvatarShape.circle.boxShape, BoxShape.circle);
      expect(AppAvatarShape.square.boxShape, BoxShape.rectangle);
      expect(AppAvatarShape.rounded.boxShape, BoxShape.rectangle);
    });
  });

  group('AppAvatarState', () {
    test('should detect interactive states correctly', () {
      expect(AppAvatarState.hover.isInteractiveState, isTrue);
      expect(AppAvatarState.pressed.isInteractiveState, isTrue);
      expect(AppAvatarState.focus.isInteractiveState, isTrue);
      expect(AppAvatarState.defaultState.isInteractiveState, isFalse);
      expect(AppAvatarState.disabled.isInteractiveState, isFalse);
    });

    test('should detect special states correctly', () {
      expect(AppAvatarState.disabled.isDisabledState, isTrue);
      expect(AppAvatarState.loading.isLoadingState, isTrue);
      expect(AppAvatarState.skeleton.isSkeletonState, isTrue);
      expect(AppAvatarState.selected.isSelectedState, isTrue);
      expect(AppAvatarState.defaultState.isDisabledState, isFalse);
    });
  });
}

void _mockCallback() {
  // Mock callback for testing
}