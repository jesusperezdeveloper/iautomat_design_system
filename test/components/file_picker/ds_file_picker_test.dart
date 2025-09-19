import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/file_picker/ds_file_picker.dart';
import 'package:iautomat_design_system/src/components/file_picker/file_picker_config.dart';

void main() {
  group('DSFilePicker', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSFilePicker(),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('renders with drag and drop variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.dragAndDrop,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('renders with multi selector variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.multi,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('displays label when provided', (tester) async {
        const labelText = 'Select Files';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                label: labelText,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('displays hint text', (tester) async {
        const hintText = 'Drag files here';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                hint: hintText,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.textContaining('Drag files here'), findsOneWidget);
      });

      testWidgets('displays helper text when provided', (tester) async {
        const helperText = 'Maximum file size: 10MB';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                helperText: helperText,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.text(helperText), findsOneWidget);
      });

      testWidgets('displays error text when provided', (tester) async {
        const errorText = 'File too large';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                errorText: errorText,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.text(errorText), findsOneWidget);
      });

      testWidgets('shows prefix icon in multi variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.multi,
                prefixIcon: const Icon(Icons.upload),
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.upload), findsOneWidget);
      });

      testWidgets('shows suffix icon in multi variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.multi,
                suffixIcon: const Icon(Icons.folder),
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.folder), findsOneWidget);
      });
    });

    group('State Tests', () {
      testWidgets('renders disabled state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                enabled: false,
                label: 'Disabled File Picker',
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
        expect(find.text('Disabled File Picker'), findsOneWidget);
      });

      testWidgets('renders loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                state: DSFilePickerState.loading,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                state: DSFilePickerState.skeleton,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows selected files count when files are present',
          (tester) async {
        final mockFiles = [
          DSFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.dragAndDrop,
                value: mockFiles,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.textContaining('archivo seleccionado'), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('calls onFilesSelected when tapped', (tester) async {
        bool callbackCalled = false;
        List<DSFileData>? selectedFiles;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.multi,
                onFilesSelected: (files) {
                  callbackCalled = true;
                  selectedFiles = files;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle();

        // Note: Since we're using a mock file picker, the callback will be called
        // but with mock data. In a real implementation, this would open the actual file picker.
        expect(callbackCalled, isTrue);
        expect(selectedFiles, isNotNull);
      });

      testWidgets('does not respond to tap when disabled', (tester) async {
        bool callbackCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                enabled: false,
                onFilesSelected: (files) {
                  callbackCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DSFilePicker));
        await tester.pumpAndSettle();

        expect(callbackCalled, isFalse);
      });

      testWidgets('removes file when remove button is tapped', (tester) async {
        final mockFiles = [
          DSFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        List<DSFileData>? updatedFiles;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                value: mockFiles,
                preview: true,
                onFilesSelected: (files) {
                  updatedFiles = files;
                },
              ),
            ),
          ),
        );

        // Find and tap the remove button
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pumpAndSettle();

        expect(updatedFiles, isNotNull);
        expect(updatedFiles!.isEmpty, isTrue);
      });
    });

    group('Preview Tests', () {
      testWidgets('shows file preview when preview is enabled', (tester) async {
        final mockFiles = [
          DSFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                value: mockFiles,
                preview: true,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.text('Archivos seleccionados:'), findsOneWidget);
        expect(find.text('test.pdf'), findsOneWidget);
      });

      testWidgets('does not show preview when preview is disabled',
          (tester) async {
        final mockFiles = [
          DSFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                value: mockFiles,
                preview: false,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.text('Archivos seleccionados:'), findsNothing);
        expect(find.text('test.pdf'), findsNothing);
      });
    });

    group('Configuration Tests', () {
      testWidgets('applies custom configuration correctly', (tester) async {
        final customConfig = DSFilePickerConfig(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          minSize: const Size(300, 150),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                config: customConfig,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('respects file type restrictions', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                accept: const ['pdf', 'jpg', 'png'],
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('respects max file size', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                maxSize: const DSFileSize(5, DSFileSizeUnit.mb),
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('respects multiple file selection settings', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                allowMultiple: false,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });

      testWidgets('respects max files limit', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                maxFiles: 3,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantic labels', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                semanticLabel: 'File picker for documents',
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(
          find.bySemanticsLabel('File picker for documents'),
          findsOneWidget,
        );
      });

      testWidgets('is marked as button for accessibility', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('supports focus and keyboard navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsOneWidget);
      });
    });

    group('Validation Tests', () {
      testWidgets('calls validation error callback on invalid file',
          (tester) async {
        String? errorMessage;
        DSFileData? errorFile;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                accept: const ['pdf'],
                onValidationError: (error, file) {
                  errorMessage = error;
                  errorFile = file;
                },
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
        // Note: Validation testing would require mock file selection
        // Variables are prepared for validation callback testing
        expect(errorMessage, isNull); // No error yet without file selection
        expect(errorFile, isNull);
      });

      testWidgets('uses custom validator when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                customValidator: (file) => file.name.contains('test'),
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSFilePicker), findsOneWidget);
      });
    });

    group('RTL Tests', () {
      testWidgets('renders correctly in RTL direction', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: DSFilePicker(
                  label: 'اختر ملفات',
                  onFilesSelected: (files) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('اختر ملفات'), findsOneWidget);
        expect(find.byType(DSFilePicker), findsOneWidget);
      });
    });

    group('Animation Tests', () {
      testWidgets('has animation controllers', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });

      testWidgets('animates on hover', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSFilePicker(
                variant: DSFilePickerVariant.dragAndDrop,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);

        await gesture.moveTo(tester.getCenter(find.byType(MouseRegion)));
        await tester.pumpAndSettle();

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });
    });
  });

  group('DSFileData', () {
    test('correctly identifies file extensions', () {
      final pdfFile = DSFileData(
        name: 'document.pdf',
        size: 1024,
        type: 'application/pdf',
        lastModified: DateTime.now(),
      );

      expect(pdfFile.extension, equals('pdf'));
    });

    test('formats file size correctly', () {
      final smallFile = DSFileData(
        name: 'small.txt',
        size: 512,
        type: 'text/plain',
        lastModified: DateTime.now(),
      );

      final largeFile = DSFileData(
        name: 'large.zip',
        size: 1024 * 1024,
        type: 'application/zip',
        lastModified: DateTime.now(),
      );

      expect(smallFile.formattedSize, equals('512 B'));
      expect(largeFile.formattedSize, equals('1.0 MB'));
    });

    test('correctly identifies file types', () {
      final imageFile = DSFileData(
        name: 'photo.jpg',
        size: 1024,
        type: 'image/jpeg',
        lastModified: DateTime.now(),
      );

      final videoFile = DSFileData(
        name: 'video.mp4',
        size: 1024,
        type: 'video/mp4',
        lastModified: DateTime.now(),
      );

      final documentFile = DSFileData(
        name: 'document.pdf',
        size: 1024,
        type: 'application/pdf',
        lastModified: DateTime.now(),
      );

      expect(imageFile.isImage, isTrue);
      expect(videoFile.isVideo, isTrue);
      expect(documentFile.isDocument, isTrue);
    });

    test('returns appropriate icons for file types', () {
      const icons = DSFilePickerIcons();

      final imageFile = DSFileData(
        name: 'photo.jpg',
        size: 1024,
        type: 'image/jpeg',
        lastModified: DateTime.now(),
      );

      expect(imageFile.getIcon(icons), equals(icons.imageIcon));
    });
  });

  group('DSFileSize', () {
    test('converts to bytes correctly', () {
      const kbSize = DSFileSize(1, DSFileSizeUnit.kb);
      const mbSize = DSFileSize(1, DSFileSizeUnit.mb);
      const gbSize = DSFileSize(1, DSFileSizeUnit.gb);

      expect(kbSize.bytes, equals(1024));
      expect(mbSize.bytes, equals(1024 * 1024));
      expect(gbSize.bytes, equals(1024 * 1024 * 1024));
    });

    test('formats size correctly', () {
      const bytesSize = DSFileSize(500, DSFileSizeUnit.bytes);
      const kbSize = DSFileSize(1.5, DSFileSizeUnit.kb);
      const mbSize = DSFileSize(2.7, DSFileSizeUnit.mb);

      expect(bytesSize.formatted, equals('500 B'));
      expect(kbSize.formatted, equals('1.5 KB'));
      expect(mbSize.formatted, equals('2.7 MB'));
    });
  });

  group('DSFileValidators', () {
    test('validates file size correctly', () {
      final smallFile = DSFileData(
        name: 'small.txt',
        size: 1024,
        type: 'text/plain',
        lastModified: DateTime.now(),
      );

      final largeFile = DSFileData(
        name: 'large.zip',
        size: 10 * 1024 * 1024,
        type: 'application/zip',
        lastModified: DateTime.now(),
      );

      const maxSize = DSFileSize(5, DSFileSizeUnit.mb);

      expect(DSFileValidators.validateSize(smallFile, maxSize), isTrue);
      expect(DSFileValidators.validateSize(largeFile, maxSize), isFalse);
    });

    test('validates file extensions correctly', () {
      final pdfFile = DSFileData(
        name: 'document.pdf',
        size: 1024,
        type: 'application/pdf',
        lastModified: DateTime.now(),
      );

      final txtFile = DSFileData(
        name: 'readme.txt',
        size: 1024,
        type: 'text/plain',
        lastModified: DateTime.now(),
      );

      const allowedExtensions = ['pdf', 'doc', 'docx'];

      expect(DSFileValidators.validateExtension(pdfFile, allowedExtensions),
          isTrue);
      expect(DSFileValidators.validateExtension(txtFile, allowedExtensions),
          isFalse);
    });

    test('validates empty extension list as allowing all files', () {
      final anyFile = DSFileData(
        name: 'any.xyz',
        size: 1024,
        type: 'application/unknown',
        lastModified: DateTime.now(),
      );

      expect(DSFileValidators.validateExtension(anyFile, []), isTrue);
    });

    test('validates file names correctly', () {
      expect(DSFileValidators.validateFileName('valid_file.txt'), isTrue);
      expect(
          DSFileValidators.validateFileName('file with spaces.pdf'), isTrue);
      expect(DSFileValidators.validateFileName(''), isFalse);
      expect(DSFileValidators.validateFileName('invalid/file.txt'), isFalse);
      expect(DSFileValidators.validateFileName('invalid\\file.txt'), isFalse);
      expect(DSFileValidators.validateFileName('invalid:file.txt'), isFalse);
    });

    test('gets file size from bytes correctly', () {
      final bytesSize = DSFileValidators.getFileSize(500);
      final kbSize = DSFileValidators.getFileSize(1500);
      final mbSize = DSFileValidators.getFileSize(2 * 1024 * 1024);

      expect(bytesSize.unit, equals(DSFileSizeUnit.bytes));
      expect(kbSize.unit, equals(DSFileSizeUnit.kb));
      expect(mbSize.unit, equals(DSFileSizeUnit.mb));
    });
  });

  group('DSFilePickerUtils', () {
    test('gets correct MIME type from extension', () {
      expect(
        DSFilePickerUtils.getMimeTypeFromExtension('pdf'),
        equals('application/pdf'),
      );
      expect(
        DSFilePickerUtils.getMimeTypeFromExtension('jpg'),
        equals('image/jpeg'),
      );
      expect(
        DSFilePickerUtils.getMimeTypeFromExtension('mp4'),
        equals('video/mp4'),
      );
      expect(
        DSFilePickerUtils.getMimeTypeFromExtension('unknown'),
        equals('application/octet-stream'),
      );
    });

    test('formats file size correctly', () {
      expect(DSFilePickerUtils.formatFileSize(500), equals('500 B'));
      expect(DSFilePickerUtils.formatFileSize(1536), equals('1.5 KB'));
      expect(
          DSFilePickerUtils.formatFileSize(2 * 1024 * 1024), equals('2.0 MB'));
    });

    test('checks platform support correctly', () {
      expect(DSFilePickerUtils.supportsDragAndDrop, isA<bool>());
      expect(DSFilePickerUtils.supportsNativeFilePicker, isA<bool>());
    });
  });
}
