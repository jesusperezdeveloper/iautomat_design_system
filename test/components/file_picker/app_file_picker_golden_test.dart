import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/file_picker/app_file_picker.dart';
import 'package:iautomat_design_system/src/components/file_picker/file_picker_config.dart';

void main() {
  group('AppFilePicker Golden Tests', () {
    group('Basic Variants', () {
      testWidgets('drag and drop picker default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Drag & Drop File Picker',
                    hint: 'Drag files here or click to select',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('drag_drop_picker_default.png'),
        );
      });

      testWidgets('multi selector picker default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'Multi File Picker',
                    hint: 'Select files',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('multi_picker_default.png'),
        );
      });
    });

    group('With Values', () {
      testWidgets('drag and drop picker with selected files', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'document.pdf',
            size: 1024 * 1024,
            type: 'application/pdf',
            lastModified: DateTime(2023, 1, 1),
          ),
          AppFileData(
            name: 'image.jpg',
            size: 512 * 1024,
            type: 'image/jpeg',
            lastModified: DateTime(2023, 1, 1),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'With Selected Files',
                    value: mockFiles,
                    preview: true,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('drag_drop_with_files.png'),
        );
      });

      testWidgets('multi picker with selected files', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'presentation.pptx',
            size: 2 * 1024 * 1024,
            type:
                'application/vnd.openxmlformats-officedocument.presentationml.presentation',
            lastModified: DateTime(2023, 1, 1),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'Multi Picker with Files',
                    value: mockFiles,
                    preview: true,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('multi_picker_with_files.png'),
        );
      });
    });

    group('States', () {
      testWidgets('disabled state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Disabled File Picker',
                    enabled: false,
                    hint: 'This picker is disabled',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_disabled.png'),
        );
      });

      testWidgets('loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'Loading File Picker',
                    state: AppFilePickerState.loading,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_loading.png'),
        );
      });

      testWidgets('skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Skeleton File Picker',
                    state: AppFilePickerState.skeleton,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_skeleton.png'),
        );
      });
    });

    group('Custom Icons', () {
      testWidgets('with prefix icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'With Prefix Icon',
                    prefixIcon:
                        const Icon(Icons.cloud_upload, color: Colors.blue),
                    hint: 'Upload to cloud',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_prefix_icon.png'),
        );
      });

      testWidgets('with suffix icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'With Suffix Icon',
                    suffixIcon:
                        const Icon(Icons.folder_open, color: Colors.orange),
                    hint: 'Browse files',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_suffix_icon.png'),
        );
      });

      testWidgets('with both prefix and suffix icons', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'With Both Icons',
                    prefixIcon:
                        const Icon(Icons.attach_file, color: Colors.green),
                    suffixIcon:
                        const Icon(Icons.arrow_forward, color: Colors.blue),
                    hint: 'Attach files',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_both_icons.png'),
        );
      });
    });

    group('Validation States', () {
      testWidgets('with error text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'File Picker with Error',
                    errorText: 'File size too large. Maximum allowed is 10MB.',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_error.png'),
        );
      });

      testWidgets('with helper text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'File Picker with Helper',
                    helperText:
                        'Accepted formats: PDF, JPG, PNG. Maximum size: 10MB.',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_helper.png'),
        );
      });
    });

    group('Custom Configuration', () {
      testWidgets('custom border radius', (tester) async {
        final customConfig = AppFilePickerConfig(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderWidth: 3.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Custom Border Radius',
                    config: customConfig,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_custom_border.png'),
        );
      });

      testWidgets('custom colors', (tester) async {
        final customColors = AppFilePickerColors(
          backgroundColor: Colors.lightBlue.shade50,
          borderColor: Colors.blue,
          hoverBackgroundColor: Colors.blue.shade100,
          hoverBorderColor: Colors.blue.shade700,
          textColor: Colors.blue.shade900,
          iconColor: Colors.blue.shade600,
        );

        final customConfig = AppFilePickerConfig(
          colors: customColors,
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Custom Colors',
                    config: customConfig,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_custom_colors.png'),
        );
      });

      testWidgets('custom size', (tester) async {
        final customConfig = AppFilePickerConfig(
          minSize: const Size(350, 180),
          contentPadding: const EdgeInsets.all(24.0),
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Custom Size',
                    config: customConfig,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_custom_size.png'),
        );
      });
    });

    group('File Types', () {
      testWidgets('image files only', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Images Only',
                    accept: const ['jpg', 'jpeg', 'png', 'gif'],
                    helperText: 'Accepted formats: JPG, JPEG, PNG, GIF',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_images_only.png'),
        );
      });

      testWidgets('documents only', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'Documents Only',
                    accept: const ['pdf', 'doc', 'docx', 'txt'],
                    helperText: 'Accepted formats: PDF, DOC, DOCX, TXT',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_documents_only.png'),
        );
      });
    });

    group('Preview Modes', () {
      testWidgets('with file preview', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'report.pdf',
            size: 1536 * 1024, // 1.5 MB
            type: 'application/pdf',
            lastModified: DateTime(2023, 1, 1),
          ),
          AppFileData(
            name: 'photo.jpg',
            size: 768 * 1024, // 768 KB
            type: 'image/jpeg',
            lastModified: DateTime(2023, 1, 1),
          ),
          AppFileData(
            name: 'data.xlsx',
            size: 2 * 1024 * 1024, // 2 MB
            type:
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            lastModified: DateTime(2023, 1, 1),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'With File Preview',
                    value: mockFiles,
                    preview: true,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_with_preview.png'),
        );
      });

      testWidgets('without preview', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'hidden.pdf',
            size: 1024 * 1024,
            type: 'application/pdf',
            lastModified: DateTime(2023, 1, 1),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Without Preview',
                    value: mockFiles,
                    preview: false,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_no_preview.png'),
        );
      });
    });

    group('Themes', () {
      testWidgets('dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Dark Theme File Picker',
                    hint: 'Drop files here',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_dark_theme.png'),
        );
      });

      testWidgets('dark theme with files', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'dark_document.pdf',
            size: 1024 * 1024,
            type: 'application/pdf',
            lastModified: DateTime(2023, 1, 1),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Dark Theme with Files',
                    value: mockFiles,
                    preview: true,
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_dark_theme_with_files.png'),
        );
      });

      testWidgets('dark theme disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.multi,
                    label: 'Disabled Dark Theme',
                    enabled: false,
                    hint: 'Disabled picker',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_dark_theme_disabled.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('RTL layout', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 400,
                    child: AppFilePicker(
                      variant: AppFilePickerVariant.dragAndDrop,
                      label: 'منتخب کریں فائلز',
                      hint: 'یہاں فائلز گھسیٹیں',
                      helperText: 'زیادہ سے زیادہ 10MB',
                      onFilesSelected: (files) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_rtl.png'),
        );
      });

      testWidgets('RTL with files', (tester) async {
        final mockFiles = [
          AppFileData(
            name: 'مستند.pdf',
            size: 1024 * 1024,
            type: 'application/pdf',
            lastModified: DateTime(2023, 1, 1),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 400,
                    child: AppFilePicker(
                      variant: AppFilePickerVariant.dragAndDrop,
                      label: 'فائلز کے ساتھ',
                      value: mockFiles,
                      preview: true,
                      onFilesSelected: (files) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_rtl_with_files.png'),
        );
      });

      testWidgets('RTL with icons', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 400,
                    child: AppFilePicker(
                      variant: AppFilePickerVariant.multi,
                      label: 'آئیکنز کے ساتھ',
                      prefixIcon: const Icon(Icons.upload_file),
                      suffixIcon: const Icon(Icons.folder_open),
                      hint: 'فائل منتخب کریں',
                      onFilesSelected: (files) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_rtl_with_icons.png'),
        );
      });
    });

    group('Size Variations', () {
      testWidgets('compact size', (tester) async {
        final compactConfig = AppFilePickerConfig(
          minSize: const Size(250, 80),
          contentPadding: const EdgeInsets.all(8.0),
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 300,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Compact Size',
                    config: compactConfig,
                    hint: 'Small picker',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_compact.png'),
        );
      });

      testWidgets('large size', (tester) async {
        final largeConfig = AppFilePickerConfig(
          minSize: const Size(500, 250),
          contentPadding: const EdgeInsets.all(32.0),
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 600,
                  child: AppFilePicker(
                    variant: AppFilePickerVariant.dragAndDrop,
                    label: 'Large Size',
                    config: largeConfig,
                    hint: 'Big drop zone',
                    onFilesSelected: (files) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(AppFilePicker),
          matchesGoldenFile('file_picker_large.png'),
        );
      });
    });

    group('Both Variants Side by Side', () {
      testWidgets('variants comparison', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 800,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 350,
                        child: AppFilePicker(
                          variant: AppFilePickerVariant.dragAndDrop,
                          label: 'Drag & Drop Variant',
                          hint: 'Drop files here',
                          onFilesSelected: (files) {},
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: AppFilePicker(
                          variant: AppFilePickerVariant.multi,
                          label: 'Multi Selector Variant',
                          hint: 'Select files',
                          onFilesSelected: (files) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(Column),
          matchesGoldenFile('file_picker_variants_comparison.png'),
        );
      });

      testWidgets('all states comparison', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 800,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 200,
                            child: AppFilePicker(
                              variant: AppFilePickerVariant.dragAndDrop,
                              label: 'Default',
                              onFilesSelected: (files) {},
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: AppFilePicker(
                              variant: AppFilePickerVariant.dragAndDrop,
                              label: 'Disabled',
                              enabled: false,
                              onFilesSelected: (files) {},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 200,
                            child: AppFilePicker(
                              variant: AppFilePickerVariant.multi,
                              label: 'Loading',
                              state: AppFilePickerState.loading,
                              onFilesSelected: (files) {},
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: AppFilePicker(
                              variant: AppFilePickerVariant.multi,
                              label: 'With Error',
                              errorText: 'Error message',
                              onFilesSelected: (files) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await expectLater(
          find.byType(Column),
          matchesGoldenFile('file_picker_all_states.png'),
        );
      });
    });
  });
}
