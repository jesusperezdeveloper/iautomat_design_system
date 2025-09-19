import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/lightbox/ds_lightbox.dart';
import 'package:iautomat_design_system/src/components/lightbox/ds_lightbox_config.dart';

void main() {
  group('DSLightbox Widget Tests', () {
    late List<DSLightboxImage> testImages;

    setUp(() {
      testImages = [
        const DSLightboxImage(
          id: 'test_1',
          imageProvider: AssetImage('assets/test/test_image_1.png'),
          title: 'Test Image 1',
          description: 'First test image',
          alt: 'Alt text for test image 1',
        ),
        const DSLightboxImage(
          id: 'test_2',
          imageProvider: AssetImage('assets/test/test_image_2.png'),
          title: 'Test Image 2',
          description: 'Second test image',
          alt: 'Alt text for test image 2',
        ),
        const DSLightboxImage(
          id: 'test_3',
          imageProvider: AssetImage('assets/test/test_image_3.png'),
          title: 'Test Image 3',
          description: 'Third test image',
          alt: 'Alt text for test image 3',
        ),
      ];
    });

    testWidgets('renders zoom lightbox correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.zoom,
            ),
            images: [testImages.first],
            onClose: () {},
          ),
        ),
      );

      expect(find.byType(DSLightbox), findsOneWidget);
      expect(find.byType(InteractiveViewer), findsOneWidget);
      expect(find.byType(PageView), findsNothing);
    });

    testWidgets('renders gallery lightbox correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
            ),
            images: testImages,
            onClose: () {},
          ),
        ),
      );

      expect(find.byType(DSLightbox), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(InteractiveViewer), findsOneWidget);
    });

    testWidgets('shows close button when enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              enableCloseButton: true,
            ),
            images: [testImages.first],
            onClose: () {},
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('hides close button when disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              enableCloseButton: false,
            ),
            images: [testImages.first],
            onClose: () {},
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('shows counter when enabled in gallery mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              enableCounter: true,
            ),
            images: testImages,
            onClose: () {},
          ),
        ),
      );

      expect(find.text('1 / 3'), findsOneWidget);
    });

    testWidgets('hides counter when disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              enableCounter: false,
            ),
            images: testImages,
            onClose: () {},
          ),
        ),
      );

      expect(find.text('1 / 3'), findsNothing);
    });

    testWidgets('shows thumbnails when enabled in gallery mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              enableThumbnails: true,
            ),
            images: testImages,
            onClose: () {},
          ),
        ),
      );

      // Should show thumbnails for all images
      expect(find.byType(GestureDetector), findsAtLeastNWidgets(3));
    });

    testWidgets('calls onClose when close button is tapped', (tester) async {
      bool wasCloseCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              enableCloseButton: true,
            ),
            images: [testImages.first],
            onClose: () => wasCloseCalled = true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      expect(wasCloseCalled, isTrue);
    });

    testWidgets('handles initial index correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              initialIndex: 1,
              enableCounter: true,
            ),
            images: testImages,
            onClose: () {},
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('2 / 3'), findsOneWidget);
    });

    testWidgets('calls onIndexChanged when page changes', (tester) async {
      int? lastIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
            ),
            images: testImages,
            onClose: () {},
            onIndexChanged: (index) => lastIndex = index,
          ),
        ),
      );

      // Swipe to next image
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      expect(lastIndex, equals(1));
    });

    testWidgets('responds to keyboard navigation when enabled', (tester) async {
      int? lastIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              enableKeyboardSupport: true,
            ),
            images: testImages,
            onClose: () {},
            onIndexChanged: (index) => lastIndex = index,
          ),
        ),
      );

      // Focus the lightbox
      await tester.tap(find.byType(DSLightbox));
      await tester.pumpAndSettle();

      // Press right arrow key
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();

      expect(lastIndex, equals(1));

      // Press left arrow key
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();

      expect(lastIndex, equals(0));
    });

    testWidgets('handles escape key to close when keyboard support enabled', (tester) async {
      bool wasCloseCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              enableKeyboardSupport: true,
            ),
            images: [testImages.first],
            onClose: () => wasCloseCalled = true,
          ),
        ),
      );

      // Focus the lightbox
      await tester.tap(find.byType(DSLightbox));
      await tester.pumpAndSettle();

      // Press escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      expect(wasCloseCalled, isTrue);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              state: DSLightboxState.loading,
            ),
            images: [testImages.first],
            onClose: () {},
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('applies custom colors correctly', (tester) async {
      const customColors = DSLightboxColors(
        backgroundColor: Colors.red,
        overlayColor: Colors.blue,
        controlsColor: Colors.green,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              colors: customColors,
              enableCloseButton: true,
            ),
            images: [testImages.first],
            onClose: () {},
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSLightbox),
          matching: find.byType(Container),
        ).first,
      );

      expect((container.decoration as BoxDecoration?)?.color, equals(Colors.red));
    });

    testWidgets('handles thumbnail tap correctly', (tester) async {
      int? lastIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              enableThumbnails: true,
            ),
            images: testImages,
            onClose: () {},
            onIndexChanged: (index) => lastIndex = index,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find and tap the third thumbnail (index 2)
      final thumbnails = find.byType(GestureDetector);
      if (thumbnails.evaluate().length >= 3) {
        await tester.tap(thumbnails.at(2));
        await tester.pumpAndSettle();
        expect(lastIndex, equals(2));
      }
    });

    testWidgets('respects RTL text direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: DSLightbox(
              config: const DSLightboxConfig(
                variant: DSLightboxVariant.gallery,
                enableCounter: true,
              ),
              images: testImages,
              onClose: () {},
            ),
          ),
        ),
      );

      expect(find.byType(DSLightbox), findsOneWidget);
      expect(find.text('1 / 3'), findsOneWidget);
    });

    testWidgets('handles gesture configuration correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              enabledGestures: {
                DSLightboxGesture.tap,
                DSLightboxGesture.pinchZoom,
              },
            ),
            images: [testImages.first],
            onClose: () {},
          ),
        ),
      );

      expect(find.byType(InteractiveViewer), findsOneWidget);
      expect(find.byType(GestureDetector), findsAtLeastNWidgets(1));
    });

    testWidgets('shows proper semantic labels', (tester) async {
      const customAccessibility = DSLightboxAccessibility(
        semanticLabel: 'Custom Lightbox',
        closeButtonLabel: 'Custom Close',
        counterLabel: 'Image {} of {}',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: DSLightbox(
            config: const DSLightboxConfig(
              variant: DSLightboxVariant.gallery,
              enableA11y: true,
              enableCloseButton: true,
              enableCounter: true,
              accessibility: customAccessibility,
            ),
            images: testImages,
            onClose: () {},
          ),
        ),
      );

      expect(find.bySemanticsLabel('Custom Lightbox'), findsOneWidget);
      expect(find.bySemanticsLabel('Custom Close'), findsOneWidget);
    });
  });

  group('DSLightboxConfig Tests', () {
    test('creates config with default values', () {
      const config = DSLightboxConfig();

      expect(config.variant, equals(DSLightboxVariant.zoom));
      expect(config.state, equals(DSLightboxState.defaultState));
      expect(config.initialIndex, equals(0));
      expect(config.enableCloseButton, isTrue);
      expect(config.enableCounter, isTrue);
      expect(config.enableThumbnails, isTrue);
      expect(config.enableZoom, isTrue);
      expect(config.minZoom, equals(0.5));
      expect(config.maxZoom, equals(5.0));
    });

    test('creates config with custom values', () {
      const config = DSLightboxConfig(
        variant: DSLightboxVariant.gallery,
        state: DSLightboxState.loading,
        initialIndex: 2,
        enableCloseButton: false,
        enableCounter: false,
        minZoom: 1.0,
        maxZoom: 10.0,
      );

      expect(config.variant, equals(DSLightboxVariant.gallery));
      expect(config.state, equals(DSLightboxState.loading));
      expect(config.initialIndex, equals(2));
      expect(config.enableCloseButton, isFalse);
      expect(config.enableCounter, isFalse);
      expect(config.minZoom, equals(1.0));
      expect(config.maxZoom, equals(10.0));
    });

    test('copyWith works correctly', () {
      const originalConfig = DSLightboxConfig();
      final modifiedConfig = originalConfig.copyWith(
        variant: DSLightboxVariant.gallery,
        enableCounter: false,
      );

      expect(modifiedConfig.variant, equals(DSLightboxVariant.gallery));
      expect(modifiedConfig.enableCounter, isFalse);
      expect(modifiedConfig.enableCloseButton, isTrue); // Should remain unchanged
      expect(modifiedConfig.initialIndex, equals(0)); // Should remain unchanged
    });

    test('equality works correctly', () {
      const config1 = DSLightboxConfig(
        variant: DSLightboxVariant.gallery,
        initialIndex: 1,
      );
      const config2 = DSLightboxConfig(
        variant: DSLightboxVariant.gallery,
        initialIndex: 1,
      );
      const config3 = DSLightboxConfig(
        variant: DSLightboxVariant.zoom,
        initialIndex: 1,
      );

      expect(config1, equals(config2));
      expect(config1, isNot(equals(config3)));
    });
  });

  group('DSLightboxImage Tests', () {
    test('creates image with required values', () {
      const image = DSLightboxImage(
        id: 'test_image',
        imageProvider: AssetImage('test.png'),
      );

      expect(image.id, equals('test_image'));
      expect(image.imageProvider, isA<AssetImage>());
      expect(image.title, isNull);
      expect(image.description, isNull);
      expect(image.alt, isNull);
      expect(image.fit, equals(BoxFit.contain));
      expect(image.isLoading, isFalse);
      expect(image.hasError, isFalse);
    });

    test('creates image with all values', () {
      const image = DSLightboxImage(
        id: 'test_image',
        imageProvider: AssetImage('test.png'),
        title: 'Test Title',
        description: 'Test Description',
        alt: 'Test Alt Text',
        fit: BoxFit.cover,
        isLoading: true,
        hasError: false,
        metadata: {'key': 'value'},
      );

      expect(image.id, equals('test_image'));
      expect(image.title, equals('Test Title'));
      expect(image.description, equals('Test Description'));
      expect(image.alt, equals('Test Alt Text'));
      expect(image.fit, equals(BoxFit.cover));
      expect(image.isLoading, isTrue);
      expect(image.hasError, isFalse);
      expect(image.metadata, equals({'key': 'value'}));
    });

    test('copyWith works correctly', () {
      const originalImage = DSLightboxImage(
        id: 'test_image',
        imageProvider: AssetImage('test.png'),
        title: 'Original Title',
      );

      final modifiedImage = originalImage.copyWith(
        title: 'Modified Title',
        isLoading: true,
      );

      expect(modifiedImage.id, equals('test_image'));
      expect(modifiedImage.title, equals('Modified Title'));
      expect(modifiedImage.isLoading, isTrue);
      expect(modifiedImage.imageProvider, equals(originalImage.imageProvider));
    });

    test('equality works correctly', () {
      const image1 = DSLightboxImage(
        id: 'test_image',
        imageProvider: AssetImage('test.png'),
        title: 'Test Title',
      );
      const image2 = DSLightboxImage(
        id: 'test_image',
        imageProvider: AssetImage('test.png'),
        title: 'Test Title',
      );
      const image3 = DSLightboxImage(
        id: 'different_image',
        imageProvider: AssetImage('test.png'),
        title: 'Test Title',
      );

      expect(image1, equals(image2));
      expect(image1, isNot(equals(image3)));
    });
  });
}