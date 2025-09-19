import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../widgets/theme_switcher.dart';
import '../widgets/ds_app_bar_with_back.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Sistema de Colores'),
        actions: [
          ThemeSwitcherButton(),
          ThemePickerButton(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sistema de Colores', style: DSTypography.h2),
            const SizedBox(height: 24),

            _buildColorSection('Primarios', [
              _ColorItem('Primary', DSColors.primary),
              _ColorItem('Primary Light', DSColors.primaryLight),
              _ColorItem('Primary Dark', DSColors.primaryDark),
            ]),

            _buildColorSection('Secundarios', [
              _ColorItem('Secondary', DSColors.secondary),
              _ColorItem('Secondary Light', DSColors.secondaryLight),
              _ColorItem('Secondary Dark', DSColors.secondaryDark),
            ]),

            _buildColorSection('Semánticos', [
              _ColorItem('Success', DSColors.success),
              _ColorItem('Warning', DSColors.warning),
              _ColorItem('Error', DSColors.error),
              _ColorItem('Info', DSColors.info),
            ]),

            _buildColorSection('Escala de Grises', [
              _ColorItem('Gray 100', DSColors.gray100),
              _ColorItem('Gray 200', DSColors.gray200),
              _ColorItem('Gray 300', DSColors.gray300),
              _ColorItem('Gray 400', DSColors.gray400),
              _ColorItem('Gray 500', DSColors.gray500),
              _ColorItem('Gray 600', DSColors.gray600),
              _ColorItem('Gray 700', DSColors.gray700),
              _ColorItem('Gray 800', DSColors.gray800),
              _ColorItem('Gray 900', DSColors.gray900),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSection(String title, List<_ColorItem> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h4),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final crossAxisCount = screenWidth > 600
                ? 4
                : (screenWidth > 400 ? 3 : 2);

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.9,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final color = colors[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          color: color.color,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                color.name,
                                style: DSTypography.labelSmall.copyWith(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '#${color.color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                                style: DSTypography.caption.copyWith(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _ColorItem {
  final String name;
  final Color color;

  _ColorItem(this.name, this.color);
}