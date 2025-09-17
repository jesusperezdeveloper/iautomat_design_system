import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/color_picker/app_color_picker.dart';
import 'package:iautomat_design_system/src/components/color_picker/color_picker_config.dart';

/// Storybook examples for AppColorPicker component
///
/// This file contains various configurations and usage examples
/// of the AppColorPicker component for demonstration and testing purposes.
class AppColorPickerStory {
  static Widget get title => const Text(
        'AppColorPicker',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );

  static Widget get description => const Text(
        'A comprehensive color picker component with HSV and palette variants, supporting multiple states and platform-adaptive behavior.',
      );

  /// Basic color picker examples
  static List<ColorPickerStoryExample> get basicExamples => [
        ColorPickerStoryExample(
          name: 'HSV Color Picker - Default',
          description: 'Basic HSV color picker with default configuration',
          widget: _HSVColorPickerExample(),
        ),
        ColorPickerStoryExample(
          name: 'Palette Color Picker - Default',
          description: 'Basic palette color picker with default configuration',
          widget: _PaletteColorPickerExample(),
        ),
      ];

  /// State examples
  static List<ColorPickerStoryExample> get stateExamples => [
        ColorPickerStoryExample(
          name: 'All States - HSV Picker',
          description: 'HSV color picker showing all possible states',
          widget: _StateExamplesWidget(),
        ),
        ColorPickerStoryExample(
          name: 'Disabled State',
          description: 'Color picker in disabled state',
          widget: _DisabledExample(),
        ),
        ColorPickerStoryExample(
          name: 'Loading State',
          description: 'Color picker in loading state',
          widget: _LoadingExample(),
        ),
        ColorPickerStoryExample(
          name: 'Skeleton State',
          description: 'Color picker in skeleton loading state',
          widget: _SkeletonExample(),
        ),
      ];

  /// Customization examples
  static List<ColorPickerStoryExample> get customizationExamples => [
        ColorPickerStoryExample(
          name: 'Custom Configuration',
          description: 'Color picker with custom styling and configuration',
          widget: _CustomConfigExample(),
        ),
        ColorPickerStoryExample(
          name: 'With Alpha Channel',
          description: 'Color picker with alpha channel support',
          widget: _AlphaChannelExample(),
        ),
        ColorPickerStoryExample(
          name: 'Custom Palette',
          description: 'Palette picker with custom color collection',
          widget: _CustomPaletteExample(),
        ),
        ColorPickerStoryExample(
          name: 'Custom Icons',
          description: 'Color picker with custom prefix and suffix icons',
          widget: _CustomIconsExample(),
        ),
      ];

  /// Platform examples
  static List<ColorPickerStoryExample> get platformExamples => [
        ColorPickerStoryExample(
          name: 'Platform Adaptive',
          description: 'Color picker that adapts to platform',
          widget: _PlatformAdaptiveExample(),
        ),
        ColorPickerStoryExample(
          name: 'Material Design',
          description: 'Color picker with Material Design styling',
          widget: _MaterialExample(),
        ),
      ];

  /// Form integration examples
  static List<ColorPickerStoryExample> get formExamples => [
        ColorPickerStoryExample(
          name: 'Form Integration',
          description: 'Color picker integrated within a form',
          widget: _FormIntegrationExample(),
        ),
        ColorPickerStoryExample(
          name: 'Multiple Color Pickers',
          description: 'Multiple color pickers in a single form',
          widget: _MultiplePickersExample(),
        ),
        ColorPickerStoryExample(
          name: 'Color Validation',
          description: 'Color picker with validation rules',
          widget: _ValidationExample(),
        ),
      ];

  /// Accessibility examples
  static List<ColorPickerStoryExample> get accessibilityExamples => [
        ColorPickerStoryExample(
          name: 'With Semantic Labels',
          description: 'Color picker with proper semantic labels for accessibility',
          widget: _AccessibilityExample(),
        ),
        ColorPickerStoryExample(
          name: 'Keyboard Navigation',
          description: 'Color picker optimized for keyboard navigation',
          widget: _KeyboardNavigationExample(),
        ),
      ];

  /// RTL examples
  static List<ColorPickerStoryExample> get rtlExamples => [
        ColorPickerStoryExample(
          name: 'RTL Support',
          description: 'Color picker with Right-to-Left text direction',
          widget: _RTLExample(),
        ),
      ];

  /// Color format examples
  static List<ColorPickerStoryExample> get formatExamples => [
        ColorPickerStoryExample(
          name: 'HEX Format',
          description: 'Color picker displaying HEX values',
          widget: _HexFormatExample(),
        ),
        ColorPickerStoryExample(
          name: 'RGB Format',
          description: 'Color picker displaying RGB values',
          widget: _RgbFormatExample(),
        ),
        ColorPickerStoryExample(
          name: 'HSL Format',
          description: 'Color picker displaying HSL values',
          widget: _HslFormatExample(),
        ),
      ];

  /// All examples grouped by category
  static Map<String, List<ColorPickerStoryExample>> get allExamples => {
        'Basic Usage': basicExamples,
        'States': stateExamples,
        'Customization': customizationExamples,
        'Platform Adaptive': platformExamples,
        'Form Integration': formExamples,
        'Accessibility': accessibilityExamples,
        'RTL Support': rtlExamples,
        'Color Formats': formatExamples,
      };
}

/// Data class for story examples
class ColorPickerStoryExample {
  final String name;
  final String description;
  final Widget widget;

  const ColorPickerStoryExample({
    required this.name,
    required this.description,
    required this.widget,
  });
}

// Example Widgets

class _HSVColorPickerExample extends StatefulWidget {
  @override
  _HSVColorPickerExampleState createState() => _HSVColorPickerExampleState();
}

class _HSVColorPickerExampleState extends State<_HSVColorPickerExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color),
            labelText: 'Color primario',
            hintText: 'Selecciona un color',
          ),
          const SizedBox(height: 16),
          Text('Color seleccionado: ${selectedColor?.getFormattedString() ?? 'Ninguno'}'),
          if (selectedColor != null) ...[
            const SizedBox(height: 8),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: selectedColor!.colorWithAlpha,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PaletteColorPickerExample extends StatefulWidget {
  @override
  _PaletteColorPickerExampleState createState() => _PaletteColorPickerExampleState();
}

class _PaletteColorPickerExampleState extends State<_PaletteColorPickerExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.palette,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color),
            labelText: 'Color de paleta',
            hintText: 'Elige de la paleta',
          ),
          const SizedBox(height: 16),
          Text('Color seleccionado: ${selectedColor?.getFormattedString() ?? 'Ninguno'}'),
          if (selectedColor != null) ...[
            const SizedBox(height: 8),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: selectedColor!.colorWithAlpha,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StateExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStateExample('Default', AppColorPickerState.defaultState),
          const SizedBox(height: 12),
          _buildStateExample('Hover', AppColorPickerState.hover),
          const SizedBox(height: 12),
          _buildStateExample('Focus', AppColorPickerState.focus),
          const SizedBox(height: 12),
          _buildStateExample('Selected', AppColorPickerState.selected, AppColorValue.fromColor(Colors.blue)),
          const SizedBox(height: 12),
          _buildStateExample('Disabled', AppColorPickerState.disabled),
          const SizedBox(height: 12),
          _buildStateExample('Loading', AppColorPickerState.loading),
          const SizedBox(height: 12),
          _buildStateExample('Skeleton', AppColorPickerState.skeleton),
        ],
      ),
    );
  }

  Widget _buildStateExample(String stateName, AppColorPickerState state, [AppColorValue? value]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(stateName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        AppColorPicker(
          variant: AppColorPickerVariant.hsv,
          state: state,
          value: value,
          onChanged: state == AppColorPickerState.disabled ? null : (_) {},
          labelText: 'Color $stateName',
          hintText: 'Estado: $stateName',
        ),
      ],
    );
  }
}

class _DisabledExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        enabled: false,
        labelText: 'Color (Deshabilitado)',
        hintText: 'Este campo está deshabilitado',
        onChanged: null,
      ),
    );
  }
}

class _LoadingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        state: AppColorPickerState.loading,
        labelText: 'Cargando colores...',
        hintText: 'Por favor espera',
        onChanged: (_) {},
      ),
    );
  }
}

class _SkeletonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        state: AppColorPickerState.skeleton,
        labelText: 'Cargando...',
        onChanged: (_) {},
      ),
    );
  }
}

class _CustomConfigExample extends StatefulWidget {
  @override
  _CustomConfigExampleState createState() => _CustomConfigExampleState();
}

class _CustomConfigExampleState extends State<_CustomConfigExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        value: selectedColor,
        onChanged: (color) => setState(() => selectedColor = color),
        labelText: 'Color personalizado',
        hintText: 'Estilo personalizado',
        config: const AppColorPickerConfig(
          borderRadius: 20.0,
          borderWidth: 3.0,
          enableShadow: true,
          shadowBlurRadius: 8.0,
          shadowOffset: Offset(0, 4),
          animationDuration: Duration(milliseconds: 400),
          pressedScale: 0.9,
          showColorPreview: true,
          colorPreviewSize: 80.0,
        ),
      ),
    );
  }
}

class _AlphaChannelExample extends StatefulWidget {
  @override
  _AlphaChannelExampleState createState() => _AlphaChannelExampleState();
}

class _AlphaChannelExampleState extends State<_AlphaChannelExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color),
            labelText: 'Color con transparencia',
            hintText: 'Incluye canal alpha',
            showAlphaChannel: true,
            config: const AppColorPickerConfig(showAlphaChannel: true),
          ),
          const SizedBox(height: 16),
          if (selectedColor != null) ...[
            Text('Alpha: ${(selectedColor!.alpha * 100).toStringAsFixed(0)}%'),
            const SizedBox(height: 8),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: selectedColor!.colorWithAlpha,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CustomPaletteExample extends StatefulWidget {
  @override
  _CustomPaletteExampleState createState() => _CustomPaletteExampleState();
}

class _CustomPaletteExampleState extends State<_CustomPaletteExample> {
  AppColorValue? selectedColor;

  static const List<Color> customPalette = [
    Color(0xFFE8F5E8),
    Color(0xFFC8E6C9),
    Color(0xFFA5D6A7),
    Color(0xFF81C784),
    Color(0xFF66BB6A),
    Color(0xFF4CAF50),
    Color(0xFF43A047),
    Color(0xFF388E3C),
    Color(0xFF2E7D32),
    Color(0xFF1B5E20),
    Color(0xFF87CEEB),
    Color(0xFF4682B4),
    Color(0xFF4169E1),
    Color(0xFF0000CD),
    Color(0xFF191970),
    Color(0xFFFFE4E1),
    Color(0xFFFFC0CB),
    Color(0xFFFF1493),
    Color(0xFFDC143C),
    Color(0xFF8B0000),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.palette,
        value: selectedColor,
        onChanged: (color) => setState(() => selectedColor = color),
        labelText: 'Paleta personalizada',
        hintText: 'Colores personalizados',
        customPalette: customPalette,
        paletteName: 'Personalizada',
      ),
    );
  }
}

class _CustomIconsExample extends StatefulWidget {
  @override
  _CustomIconsExampleState createState() => _CustomIconsExampleState();
}

class _CustomIconsExampleState extends State<_CustomIconsExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        value: selectedColor,
        onChanged: (color) => setState(() => selectedColor = color),
        labelText: 'Color con iconos personalizados',
        hintText: 'Iconos personalizados',
        prefixIcon: const Icon(Icons.brush),
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

class _PlatformAdaptiveExample extends StatefulWidget {
  @override
  _PlatformAdaptiveExampleState createState() => _PlatformAdaptiveExampleState();
}

class _PlatformAdaptiveExampleState extends State<_PlatformAdaptiveExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        value: selectedColor,
        onChanged: (color) => setState(() => selectedColor = color),
        labelText: 'Color adaptativo',
        hintText: 'Se adapta a la plataforma',
        adaptivePlatform: true,
      ),
    );
  }
}

class _MaterialExample extends StatefulWidget {
  @override
  _MaterialExampleState createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<_MaterialExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        value: selectedColor,
        onChanged: (color) => setState(() => selectedColor = color),
        labelText: 'Color Material Design',
        hintText: 'Estilo Material',
        adaptivePlatform: false,
      ),
    );
  }
}

class _FormIntegrationExample extends StatefulWidget {
  @override
  _FormIntegrationExampleState createState() => _FormIntegrationExampleState();
}

class _FormIntegrationExampleState extends State<_FormIntegrationExample> {
  final _formKey = GlobalKey<FormState>();
  AppColorValue? primaryColor;
  AppColorValue? secondaryColor;
  AppColorValue? accentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppColorPicker(
              variant: AppColorPickerVariant.hsv,
              value: primaryColor,
              onChanged: (color) => setState(() => primaryColor = color),
              labelText: 'Color primario',
              hintText: 'Selecciona color primario',
              validator: AppColorValidators.required(),
            ),
            const SizedBox(height: 16),
            AppColorPicker(
              variant: AppColorPickerVariant.palette,
              value: secondaryColor,
              onChanged: (color) => setState(() => secondaryColor = color),
              labelText: 'Color secundario',
              hintText: 'Selecciona color secundario',
              validator: AppColorValidators.required(),
            ),
            const SizedBox(height: 16),
            AppColorPicker(
              variant: AppColorPickerVariant.hsv,
              value: accentColor,
              onChanged: (color) => setState(() => accentColor = color),
              labelText: 'Color de acento',
              hintText: 'Selecciona color de acento',
              showAlphaChannel: true,
              validator: (value) {
                final validators = [
                  AppColorValidators.required(),
                  AppColorValidators.alphaRange(0.5, 1.0),
                ];
                for (final validator in validators) {
                  final result = validator(value);
                  if (result != null) return result;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Formulario válido!')),
                  );
                }
              },
              child: const Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MultiplePickersExample extends StatefulWidget {
  @override
  _MultiplePickersExampleState createState() => _MultiplePickersExampleState();
}

class _MultiplePickersExampleState extends State<_MultiplePickersExample> {
  AppColorValue? textColor;
  AppColorValue? backgroundColor;
  AppColorValue? borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: textColor,
            onChanged: (color) => setState(() => textColor = color),
            labelText: 'Color del texto',
            hintText: 'Color para el texto',
          ),
          const SizedBox(height: 16),
          AppColorPicker(
            variant: AppColorPickerVariant.palette,
            value: backgroundColor,
            onChanged: (color) => setState(() => backgroundColor = color),
            labelText: 'Color de fondo',
            hintText: 'Color de fondo',
          ),
          const SizedBox(height: 16),
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: borderColor,
            onChanged: (color) => setState(() => borderColor = color),
            labelText: 'Color del borde',
            hintText: 'Color del borde',
            showAlphaChannel: true,
          ),
          const SizedBox(height: 24),
          if (textColor != null && backgroundColor != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor!.colorWithAlpha,
                border: borderColor != null
                    ? Border.all(color: borderColor!.colorWithAlpha, width: 2)
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Vista previa del estilo',
                style: TextStyle(
                  color: textColor!.colorWithAlpha,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}

class _ValidationExample extends StatefulWidget {
  @override
  _ValidationExampleState createState() => _ValidationExampleState();
}

class _ValidationExampleState extends State<_ValidationExample> {
  AppColorValue? selectedColor;
  String? errorText;

  void _validateColor(AppColorValue? color) {
    setState(() {
      final validators = [
        AppColorValidators.required(),
        AppColorValidators.notTransparent(),
        AppColorValidators.contrast(Colors.white, 4.5),
      ];
      for (final validator in validators) {
        final result = validator(color);
        if (result != null) {
          errorText = result;
          return;
        }
      }
      errorText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        value: selectedColor,
        onChanged: (color) {
          setState(() => selectedColor = color);
          _validateColor(color);
        },
        labelText: 'Color con validación',
        hintText: 'Debe tener buen contraste',
        errorText: errorText,
        showAlphaChannel: true,
      ),
    );
  }
}

class _AccessibilityExample extends StatefulWidget {
  @override
  _AccessibilityExampleState createState() => _AccessibilityExampleState();
}

class _AccessibilityExampleState extends State<_AccessibilityExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppColorPicker(
        variant: AppColorPickerVariant.hsv,
        value: selectedColor,
        onChanged: (color) => setState(() => selectedColor = color),
        labelText: 'Color accesible',
        hintText: 'Selecciona un color accesible',
        semanticLabel: 'Selector de color para tema accesible, toca para abrir el picker',
        helperText: 'Elige un color que cumpla con los estándares de accesibilidad',
      ),
    );
  }
}

class _KeyboardNavigationExample extends StatefulWidget {
  @override
  _KeyboardNavigationExampleState createState() => _KeyboardNavigationExampleState();
}

class _KeyboardNavigationExampleState extends State<_KeyboardNavigationExample> {
  AppColorValue? selectedColor;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Usa Tab para navegar, Enter/Space para activar'),
          const SizedBox(height: 16),
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color),
            labelText: 'Color con navegación por teclado',
            hintText: 'Navegable por teclado',
            focusNode: _focusNode,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

class _RTLExample extends StatefulWidget {
  @override
  _RTLExampleState createState() => _RTLExampleState();
}

class _RTLExampleState extends State<_RTLExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppColorPicker(
          variant: AppColorPickerVariant.hsv,
          value: selectedColor,
          onChanged: (color) => setState(() => selectedColor = color),
          labelText: 'اختر اللون',
          hintText: 'اختر لونًا من هنا',
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}

class _HexFormatExample extends StatefulWidget {
  @override
  _HexFormatExampleState createState() => _HexFormatExampleState();
}

class _HexFormatExampleState extends State<_HexFormatExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color.copyWithFormat(ColorFormat.hex)),
            labelText: 'Color en formato HEX',
            hintText: 'Formato HEX (#RRGGBB)',
          ),
          const SizedBox(height: 16),
          if (selectedColor != null)
            Text('HEX: ${selectedColor!.hexString}'),
        ],
      ),
    );
  }
}

class _RgbFormatExample extends StatefulWidget {
  @override
  _RgbFormatExampleState createState() => _RgbFormatExampleState();
}

class _RgbFormatExampleState extends State<_RgbFormatExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color.copyWithFormat(ColorFormat.rgb)),
            labelText: 'Color en formato RGB',
            hintText: 'Formato RGB',
          ),
          const SizedBox(height: 16),
          if (selectedColor != null)
            Text('RGB: ${selectedColor!.rgbString}'),
        ],
      ),
    );
  }
}

class _HslFormatExample extends StatefulWidget {
  @override
  _HslFormatExampleState createState() => _HslFormatExampleState();
}

class _HslFormatExampleState extends State<_HslFormatExample> {
  AppColorValue? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            value: selectedColor,
            onChanged: (color) => setState(() => selectedColor = color.copyWithFormat(ColorFormat.hsl)),
            labelText: 'Color en formato HSL',
            hintText: 'Formato HSL',
          ),
          const SizedBox(height: 16),
          if (selectedColor != null)
            Text('HSL: ${selectedColor!.hslString}'),
        ],
      ),
    );
  }
}