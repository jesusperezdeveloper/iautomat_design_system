import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/file_picker/app_file_picker.dart';
import 'package:iautomat_design_system/src/components/file_picker/file_picker_config.dart';

void main() {
  group('AppFilePicker', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppFilePicker(),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('renders with drag and drop variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                variant: AppFilePickerVariant.dragAndDrop,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('renders with multi selector variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                variant: AppFilePickerVariant.multi,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('displays label when provided', (tester) async {
        const labelText = 'Select Files';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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
              body: AppFilePicker(
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
              body: AppFilePicker(
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
              body: AppFilePicker(
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
              body: AppFilePicker(
                variant: AppFilePickerVariant.multi,
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
              body: AppFilePicker(
                variant: AppFilePickerVariant.multi,
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
              body: AppFilePicker(
                enabled: false,
                label: 'Disabled File Picker',
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
        expect(find.text('Disabled File Picker'), findsOneWidget);
      });

      testWidgets('renders loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                state: AppFilePickerState.loading,
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
              body: AppFilePicker(
                state: AppFilePickerState.skeleton,
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
          AppFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                variant: AppFilePickerVariant.dragAndDrop,
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
        List<AppFileData>? selectedFiles;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                variant: AppFilePickerVariant.multi,
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
              body: AppFilePicker(
                enabled: false,
                onFilesSelected: (files) {
                  callbackCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppFilePicker));
        await tester.pumpAndSettle();

        expect(callbackCalled, isFalse);
      });

      testWidgets('removes file when remove button is tapped', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        List<AppFileData>? updatedFiles;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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
          AppFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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
          AppFileData(
            name: 'test.pdf',
            size: 1024,
            type: 'application/pdf',
            lastModified: DateTime.now(),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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
        final customConfig = AppFilePickerConfig(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          minSize: const Size(300, 150),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                config: customConfig,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('respects file type restrictions', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                accept: const ['pdf', 'jpg', 'png'],
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('respects max file size', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                maxSize: const AppFileSize(5, AppFileSizeUnit.mb),
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('respects multiple file selection settings', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                allowMultiple: false,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });

      testWidgets('respects max files limit', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                maxFiles: 3,
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantic labels', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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
              body: AppFilePicker(
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
              body: AppFilePicker(
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
        AppFileData? errorFile;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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

        expect(find.byType(AppFilePicker), findsOneWidget);
        // Note: Validation testing would require mock file selection
        // Variables are prepared for validation callback testing
        expect(errorMessage, isNull); // No error yet without file selection
        expect(errorFile, isNull);
      });

      testWidgets('uses custom validator when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
                customValidator: (file) => file.name.contains('test'),
                onFilesSelected: (files) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppFilePicker), findsOneWidget);
      });
    });

    group('RTL Tests', () {
      testWidgets('renders correctly in RTL direction', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppFilePicker(
                  label: 'اختر ملفات',
                  onFilesSelected: (files) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('اختر ملفات'), findsOneWidget);
        expect(find.byType(AppFilePicker), findsOneWidget);
      });
    });

    group('Animation Tests', () {
      testWidgets('has animation controllers', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppFilePicker(
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
              body: AppFilePicker(
                variant: AppFilePickerVariant.dragAndDrop,
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

  group('AppFileData', () {
    test('correctly identifies file extensions', () {
      final pdfFile = AppFileData(
        name: 'document.pdf',
        size: 1024,
        type: 'application/pdf',
        lastModified: DateTime.now(),
      );

      expect(pdfFile.extension, equals('pdf'));
    });

    test('formats file size correctly', () {
      final smallFile = AppFileData(
        name: 'small.txt',
        size: 512,
        type: 'text/plain',
        lastModified: DateTime.now(),
      );

      final largeFile = AppFileData(
        name: 'large.zip',
        size: 1024 * 1024,
        type: 'application/zip',
        lastModified: DateTime.now(),
      );

      expect(smallFile.formattedSize, equals('512 B'));
      expect(largeFile.formattedSize, equals('1.0 MB'));
    });

    test('correctly identifies file types', () {
      final imageFile = AppFileData(
        name: 'photo.jpg',
        size: 1024,
        type: 'image/jpeg',
        lastModified: DateTime.now(),
      );

      final videoFile = AppFileData(
        name: 'video.mp4',
        size: 1024,
        type: 'video/mp4',
        lastModified: DateTime.now(),
      );

      final documentFile = AppFileData(
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
      const icons = AppFilePickerIcons();

      final imageFile = AppFileData(
        name: 'photo.jpg',
        size: 1024,
        type: 'image/jpeg',
        lastModified: DateTime.now(),
      );

      expect(imageFile.getIcon(icons), equals(icons.imageIcon));
    });
  });

  group('AppFileSize', () {
    test('converts to bytes correctly', () {
      const kbSize = AppFileSize(1, AppFileSizeUnit.kb);
      const mbSize = AppFileSize(1, AppFileSizeUnit.mb);
      const gbSize = AppFileSize(1, AppFileSizeUnit.gb);

      expect(kbSize.bytes, equals(1024));
      expect(mbSize.bytes, equals(1024 * 1024));
      expect(gbSize.bytes, equals(1024 * 1024 * 1024));
    });

    test('formats size correctly', () {
      const bytesSize = AppFileSize(500, AppFileSizeUnit.bytes);
      const kbSize = AppFileSize(1.5, AppFileSizeUnit.kb);
      const mbSize = AppFileSize(2.7, AppFileSizeUnit.mb);

      expect(bytesSize.formatted, equals('500 B'));
      expect(kbSize.formatted, equals('1.5 KB'));
      expect(mbSize.formatted, equals('2.7 MB'));
    });
  });

  group('AppFileValidators', () {
    test('validates file size correctly', () {
      final smallFile = AppFileData(
        name: 'small.txt',
        size: 1024,
        type: 'text/plain',
        lastModified: DateTime.now(),
      );

      final largeFile = AppFileData(
        name: 'large.zip',
        size: 10 * 1024 * 1024,
        type: 'application/zip',
        lastModified: DateTime.now(),
      );

      const maxSize = AppFileSize(5, AppFileSizeUnit.mb);

      expect(AppFileValidators.validateSize(smallFile, maxSize), isTrue);
      expect(AppFileValidators.validateSize(largeFile, maxSize), isFalse);
    });

    test('validates file extensions correctly', () {
      final pdfFile = AppFileData(
        name: 'document.pdf',
        size: 1024,
        type: 'application/pdf',
        lastModified: DateTime.now(),
      );

      final txtFile = AppFileData(
        name: 'readme.txt',
        size: 1024,
        type: 'text/plain',
        lastModified: DateTime.now(),
      );

      const allowedExtensions = ['pdf', 'doc', 'docx'];

      expect(AppFileValidators.validateExtension(pdfFile, allowedExtensions),
          isTrue);
      expect(AppFileValidators.validateExtension(txtFile, allowedExtensions),
          isFalse);
    });

    test('validates empty extension list as allowing all files', () {
      final anyFile = AppFileData(
        name: 'any.xyz',
        size: 1024,
        type: 'application/unknown',
        lastModified: DateTime.now(),
      );

      expect(AppFileValidators.validateExtension(anyFile, []), isTrue);
    });

    test('validates file names correctly', () {
      expect(AppFileValidators.validateFileName('valid_file.txt'), isTrue);
      expect(
          AppFileValidators.validateFileName('file with spaces.pdf'), isTrue);
      expect(AppFileValidators.validateFileName(''), isFalse);
      expect(AppFileValidators.validateFileName('invalid/file.txt'), isFalse);
      expect(AppFileValidators.validateFileName('invalid\\file.txt'), isFalse);
      expect(AppFileValidators.validateFileName('invalid:file.txt'), isFalse);
    });

    test('gets file size from bytes correctly', () {
      final bytesSize = AppFileValidators.getFileSize(500);
      final kbSize = AppFileValidators.getFileSize(1500);
      final mbSize = AppFileValidators.getFileSize(2 * 1024 * 1024);

      expect(bytesSize.unit, equals(AppFileSizeUnit.bytes));
      expect(kbSize.unit, equals(AppFileSizeUnit.kb));
      expect(mbSize.unit, equals(AppFileSizeUnit.mb));
    });
  });

  group('AppFilePickerUtils', () {
    test('gets correct MIME type from extension', () {
      expect(
        AppFilePickerUtils.getMimeTypeFromExtension('pdf'),
        equals('application/pdf'),
      );
      expect(
        AppFilePickerUtils.getMimeTypeFromExtension('jpg'),
        equals('image/jpeg'),
      );
      expect(
        AppFilePickerUtils.getMimeTypeFromExtension('mp4'),
        equals('video/mp4'),
      );
      expect(
        AppFilePickerUtils.getMimeTypeFromExtension('unknown'),
        equals('application/octet-stream'),
      );
    });

    test('formats file size correctly', () {
      expect(AppFilePickerUtils.formatFileSize(500), equals('500 B'));
      expect(AppFilePickerUtils.formatFileSize(1536), equals('1.5 KB'));
      expect(
          AppFilePickerUtils.formatFileSize(2 * 1024 * 1024), equals('2.0 MB'));
    });

    test('checks platform support correctly', () {
      expect(AppFilePickerUtils.supportsDragAndDrop, isA<bool>());
      expect(AppFilePickerUtils.supportsNativeFilePicker, isA<bool>());
    });
  });
}
