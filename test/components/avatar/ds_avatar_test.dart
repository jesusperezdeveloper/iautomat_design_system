import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSAvatar', () {
    testWidgets('should render image avatar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.image(
              imageUrl: 'https://example.com/image.jpg',
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should render initials avatar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'JD',
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('should render group avatar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.group(
              groupImageUrls: ['url1', 'url2', 'url3'],
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should handle tap interactions', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSAvatar));
      expect(tapped, isTrue);
    });

    testWidgets('should handle long press interactions', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'CD',
              onLongPress: () => longPressed = true,
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(DSAvatar));
      expect(longPressed, isTrue);
    });

    testWidgets('should not show avatar when visible is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
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
                DSAvatar.initials(
                  initials: 'S',
                  size: DSAvatarSize.small,
                ),
                DSAvatar.initials(
                  initials: 'M',
                  size: DSAvatarSize.medium,
                ),
                DSAvatar.initials(
                  initials: 'L',
                  size: DSAvatarSize.large,
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
                DSAvatar.initials(
                  initials: 'C',
                  shape: DSAvatarShape.circle,
                ),
                DSAvatar.initials(
                  initials: 'S',
                  shape: DSAvatarShape.square,
                ),
                DSAvatar.initials(
                  initials: 'R',
                  shape: DSAvatarShape.rounded,
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
            body: DSAvatar.initials(
              initials: 'AB',
              presence: DSAvatarPresence.online,
              showPresence: true,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should not interact when disabled', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              enabled: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSAvatar));
      expect(tapped, isFalse);
    });

    testWidgets('should show loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              loading: true,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should show skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              skeleton: true,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should handle tooltip', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              tooltip: 'Avatar tooltip',
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should format initials correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DSAvatar.initials(initials: 'John Doe'),
                DSAvatar.initials(initials: 'Jane'),
                DSAvatar.initials(initials: 'A B C'),
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
            body: DSAvatar.initials(
              initials: 'AB',
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              borderColor: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should handle border settings', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              showBorder: true,
              borderWidth: 3.0,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should handle group with initials', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.group(
              groupInitials: ['AB', 'CD', 'EF'],
              maxGroupCount: 2,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should show remaining count in group', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.group(
              groupInitials: ['AB', 'CD', 'EF', 'GH', 'IJ'],
              maxGroupCount: 3,
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });

    testWidgets('should handle animation configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAvatar.initials(
              initials: 'AB',
              animation: DSAvatarAnimation(
                enabled: true,
                type: DSAvatarAnimationType.pulse,
                pulse: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSAvatar), findsOneWidget);
    });
  });

  group('DSAvatarConfig', () {
    test('should have correct default values', () {
      const config = DSAvatarConfig();

      expect(config.variant, DSAvatarVariant.image);
      expect(config.state, DSAvatarState.defaultState);
      expect(config.size, DSAvatarSize.medium);
      expect(config.shape, DSAvatarShape.circle);
      expect(config.enabled, isTrue);
      expect(config.loading, isFalse);
      expect(config.skeleton, isFalse);
      expect(config.visible, isTrue);
      expect(config.maxGroupCount, 2);
      expect(config.showPresence, isFalse);
      expect(config.showBorder, isFalse);
    });

    test('should detect interactive state correctly', () {
      const interactiveConfig = DSAvatarConfig(onTap: _mockCallback);
      const nonInteractiveConfig = DSAvatarConfig();

      expect(interactiveConfig.isInteractive, isTrue);
      expect(nonInteractiveConfig.isInteractive, isFalse);
    });

    test('should detect disabled state correctly', () {
      const disabledConfig = DSAvatarConfig(enabled: false);
      const enabledConfig = DSAvatarConfig(enabled: true);

      expect(disabledConfig.isDisabled, isTrue);
      expect(enabledConfig.isDisabled, isFalse);
    });

    test('should detect loading state correctly', () {
      const loadingConfig = DSAvatarConfig(loading: true);
      const normalConfig = DSAvatarConfig(loading: false);

      expect(loadingConfig.isLoading, isTrue);
      expect(normalConfig.isLoading, isFalse);
    });

    test('should detect skeleton state correctly', () {
      const skeletonConfig = DSAvatarConfig(skeleton: true);
      const normalConfig = DSAvatarConfig(skeleton: false);

      expect(skeletonConfig.isSkeleton, isTrue);
      expect(normalConfig.isSkeleton, isFalse);
    });

    test('should determine if can interact correctly', () {
      const canInteractConfig = DSAvatarConfig(
        onTap: _mockCallback,
        enabled: true,
        loading: false,
        skeleton: false,
      );
      const cannotInteractConfig = DSAvatarConfig(
        onTap: _mockCallback,
        enabled: false,
      );

      expect(canInteractConfig.canInteract, isTrue);
      expect(cannotInteractConfig.canInteract, isFalse);
    });

    test('should detect content properties correctly', () {
      const configWithImageUrl =
          DSAvatarConfig(imageUrl: 'http://example.com');
      const configWithInitials = DSAvatarConfig(initials: 'AB');
      const configWithGroupImages = DSAvatarConfig(groupImageUrls: ['url1']);
      const configWithGroupInitials = DSAvatarConfig(groupInitials: ['AB']);
      const configWithPresence = DSAvatarConfig(
        presence: DSAvatarPresence.online,
        showPresence: true,
      );
      const emptyConfig = DSAvatarConfig();

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
      const singleName = DSAvatarConfig(initials: 'John');
      const fullName = DSAvatarConfig(initials: 'John Doe');
      const threeName = DSAvatarConfig(initials: 'John Michael Doe');
      const singleLetter = DSAvatarConfig(initials: 'A');
      const emptyInitials = DSAvatarConfig(initials: '');

      expect(singleName.displayInitials, 'JO');
      expect(fullName.displayInitials, 'JD');
      expect(threeName.displayInitials, 'JM');
      expect(singleLetter.displayInitials, 'A');
      expect(emptyInitials.displayInitials, '');
    });

    test('should calculate remaining group count correctly', () {
      const normalGroup = DSAvatarConfig(
        variant: DSAvatarVariant.group,
        groupInitials: ['A', 'B', 'C'],
        maxGroupCount: 2,
      );
      const smallGroup = DSAvatarConfig(
        variant: DSAvatarVariant.group,
        groupInitials: ['A', 'B'],
        maxGroupCount: 3,
      );
      const nonGroup = DSAvatarConfig(
        variant: DSAvatarVariant.initials,
        groupInitials: ['A', 'B', 'C'],
        maxGroupCount: 2,
      );

      expect(normalGroup.remainingGroupCount, 1);
      expect(smallGroup.remainingGroupCount, 0);
      expect(nonGroup.remainingGroupCount, 0);
    });

    test('should return correct border width', () {
      const withBorder = DSAvatarConfig(showBorder: true);
      const withCustomBorderWidth = DSAvatarConfig(borderWidth: 5.0);
      const noBorder = DSAvatarConfig(showBorder: false);

      expect(withBorder.getEffectiveBorderWidth(),
          DSAvatarConstants.defaultBorderWidth);
      expect(withCustomBorderWidth.getEffectiveBorderWidth(), 5.0);
      expect(noBorder.getEffectiveBorderWidth(), 0.0);
    });
  });

  group('DSAvatarVariant', () {
    test('should have correct extension properties', () {
      expect(DSAvatarVariant.image.isImage, isTrue);
      expect(DSAvatarVariant.image.isInitials, isFalse);
      expect(DSAvatarVariant.image.isGroup, isFalse);

      expect(DSAvatarVariant.initials.isImage, isFalse);
      expect(DSAvatarVariant.initials.isInitials, isTrue);
      expect(DSAvatarVariant.initials.isGroup, isFalse);

      expect(DSAvatarVariant.group.isImage, isFalse);
      expect(DSAvatarVariant.group.isInitials, isFalse);
      expect(DSAvatarVariant.group.isGroup, isTrue);
    });
  });

  group('DSAvatarPresence', () {
    test('should have correct labels', () {
      expect(DSAvatarPresence.online.label, 'En línea');
      expect(DSAvatarPresence.offline.label, 'Desconectado');
      expect(DSAvatarPresence.away.label, 'Ausente');
      expect(DSAvatarPresence.busy.label, 'Ocupado');
      expect(DSAvatarPresence.doNotDisturb.label, 'No molestar');
    });

    test('should have correct icons', () {
      expect(DSAvatarPresence.online.icon, Icons.circle);
      expect(DSAvatarPresence.offline.icon, Icons.circle_outlined);
      expect(DSAvatarPresence.away.icon, Icons.schedule);
      expect(DSAvatarPresence.busy.icon, Icons.circle);
      expect(DSAvatarPresence.doNotDisturb.icon, Icons.do_not_disturb_on);
    });
  });

  group('DSAvatarSize', () {
    test('should have correct sizes', () {
      expect(DSAvatarSize.xxsmall.size, 20.0);
      expect(DSAvatarSize.xsmall.size, 24.0);
      expect(DSAvatarSize.small.size, 32.0);
      expect(DSAvatarSize.medium.size, 40.0);
      expect(DSAvatarSize.large.size, 48.0);
      expect(DSAvatarSize.xlarge.size, 56.0);
      expect(DSAvatarSize.xxlarge.size, 64.0);
    });

    test('should have correct font sizes', () {
      expect(DSAvatarSize.xxsmall.fontSize, 8.0);
      expect(DSAvatarSize.xsmall.fontSize, 10.0);
      expect(DSAvatarSize.small.fontSize, 12.0);
      expect(DSAvatarSize.medium.fontSize, 16.0);
      expect(DSAvatarSize.large.fontSize, 18.0);
      expect(DSAvatarSize.xlarge.fontSize, 20.0);
      expect(DSAvatarSize.xxlarge.fontSize, 24.0);
    });

    test('should have correct icon sizes', () {
      expect(DSAvatarSize.xxsmall.iconSize, 10.0);
      expect(DSAvatarSize.xsmall.iconSize, 12.0);
      expect(DSAvatarSize.small.iconSize, 16.0);
      expect(DSAvatarSize.medium.iconSize, 20.0);
      expect(DSAvatarSize.large.iconSize, 24.0);
      expect(DSAvatarSize.xlarge.iconSize, 28.0);
      expect(DSAvatarSize.xxlarge.iconSize, 32.0);
    });

    test('should have correct presence sizes', () {
      expect(DSAvatarSize.xxsmall.presenceSize, 6.0);
      expect(DSAvatarSize.xsmall.presenceSize, 8.0);
      expect(DSAvatarSize.small.presenceSize, 10.0);
      expect(DSAvatarSize.medium.presenceSize, 12.0);
      expect(DSAvatarSize.large.presenceSize, 14.0);
      expect(DSAvatarSize.xlarge.presenceSize, 16.0);
      expect(DSAvatarSize.xxlarge.presenceSize, 18.0);
    });

    test('should calculate group overlap correctly', () {
      expect(DSAvatarSize.medium.groupOverlap, 10.0); // 40 * 0.25
      expect(DSAvatarSize.large.groupOverlap, 12.0); // 48 * 0.25
    });
  });

  group('DSAvatarShape', () {
    test('should generate correct border radius', () {
      final circleRadius = DSAvatarShape.circle.getBorderRadius(40.0);
      expect(circleRadius, BorderRadius.circular(20.0));

      final squareRadius = DSAvatarShape.square.getBorderRadius(40.0);
      expect(squareRadius, BorderRadius.zero);

      final roundedRadius = DSAvatarShape.rounded.getBorderRadius(40.0);
      expect(roundedRadius, BorderRadius.circular(5.0)); // 40 * 0.125
    });

    test('should have correct box shapes', () {
      expect(DSAvatarShape.circle.boxShape, BoxShape.circle);
      expect(DSAvatarShape.square.boxShape, BoxShape.rectangle);
      expect(DSAvatarShape.rounded.boxShape, BoxShape.rectangle);
    });
  });

  group('DSAvatarState', () {
    test('should detect interactive states correctly', () {
      expect(DSAvatarState.hover.isInteractiveState, isTrue);
      expect(DSAvatarState.pressed.isInteractiveState, isTrue);
      expect(DSAvatarState.focus.isInteractiveState, isTrue);
      expect(DSAvatarState.defaultState.isInteractiveState, isFalse);
      expect(DSAvatarState.disabled.isInteractiveState, isFalse);
    });

    test('should detect special states correctly', () {
      expect(DSAvatarState.disabled.isDisabledState, isTrue);
      expect(DSAvatarState.loading.isLoadingState, isTrue);
      expect(DSAvatarState.skeleton.isSkeletonState, isTrue);
      expect(DSAvatarState.selected.isSelectedState, isTrue);
      expect(DSAvatarState.defaultState.isDisabledState, isFalse);
    });
  });
}

void _mockCallback() {
  // Mock callback for testing
}
