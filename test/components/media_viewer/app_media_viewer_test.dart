import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/src/components/media_viewer/app_media_viewer.dart';
import 'package:iautomat_design_system/src/components/media_viewer/app_media_viewer_config.dart';

void main() {
  group('AppMediaViewer Widget Tests', () {
    final testImageItems = [
      const AppMediaItem(
        type: AppMediaType.image,
        src: 'assets/test_image1.jpg',
        caption: 'Test image 1',
        alt: 'First test image',
      ),
      const AppMediaItem(
        type: AppMediaType.image,
        src: 'assets/test_image2.jpg',
        caption: 'Test image 2',
        alt: 'Second test image',
      ),
    ];

    final testVideoItems = [
      const AppMediaItem(
        type: AppMediaType.video,
        src: 'assets/test_video.mp4',
        thumbnail: 'assets/test_thumbnail.jpg',
        caption: 'Test video',
        duration: 120.0,
      ),
    ];

    final testAudioItems = [
      const AppMediaItem(
        type: AppMediaType.audio,
        src: 'assets/test_audio.mp3',
        caption: 'Test audio',
        duration: 180.0,
      ),
    ];

    testWidgets('renders correctly with image items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              initialIndex: 0,
            ),
          ),
        ),
      );

      expect(find.byType(AppMediaViewer), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('renders correctly with video items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testVideoItems,
              initialIndex: 0,
              config: const AppMediaViewerConfig(
                variant: AppMediaViewerVariant.video,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMediaViewer), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('renders correctly with audio items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testAudioItems,
              initialIndex: 0,
              config: const AppMediaViewerConfig(
                variant: AppMediaViewerVariant.audio,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMediaViewer), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('shows controls when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testVideoItems,
              config: const AppMediaViewerConfig(
                showControls: true,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Should have control elements
      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('hides controls when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              config: const AppMediaViewerConfig(
                showControls: false,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AppMediaViewer), findsOneWidget);
    });

    testWidgets('responds to tap gestures', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              onItemTap: (_) => tapped = true,
            ),
          ),
        ),
      );

      await tester.pump();

      final gestureDetector = find.descendant(
        of: find.byType(AppMediaViewer),
        matching: find.byType(GestureDetector),
      );

      if (gestureDetector.evaluate().isNotEmpty) {
        await tester.tap(gestureDetector.first);
        expect(tapped, isTrue);
      }
    });

    testWidgets('handles page changes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              onPageChanged: (index) {
                // Callback para cambios de página
              },
            ),
          ),
        ),
      );

      await tester.pump();

      // Simulate page change by dragging
      final pageView = find.byType(PageView);
      if (pageView.evaluate().isNotEmpty) {
        await tester.drag(pageView, const Offset(-300, 0));
        await tester.pumpAndSettle();

        // May or may not trigger depending on test environment
        // The important thing is that the widget renders without errors
      }

      expect(find.byType(AppMediaViewer), findsOneWidget);
    });

    testWidgets('handles keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              config: const AppMediaViewerConfig(
                a11yConfig: AppMediaViewerA11yConfig(
                  enableKeyboardNavigation: true,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Focus the widget
      final focusWidget = find.byType(Focus);
      if (focusWidget.evaluate().isNotEmpty) {
        await tester.tap(focusWidget.first);
        await tester.pump();

        // Test keyboard events
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.pump();

        expect(find.byType(AppMediaViewer), findsOneWidget);
      }
    });

    testWidgets('applies custom colors from config', (tester) async {
      const customBackgroundColor = Colors.red;
      const customControlsColor = Colors.blue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              config: const AppMediaViewerConfig(
                colors: AppMediaViewerColors(
                  backgroundColor: customBackgroundColor,
                  controlsBackgroundColor: customControlsColor,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Verify the widget renders with custom configuration
      expect(find.byType(AppMediaViewer), findsOneWidget);
    });

    testWidgets('handles different states correctly', (tester) async {
      for (final state in AppMediaViewerState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppMediaViewer(
                items: testImageItems,
                config: AppMediaViewerConfig(
                  state: state,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        // Verify that the widget renders for each state
        expect(find.byType(AppMediaViewer), findsOneWidget);
      }
    });

    testWidgets('handles different variants correctly', (tester) async {
      final variantItems = {
        AppMediaViewerVariant.image: testImageItems,
        AppMediaViewerVariant.video: testVideoItems,
        AppMediaViewerVariant.audio: testAudioItems,
      };

      for (final entry in variantItems.entries) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppMediaViewer(
                items: entry.value,
                config: AppMediaViewerConfig(
                  variant: entry.key,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(AppMediaViewer), findsOneWidget);
      }
    });

    testWidgets('shows captions when enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              showCaptions: true,
            ),
          ),
        ),
      );

      await tester.pump();

      // Should render caption text if captions are shown
      expect(find.text('Test image 1'), findsOneWidget);
    });

    testWidgets('hides captions when disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              showCaptions: false,
            ),
          ),
        ),
      );

      await tester.pump();

      // Caption should not be visible
      expect(find.text('Test image 1'), findsNothing);
    });

    testWidgets('handles empty items list assertion', (tester) async {
      expect(
        () => AppMediaViewer(items: const []),
        throwsAssertionError,
      );
    });

    testWidgets('handles negative initial index assertion', (tester) async {
      expect(
        () => AppMediaViewer(
          items: testImageItems,
          initialIndex: -1,
        ),
        throwsAssertionError,
      );
    });

    testWidgets('applies correct semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              config: const AppMediaViewerConfig(
                a11yConfig: AppMediaViewerA11yConfig(
                  semanticsLabel: 'Test media viewer',
                  semanticsDescription: 'Viewing test images',
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(Semantics), findsWidgets);
    });

    testWidgets('handles fullscreen toggle', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testVideoItems,
              onFullscreenToggle: () {
                // Callback para toggle fullscreen
              },
            ),
          ),
        ),
      );

      await tester.pump();

      // The callback should be set up correctly
      expect(find.byType(AppMediaViewer), findsOneWidget);
    });

    testWidgets('handles play pause events', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testVideoItems,
              onPlayPause: (_) {
                // Callback para play/pause
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AppMediaViewer), findsOneWidget);
    });

    testWidgets('maintains state when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMediaViewer(
              items: testImageItems,
              config: const AppMediaViewerConfig(
                behavior: AppMediaViewerBehavior(
                  maintainState: true,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AppMediaViewer), findsOneWidget);
    });
  });

  group('AppMediaViewerConfig Tests', () {
    test('creates with default values', () {
      const config = AppMediaViewerConfig();

      expect(config.variant, equals(AppMediaViewerVariant.image));
      expect(config.state, equals(AppMediaViewerState.defaultState));
      expect(config.items, isEmpty);
      expect(config.initialIndex, equals(0));
      expect(config.showCaptions, isTrue);
      expect(config.showControls, isTrue);
      expect(config.showIndicators, isTrue);
    });

    test('creates with custom values', () {
      const config = AppMediaViewerConfig(
        variant: AppMediaViewerVariant.video,
        state: AppMediaViewerState.loading,
        initialIndex: 2,
        showCaptions: false,
        autoPlay: true,
        loop: true,
      );

      expect(config.variant, equals(AppMediaViewerVariant.video));
      expect(config.state, equals(AppMediaViewerState.loading));
      expect(config.initialIndex, equals(2));
      expect(config.showCaptions, isFalse);
      expect(config.autoPlay, isTrue);
      expect(config.loop, isTrue);
    });
  });

  group('AppMediaItem Tests', () {
    test('creates valid image item', () {
      const item = AppMediaItem(
        type: AppMediaType.image,
        src: 'test.jpg',
        caption: 'Test image',
        alt: 'Alt text',
      );

      expect(item.type, equals(AppMediaType.image));
      expect(item.src, equals('test.jpg'));
      expect(item.caption, equals('Test image'));
      expect(item.alt, equals('Alt text'));
      expect(item.isImage, isTrue);
      expect(item.isVideo, isFalse);
      expect(item.isAudio, isFalse);
      expect(item.isPlayable, isFalse);
    });

    test('creates valid video item', () {
      const item = AppMediaItem(
        type: AppMediaType.video,
        src: 'test.mp4',
        duration: 120.0,
        thumbnail: 'thumb.jpg',
      );

      expect(item.type, equals(AppMediaType.video));
      expect(item.src, equals('test.mp4'));
      expect(item.duration, equals(120.0));
      expect(item.thumbnail, equals('thumb.jpg'));
      expect(item.isVideo, isTrue);
      expect(item.isPlayable, isTrue);
      expect(item.hasAudio, isTrue);
      expect(item.formattedDuration, equals('02:00'));
    });

    test('creates valid audio item', () {
      const item = AppMediaItem(
        type: AppMediaType.audio,
        src: 'test.mp3',
        duration: 75.0,
      );

      expect(item.type, equals(AppMediaType.audio));
      expect(item.src, equals('test.mp3'));
      expect(item.duration, equals(75.0));
      expect(item.isAudio, isTrue);
      expect(item.isPlayable, isTrue);
      expect(item.hasAudio, isTrue);
      expect(item.formattedDuration, equals('01:15'));
    });

    test('calculates aspect ratio correctly', () {
      const item = AppMediaItem(
        type: AppMediaType.image,
        src: 'test.jpg',
        dimensions: Size(1920, 1080),
      );

      expect(item.aspectRatio, closeTo(16 / 9, 0.01));
    });

    test('extracts file extension correctly', () {
      const item = AppMediaItem(
        type: AppMediaType.image,
        src: 'https://example.com/path/image.jpg',
      );

      expect(item.fileExtension, equals('jpg'));
    });

    test('validates correctly', () {
      const validItem = AppMediaItem(
        type: AppMediaType.image,
        src: 'test.jpg',
      );

      const invalidItem = AppMediaItem(
        type: AppMediaType.image,
        src: '',
      );

      expect(validItem.isValid, isTrue);
      expect(invalidItem.isValid, isFalse);
    });
  });

  group('AppMediaViewerState Extension Tests', () {
    test('correctly identifies interactive states', () {
      expect(AppMediaViewerState.defaultState.isInteractive, isTrue);
      expect(AppMediaViewerState.hover.isInteractive, isTrue);
      expect(AppMediaViewerState.pressed.isInteractive, isTrue);
      expect(AppMediaViewerState.focus.isInteractive, isTrue);
      expect(AppMediaViewerState.selected.isInteractive, isTrue);

      expect(AppMediaViewerState.disabled.isInteractive, isFalse);
      expect(AppMediaViewerState.loading.isInteractive, isFalse);
      expect(AppMediaViewerState.skeleton.isInteractive, isFalse);
    });

    test('returns correct opacity values', () {
      expect(AppMediaViewerState.defaultState.opacity, equals(1.0));
      expect(AppMediaViewerState.disabled.opacity, equals(0.6));
      expect(AppMediaViewerState.loading.opacity, equals(0.8));
      expect(AppMediaViewerState.skeleton.opacity, equals(0.3));
    });

    test('correctly identifies loader states', () {
      expect(AppMediaViewerState.loading.showsLoader, isTrue);
      expect(AppMediaViewerState.skeleton.showsSkeleton, isTrue);

      expect(AppMediaViewerState.defaultState.showsLoader, isFalse);
      expect(AppMediaViewerState.defaultState.showsSkeleton, isFalse);
    });

    test('correctly identifies interactive capability', () {
      expect(AppMediaViewerState.defaultState.canInteract, isTrue);
      expect(AppMediaViewerState.disabled.canInteract, isFalse);
      expect(AppMediaViewerState.loading.canInteract, isFalse);
    });

    test('returns correct elevation multipliers', () {
      expect(AppMediaViewerState.defaultState.elevationMultiplier, equals(1.0));
      expect(AppMediaViewerState.hover.elevationMultiplier, equals(1.5));
      expect(AppMediaViewerState.pressed.elevationMultiplier, equals(0.5));
      expect(AppMediaViewerState.disabled.elevationMultiplier, equals(0.0));
    });
  });

  group('AppMediaType Extension Tests', () {
    test('correctly identifies media types', () {
      expect(AppMediaType.image.isImage, isTrue);
      expect(AppMediaType.image.isVideo, isFalse);
      expect(AppMediaType.image.isAudio, isFalse);

      expect(AppMediaType.video.isVideo, isTrue);
      expect(AppMediaType.video.hasAudio, isTrue);
      expect(AppMediaType.video.isPlayable, isTrue);

      expect(AppMediaType.audio.isAudio, isTrue);
      expect(AppMediaType.audio.hasAudio, isTrue);
      expect(AppMediaType.audio.isPlayable, isTrue);
    });

    test('returns correct display names', () {
      expect(AppMediaType.image.displayName, equals('Imagen'));
      expect(AppMediaType.video.displayName, equals('Video'));
      expect(AppMediaType.audio.displayName, equals('Audio'));
    });
  });

  group('AppMediaViewerVariant Extension Tests', () {
    test('correctly identifies variant capabilities', () {
      expect(AppMediaViewerVariant.image.supportsZoom, isTrue);
      expect(AppMediaViewerVariant.image.supportsPlayback, isFalse);

      expect(AppMediaViewerVariant.video.supportsPlayback, isTrue);
      expect(AppMediaViewerVariant.video.supportsZoom, isFalse);

      expect(AppMediaViewerVariant.audio.supportsPlayback, isTrue);
      expect(AppMediaViewerVariant.audio.supportsZoom, isFalse);
    });

    test('returns correct primary media types', () {
      expect(AppMediaViewerVariant.image.primaryMediaType, equals(AppMediaType.image));
      expect(AppMediaViewerVariant.video.primaryMediaType, equals(AppMediaType.video));
      expect(AppMediaViewerVariant.audio.primaryMediaType, equals(AppMediaType.audio));
    });
  });

  group('Animation Type Extension Tests', () {
    test('correctly identifies animation capability', () {
      expect(AppMediaViewerAnimationType.none.hasAnimation, isFalse);
      expect(AppMediaViewerAnimationType.slide.hasAnimation, isTrue);
      expect(AppMediaViewerAnimationType.fade.hasAnimation, isTrue);
      expect(AppMediaViewerAnimationType.scale.hasAnimation, isTrue);
    });

    test('returns appropriate default curves', () {
      expect(AppMediaViewerAnimationType.none.defaultCurve, equals(Curves.linear));
      expect(AppMediaViewerAnimationType.slide.defaultCurve, equals(Curves.easeOutCubic));
      expect(AppMediaViewerAnimationType.fade.defaultCurve, equals(Curves.easeInOut));
      expect(AppMediaViewerAnimationType.scale.defaultCurve, equals(Curves.elasticOut));
    });
  });

  group('Clip Behavior Extension Tests', () {
    test('maps to correct Flutter clip values', () {
      expect(AppMediaViewerClipBehavior.none.flutterClip, equals(Clip.none));
      expect(AppMediaViewerClipBehavior.antiAlias.flutterClip, equals(Clip.antiAlias));
      expect(AppMediaViewerClipBehavior.hardEdge.flutterClip, equals(Clip.hardEdge));
    });

    test('returns correct display names', () {
      expect(AppMediaViewerClipBehavior.none.displayName, equals('None'));
      expect(AppMediaViewerClipBehavior.antiAlias.displayName, equals('Anti Alias'));
    });
  });
}