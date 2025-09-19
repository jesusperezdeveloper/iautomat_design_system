import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSClipboardShare', () {
    late DSShareData testData;
    late List<DSShareFile> testFiles;

    setUp(() {
      testData = const DSShareData(
        text: 'Este es un texto de prueba para compartir',
        subject: 'Asunto de prueba',
        url: 'https://example.com',
        mimeType: 'text/plain',
      );

      testFiles = [
        const DSShareFile(
          name: 'test.pdf',
          mimeType: 'application/pdf',
          size: 1024,
        ),
        const DSShareFile(
          name: 'image.jpg',
          mimeType: 'image/jpeg',
          size: 2048,
        ),
      ];
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DSClipboardShare(data: testData)),
        ),
      );

      expect(find.byType(DSClipboardShare), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('displays correct icon based on platform', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              config: const DSClipboardShareConfig(
                variant: DSClipboardShareVariant.shareSheet,
              ),
            ),
          ),
        ),
      );

      // Default should show share icon
      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('responds to tap when interactive', (tester) async {
      bool sharePressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              interactive: true,
              onSharePressed: () {
                sharePressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSClipboardShare));
      await tester.pump();

      expect(sharePressed, isTrue);
    });

    testWidgets('does not respond to tap when not interactive', (tester) async {
      bool sharePressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              interactive: false,
              onSharePressed: () {
                sharePressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSClipboardShare));
      await tester.pump();

      expect(sharePressed, isFalse);
    });

    testWidgets('displays loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              config: const DSClipboardShareConfig(
                state: DSClipboardShareState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSClipboardShare), findsOneWidget);
    });

    testWidgets('displays skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              config: const DSClipboardShareConfig(
                state: DSClipboardShareState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSClipboardShare), findsOneWidget);
    });

    testWidgets('handles long press for copy action', (tester) async {
      bool copyPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              interactive: true,
              onCopyPressed: () {
                copyPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(DSClipboardShare));
      await tester.pump();

      expect(copyPressed, isTrue);
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      DSClipboardShareState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              onStateChanged: (state) => capturedState = state,
            ),
          ),
        ),
      );

      // Simulate hover to trigger state change
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(find.byType(DSClipboardShare)));
      await tester.pump();

      expect(capturedState, equals(DSClipboardShareState.hover));
    });

    testWidgets('shows different variants correctly', (tester) async {
      for (final variant in DSClipboardShareVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSClipboardShare(
                data: testData,
                config: DSClipboardShareConfig(variant: variant),
              ),
            ),
          ),
        );

        expect(find.byType(DSClipboardShare), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('handles files correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              files: testFiles,
              config: const DSClipboardShareConfig(showPreview: true),
            ),
          ),
        ),
      );

      expect(find.byType(DSClipboardShare), findsOneWidget);
    });

    testWidgets('supports semantic labels correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSClipboardShare(
              data: testData,
              config: const DSClipboardShareConfig(
                accessibility: DSClipboardShareAccessibility(
                  enabled: true,
                  shareLabel: 'Compartir contenido',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSClipboardShare), findsOneWidget);
    });

    group('DSClipboardShareConfig', () {
      test('has correct default values', () {
        const config = DSClipboardShareConfig();

        expect(config.variant, equals(DSClipboardShareVariant.shareSheet));
        expect(config.state, equals(DSClipboardShareState.defaultState));
        expect(config.showPreview, isTrue);
        expect(config.allowEdit, isFalse);
        expect(config.showConfirmation, isTrue);
        expect(config.allowMultipleFiles, isTrue);
        expect(config.compressImages, isTrue);
        expect(config.imageQuality, equals(85));
      });

      test('copyWith works correctly', () {
        const original = DSClipboardShareConfig(
          variant: DSClipboardShareVariant.shareSheet,
          showPreview: true,
        );

        final updated = original.copyWith(
          variant: DSClipboardShareVariant.customMenu,
          showPreview: false,
        );

        expect(updated.variant, equals(DSClipboardShareVariant.customMenu));
        expect(updated.showPreview, isFalse);
        expect(updated.showConfirmation, equals(original.showConfirmation));
      });

      test('validation works correctly', () {
        const validConfig = DSClipboardShareConfig(
          maxFileSize: 1024,
          imageQuality: 85,
          allowedFileTypes: ['image/*', 'text/*'],
        );

        const invalidConfig1 = DSClipboardShareConfig(
          maxFileSize: -1, // Invalid
          imageQuality: 85,
          allowedFileTypes: ['image/*'],
        );

        const invalidConfig2 = DSClipboardShareConfig(
          maxFileSize: 1024,
          imageQuality: 150, // Invalid
          allowedFileTypes: ['image/*'],
        );

        const invalidConfig3 = DSClipboardShareConfig(
          maxFileSize: 1024,
          imageQuality: 85,
          allowedFileTypes: [], // Invalid
        );

        expect(validConfig.isValid, isTrue);
        expect(invalidConfig1.isValid, isFalse);
        expect(invalidConfig2.isValid, isFalse);
        expect(invalidConfig3.isValid, isFalse);
      });
    });

    group('DSShareData', () {
      test('has correct required properties', () {
        const data = DSShareData(text: 'Test text', subject: 'Test subject');

        expect(data.text, equals('Test text'));
        expect(data.subject, equals('Test subject'));
      });

      test('hasContent works correctly', () {
        const dataWithText = DSShareData(text: 'Some text');
        const dataWithUrl = DSShareData(url: 'https://example.com');
        const dataWithFiles = DSShareData(
          files: [DSShareFile(name: 'test.txt', mimeType: 'text/plain')],
        );
        const dataEmpty = DSShareData();

        expect(dataWithText.hasContent, isTrue);
        expect(dataWithUrl.hasContent, isTrue);
        expect(dataWithFiles.hasContent, isTrue);
        expect(dataEmpty.hasContent, isFalse);
      });

      test('totalFileSize calculates correctly', () {
        const data = DSShareData(
          files: [
            DSShareFile(name: 'file1.txt', size: 100),
            DSShareFile(name: 'file2.txt', size: 200),
            DSShareFile(name: 'file3.txt'), // No size
          ],
        );

        expect(data.totalFileSize, equals(300));
      });
    });

    group('DSShareFile', () {
      test('has correct required properties', () {
        const file = DSShareFile(
          name: 'test.pdf',
          mimeType: 'application/pdf',
        );

        expect(file.name, equals('test.pdf'));
        expect(file.mimeType, equals('application/pdf'));
      });

      test('file type detection works correctly', () {
        const imageFile = DSShareFile(
          name: 'image.jpg',
          mimeType: 'image/jpeg',
        );
        const videoFile = DSShareFile(
          name: 'video.mp4',
          mimeType: 'video/mp4',
        );
        const documentFile = DSShareFile(
          name: 'document.pdf',
          mimeType: 'application/pdf',
        );

        expect(imageFile.isImage, isTrue);
        expect(imageFile.isVideo, isFalse);
        expect(imageFile.isDocument, isFalse);

        expect(videoFile.isImage, isFalse);
        expect(videoFile.isVideo, isTrue);
        expect(videoFile.isDocument, isFalse);

        expect(documentFile.isImage, isFalse);
        expect(documentFile.isVideo, isFalse);
        expect(documentFile.isDocument, isTrue);
      });
    });
  });
}
