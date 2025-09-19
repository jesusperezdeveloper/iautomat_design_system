# CLAUDE.md

Este archivo proporciona orientación a Claude Code (claude.ai/code) cuando trabaje con el código del Design System de IAutomat.

## Contexto del Proyecto

**Proyecto**: iautomat_design_system
**Tipo**: Flutter Package (Design System)
**Propósito**: Sistema de diseño reutilizable para todas las aplicaciones Flutter de IAutomat (agencia de automatización)
**Autor**: Senior Software Developer especializado en Flutter, Python y n8n

## Comandos de Desarrollo

### Comandos Esenciales
```bash
# Instalar dependencias
flutter pub get

# Ejecutar tests
flutter test

# Análisis estático del código
flutter analyze

# Formatear código según estándares Dart
dart format . --line-length=80

# Verificar problemas antes de commit
flutter analyze && flutter test && dart format . --set-exit-if-changed

# Ejecutar app de ejemplo
cd example && flutter run

# Generar documentación
dart doc .
```

### Build y Deploy
```bash
# Verificar que el package es publicable
flutter pub publish --dry-run

# Actualizar dependencias
flutter pub upgrade

# Ver dependencias outdated
flutter pub outdated
```

## Arquitectura del Design System

### Estructura de Carpetas
```
lib/
├── iautomat_design_system.dart    # Punto de entrada principal, exporta todo
├── src/
│   ├── theme/                     # 🎨 Sistema de temas
│   │   ├── colors.dart           # Paleta de colores (primary, secondary, semantic)
│   │   ├── typography.dart       # Sistema tipográfico (12+ estilos)
│   │   ├── spacing.dart          # Espaciado basado en 8px
│   │   ├── app_theme.dart        # ThemeData para Material 3
│   │   └── theme.dart            # Barrel file de exports
│   │
│   ├── components/                # 🧩 Componentes reutilizables
│   │   ├── buttons/
│   │   │   ├── app_button.dart   # Widget principal del botón
│   │   │   └── button_styles.dart # Variantes: primary, secondary, outline, ghost, danger
│   │   ├── inputs/
│   │   │   ├── app_input.dart    # TextField personalizado con validación
│   │   │   └── input_styles.dart # Estilos y decoraciones
│   │   ├── cards/
│   │   │   └── app_card.dart     # Card con elevación y bordes personalizables
│   │   └── components.dart       # Barrel file de exports
│   │
│   └── utils/                     # 🔧 Utilidades
│       ├── responsive.dart       # Helpers para mobile/tablet/desktop
│       └── utils.dart            # Barrel file de exports
```

### Principios de Diseño

1. **Consistencia**: Todos los componentes usan los tokens del sistema (colors, spacing, typography)
2. **Escalabilidad**: Fácil agregar nuevos componentes siguiendo la estructura
3. **Responsive**: Todos los componentes deben adaptarse a diferentes tamaños
4. **Accesibilidad**: Seguir las guías de Material Design para accesibilidad
5. **Performance**: Componentes stateless cuando sea posible, const constructors

### Sistema de Tokens

#### Colores
- **Primarios**: brand colors de IAutomat
- **Secundarios**: colores de apoyo
- **Semánticos**: success, warning, error, info
- **Neutros**: grises para texto y fondos
- **Soporte**: Light y Dark mode

#### Tipografía
- **Escalas**: 10px hasta 72px
- **Pesos**: 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Estilos predefinidos**: h1-h6, body1-2, caption, overline, button

#### Espaciado
- **Base**: 8px
- **Escala**: 4, 8, 12, 16, 20, 24, 32, 40, 48, 56, 64, 72
- **Nomenclatura**: xxxs, xxs, xs, sm, md, lg, xl, xxl, xxxl

### Convenciones de Código

#### Naming Conventions
```dart
// Clases: PascalCase
class AppButton extends StatelessWidget {}

// Archivos: snake_case
app_button.dart

// Constantes: lowerCamelCase con prefijo 'k'
const kDefaultPadding = EdgeInsets.all(16.0);

// Enums: PascalCase
enum ButtonVariant { primary, secondary, outline }

// Variables privadas: _camelCase
final _controller = TextEditingController();
```

#### Estructura de Componentes
```dart
// 1. Imports
import 'package:flutter/material.dart';

// 2. Enums y Types
enum ButtonSize { small, medium, large }

// 3. Widget principal
class AppButton extends StatelessWidget {
  // 3.1 Propiedades con documentación
  /// Texto del botón
  final String text;
  
  // 3.2 Constructor const cuando sea posible
  const AppButton({
    super.key,
    required this.text,
  });
  
  // 3.3 Build method
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// 4. Widgets privados auxiliares (si los hay)
class _ButtonContent extends StatelessWidget {}
```

### Patrones de Desarrollo

#### Uso del Theme
```dart
// Siempre obtener colores del theme
final theme = Theme.of(context);
final colors = theme.colorScheme;
final textTheme = theme.textTheme;

// Nunca hardcodear valores
// ❌ Mal
color: Color(0xFF2196F3)

// ✅ Bien
color: theme.colorScheme.primary
```

#### Responsive Design
```dart
// Usar el helper responsive
if (Responsive.isMobile(context)) {
  return MobileLayout();
} else if (Responsive.isTablet(context)) {
  return TabletLayout();
} else {
  return DesktopLayout();
}
```

#### Componentes Configurables
```dart
// Los componentes deben tener valores por defecto sensatos
class AppButton extends StatelessWidget {
  final ButtonVariant variant;
  final ButtonSize size;
  
  const AppButton({
    this.variant = ButtonVariant.primary,  // Default
    this.size = ButtonSize.medium,          // Default
  });
}
```

## Testing

### Estructura de Tests
```
test/
├── theme/
│   ├── colors_test.dart
│   └── typography_test.dart
├── components/
│   ├── app_button_test.dart
│   └── app_input_test.dart
└── utils/
    └── responsive_test.dart
```

### Ejemplo de Test
```dart
// Cada componente debe tener tests para:
// 1. Renderizado correcto
// 2. Interacciones
// 3. Estados (enabled/disabled, loading, etc)
// 4. Responsiveness

testWidgets('AppButton renders correctly', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: AppButton(
          text: 'Test',
          onPressed: () {},
        ),
      ),
    ),
  );
  
  expect(find.text('Test'), findsOneWidget);
});
```

## Ejemplo de Uso

### En una App Flutter
```dart
// main.dart
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IAutomat App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

// Uso de componentes
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacing.pagePadding,
        child: Column(
          children: [
            Text(
              'Bienvenido',
              style: AppTypography.h1,
            ),
            AppSpacing.verticalMd,
            AppButton(
              text: 'Comenzar',
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.large,
            ),
            AppSpacing.verticalSm,
            AppInput(
              label: 'Email',
              hint: 'ejemplo@iautomat.com',
              validator: Validators.email,
            ),
            AppSpacing.verticalMd,
            AppCard(
              child: Text('Contenido de la tarjeta'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Checklist para Nuevos Componentes

Cuando agregues un nuevo componente, asegúrate de:

- [ ] Crear el archivo en la carpeta correcta (`lib/src/components/[categoria]/`)
- [ ] Seguir las convenciones de naming
- [ ] Usar const constructors cuando sea posible
- [ ] Implementar soporte para theme (light/dark)
- [ ] Agregar documentación inline con `///`
- [ ] Exportar en el barrel file correspondiente
- [ ] Crear tests unitarios
- [ ] Agregar ejemplo en `example/lib/main.dart`
- [ ] Verificar responsive design
- [ ] Pasar `flutter analyze`
- [ ] Formatear con `dart format`

## Troubleshooting Común

### Problema: Los colores no cambian en dark mode
**Solución**: Asegúrate de usar `Theme.of(context).colorScheme` en lugar de colores hardcodeados

### Problema: El componente no es responsive
**Solución**: Usa el helper `Responsive` o `LayoutBuilder` para adaptar el diseño

### Problema: Tests fallan después de cambios
**Solución**: Actualiza los golden tests con `flutter test --update-goldens`

## Enlaces y Recursos

- [Material 3 Design Guidelines](https://m3.material.io/)
- [Flutter Best Practices](https://docs.flutter.dev/development/ui/widgets/intro)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Flutter Performance Best Practices](https://docs.flutter.dev/perf/best-practices)

## Notas para Claude Code

- Prioriza la consistencia con el código existente
- Siempre usa los tokens del sistema (colors, typography, spacing)
- Los componentes nuevos deben seguir el mismo patrón que los existentes
- Agrega tests para cualquier funcionalidad nueva
- Mantén la documentación actualizada
- Si necesitas agregar dependencias, justifica por qué son necesarias
- Optimiza para performance: usa const, evita rebuilds innecesarios

## Estado Actual del Proyecto

### ✅ Completado
- **Estructura del proyecto:** Completamente configurada y funcional
- **Sistema de tema completo:**
  - DSTheme con soporte para Material 3
  - Sistema de colores (DSColors) con paleta completa
  - Sistema tipográfico (DSTypography) basado en Inter
  - Sistema de espaciado (DSSpacing) con grid de 8px
  - 20 presets de tema profesionales para 2025
- **70+ componentes implementados** con prefijo DS:
  - Componentes base (DSButton, DSCard, DSInput, etc.)
  - Componentes de formulario (DSCurrencyInput, DSDatePicker, etc.)
  - Componentes de navegación (DSDrawer, DSBreadcrumbs, DSTabs, etc.)
  - Componentes de datos (DSDataTable, DSChart, DSCalendar, etc.)
  - Componentes de feedback (DSToast, DSProgress, DSDialog, etc.)
  - Componentes e-commerce (DSProductCard, DSCartWidget, DSCheckoutForms)
  - Componentes especializados (DSBackToTop, DSCommandPalette, DSTour, etc.)
- **Sistema de configuración con Freezed:** Todos los componentes usan modelos inmutables
- **Accesibilidad completa:** Helpers A11y para cada componente complejo
- **Adaptadores de plataforma:** Para comportamiento específico por plataforma
- **Utilidades responsive:** Sistema completo de breakpoints y helpers
- **Tests exhaustivos:** 134 archivos de test con cobertura >95%
- **Aplicación de ejemplo funcional:** 42 archivos, con router y provider
- **Documentación completa:** README.md con 1900+ líneas de documentación

### 🚀 Features Destacadas Implementadas
- **Prefijo DS consistente** en todos los componentes
- **Material 3** totalmente integrado
- **WCAG 2.0 AA** compliance en accesibilidad
- **RTL support** completo
- **20 presets de tema** categorizados (corporativo, tech, creativo, natural)
- **Sistema de validación** robusto para formularios
- **Animaciones y transiciones** optimizadas
- **Golden tests** para validación visual
- **CI/CD ready** con scripts de verificación

### 📊 Métricas del Proyecto
- **Componentes:** 70+ componentes completos
- **Tests:** 134 archivos de test
- **Cobertura:** >95%
- **Documentación:** README completo con ejemplos
- **Performance:** 0 warnings en flutter analyze

### 🔄 Mantenimiento Continuo
- Actualización regular de dependencias
- Mejoras de performance
- Nuevos componentes según necesidades
- Refinamiento de temas y estilos

## Guías de Implementación Específicas

### Para Colores (colors.dart)
```dart
// Estructura esperada
class AppColors {
  // Colores primarios
  static const Color primary = Color(0xFF...);
  static const Color primaryLight = Color(0xFF...);
  static const Color primaryDark = Color(0xFF...);
  
  // Colores secundarios
  static const Color secondary = Color(0xFF...);
  
  // Colores semánticos
  static const Color success = Color(0xFF...);
  static const Color warning = Color(0xFF...);
  static const Color error = Color(0xFF...);
  static const Color info = Color(0xFF...);
  
  // Escala de grises
  static const Color gray50 = Color(0xFF...);
  // ... gray100 hasta gray900
  
  // Colores para dark mode
  static const Color primaryDark = Color(0xFF...);
}
```

### Para Tipografía (typography.dart)
```dart
// Sistema tipográfico basado en Material Design
class AppTypography {
  static const TextStyle h1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  
  static const TextStyle h2 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  
  // ... h3 hasta h6
  
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}
```

### Para Espaciado (spacing.dart)
```dart
class AppSpacing {
  // Base unit
  static const double unit = 8.0;
  
  // Spacing scale
  static const double xxxs = unit * 0.5;  // 4
  static const double xxs = unit * 1;     // 8
  static const double xs = unit * 1.5;    // 12
  static const double sm = unit * 2;      // 16
  static const double md = unit * 3;      // 24
  static const double lg = unit * 4;      // 32
  static const double xl = unit * 5;      // 40
  static const double xxl = unit * 6;     // 48
  static const double xxxl = unit * 8;    // 64
  
  // Widgets de espaciado
  static const Widget verticalXxs = SizedBox(height: xxs);
  static const Widget verticalXs = SizedBox(height: xs);
  static const Widget verticalSm = SizedBox(height: sm);
  static const Widget verticalMd = SizedBox(height: md);
  static const Widget verticalLg = SizedBox(height: lg);
  
  static const Widget horizontalXxs = SizedBox(width: xxs);
  static const Widget horizontalXs = SizedBox(width: xs);
  static const Widget horizontalSm = SizedBox(width: sm);
  static const Widget horizontalMd = SizedBox(width: md);
  static const Widget horizontalLg = SizedBox(width: lg);
  
  // Padding presets
  static const EdgeInsets pagePadding = EdgeInsets.all(md);
  static const EdgeInsets cardPadding = EdgeInsets.all(sm);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: xs,
  );
}
```

### Para AppTheme (app_theme.dart)
```dart
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        // ... otros colores
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.h1,
        displayMedium: AppTypography.h2,
        bodyLarge: AppTypography.body1,
        // ... mapear todos los estilos
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        margin: EdgeInsets.all(AppSpacing.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    // Similar pero con colores para dark mode
  }
}
```

## Prioridades de Desarrollo

1. **Primera Fase** (Base del Design System)
   - Implementar colors.dart con paleta completa
   - Crear typography.dart con sistema tipográfico
   - Definir spacing.dart con sistema de espaciado
   - Configurar app_theme.dart con Material 3

2. **Segunda Fase** (Componentes Core)
   - AppButton con 5 variantes y 3 tamaños
   - AppInput con validación y estados
   - AppCard con customización

3. **Tercera Fase** (Polish)
   - Utilidades responsive
   - Tests completos
   - Documentación inline
   - App de ejemplo funcional

## Métricas de Calidad

El código debe cumplir con:
- 0 errores en `flutter analyze`
- Coverage de tests > 80%
- Documentación en todos los métodos públicos
- Ejemplos para cada componente
- Compatible con Flutter 3.0+
- Soporte completo para Material 3
- no debes lanzar ningun emulador sin que te lo pida yo.
- debes tener en cuenta los recursos de la maquina en la que corres. No tiene recursos ilimitados y tienes que optimiizar procesos
- Asegúrate siempre de que de que codificas con la ultima version disponible de la API de Flutter, para evitar deprecados.
- Cada vez que termines una feature, evalua warnings y resuelvelos antes de terminar
- todo el código que escribas debes adaptarlo a la version 3.35.3 de Flutter y la 3.9.2 de Dart. No esta permitido que escribas código deprecado.
- tienes el compromiso de escribir código 100% libre de warnings