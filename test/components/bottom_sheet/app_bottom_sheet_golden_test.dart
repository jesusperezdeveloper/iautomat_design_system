import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/bottom_sheet/app_bottom_sheet.dart';

void main() {
  group('DSBottomSheet Golden Tests', () {
    testWidgets('modal variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                // Background content
                const Center(
                  child: Text('Background Content'),
                ),
                // Bottom sheet positioned at bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 400,
                  child: DSBottomSheet.modal(
                    content: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Modal Bottom Sheet',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'This is a modal bottom sheet that overlays the entire screen. '
                            'It\'s perfect for important actions that require user attention.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_modal.png'),
      );
    });

    testWidgets('half variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                // Background content
                const Center(
                  child: Text('Background Content'),
                ),
                // Bottom sheet positioned at bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 300,
                  child: DSBottomSheet.half(
                    content: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Half Bottom Sheet',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'This is a half-height bottom sheet that provides additional '
                            'information without taking up the entire screen.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_half.png'),
      );
    });

    testWidgets('full variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                // Background content
                const Center(
                  child: Text('Background Content'),
                ),
                // Bottom sheet positioned at bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 500,
                  child: DSBottomSheet.full(
                    content: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Full Bottom Sheet',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'This is a full-height bottom sheet that maximizes the available '
                            'space for extensive content like forms or lists.',
                          ),
                          SizedBox(height: 24),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Example Field',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: null,
                                  child: Text('Cancel'),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: FilledButton(
                                  onPressed: null,
                                  child: Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_full.png'),
      );
    });

    testWidgets('draggable vs non-draggable golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                // Draggable bottom sheet
                Expanded(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text('Draggable'),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 250,
                        child: DSBottomSheet.half(
                          content: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Draggable',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8),
                                Text('Has drag handle'),
                              ],
                            ),
                          ),
                          draggable: true,
                        ),
                      ),
                    ],
                  ),
                ),
                // Non-draggable bottom sheet
                Expanded(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text('Non-Draggable'),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 250,
                        child: DSBottomSheet.half(
                          content: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Non-Draggable',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8),
                                Text('No drag handle'),
                              ],
                            ),
                          ),
                          draggable: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_draggable.png'),
      );
    });

    testWidgets('states golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                // Default and Focus states
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Default')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 120,
                              child: DSBottomSheet.half(
                                content: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Default State'),
                                ),
                                state: DSBottomSheetState.defaultState,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Focus')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 120,
                              child: DSBottomSheet.half(
                                content: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Focus State'),
                                ),
                                state: DSBottomSheetState.focus,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Disabled and Loading states
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Disabled')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 120,
                              child: DSBottomSheet.half(
                                content: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Disabled State'),
                                ),
                                state: DSBottomSheetState.disabled,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Loading')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 120,
                              child: DSBottomSheet.half(
                                content: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Loading State'),
                                ),
                                state: DSBottomSheetState.loading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Skeleton state
                Expanded(
                  child: Stack(
                    children: [
                      const Center(child: Text('Skeleton')),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 8,
                        height: 120,
                        child: DSBottomSheet.half(
                          content: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Skeleton State'),
                          ),
                          state: DSBottomSheetState.skeleton,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_states.png'),
      );
    });

    testWidgets('custom colors golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                // Custom background color
                Expanded(
                  child: Stack(
                    children: [
                      const Center(child: Text('Custom Background')),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 8,
                        height: 200,
                        child: DSBottomSheet.half(
                          content: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Custom Background',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8),
                                Text('Purple background color'),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.purple[100],
                        ),
                      ),
                    ],
                  ),
                ),
                // Custom handle color
                Expanded(
                  child: Stack(
                    children: [
                      const Center(child: Text('Custom Handle')),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 8,
                        height: 200,
                        child: DSBottomSheet.half(
                          content: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Custom Handle',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8),
                                Text('Amber handle color'),
                              ],
                            ),
                          ),
                          handleColor: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_custom_colors.png'),
      );
    });

    testWidgets('snap positions golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                const Center(child: Text('Snap Positions Test')),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  height: 200,
                  child: DSBottomSheet.half(
                    content: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Half snap position'),
                    ),
                    initialSnap: BottomSheetSnap.half,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_snaps.png'),
      );
    });

    testWidgets('dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Stack(
              children: [
                // Background content
                const Center(
                  child: Text(
                    'Background Content',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Bottom sheet positioned at bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 300,
                  child: DSBottomSheet.half(
                    content: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Dark Theme Bottom Sheet',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'This bottom sheet adapts to dark theme with appropriate '
                            'colors and contrasts for optimal visibility.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_dark.png'),
      );
    });

    testWidgets('rtl layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  // Background content
                  const Center(
                    child: Text('محتوى الخلفية'),
                  ),
                  // Bottom sheet positioned at bottom
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 300,
                    child: DSBottomSheet.half(
                      content: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ورقة سفلية باللغة العربية',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'هذه ورقة سفلية تدعم اتجاه الكتابة من اليمين إلى اليسار '
                              'وتعرض النص بشكل صحيح باللغة العربية.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_bottom_sheet_rtl.png'),
      );
    });
  });
}