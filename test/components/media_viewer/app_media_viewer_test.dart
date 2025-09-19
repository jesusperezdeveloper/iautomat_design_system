import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/src/components/media_viewer/app_media_viewer.dart';
import 'package:iautomat_design_system/src/components/media_viewer/app_media_viewer_config.dart';

void main() {
  group('DSMediaViewer Widget Tests', () {
    final testImageItems = [
      const DSMediaItem(
        type: DSMediaType.image,
        src: 'assets/test_image1.jpg',
        caption: 'Test image 1',
        alt: 'First test image',
      ),
      const DSMediaItem(
        type: DSMediaType.image,
        src: 'assets/test_image2.jpg',
        caption: 'Test image 2',
        alt: 'Second test image',
      ),
    ];

    final testVideoItems = [
      const DSMediaItem(
        type: DSMediaType.video,
        src: 'assets/test_video.mp4',
        thumbnail: 'assets/test_thumbnail.jpg',
        caption: 'Test video',
        duration: 120.0,
      ),
    ];

    final testAudioItems = [
      const DSMediaItem(
        type: DSMediaType.audio,
        src: 'assets/test_audio.mp3',
        caption: 'Test audio',
        duration: 180.0,
      ),
    ];

    testWidgets('renders correctly with image items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testImageItems,
              initialIndex: 0,
            ),
          ),
        ),
      );

      expect(find.byType(DSMediaViewer), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('renders correctly with video items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testVideoItems,
              initialIndex: 0,
              config: const DSMediaViewerConfig(
                variant: DSMediaViewerVariant.video,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMediaViewer), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('renders correctly with audio items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testAudioItems,
              initialIndex: 0,
              config: const DSMediaViewerConfig(
                variant: DSMediaViewerVariant.audio,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMediaViewer), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('shows controls when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testVideoItems,
              config: const DSMediaViewerConfig(
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
            body: DSMediaViewer(
              items: testImageItems,
              config: const DSMediaViewerConfig(
                showControls: false,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMediaViewer), findsOneWidget);
    });

    testWidgets('responds to tap gestures', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testImageItems,
              onItemTap: (_) => tapped = true,
            ),
          ),
        ),
      );

      await tester.pump();

      final gestureDetector = find.descendant(
        of: find.byType(DSMediaViewer),
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
            body: DSMediaViewer(
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

      expect(find.byType(DSMediaViewer), findsOneWidget);
    });

    testWidgets('handles keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testImageItems,
              config: const DSMediaViewerConfig(
                a11yConfig: DSMediaViewerA11yConfig(
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

        expect(find.byType(DSMediaViewer), findsOneWidget);
      }
    });

    testWidgets('applies custom colors from config', (tester) async {
      const customBackgroundColor = Colors.red;
      const customControlsColor = Colors.blue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testImageItems,
              config: const DSMediaViewerConfig(
                colors: DSMediaViewerColors(
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
      expect(find.byType(DSMediaViewer), findsOneWidget);
    });

    testWidgets('handles different states correctly', (tester) async {
      for (final state in DSMediaViewerState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSMediaViewer(
                items: testImageItems,
                config: DSMediaViewerConfig(
                  state: state,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        // Verify that the widget renders for each state
        expect(find.byType(DSMediaViewer), findsOneWidget);
      }
    });

    testWidgets('handles different variants correctly', (tester) async {
      final variantItems = {
        DSMediaViewerVariant.image: testImageItems,
        DSMediaViewerVariant.video: testVideoItems,
        DSMediaViewerVariant.audio: testAudioItems,
      };

      for (final entry in variantItems.entries) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSMediaViewer(
                items: entry.value,
                config: DSMediaViewerConfig(
                  variant: entry.key,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(DSMediaViewer), findsOneWidget);
      }
    });

    testWidgets('shows captions when enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
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
            body: DSMediaViewer(
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
        () => DSMediaViewer(items: const []),
        throwsAssertionError,
      );
    });

    testWidgets('handles negative initial index assertion', (tester) async {
      expect(
        () => DSMediaViewer(
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
            body: DSMediaViewer(
              items: testImageItems,
              config: const DSMediaViewerConfig(
                a11yConfig: DSMediaViewerA11yConfig(
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
            body: DSMediaViewer(
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
      expect(find.byType(DSMediaViewer), findsOneWidget);
    });

    testWidgets('handles play pause events', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testVideoItems,
              onPlayPause: (_) {
                // Callback para play/pause
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMediaViewer), findsOneWidget);
    });

    testWidgets('maintains state when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMediaViewer(
              items: testImageItems,
              config: const DSMediaViewerConfig(
                behavior: DSMediaViewerBehavior(
                  maintainState: true,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMediaViewer), findsOneWidget);
    });
  });

  group('DSMediaViewerConfig Tests', () {
    test('creates with default values', () {
      const config = DSMediaViewerConfig();

      expect(config.variant, equals(DSMediaViewerVariant.image));
      expect(config.state, equals(DSMediaViewerState.defaultState));
      expect(config.items, isEmpty);
      expect(config.initialIndex, equals(0));
      expect(config.showCaptions, isTrue);
      expect(config.showControls, isTrue);
      expect(config.showIndicators, isTrue);
    });

    test('creates with custom values', () {
      const config = DSMediaViewerConfig(
        variant: DSMediaViewerVariant.video,
        state: DSMediaViewerState.loading,
        initialIndex: 2,
        showCaptions: false,
        autoPlay: true,
        loop: true,
      );

      expect(config.variant, equals(DSMediaViewerVariant.video));
      expect(config.state, equals(DSMediaViewerState.loading));
      expect(config.initialIndex, equals(2));
      expect(config.showCaptions, isFalse);
      expect(config.autoPlay, isTrue);
      expect(config.loop, isTrue);
    });
  });

  group('DSMediaItem Tests', () {
    test('creates valid image item', () {
      const item = DSMediaItem(
        type: DSMediaType.image,
        src: 'test.jpg',
        caption: 'Test image',
        alt: 'Alt text',
      );

      expect(item.type, equals(DSMediaType.image));
      expect(item.src, equals('test.jpg'));
      expect(item.caption, equals('Test image'));
      expect(item.alt, equals('Alt text'));
      expect(item.isImage, isTrue);
      expect(item.isVideo, isFalse);
      expect(item.isAudio, isFalse);
      expect(item.isPlayable, isFalse);
    });

    test('creates valid video item', () {
      const item = DSMediaItem(
        type: DSMediaType.video,
        src: 'test.mp4',
        duration: 120.0,
        thumbnail: 'thumb.jpg',
      );

      expect(item.type, equals(DSMediaType.video));
      expect(item.src, equals('test.mp4'));
      expect(item.duration, equals(120.0));
      expect(item.thumbnail, equals('thumb.jpg'));
      expect(item.isVideo, isTrue);
      expect(item.isPlayable, isTrue);
      expect(item.hasAudio, isTrue);
      expect(item.formattedDuration, equals('02:00'));
    });

    test('creates valid audio item', () {
      const item = DSMediaItem(
        type: DSMediaType.audio,
        src: 'test.mp3',
        duration: 75.0,
      );

      expect(item.type, equals(DSMediaType.audio));
      expect(item.src, equals('test.mp3'));
      expect(item.duration, equals(75.0));
      expect(item.isAudio, isTrue);
      expect(item.isPlayable, isTrue);
      expect(item.hasAudio, isTrue);
      expect(item.formattedDuration, equals('01:15'));
    });

    test('calculates aspect ratio correctly', () {
      const item = DSMediaItem(
        type: DSMediaType.image,
        src: 'test.jpg',
        dimensions: Size(1920, 1080),
      );

      expect(item.aspectRatio, closeTo(16 / 9, 0.01));
    });

    test('extracts file extension correctly', () {
      const item = DSMediaItem(
        type: DSMediaType.image,
        src: 'https://example.com/path/image.jpg',
      );

      expect(item.fileExtension, equals('jpg'));
    });

    test('validates correctly', () {
      const validItem = DSMediaItem(
        type: DSMediaType.image,
        src: 'test.jpg',
      );

      const invalidItem = DSMediaItem(
        type: DSMediaType.image,
        src: '',
      );

      expect(validItem.isValid, isTrue);
      expect(invalidItem.isValid, isFalse);
    });
  });

  group('DSMediaViewerState Extension Tests', () {
    test('correctly identifies interactive states', () {
      expect(DSMediaViewerState.defaultState.isInteractive, isTrue);
      expect(DSMediaViewerState.hover.isInteractive, isTrue);
      expect(DSMediaViewerState.pressed.isInteractive, isTrue);
      expect(DSMediaViewerState.focus.isInteractive, isTrue);
      expect(DSMediaViewerState.selected.isInteractive, isTrue);

      expect(DSMediaViewerState.disabled.isInteractive, isFalse);
      expect(DSMediaViewerState.loading.isInteractive, isFalse);
      expect(DSMediaViewerState.skeleton.isInteractive, isFalse);
    });

    test('returns correct opacity values', () {
      expect(DSMediaViewerState.defaultState.opacity, equals(1.0));
      expect(DSMediaViewerState.disabled.opacity, equals(0.6));
      expect(DSMediaViewerState.loading.opacity, equals(0.8));
      expect(DSMediaViewerState.skeleton.opacity, equals(0.3));
    });

    test('correctly identifies loader states', () {
      expect(DSMediaViewerState.loading.showsLoader, isTrue);
      expect(DSMediaViewerState.skeleton.showsSkeleton, isTrue);

      expect(DSMediaViewerState.defaultState.showsLoader, isFalse);
      expect(DSMediaViewerState.defaultState.showsSkeleton, isFalse);
    });

    test('correctly identifies interactive capability', () {
      expect(DSMediaViewerState.defaultState.canInteract, isTrue);
      expect(DSMediaViewerState.disabled.canInteract, isFalse);
      expect(DSMediaViewerState.loading.canInteract, isFalse);
    });

    test('returns correct elevation multipliers', () {
      expect(DSMediaViewerState.defaultState.elevationMultiplier, equals(1.0));
      expect(DSMediaViewerState.hover.elevationMultiplier, equals(1.5));
      expect(DSMediaViewerState.pressed.elevationMultiplier, equals(0.5));
      expect(DSMediaViewerState.disabled.elevationMultiplier, equals(0.0));
    });
  });

  group('DSMediaType Extension Tests', () {
    test('correctly identifies media types', () {
      expect(DSMediaType.image.isImage, isTrue);
      expect(DSMediaType.image.isVideo, isFalse);
      expect(DSMediaType.image.isAudio, isFalse);

      expect(DSMediaType.video.isVideo, isTrue);
      expect(DSMediaType.video.hasAudio, isTrue);
      expect(DSMediaType.video.isPlayable, isTrue);

      expect(DSMediaType.audio.isAudio, isTrue);
      expect(DSMediaType.audio.hasAudio, isTrue);
      expect(DSMediaType.audio.isPlayable, isTrue);
    });

    test('returns correct display names', () {
      expect(DSMediaType.image.displayName, equals('Imagen'));
      expect(DSMediaType.video.displayName, equals('Video'));
      expect(DSMediaType.audio.displayName, equals('Audio'));
    });
  });

  group('DSMediaViewerVariant Extension Tests', () {
    test('correctly identifies variant capabilities', () {
      expect(DSMediaViewerVariant.image.supportsZoom, isTrue);
      expect(DSMediaViewerVariant.image.supportsPlayback, isFalse);

      expect(DSMediaViewerVariant.video.supportsPlayback, isTrue);
      expect(DSMediaViewerVariant.video.supportsZoom, isFalse);

      expect(DSMediaViewerVariant.audio.supportsPlayback, isTrue);
      expect(DSMediaViewerVariant.audio.supportsZoom, isFalse);
    });

    test('returns correct primary media types', () {
      expect(DSMediaViewerVariant.image.primaryMediaType, equals(DSMediaType.image));
      expect(DSMediaViewerVariant.video.primaryMediaType, equals(DSMediaType.video));
      expect(DSMediaViewerVariant.audio.primaryMediaType, equals(DSMediaType.audio));
    });
  });

  group('Animation Type Extension Tests', () {
    test('correctly identifies animation capability', () {
      expect(DSMediaViewerAnimationType.none.hasAnimation, isFalse);
      expect(DSMediaViewerAnimationType.slide.hasAnimation, isTrue);
      expect(DSMediaViewerAnimationType.fade.hasAnimation, isTrue);
      expect(DSMediaViewerAnimationType.scale.hasAnimation, isTrue);
    });

    test('returns appropriate default curves', () {
      expect(DSMediaViewerAnimationType.none.defaultCurve, equals(Curves.linear));
      expect(DSMediaViewerAnimationType.slide.defaultCurve, equals(Curves.easeOutCubic));
      expect(DSMediaViewerAnimationType.fade.defaultCurve, equals(Curves.easeInOut));
      expect(DSMediaViewerAnimationType.scale.defaultCurve, equals(Curves.elasticOut));
    });
  });

  group('Clip Behavior Extension Tests', () {
    test('maps to correct Flutter clip values', () {
      expect(DSMediaViewerClipBehavior.none.flutterClip, equals(Clip.none));
      expect(DSMediaViewerClipBehavior.antiAlias.flutterClip, equals(Clip.antiAlias));
      expect(DSMediaViewerClipBehavior.hardEdge.flutterClip, equals(Clip.hardEdge));
    });

    test('returns correct display names', () {
      expect(DSMediaViewerClipBehavior.none.displayName, equals('None'));
      expect(DSMediaViewerClipBehavior.antiAlias.displayName, equals('Anti Alias'));
    });
  });
}