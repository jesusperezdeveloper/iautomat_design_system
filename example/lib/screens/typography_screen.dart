import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../widgets/theme_switcher.dart';
import '../widgets/ds_app_bar_with_back.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Sistema Tipográfico'),
        actions: [
          ThemeSwitcherButton(),
          ThemePickerButton(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sistema Tipográfico', style: DSTypography.h2),
            const SizedBox(height: 24),

            _buildTypographySection('Headers', [
              _TypographyItem('H1 - Display Large', DSTypography.h1),
              _TypographyItem('H2 - Display Medium', DSTypography.h2),
              _TypographyItem('H3 - Display Small', DSTypography.h3),
              _TypographyItem('H4 - Headline Large', DSTypography.h4),
              _TypographyItem('H5 - Headline Medium', DSTypography.h5),
              _TypographyItem('H6 - Headline Small', DSTypography.h6),
            ]),

            _buildTypographySection('Body Text', [
              _TypographyItem('Body Large', DSTypography.bodyLarge),
              _TypographyItem('Body Medium', DSTypography.bodyMedium),
              _TypographyItem('Body Small', DSTypography.bodySmall),
            ]),

            _buildTypographySection('Labels', [
              _TypographyItem('Label Large', DSTypography.labelLarge),
              _TypographyItem('Label Medium', DSTypography.labelMedium),
              _TypographyItem('Label Small', DSTypography.labelSmall),
            ]),

            _buildTypographySection('Especiales', [
              _TypographyItem('Button Text', DSTypography.button),
              _TypographyItem('Caption Text', DSTypography.caption),
              _TypographyItem('OVERLINE TEXT', DSTypography.overline),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographySection(String title, List<_TypographyItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h4),
        const SizedBox(height: 16),
        ...items.map((item) => _buildTypographyCard(item)),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTypographyCard(_TypographyItem item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.text, style: item.style),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Size: ${item.style.fontSize?.toStringAsFixed(0)}px, Weight: ${item.style.fontWeight.toString()}',
                style: DSTypography.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypographyItem {
  final String text;
  final TextStyle style;

  _TypographyItem(this.text, this.style);
}