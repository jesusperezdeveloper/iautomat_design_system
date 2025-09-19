import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/src/components/media_viewer/ds_media_viewer.dart';
import 'package:iautomat_design_system/src/components/media_viewer/ds_media_viewer_config.dart';

void main() {
  group('DSMediaViewer Golden Tests', () {
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
        caption: 'Test audio track',
        duration: 180.0,
      ),
    ];

    testWidgets('image viewer default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  initialIndex: 0,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.image,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_image_default.png'),
      );
    });

    testWidgets('video viewer default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testVideoItems,
                  initialIndex: 0,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.video,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_video_default.png'),
      );
    });

    testWidgets('audio viewer default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testAudioItems,
                  initialIndex: 0,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.audio,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_audio_default.png'),
      );
    });

    testWidgets('loading state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.loading,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_loading.png'),
      );
    });

    testWidgets('skeleton state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.skeleton,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_skeleton.png'),
      );
    });

    testWidgets('disabled state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.disabled,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_disabled.png'),
      );
    });

    testWidgets('hover state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.hover,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_hover.png'),
      );
    });

    testWidgets('pressed state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.pressed,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_pressed.png'),
      );
    });

    testWidgets('focus state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.focus,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_focus.png'),
      );
    });

    testWidgets('selected state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    state: DSMediaViewerState.selected,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_selected.png'),
      );
    });

    testWidgets('with captions golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  showCaptions: true,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.image,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_with_captions.png'),
      );
    });

    testWidgets('without captions golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  showCaptions: false,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.image,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_without_captions.png'),
      );
    });

    testWidgets('custom colors golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testVideoItems,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.video,
                    colors: DSMediaViewerColors(
                      backgroundColor: Colors.red,
                      controlsBackgroundColor: Colors.blue,
                      controlsIconColor: Colors.yellow,
                      activeIndicatorColor: Colors.green,
                    ),
                    spacing: DSMediaViewerSpacing(
                      borderWidth: 3.0,
                      borderRadius: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_custom_colors.png'),
      );
    });

    testWidgets('rounded corners golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    spacing: DSMediaViewerSpacing(
                      borderRadius: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_rounded.png'),
      );
    });

    testWidgets('with elevation golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    elevation: DSMediaViewerElevation(
                      defaultElevation: 8.0,
                      controlsElevation: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_elevation.png'),
      );
    });

    testWidgets('small size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: DSMediaViewer(
                  items: testImageItems,
                  config: const DSMediaViewerConfig(
                    spacing: DSMediaViewerSpacing(
                      controlsIconSize: 16.0,
                      controlsBarHeight: 40.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_small.png'),
      );
    });

    testWidgets('large size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 800,
                height: 600,
                child: DSMediaViewer(
                  items: testVideoItems,
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.video,
                    spacing: DSMediaViewerSpacing(
                      controlsIconSize: 32.0,
                      controlsBarHeight: 80.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_large.png'),
      );
    });

    testWidgets('multiple items indicator golden test', (tester) async {
      final multipleItems = [
        ...testImageItems,
        const DSMediaItem(
          type: DSMediaType.image,
          src: 'assets/test_image3.jpg',
          caption: 'Test image 3',
        ),
        const DSMediaItem(
          type: DSMediaType.image,
          src: 'assets/test_image4.jpg',
          caption: 'Test image 4',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: multipleItems,
                  initialIndex: 1,
                  config: const DSMediaViewerConfig(
                    showIndicators: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_multiple_items.png'),
      );
    });
  });

  group('DSMediaViewer Dark Mode Golden Tests', () {
    testWidgets('image viewer dark mode golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: [
                    const DSMediaItem(
                      type: DSMediaType.image,
                      src: 'assets/test_image1.jpg',
                      caption: 'Dark mode image',
                    ),
                  ],
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.image,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_dark_mode.png'),
      );
    });

    testWidgets('video viewer dark mode golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: [
                    const DSMediaItem(
                      type: DSMediaType.video,
                      src: 'assets/test_video.mp4',
                      caption: 'Dark mode video',
                      duration: 90.0,
                    ),
                  ],
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.video,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_dark_video.png'),
      );
    });

    testWidgets('audio viewer dark mode golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: DSMediaViewer(
                  items: [
                    const DSMediaItem(
                      type: DSMediaType.audio,
                      src: 'assets/test_audio.mp3',
                      caption: 'Dark mode audio',
                      duration: 200.0,
                    ),
                  ],
                  config: const DSMediaViewerConfig(
                    variant: DSMediaViewerVariant.audio,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSMediaViewer),
        matchesGoldenFile('goldens/app_media_viewer_dark_audio.png'),
      );
    });
  });
}