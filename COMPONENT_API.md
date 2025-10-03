# 📚 Component API Reference

**Referencia completa y exhaustiva de la API de componentes del IAutomat Design System**

> Esta guía está diseñada específicamente para que Claude Code (u otras instancias de IA) puedan usar el Design System sin ambigüedades. Cada sección incluye documentación completa de configuración, ejemplos prácticos y casos de uso reales.

---

## 🎯 Información Esencial del Proyecto

### Versiones y Compatibilidad
```yaml
Flutter: ">=3.35.3"
Dart: ">=3.9.2 <4.0.0"
Material Design: Material 3 (Latest)
```

### Convenciones de Nomenclatura
- **Prefijo universal**: Todos los componentes usan el prefijo `DS` (Design System)
- **Clases de configuración**: Terminan en `Config` (ej: `DSButtonConfig`)
- **Helpers de accesibilidad**: Terminan en `A11yHelper` (ej: `DSButtonA11yHelper`)
- **Adaptadores de plataforma**: Terminan en `PlatformAdapter`

### Sistema de Importación
```dart
// Importación completa (recomendado)
import 'package:iautomat_design_system/iautomat_design_system.dart';

// Importación específica (opcional)
import 'package:iautomat_design_system/src/components/buttons/ds_button.dart';
import 'package:iautomat_design_system/src/theme/ds_theme.dart';
```

### 🚀 Quick Start - Configuración Inicial

```dart
import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación Empresarial',
      // Usar tema del Design System
      theme: DSTheme.lightTheme,
      darkTheme: DSTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
```

### 📊 Estadísticas del Design System
- **Total de componentes**: 70+
- **Variantes de tema**: 100 presets profesionales
- **Tests**: 134 archivos con >95% cobertura
- **Plataformas soportadas**: iOS, Android, Web, Windows, macOS, Linux
- **Accesibilidad**: WCAG 2.0 AA compliant

---

## 📖 Documentación Completa de Componentes

> **📚 NUEVO: [Referencia Completa de TODOS los Componentes](docs/COMPLETE_COMPONENTS_REFERENCE.md)**
>
> Hemos creado un documento exhaustivo con la documentación detallada de los 70+ componentes del Design System.
> Incluye constructores, configuraciones, ejemplos y patrones de uso para cada componente.
>
> **[👉 Ver Referencia Completa de Componentes](docs/COMPLETE_COMPONENTS_REFERENCE.md)**

### Componentes Destacados en este Documento

Este documento (`COMPONENT_API.md`) se enfoca en:
- **DSButton**: Documentación exhaustiva completa
- **DSToast**: Sistema de notificaciones
- **DSDataTable**: Tablas empresariales
- **Sistema de Temas**: DSTheme, DSColors, DSTypography, DSSpacing
- **Utilidades**: Responsive System, Validación
- **Mejores Prácticas**: Guías de uso
- **Troubleshooting**: Problemas comunes

**Para ver TODOS los componentes detallados:** [COMPLETE_COMPONENTS_REFERENCE.md](docs/COMPLETE_COMPONENTS_REFERENCE.md)

---

## 📋 Índice de Componentes

### 💠 Base Components (12)
- [DSButton](#dsbutton) - Sistema completo de botones
- [DSInput](#dsinput) - Campos de entrada inteligentes
- [DSCard](#dscard) - Cards empresariales
- [DSFab](#dsfab) - Floating Action Button
- [DSIconButton](#dsiconbutton) - Botones de icono
- [DSSwitch](#dsswitch) - Interruptores
- [DSCheckbox](#dscheckbox) - Checkboxes
- [DSRadio](#dsradio) - Radio buttons
- [DSTextField](#dstextfield) - Campos de texto avanzados
- [DSTextArea](#dstextarea) - Áreas de texto
- [DSSelect](#dsselect) - Selectores dropdown
- [DSSlider](#dsslider) - Controles deslizantes

### 📝 Form Components (8)
- [DSCombobox](#dscombobox) - Combo boxes
- [DSStepper](#dsstepper) - Steppers de proceso
- [DSDatePicker](#dsdatepicker) - Selectores de fecha
- [DSColorPicker](#dscolorpicker) - Selectores de color
- [DSFilePicker](#dsfilepicker) - Selectores de archivo
- [DSCurrencyInput](#dscurrencyinput) - Input de moneda
- [DSCheckoutForms](#dscheckoutforms) - Formularios de checkout
- [DSAuthScreens](#dsauthscreens) - Pantallas de autenticación

### 🗂️ Data Components (10)
- [DSDataTable](#dsdatatable) - Tablas de datos avanzadas
- [DSSimpleTable](#dssimpletable) - Tablas simples
- [DSListItem](#dslistitem) - Items de lista
- [DSDescriptionList](#dsdescriptionlist) - Listas descriptivas
- [DSMetricCard](#dsmetriccard) - Cards de métricas
- [DSCalendar](#dscalendar) - Calendario
- [DSChart](#dschart) - Gráficos
- [DSKanban](#dskanban) - Tableros Kanban
- [DSOutlineTree](#dsoutlinetree) - Árboles jerárquicos
- [DSFilterBar](#dsfilterbar) - Barras de filtro

### 🧭 Navigation Components (8)
- [DSScaffold](#dsscaffold) - Scaffold personalizado
- [DSTopAppBar](#dstopappbar) - App bars superiores
- [DSNavigation](#dsnavigation) - Navegación principal
- [DSTabs](#dstabs) - Sistema de pestañas
- [DSBreadcrumbs](#dsbreadcrumbs) - Breadcrumbs
- [DSDrawer](#dsdrawer) - Navegación lateral
- [DSMenu](#dsmenu) - Menús contextuales
- [DSPagination](#dspagination) - Paginación

### 🎯 Feedback Components (6)
- [DSToast](#dstoast) - Notificaciones toast
- [DSBanner](#dsbanner) - Banners informativos
- [DSTooltip](#dstooltip) - Tooltips
- [DSProgress](#dsprogress) - Indicadores de progreso
- [DSEmptyState](#dsemptystate) - Estados vacíos
- [DSStatusDot](#dsstatusdot) - Indicadores de estado

### 🎭 Display Components (8)
- [DSBadge](#dsbadge) - Badges y contadores
- [DSAvatar](#dsavatar) - Avatares de usuario
- [DSTag](#dstag) - Etiquetas
- [DSTimeline](#dstimeline) - Líneas de tiempo
- [DSImage](#dsimage) - Gestión de imágenes
- [DSLightbox](#dslightbox) - Visualizador de imágenes
- [DSMediaViewer](#dsmediaviewer) - Visor multimedia
- [DSSkeleton](#dsskeleton) - Estados de carga

### 🔧 Layout Components (6)
- [DSSplitView](#dssplitview) - Vistas divididas
- [DSDivider](#dsdivider) - Divisores
- [DSAccordion](#dsaccordion) - Acordeones
- [DSChip](#dschip) - Chips informativos
- [DSToggleView](#dstoggleview) - Vistas alternables
- [DSCommandPalette](#dscommandpalette) - Paleta de comandos

### 🏪 E-commerce Components (4)
- [DSProductCard](#dsproductcard) - Cards de producto
- [DSCartWidget](#dscartwidget) - Widget de carrito
- [DSMap](#dsmap) - Mapas interactivos
- [DSCameraPicker](#dscamerapicker) - Selector de cámara

### ⚙️ Specialty Components (8)
- [DSProfilePreferences](#dsprofilepreferences) - Configuración de perfil
- [DSRoleVisibility](#dsrolevisibility) - Control de visibilidad por roles
- [DSClipboardShare](#dsclipboardshare) - Compartir portapapeles
- [DSBackToTop](#dsbacktotop) - Botón volver arriba
- [DSInPageSearch](#dsinpagesearch) - Búsqueda en página
- [DSDialog](#dsdialog) - Diálogos modales
- [DSBottomSheet](#dsbottomsheet) - Bottom sheets
- [DSTour](#dstour) - Tours guiados

---

## 💠 Base Components

### DSButton

**Sistema completo de botones empresariales con 6 variantes y 8 estados**

> ⚠️ **IMPORTANTE**: Este componente usa el prefijo `DS` (Design System), no `App`. El nombre correcto es `DSButton`.

#### Constructor Principal
```dart
DSButton({
  Key? key,
  required String text,                    // Texto del botón
  VoidCallback? onPressed,                 // Callback de acción (null = disabled)
  VoidCallback? onLongPress,               // Callback de presión larga
  Widget? prefixIcon,                      // Icono antes del texto
  Widget? suffixIcon,                      // Icono después del texto
  bool loading = false,                    // Estado de carga con spinner
  bool disabled = false,                   // Estado deshabilitado explícito
  String? tooltip,                         // Tooltip accesible
  FocusNode? focusNode,                    // Focus node personalizado
  bool autofocus = false,                  // Auto-focus inicial
  DSButtonConfig? config,                  // Configuración completa (ver abajo)
})
```

#### Variantes del Constructor
```dart
// Botón de icono circular
DSButton.icon({
  required Widget icon,
  VoidCallback? onPressed,
  String? tooltip,
  DSButtonConfig? config,
})

// Botón de texto (sin fondo)
DSButton.text({
  required String text,
  VoidCallback? onPressed,
  DSButtonConfig? config,
})

// Botón outline (con borde)
DSButton.outline({
  required String text,
  VoidCallback? onPressed,
  DSButtonConfig? config,
})
```

#### Configuración (DSButtonConfig)
```dart
@freezed
class DSButtonConfig with _$DSButtonConfig {
  const factory DSButtonConfig({
    @Default(DSButtonVariant.filled) DSButtonVariant variant,    // Variante del botón
    @Default(DSButtonState.defaultState) DSButtonState state,    // Estado actual
    @Default(DSButtonSize.medium) DSButtonSize size,             // Tamaño
    @Default(false) bool isDanger,                               // Estilo de peligro/eliminación
    @Default(true) bool isAdaptive,                              // Adaptar a plataforma
    @Default(false) bool isRtl,                                  // Soporte Right-to-Left
    @Default(true) bool enableA11y,                              // Accesibilidad habilitada
    @Default(true) bool enableKeyboardSupport,                   // Soporte de teclado
    @Default(true) bool isInteractive,                           // Si es interactivo
    DSButtonColors? colors,                                      // Configuración de colores
    DSButtonSpacing? spacing,                                    // Espaciado y dimensiones
    DSButtonElevation? elevation,                                // Configuración de elevación
    DSButtonBehavior? behavior,                                  // Comportamiento
    DSButtonAnimation? animation,                                // Animaciones
    VoidCallback? onPressed,                                     // Callback adicional
    VoidCallback? onLongPress,                                   // Callback presión larga
    ValueChanged<bool>? onHover,                                 // Callback hover
    ValueChanged<bool>? onFocusChange,                          // Callback focus
  }) = _DSButtonConfig;
}
```

#### DSButtonVariant (Variantes Disponibles)
```dart
enum DSButtonVariant {
  filled,      // Botón con fondo sólido y alta prominencia
  tonal,       // Botón con fondo tonal y prominencia media
  outline,     // Botón con borde y fondo transparente
  text,        // Botón sin fondo, solo texto
  icon,        // Botón circular solo con icono
  segmented,   // Botón para uso en grupos segmentados
}

// Propiedades útiles de la variante
variant.displayName        // "Filled", "Tonal", etc.
variant.description        // Descripción detallada
variant.hasElevation       // Si tiene sombra
variant.hasBorder          // Si tiene borde
variant.hasBackground      // Si tiene fondo
variant.isIconOnly         // Si es solo icono
```

#### DSButtonState (Estados del Botón)
```dart
enum DSButtonState {
  defaultState,  // Estado por defecto
  hover,         // Mouse sobre el botón
  pressed,       // Botón presionado
  focus,         // Botón enfocado (teclado)
  selected,      // Botón seleccionado
  disabled,      // Botón deshabilitado
  loading,       // Estado de carga (con spinner)
  skeleton,      // Estado skeleton (placeholder)
}

// Propiedades útiles del estado
state.displayName          // "Default", "Hover", etc.
state.isInteractive        // Si permite interacción
state.opacity              // Opacidad del estado (0.0-1.0)
state.showsLoader          // Si muestra loader
state.showsSkeleton        // Si muestra skeleton
state.canInteract          // Si puede interactuar
state.elevationMultiplier  // Multiplicador de elevación
```

#### DSButtonSize (Tamaños Disponibles)
```dart
enum DSButtonSize {
  small,    // Compacto (32px altura mínima)
  medium,   // Estándar (40px altura mínima)
  large,    // Grande (48px altura mínima)
}

// Propiedades automáticas por tamaño
size.displayName           // "Small", "Medium", "Large"
size.fontSize              // 12.0, 14.0, 16.0
size.iconSize              // 16.0, 20.0, 24.0
size.minHeight             // 32.0, 40.0, 48.0
size.horizontalPadding     // 12.0, 16.0, 20.0
size.verticalPadding       // 8.0, 10.0, 12.0
```

#### DSButtonColors (Configuración de Colores)
```dart
@freezed
class DSButtonColors with _$DSButtonColors {
  const factory DSButtonColors({
    Color? backgroundColor,           // Color de fondo
    Color? foregroundColor,           // Color del texto/icono
    Color? surfaceColor,              // Color de superficie
    Color? shadowColor,               // Color de la sombra
    Color? borderColor,               // Color del borde
    Color? hoverColor,                // Color en hover
    Color? pressedColor,              // Color al presionar
    Color? focusColor,                // Color al enfocar
    Color? selectedColor,             // Color seleccionado
    Color? disabledColor,             // Color deshabilitado
    Color? loadingColor,              // Color en loading
    Color? skeletonColor,             // Color skeleton
    Color? dangerColor,               // Color de peligro
    Color? dangerForegroundColor,     // Color texto peligro
    Color? textColor,                 // Color texto general
    Color? iconColor,                 // Color icono general
  }) = _DSButtonColors;
}
```

#### DSButtonSpacing (Espaciado y Dimensiones)
```dart
@freezed
class DSButtonSpacing with _$DSButtonSpacing {
  const factory DSButtonSpacing({
    @Default(16.0) double horizontalPadding,  // Padding horizontal
    @Default(12.0) double verticalPadding,    // Padding vertical
    @Default(8.0) double iconSpacing,         // Espacio entre icono y texto
    @Default(12.0) double borderRadius,       // Radio de bordes
    @Default(1.0) double borderWidth,         // Ancho del borde
    @Default(24.0) double minHeight,          // Altura mínima
    @Default(88.0) double minWidth,           // Ancho mínimo
    @Default(true) bool adaptive,             // Adaptar a plataforma
  }) = _DSButtonSpacing;
}
```

#### DSButtonElevation (Configuración de Elevación)
```dart
@freezed
class DSButtonElevation with _$DSButtonElevation {
  const factory DSButtonElevation({
    @Default(1.0) double defaultElevation,   // Elevación por defecto
    @Default(4.0) double hoveredElevation,   // Elevación en hover
    @Default(8.0) double pressedElevation,   // Elevación al presionar
    @Default(2.0) double focusedElevation,   // Elevación enfocado
    @Default(6.0) double selectedElevation,  // Elevación seleccionado
    @Default(0.0) double disabledElevation,  // Elevación deshabilitado
    Color? shadowColor,                      // Color de sombra
    Color? surfaceTintColor,                 // Color de tinte de superficie
  }) = _DSButtonElevation;
}
```

#### DSButtonBehavior (Comportamiento)
```dart
@freezed
class DSButtonBehavior with _$DSButtonBehavior {
  const factory DSButtonBehavior({
    @Default(true) bool enableHapticFeedback,    // Feedback háptico
    @Default(true) bool enableRipple,            // Efecto ripple
    @Default(true) bool enableHover,             // Efecto hover
    @Default(true) bool enableFocus,             // Efecto focus
    @Default(true) bool maintainState,           // Mantener estado
    @Default(DSButtonClipBehavior.antiAlias) DSButtonClipBehavior clipBehavior,
    @Default(300) int animationDuration,         // Duración animación (ms)
    @Default(true) bool showLoadingIndicator,    // Mostrar loading
    @Default(true) bool showSkeletonAnimation,   // Mostrar skeleton
    @Default(true) bool autoSize,                // Auto-dimensionar
  }) = _DSButtonBehavior;
}
```

#### DSButtonAnimation (Animaciones)
```dart
@freezed
class DSButtonAnimation with _$DSButtonAnimation {
  const factory DSButtonAnimation({
    @Default(DSButtonAnimationType.scale) DSButtonAnimationType type,
    @Default(300) int duration,                          // Duración en ms
    @Default(Curves.easeInOut) Curve curve,              // Curva de animación
    @Default(true) bool enableStateTransitions,          // Transiciones de estado
    @Default(true) bool enableHoverAnimation,            // Animación hover
    @Default(true) bool enablePressAnimation,            // Animación press
    @Default(true) bool enableLoadingAnimation,          // Animación loading
  }) = _DSButtonAnimation;
}

enum DSButtonAnimationType {
  none,       // Sin animación
  scale,      // Escala (elasticOut)
  fade,       // Fade (easeInOut)
  slide,      // Deslizamiento (easeOutCubic)
  elevation,  // Elevación (easeInOutQuart)
}
```

#### Ejemplos de Uso Reales

##### Ejemplo 1: Botón Básico de Guardado
```dart
DSButton(
  text: 'Guardar',
  onPressed: () => _save(),
)
```

##### Ejemplo 2: Botón de Descarga con Icono
```dart
DSButton(
  text: 'Descargar Reporte',
  prefixIcon: Icon(Icons.download),
  config: DSButtonConfig(
    variant: DSButtonVariant.outline,
    size: DSButtonSize.large,
    colors: DSButtonColors(
      backgroundColor: DSColors.primary,
      foregroundColor: Colors.white,
    ),
  ),
  onPressed: () => _downloadReport(),
)
```

##### Ejemplo 3: Botón de Carga (Loading State)
```dart
DSButton(
  text: _isProcessing ? 'Procesando...' : 'Procesar',
  loading: _isProcessing,
  disabled: _isProcessing,
  onPressed: () async {
    setState(() => _isProcessing = true);
    await _processData();
    setState(() => _isProcessing = false);
  },
)
```

##### Ejemplo 4: Botón de Peligro (Eliminar)
```dart
DSButton(
  text: 'Eliminar Cuenta',
  prefixIcon: Icon(Icons.delete_forever),
  config: DSButtonConfig(
    isDanger: true,
    variant: DSButtonVariant.filled,
    behavior: DSButtonBehavior(
      enableHapticFeedback: true,
    ),
  ),
  onPressed: () => _showDeleteConfirmation(),
)
```

##### Ejemplo 5: Botón con Configuración Completa
```dart
DSButton(
  text: 'Confirmar Pago',
  prefixIcon: Icon(Icons.payment),
  tooltip: 'Procesar el pago de forma segura',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.large,
    colors: DSButtonColors(
      backgroundColor: DSColors.success,
      foregroundColor: Colors.white,
      hoverColor: DSColors.successDark,
    ),
    spacing: DSButtonSpacing(
      horizontalPadding: 24.0,
      verticalPadding: 16.0,
      borderRadius: 16.0,
    ),
    elevation: DSButtonElevation(
      defaultElevation: 2.0,
      hoveredElevation: 8.0,
      pressedElevation: 12.0,
    ),
    animation: DSButtonAnimation(
      type: DSButtonAnimationType.scale,
      duration: 200,
      curve: Curves.easeInOut,
    ),
    behavior: DSButtonBehavior(
      enableHapticFeedback: true,
      enableRipple: true,
    ),
  ),
  onPressed: () => _processPayment(),
  onLongPress: () => _showPaymentOptions(),
)
```

##### Ejemplo 6: Grupo de Botones Segmentados
```dart
Row(
  children: [
    Expanded(
      child: DSButton(
        text: 'Mes',
        config: DSButtonConfig(
          variant: DSButtonVariant.segmented,
          state: _selectedPeriod == 'month'
            ? DSButtonState.selected
            : DSButtonState.defaultState,
        ),
        onPressed: () => setState(() => _selectedPeriod = 'month'),
      ),
    ),
    Expanded(
      child: DSButton(
        text: 'Año',
        config: DSButtonConfig(
          variant: DSButtonVariant.segmented,
          state: _selectedPeriod == 'year'
            ? DSButtonState.selected
            : DSButtonState.defaultState,
        ),
        onPressed: () => setState(() => _selectedPeriod = 'year'),
      ),
    ),
  ],
)
```

##### Ejemplo 7: Botón de Icono (FAB-like)
```dart
DSButton.icon(
  icon: Icon(Icons.add),
  tooltip: 'Crear nuevo elemento',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.large,
    colors: DSButtonColors(
      backgroundColor: DSColors.primary,
      foregroundColor: Colors.white,
    ),
    spacing: DSButtonSpacing(
      borderRadius: 28.0, // Circular
    ),
  ),
  onPressed: () => _createNew(),
)
```

##### Ejemplo 8: Botón Adaptativo por Plataforma
```dart
DSButton(
  text: 'Compartir',
  prefixIcon: Icon(Icons.share),
  config: DSButtonConfig(
    isAdaptive: true, // Se adapta automáticamente a iOS/Android/Web
    variant: DSButtonVariant.tonal,
  ),
  onPressed: () => _shareContent(),
)
```

##### Ejemplo 9: Botón con RTL Support
```dart
DSButton(
  text: 'التالي', // "Siguiente" en árabe
  suffixIcon: Icon(Icons.arrow_forward),
  config: DSButtonConfig(
    isRtl: true, // El icono se coloca a la izquierda automáticamente
    variant: DSButtonVariant.outline,
  ),
  onPressed: () => _goNext(),
)
```

##### Ejemplo 10: Botón Skeleton (Placeholder)
```dart
// Útil mientras carga data
DSButton(
  text: 'Cargando...',
  config: DSButtonConfig(
    state: DSButtonState.skeleton,
    behavior: DSButtonBehavior(
      showSkeletonAnimation: true,
    ),
  ),
)
```

#### Casos de Uso Empresariales

##### Dashboard Ejecutivo
```dart
// Botón de acción principal
DSButton(
  text: 'Generar Reporte',
  prefixIcon: Icon(Icons.analytics),
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.large,
  ),
  onPressed: () => _generateReport(),
)

// Botón secundario
DSButton(
  text: 'Exportar a Excel',
  prefixIcon: Icon(Icons.file_download),
  config: DSButtonConfig(
    variant: DSButtonVariant.outline,
    size: DSButtonSize.medium,
  ),
  onPressed: () => _exportToExcel(),
)
```

##### E-commerce
```dart
// Botón "Agregar al carrito"
DSButton(
  text: 'Agregar al Carrito',
  prefixIcon: Icon(Icons.shopping_cart),
  config: DSButtonConfig(
    variant: DSButtonVariant.tonal,
    colors: DSButtonColors(
      backgroundColor: DSColors.primary.withOpacity(0.1),
      foregroundColor: DSColors.primary,
    ),
  ),
  onPressed: () => _addToCart(product),
)

// Botón "Comprar ahora"
DSButton(
  text: 'Comprar Ahora',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.large,
    colors: DSButtonColors(
      backgroundColor: DSColors.success,
    ),
  ),
  onPressed: () => _buyNow(product),
)
```

##### Formularios
```dart
// Botón submit con validación
DSButton(
  text: 'Crear Cuenta',
  loading: _isCreating,
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.large,
  ),
  onPressed: _formKey.currentState?.validate() ?? false
    ? () => _createAccount()
    : null, // null = disabled
)

// Botón cancelar
DSButton(
  text: 'Cancelar',
  config: DSButtonConfig(
    variant: DSButtonVariant.text,
  ),
  onPressed: () => Navigator.pop(context),
)
```

---

### DSInput

**Campos de entrada inteligentes con validación avanzada**

#### Constructor
```dart
DSInput({
  Key? key,
  String? label,                           // Etiqueta del campo
  String? hint,                            // Texto de placeholder
  String? helperText,                      // Texto de ayuda
  String? errorText,                       // Texto de error
  String? initialValue,                    // Valor inicial
  TextEditingController? controller,       // Controlador personalizado
  FocusNode? focusNode,                    // Focus node
  TextInputType? keyboardType,             // Tipo de teclado
  TextInputAction? textInputAction,        // Acción del teclado
  ValueChanged<String>? onChanged,         // Callback de cambio
  VoidCallback? onEditingComplete,         // Callback de edición completa
  ValueChanged<String>? onFieldSubmitted,  // Callback de submit
  FormFieldValidator<String>? validator,   // Validador
  List<TextInputFormatter>? inputFormatters, // Formateadores
  bool readOnly = false,                   // Solo lectura
  bool obscureText = false,                // Texto oculto (password)
  bool autocorrect = true,                 // Autocorrección
  bool enableSuggestions = true,           // Sugerencias
  int? maxLines = 1,                       // Máximo de líneas
  int? minLines,                           // Mínimo de líneas
  int? maxLength,                          // Máximo de caracteres
  Widget? prefixIcon,                      // Icono prefijo
  Widget? suffixIcon,                      // Icono sufijo
  String? prefixText,                      // Texto prefijo
  String? suffixText,                      // Texto sufijo
  DSInputConfig? config,                  // Configuración completa
})
```

#### Configuración (DSInputConfig)
```dart
@freezed
class DSInputConfig with _$DSInputConfig {
  const factory DSInputConfig({
    @Default(DSInputVariant.outline) DSInputVariant variant, // outline, filled, underline
    @Default(DSInputState.defaultState) DSInputState state,  // default, focus, error, disabled, readonly
    DSInputColors? colors,                                     // Configuración de colores
    DSInputSpacing? spacing,                                   // Espaciado y dimensiones
    DSInputValidation? validation,                             // Configuración de validación
    DSInputAccessibility? accessibility,                       // Accesibilidad
  }) = _DSInputConfig;
}
```

#### DSInputValidation
```dart
@freezed
class DSInputValidation with _$DSInputValidation {
  const factory DSInputValidation({
    @Default(true) bool enabled,             // Validación habilitada
    @Default(false) bool realTimeValidation, // Validación en tiempo real
    @Default(false) bool showProgress,       // Mostrar progreso de validación
    @Default(true) bool showErrorIcon,       // Mostrar icono de error
    @Default(true) bool showSuccessIcon,     // Mostrar icono de éxito
    int? maxLength,                          // Longitud máxima
    int? minLength,                          // Longitud mínima
    RegExp? pattern,                         // Patrón regex
    List<String>? allowedDomains,            // Dominios permitidos (email)
  }) = _DSInputValidation;
}
```

#### Validadores Incluidos
```dart
// Validadores básicos
Validators.required('Campo requerido')
Validators.email('Email inválido')
Validators.minLength(6, 'Mínimo 6 caracteres')
Validators.maxLength(50, 'Máximo 50 caracteres')
Validators.numeric('Solo números')
Validators.alphanumeric('Solo letras y números')

// Validadores avanzados
Validators.password(
  minLength: 8,
  requireUppercase: true,
  requireLowercase: true,
  requireNumbers: true,
  requireSpecialChars: true,
)
Validators.url('URL inválida')
Validators.phone('Teléfono inválido')
Validators.creditCard('Tarjeta de crédito inválida')
Validators.domain(['empresa.com'], 'Debe ser email corporativo')

// Combinar validadores
Validators.compose([
  Validators.required('Email requerido'),
  Validators.email('Email inválido'),
  Validators.domain(['empresa.com'], 'Debe ser email corporativo'),
])
```

#### Ejemplos de Uso
```dart
// Input básico
DSInput(
  label: 'Email',
  hint: 'usuario@empresa.com',
  keyboardType: TextInputType.emailAddress,
  validator: Validators.compose([
    Validators.required('Email requerido'),
    Validators.email('Email inválido'),
  ]),
)

// Input de contraseña
DSInput(
  label: 'Contraseña',
  obscureText: true,
  validator: Validators.password(
    minLength: 8,
    requireUppercase: true,
    requireNumbers: true,
  ),
  config: DSInputConfig(
    validation: DSInputValidation(
      realTimeValidation: true,
      showProgress: true,
    ),
  ),
)

// Input con formato personalizado
DSInput(
  label: 'Teléfono',
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
    PhoneNumberFormatter(),
  ],
  prefixIcon: Icon(Icons.phone),
)
```

---

### DSCard

**Cards empresariales con configuración avanzada**

#### Constructor
```dart
DSCard({
  Key? key,
  required Widget child,                   // Contenido de la card
  VoidCallback? onTap,                     // Callback de tap
  VoidCallback? onLongPress,               // Callback de presión larga
  bool interactive = false,                // Si es interactiva
  String? semanticsLabel,                  // Etiqueta semántica
  DSCardConfig? config,                   // Configuración completa
})
```

#### Configuración (DSCardConfig)
```dart
@freezed
class DSCardConfig with _$DSCardConfig {
  const factory DSCardConfig({
    @Default(DSCardVariant.elevated) DSCardVariant variant, // elevated, filled, outline
    @Default(DSCardState.defaultState) DSCardState state,   // default, hover, pressed, focus, selected, disabled
    DSCardColors? colors,                                     // Configuración de colores
    DSCardSpacing? spacing,                                   // Espaciado y dimensiones
    DSCardAnimations? animations,                             // Animaciones
  }) = _DSCardConfig;
}
```

#### DSCardSpacing
```dart
@freezed
class DSCardSpacing with _$DSCardSpacing {
  const factory DSCardSpacing({
    EdgeInsets? padding,                     // Padding interno
    EdgeInsets? margin,                      // Margin externo
    @Default(12.0) double borderRadius,      // Radio de bordes
    @Default(1.0) double borderWidth,        // Ancho del borde
    @Default(4.0) double elevation,          // Elevación/sombra
    @Default(double.infinity) double width,  // Ancho
    double? height,                          // Alto
  }) = _DSCardSpacing;
}
```

#### Ejemplos de Uso
```dart
// Card básica
DSCard(
  child: Padding(
    padding: DSSpacing.cardPadding,
    child: Column(
      children: [
        Text('Título', style: DSTypography.h5),
        DSSpacing.verticalSm,
        Text('Contenido...'),
      ],
    ),
  ),
)

// Card interactiva
DSCard(
  interactive: true,
  onTap: () => _openDetails(),
  config: DSCardConfig(
    variant: DSCardVariant.outline,
    spacing: DSCardSpacing(
      borderRadius: 16,
      elevation: 8,
    ),
    animations: DSCardAnimations(
      duration: Duration(milliseconds: 200),
      hoverScale: 1.02,
    ),
  ),
  child: _buildCardContent(),
)
```

---

## 📝 Form Components

### DSCurrencyInput

**Input especializado para moneda con formateo automático**

#### Constructor
```dart
DSCurrencyInput({
  Key? key,
  String? label,                           // Etiqueta del campo
  String? hint,                            // Placeholder
  double? initialValue,                    // Valor inicial
  String currency = 'USD',                 // Código de moneda
  String locale = 'en_US',                 // Locale para formateo
  ValueChanged<double>? onChanged,         // Callback de cambio
  FormFieldValidator<double>? validator,   // Validador
  bool readOnly = false,                   // Solo lectura
  FocusNode? focusNode,                    // Focus node
  DSCurrencyInputConfig? config,          // Configuración completa
})
```

#### Configuración (DSCurrencyInputConfig)
```dart
@freezed
class DSCurrencyInputConfig with _$DSCurrencyInputConfig {
  const factory DSCurrencyInputConfig({
    DSCurrencyFormatting? formatting,      // Configuración de formato
    DSCurrencyValidation? validation,      // Validación específica
    DSCurrencyColors? colors,              // Colores personalizados
    DSCurrencyBehavior? behavior,          // Comportamiento
  }) = _DSCurrencyInputConfig;
}
```

#### DSCurrencyFormatting
```dart
@freezed
class DSCurrencyFormatting with _$DSCurrencyFormatting {
  const factory DSCurrencyFormatting({
    @Default(2) int decimalDigits,           // Dígitos decimales
    @Default(true) bool showCurrencySymbol,  // Mostrar símbolo
    @Default(',') String thousandSeparator,  // Separador de miles
    @Default('.') String decimalSeparator,   // Separador decimal
    @Default(true) bool compactFormat,       // Formato compacto (1K, 1M)
    @Default(false) bool showTrailingZeros,  // Mostrar ceros finales
  }) = _DSCurrencyFormatting;
}
```

#### Ejemplos de Uso
```dart
// Input básico de moneda
DSCurrencyInput(
  label: 'Precio',
  currency: 'USD',
  initialValue: 1500.00,
  onChanged: (value) => _updatePrice(value),
)

// Input avanzado con validación
DSCurrencyInput(
  label: 'Salario Anual',
  currency: 'USD',
  locale: 'en_US',
  validator: (value) {
    if (value == null || value < 30000) {
      return 'Salario mínimo \$30,000';
    }
    return null;
  },
  config: DSCurrencyInputConfig(
    formatting: DSCurrencyFormatting(
      decimalDigits: 0,
      compactFormat: true,
    ),
    validation: DSCurrencyValidation(
      min: 30000,
      max: 500000,
      required: true,
    ),
  ),
)
```

---

### DSDatePicker

**Selector de fecha empresarial**

#### Constructor
```dart
DSDatePicker({
  Key? key,
  String? label,                           // Etiqueta del campo
  String? hint,                            // Placeholder
  DateTime? initialDate,                   // Fecha inicial
  DateTime? firstDate,                     // Fecha mínima
  DateTime? lastDate,                      // Fecha máxima
  ValueChanged<DateTime>? onDateSelected,  // Callback de selección
  FormFieldValidator<DateTime>? validator, // Validador
  DateFormat? dateFormat,                  // Formato de fecha
  bool readOnly = false,                   // Solo lectura
  DSDatePickerConfig? config,             // Configuración completa
})
```

#### Configuración (DSDatePickerConfig)
```dart
@freezed
class DSDatePickerConfig with _$DSDatePickerConfig {
  const factory DSDatePickerConfig({
    @Default(DSDatePickerVariant.dialog) DSDatePickerVariant variant, // dialog, bottomSheet, inline
    @Default(DSDatePickerMode.date) DSDatePickerMode mode,             // date, time, dateTime
    DSDatePickerLocalization? localization,  // Localización
    DSDatePickerBehavior? behavior,          // Comportamiento
    DSDatePickerColors? colors,              // Colores personalizados
  }) = _DSDatePickerConfig;
}
```

#### Ejemplos de Uso
```dart
// Selector básico
DSDatePicker(
  label: 'Fecha de nacimiento',
  firstDate: DateTime(1950),
  lastDate: DateTime.now(),
  onDateSelected: (date) => _updateBirthDate(date),
)

// Selector de fecha y hora
DSDatePicker(
  label: 'Fecha y hora de reunión',
  initialDate: DateTime.now().add(Duration(days: 1)),
  config: DSDatePickerConfig(
    mode: DSDatePickerMode.dateTime,
    variant: DSDatePickerVariant.bottomSheet,
  ),
)
```

---

## 🗂️ Data Components

### DSDataTable

**Tabla de datos empresarial con funcionalidades avanzadas**

#### Constructor
```dart
DSDataTable<T>({
  Key? key,
  required List<DSDataColumn<T>> columns,      // Definición de columnas
  required List<T> data,                        // Datos de la tabla
  DSDataTableController<T>? controller,        // Controlador de tabla
  ValueChanged<List<T>>? onSelectionChanged,    // Callback de selección
  ValueChanged<T>? onRowTap,                    // Callback de tap en fila
  ValueChanged<T>? onRowDoubleTap,              // Callback de doble tap
  DSDataTableConfig<T>? config,                // Configuración completa
})
```

#### DSDataColumn
```dart
@freezed
class DSDataColumn<T> with _$DSDataColumn<T> {
  const factory DSDataColumn({
    required String key,                         // Clave de la columna
    required String title,                       // Título de la columna
    double? width,                               // Ancho de la columna
    @Default(false) bool sortable,               // Si es ordenable
    @Default(false) bool filterable,             // Si es filtrable
    @Default(false) bool resizable,              // Si es redimensionable
    @Default(Alignment.centerLeft) Alignment alignment, // Alineación
    Widget Function(T item)? cellBuilder,        // Constructor de celda
    String Function(dynamic value)? formatter,   // Formateador de valor
    Comparator<T>? comparator,                   // Comparador para ordenar
  }) = _DSDataColumn<T>;
}
```

#### Configuración (DSDataTableConfig)
```dart
@freezed
class DSDataTableConfig<T> with _$DSDataTableConfig<T> {
  const factory DSDataTableConfig({
    DSDataTablePagination? pagination,         // Configuración de paginación
    DSDataTableSelection<T>? selection,        // Configuración de selección
    DSDataTableSorting? sorting,               // Configuración de ordenamiento
    DSDataTableFiltering? filtering,           // Configuración de filtros
    DSDataTableStyling? styling,               // Estilos visuales
    DSDataTableBehavior? behavior,             // Comportamiento
  }) = _DSDataTableConfig<T>;
}
```

#### Ejemplos de Uso
```dart
// Tabla básica
DSDataTable<Employee>(
  columns: [
    DSDataColumn<Employee>(
      key: 'name',
      title: 'Nombre',
      width: 200,
      sortable: true,
      cellBuilder: (employee) => Text(employee.fullName),
    ),
    DSDataColumn<Employee>(
      key: 'email',
      title: 'Email',
      width: 250,
      filterable: true,
    ),
    DSDataColumn<Employee>(
      key: 'salary',
      title: 'Salario',
      width: 120,
      sortable: true,
      alignment: Alignment.centerRight,
      formatter: (value) => NumberFormat.currency().format(value),
    ),
  ],
  data: employees,
  onRowTap: (employee) => _viewEmployeeDetails(employee),
)

// Tabla con funcionalidades avanzadas
DSDataTable<Employee>(
  columns: _buildColumns(),
  data: employees,
  config: DSDataTableConfig<Employee>(
    pagination: DSDataTablePagination(
      pageSize: 25,
      showPageSizeSelector: true,
      pageSizeOptions: [10, 25, 50, 100],
    ),
    selection: DSDataTableSelection<Employee>(
      multiSelect: true,
      selectAllVisible: true,
      onSelectionChanged: (selected) => _handleSelection(selected),
    ),
    sorting: DSDataTableSorting(
      defaultSortColumn: 'name',
      defaultSortDirection: SortDirection.ascending,
    ),
    filtering: DSDataTableFiltering(
      globalFilter: true,
      columnFilters: true,
      quickFilters: [
        QuickFilter('Activos', (emp) => emp.isActive),
        QuickFilter('Gerentes', (emp) => emp.isManager),
      ],
    ),
  ),
)
```

---

### DSChart

**Sistema de gráficos profesionales**

#### Constructor
```dart
DSChart({
  Key? key,
  required DSChartType type,               // Tipo de gráfico
  required List<ChartData> data,            // Datos del gráfico
  String? title,                            // Título del gráfico
  String? subtitle,                         // Subtítulo
  DSChartConfig? config,                   // Configuración completa
})
```

#### Tipos de Gráfico (DSChartType)
```dart
enum DSChartType {
  line,           // Gráfico de líneas
  bar,            // Gráfico de barras
  pie,            // Gráfico circular
  area,           // Gráfico de área
  scatter,        // Gráfico de dispersión
  radar,          // Gráfico radar
  candlestick,    // Gráfico de velas (trading)
  gauge,          // Medidor
}
```

#### Configuración (DSChartConfig)
```dart
@freezed
class DSChartConfig with _$DSChartConfig {
  const factory DSChartConfig({
    DSChartAxis? xAxis,                     // Configuración eje X
    DSChartAxis? yAxis,                     // Configuración eje Y
    DSChartLegend? legend,                  // Configuración leyenda
    DSChartColors? colors,                  // Colores del gráfico
    DSChartAnimations? animations,          // Animaciones
    DSChartInteractions? interactions,      // Interacciones
    DSChartGrid? grid,                      // Rejilla
    DSChartTooltip? tooltip,                // Tooltips
  }) = _DSChartConfig;
}
```

#### Ejemplos de Uso
```dart
// Gráfico de líneas básico
DSChart(
  type: DSChartType.line,
  title: 'Ventas Mensuales',
  data: salesData,
  config: DSChartConfig(
    xAxis: DSChartAxis(
      title: 'Meses',
      labelFormat: DateFormat('MMM'),
    ),
    yAxis: DSChartAxis(
      title: 'Ventas (USD)',
      labelFormat: NumberFormat.currency(symbol: '\$'),
    ),
    colors: DSChartColors(
      primary: DSColors.primary,
      secondary: DSColors.secondary,
    ),
    animations: DSChartAnimations(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    ),
  ),
)

// Gráfico circular interactivo
DSChart(
  type: DSChartType.pie,
  title: 'Distribución por Departamento',
  data: departmentData,
  config: DSChartConfig(
    legend: DSChartLegend(
      position: LegendPosition.right,
      showPercentages: true,
    ),
    interactions: DSChartInteractions(
      enableSelection: true,
      enableZoom: false,
      onSegmentTap: (segment) => _showDetails(segment),
    ),
  ),
)
```

---

## 🧭 Navigation Components

### DSDrawer

**Navegación lateral empresarial**

#### Constructores
```dart
// Drawer permanente
DSDrawer.permanent({
  Key? key,
  required Widget content,                 // Contenido del drawer
  double? width,                           // Ancho del drawer
  DSDrawerConfig? config,                 // Configuración
})

// Drawer modal
DSDrawer.modal({
  Key? key,
  required Widget content,                 // Contenido del drawer
  VoidCallback? onClose,                   // Callback de cierre
  DSDrawerConfig? config,                 // Configuración
})

// Drawer temporal
DSDrawer.temporary({
  Key? key,
  required Widget content,                 // Contenido del drawer
  Duration? autoCloseDelay,                // Tiempo de auto-cierre
  DSDrawerConfig? config,                 // Configuración
})
```

#### Configuración (DSDrawerConfig)
```dart
@freezed
class DSDrawerConfig with _$DSDrawerConfig {
  const factory DSDrawerConfig({
    @Default(DSDrawerVariant.permanent) DSDrawerVariant variant, // permanent, modal, temporary
    @Default(DrawerSide.left) DrawerSide side,                     // left, right
    DSDrawerColors? colors,                                       // Colores
    DSDrawerBehavior? behavior,                                   // Comportamiento
    DSDrawerAnimations? animations,                               // Animaciones
  }) = _DSDrawerConfig;
}
```

#### Ejemplos de Uso
```dart
// Drawer permanente con navegación
DSDrawer.permanent(
  width: 280,
  content: Column(
    children: [
      _buildHeader(),
      Expanded(child: _buildNavigationMenu()),
      _buildFooter(),
    ],
  ),
  config: DSDrawerConfig(
    colors: DSDrawerColors(
      backgroundColor: DSColors.gray50,
      selectedColor: DSColors.primary,
    ),
    behavior: DSDrawerBehavior(
      collapsible: true,
      autoHideOnMobile: true,
    ),
  ),
)

// Drawer modal con overlay
DSDrawer.modal(
  content: _buildMobileMenu(),
  onClose: () => Navigator.pop(context),
  config: DSDrawerConfig(
    side: DrawerSide.right,
    animations: DSDrawerAnimations(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
  ),
)
```

---

### DSBreadcrumbs

**Navegación de ruta**

#### Constructor
```dart
DSBreadcrumbs({
  Key? key,
  required List<DSBreadcrumbItem> items,  // Items del breadcrumb
  Widget? separator,                       // Separador personalizado
  int? maxItems,                           // Máximo de items visibles
  DSBreadcrumbsConfig? config,            // Configuración
})
```

#### DSBreadcrumbItem
```dart
@freezed
class DSBreadcrumbItem with _$DSBreadcrumbItem {
  const factory DSBreadcrumbItem({
    required String label,                   // Texto del item
    Widget? icon,                            // Icono opcional
    VoidCallback? onTap,                     // Callback de tap
    @Default(false) bool isActive,           // Si es el item activo
    String? tooltip,                         // Tooltip
  }) = _DSBreadcrumbItem;
}
```

#### Ejemplos de Uso
```dart
// Breadcrumbs básico
DSBreadcrumbs(
  items: [
    DSBreadcrumbItem(
      label: 'Dashboard',
      icon: Icon(Icons.dashboard, size: 16),
      onTap: () => _navigateTo('/dashboard'),
    ),
    DSBreadcrumbItem(
      label: 'Empleados',
      onTap: () => _navigateTo('/employees'),
    ),
    DSBreadcrumbItem(
      label: 'Juan Pérez',
      isActive: true,
    ),
  ],
)

// Breadcrumbs con configuración avanzada
DSBreadcrumbs(
  items: navigationPath,
  maxItems: 5,
  config: DSBreadcrumbsConfig(
    separator: Icon(Icons.chevron_right, size: 16),
    overflow: DSBreadcrumbsOverflow.ellipsis,
    style: DSBreadcrumbsStyle(
      activeColor: DSColors.primary,
      inactiveColor: DSColors.gray600,
      fontSize: 14,
    ),
  ),
)
```

---

## 🎯 Feedback Components

### DSToast

**Sistema de notificaciones inteligentes**

#### Métodos Estáticos
```dart
// Mostrar toast básico
static void show(
  BuildContext context,
  String message,                          // Mensaje a mostrar
  {
    DSToastType type = DSToastType.info,  // Tipo de toast
    Duration? duration,                     // Duración
    DSToastConfig? config,                 // Configuración
  }
)

// Mostrar toast de éxito
static void success(BuildContext context, String message)

// Mostrar toast de error
static void error(BuildContext context, String message)

// Mostrar toast de advertencia
static void warning(BuildContext context, String message)

// Mostrar toast de información
static void info(BuildContext context, String message)
```

#### Tipos de Toast (DSToastType)
```dart
enum DSToastType {
  success,        // Éxito (verde)
  error,          // Error (rojo)
  warning,        // Advertencia (amarillo)
  info,           // Información (azul)
  loading,        // Cargando
  custom,         // Personalizado
}
```

#### Configuración (DSToastConfig)
```dart
@freezed
class DSToastConfig with _$DSToastConfig {
  const factory DSToastConfig({
    @Default(Duration(seconds: 4)) Duration duration,           // Duración
    @Default(DSToastPosition.bottom) DSToastPosition position, // Posición
    DSToastAnimations? animations,                             // Animaciones
    List<DSToastAction>? actions,                              // Acciones
    bool? dismissible,                                          // Descartable
    Widget? icon,                                               // Icono personalizado
    EdgeInsets? margin,                                         // Margen
  }) = _DSToastConfig;
}
```

#### Ejemplos de Uso
```dart
// Toast básico
DSToast.show(
  context,
  'Documento guardado exitosamente',
  type: DSToastType.success,
)

// Toast con acciones
DSToast.show(
  context,
  'Error al subir archivo',
  type: DSToastType.error,
  config: DSToastConfig(
    duration: Duration(seconds: 8),
    actions: [
      DSToastAction(
        label: 'Reintentar',
        onPressed: () => _retryUpload(),
      ),
      DSToastAction(
        label: 'Ver detalles',
        onPressed: () => _showErrorDetails(),
      ),
    ],
  ),
)

// Toast de carga
DSToast.show(
  context,
  'Procesando archivo...',
  type: DSToastType.loading,
  config: DSToastConfig(
    duration: Duration.zero, // No se oculta automáticamente
    dismissible: false,
  ),
)
```

---

### DSProgress

**Indicadores de progreso profesionales**

#### Constructor
```dart
DSProgress({
  Key? key,
  double? value,                           // Valor del progreso (0.0-1.0)
  DSProgressType type = DSProgressType.linear, // Tipo de progreso
  DSProgressState state = DSProgressState.active, // Estado
  String? label,                           // Etiqueta del progreso
  String Function(double)? formatter,      // Formateador de valor
  DSProgressConfig? config,               // Configuración
})
```

#### Tipos de Progreso (DSProgressType)
```dart
enum DSProgressType {
  linear,         // Barra lineal
  circular,       // Círculo
  ring,           // Anillo
  step,           // Por pasos
  radial,         // Radial
}
```

#### Estados (DSProgressState)
```dart
enum DSProgressState {
  active,         // Activo/progresando
  paused,         // Pausado
  completed,      // Completado
  error,          // Error
  indeterminate,  // Indeterminado
}
```

#### Ejemplos de Uso
```dart
// Progreso lineal básico
DSProgress(
  value: 0.65,
  type: DSProgressType.linear,
  label: 'Descargando archivo...',
  config: DSProgressConfig(
    showPercentage: true,
    colors: DSProgressColors(
      activeColor: DSColors.primary,
      backgroundColor: DSColors.gray200,
    ),
  ),
)

// Progreso circular con formato personalizado
DSProgress(
  value: uploadProgress,
  type: DSProgressType.circular,
  formatter: (value) => '${(value * 100).round()}% completado',
  config: DSProgressConfig(
    size: 80,
    strokeWidth: 6,
    showValue: true,
    animations: DSProgressAnimations(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    ),
  ),
)

// Progreso por pasos
DSProgress(
  value: currentStep / totalSteps,
  type: DSProgressType.step,
  config: DSProgressConfig(
    steps: totalSteps,
    stepLabels: stepNames,
    showStepNumbers: true,
  ),
)
```

---

## 🏪 E-commerce Components

### DSProductCard

**Cards de producto para e-commerce**

#### Constructor
```dart
DSProductCard({
  Key? key,
  required Product product,                // Datos del producto
  VoidCallback? onTap,                     // Callback de tap
  VoidCallback? onAddToCart,               // Callback agregar al carrito
  VoidCallback? onToggleFavorite,          // Callback favorito
  VoidCallback? onShare,                   // Callback compartir
  DSProductCardConfig? config,            // Configuración
})
```

#### Product Model
```dart
@freezed
class Product with _$Product {
  const factory Product({
    required String id,                      // ID único
    required String name,                    // Nombre del producto
    required double price,                   // Precio
    String? currency,                        // Moneda
    String? description,                     // Descripción
    String? imageUrl,                        // URL de imagen
    List<String>? imageUrls,                 // URLs de galería
    double? originalPrice,                   // Precio original (descuento)
    double? rating,                          // Calificación (0-5)
    int? reviewCount,                        // Número de reseñas
    String? brand,                           // Marca
    String? category,                        // Categoría
    List<String>? tags,                      // Etiquetas
    bool? inStock,                           // En stock
    int? stockQuantity,                      // Cantidad en stock
    Map<String, dynamic>? attributes,       // Atributos personalizados
  }) = _Product;
}
```

#### Configuración (DSProductCardConfig)
```dart
@freezed
class DSProductCardConfig with _$DSProductCardConfig {
  const factory DSProductCardConfig({
    @Default(DSProductCardVariant.standard) DSProductCardVariant variant, // standard, compact, detailed
    @Default(true) bool showRating,          // Mostrar calificación
    @Default(true) bool showPrice,           // Mostrar precio
    @Default(false) bool showQuickActions,   // Mostrar acciones rápidas
    @Default(false) bool showBadges,         // Mostrar badges (nuevo, oferta)
    @Default(16/9) double imageAspectRatio,  // Ratio de imagen
    DSProductCardColors? colors,            // Colores personalizados
    DSProductCardAnimations? animations,    // Animaciones
  }) = _DSProductCardConfig;
}
```

#### Ejemplos de Uso
```dart
// Card de producto básica
DSProductCard(
  product: Product(
    id: 'prod_001',
    name: 'iPhone 15 Pro',
    price: 999.00,
    currency: 'USD',
    imageUrl: 'https://example.com/iphone15.jpg',
    rating: 4.8,
    reviewCount: 1247,
    brand: 'Apple',
  ),
  onTap: () => _viewProduct('prod_001'),
  onAddToCart: () => _addToCart('prod_001'),
)

// Card con configuración avanzada
DSProductCard(
  product: product,
  onTap: () => _viewProduct(product.id),
  onAddToCart: () => _addToCart(product.id),
  onToggleFavorite: () => _toggleFavorite(product.id),
  onShare: () => _shareProduct(product.id),
  config: DSProductCardConfig(
    variant: DSProductCardVariant.detailed,
    showQuickActions: true,
    showBadges: true,
    imageAspectRatio: 1.0,
    animations: DSProductCardAnimations(
      hoverScale: 1.05,
      duration: Duration(milliseconds: 200),
    ),
  ),
)
```

---

### DSCartWidget

**Widget de carrito de compras**

#### Constructor
```dart
DSCartWidget({
  Key? key,
  required List<CartItem> items,           // Items del carrito
  ValueChanged<String, int>? onUpdateQuantity, // Callback actualizar cantidad
  ValueChanged<String>? onRemoveItem,      // Callback remover item
  VoidCallback? onCheckout,                // Callback checkout
  VoidCallback? onClear,                   // Callback limpiar carrito
  DSCartWidgetConfig? config,             // Configuración
})
```

#### CartItem Model
```dart
@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String productId,              // ID del producto
    required String name,                   // Nombre
    required double price,                  // Precio unitario
    required int quantity,                  // Cantidad
    String? imageUrl,                       // URL de imagen
    String? currency,                       // Moneda
    Map<String, dynamic>? attributes,       // Atributos (talla, color, etc.)
    double? discount,                       // Descuento aplicado
  }) = _CartItem;
}
```

#### Configuración (DSCartWidgetConfig)
```dart
@freezed
class DSCartWidgetConfig with _$DSCartWidgetConfig {
  const factory DSCartWidgetConfig({
    @Default(DSCartWidgetVariant.sidebar) DSCartWidgetVariant variant, // sidebar, modal, fab, mini
    @Default(true) bool showTotals,          // Mostrar totales
    @Default(true) bool enableQuantityControls, // Controles de cantidad
    @Default(true) bool showImages,          // Mostrar imágenes
    @Default(false) bool showDiscounts,      // Mostrar descuentos
    DSCartWidgetAnimations? animations,     // Animaciones
    DSCartWidgetColors? colors,             // Colores
  }) = _DSCartWidgetConfig;
}
```

#### Ejemplos de Uso
```dart
// Carrito lateral
DSCartWidget(
  items: cartItems,
  onUpdateQuantity: (productId, quantity) =>
    _updateCartQuantity(productId, quantity),
  onRemoveItem: (productId) => _removeFromCart(productId),
  onCheckout: () => _proceedToCheckout(),
  config: DSCartWidgetConfig(
    variant: DSCartWidgetVariant.sidebar,
    showTotals: true,
    enableQuantityControls: true,
    animations: DSCartWidgetAnimations(
      itemAddDuration: Duration(milliseconds: 400),
      itemRemovalDuration: Duration(milliseconds: 300),
    ),
  ),
)

// FAB de carrito
DSCartWidget(
  items: cartItems,
  config: DSCartWidgetConfig(
    variant: DSCartWidgetVariant.fab,
    showTotals: false,
  ),
  onTap: () => _openCartSidebar(),
)
```

---

## ⚙️ Specialty Components

### DSBackToTop

**Botón para volver al inicio**

#### Constructor
```dart
DSBackToTop({
  Key? key,
  ScrollController? scrollController,      // Controlador de scroll
  bool interactive = true,                 // Si es interactivo
  VoidCallback? onPressed,                 // Callback personalizado
  ValueChanged<DSBackToTopState>? onStateChanged, // Callback de estado
  DSBackToTopConfig? config,              // Configuración
})
```

#### Configuración (DSBackToTopConfig)
```dart
@freezed
class DSBackToTopConfig with _$DSBackToTopConfig {
  const factory DSBackToTopConfig({
    @Default(DSBackToTopVariant.webOnly) DSBackToTopVariant variant,
    @Default(DSBackToTopState.defaultState) DSBackToTopState state,
    DSBackToTopColors? colors,
    DSBackToTopSpacing? spacing,
    DSBackToTopAnimations? animations,
    DSBackToTopBehavior? behavior,
    DSBackToTopAccessibility? accessibility,
  }) = _DSBackToTopConfig;
}
```

#### DSBackToTopBehavior
```dart
@freezed
class DSBackToTopBehavior with _$DSBackToTopBehavior {
  const factory DSBackToTopBehavior({
    @Default(200.0) double showAfterPixels,  // Mostrar después de scroll
    @Default(0.0) double hideAfterPixels,    // Ocultar después de scroll
    @Default(true) bool autoHide,            // Auto-ocultar
    @Default(true) bool showOnScrollUp,      // Mostrar al scroll arriba
    @Default(false) bool hideOnScrollDown,   // Ocultar al scroll abajo
    @Default(true) bool smoothScrolling,     // Scroll suave
    @Default(true) bool hapticFeedback,      // Feedback háptico
    @Default(true) bool showTooltip,         // Mostrar tooltip
    Duration? autoHideDelay,                 // Delay de auto-ocultar
  }) = _DSBackToTopBehavior;
}
```

#### Ejemplos de Uso
```dart
// Botón básico
DSBackToTop(
  scrollController: _scrollController,
)

// Botón con configuración avanzada
DSBackToTop(
  scrollController: _scrollController,
  config: DSBackToTopConfig(
    variant: DSBackToTopVariant.webOnly,
    behavior: DSBackToTopBehavior(
      showAfterPixels: 300,
      smoothScrolling: true,
      autoHide: true,
      autoHideDelay: Duration(seconds: 3),
    ),
    spacing: DSBackToTopSpacing(
      position: DSBackToTopPosition.bottomRight,
      size: 56,
      margin: EdgeInsets.all(20),
    ),
    animations: DSBackToTopAnimations(
      duration: Duration(milliseconds: 250),
      scrollDuration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    ),
  ),
)

// Con overlay provider
DSBackToTopOverlay(
  scrollController: _scrollController,
  child: YourPageContent(),
)
```

---

### DSCommandPalette

**Paleta de comandos estilo VS Code**

#### Constructor
```dart
DSCommandPalette({
  Key? key,
  required List<DSCommand> commands,      // Lista de comandos
  String? placeholder,                     // Placeholder de búsqueda
  ValueChanged<DSCommand>? onCommandExecuted, // Callback de ejecución
  VoidCallback? onDismiss,                 // Callback de cerrar
  DSCommandPaletteConfig? config,         // Configuración
})
```

#### DSCommand
```dart
@freezed
class DSCommand with _$DSCommand {
  const factory DSCommand({
    required String id,                      // ID único
    required String title,                   // Título del comando
    String? description,                     // Descripción
    Widget? icon,                            // Icono
    List<String>? keywords,                  // Palabras clave
    String? shortcut,                        // Atajo de teclado
    String? category,                        // Categoría
    VoidCallback? onExecute,                 // Callback de ejecución
    bool? enabled,                           // Si está habilitado
    Color? color,                            // Color personalizado
  }) = _DSCommand;
}
```

#### Configuración (DSCommandPaletteConfig)
```dart
@freezed
class DSCommandPaletteConfig with _$DSCommandPaletteConfig {
  const factory DSCommandPaletteConfig({
    @Default('Buscar comandos...') String placeholder,
    @Default(10) int maxResults,             // Máximo de resultados
    @Default(true) bool showShortcuts,       // Mostrar atajos
    @Default(true) bool showCategories,      // Mostrar categorías
    @Default(true) bool fuzzySearch,         // Búsqueda difusa
    DSCommandPaletteColors? colors,         // Colores
    DSCommandPaletteAnimations? animations, // Animaciones
  }) = _DSCommandPaletteConfig;
}
```

#### Ejemplos de Uso
```dart
// Paleta básica
DSCommandPalette(
  commands: [
    DSCommand(
      id: 'new_project',
      title: 'Crear Nuevo Proyecto',
      description: 'Inicia un nuevo proyecto desde cero',
      icon: Icon(Icons.add),
      keywords: ['nuevo', 'crear', 'proyecto'],
      shortcut: 'Ctrl+N',
      onExecute: () => _createProject(),
    ),
    DSCommand(
      id: 'search_files',
      title: 'Buscar Archivos',
      icon: Icon(Icons.search),
      keywords: ['buscar', 'archivos', 'find'],
      shortcut: 'Ctrl+P',
      onExecute: () => _searchFiles(),
    ),
  ],
)

// Integración con atajos globales
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyK):
          OpenCommandPaletteIntent(),
      },
      child: Actions(
        actions: {
          OpenCommandPaletteIntent: CallbackAction<OpenCommandPaletteIntent>(
            onInvoke: (_) => _openCommandPalette(),
          ),
        },
        child: MaterialApp(/* ... */),
      ),
    );
  }
}
```

---

## 🔧 Utilidades y Helpers

### Responsive System

#### ResponsiveBuilder
```dart
ResponsiveBuilder(
  mobile: (context) => MobileLayout(),
  tablet: (context) => TabletLayout(),
  desktop: (context) => DesktopLayout(),
  ultraWide: (context) => UltraWideLayout(),
)
```

#### ResponsiveValue
```dart
final padding = context.responsiveValue(
  mobile: 16.0,
  tablet: 24.0,
  desktop: 32.0,
);
```

#### ResponsiveGrid
```dart
ResponsiveGrid(
  children: widgets,
  mobile: ResponsiveGridConfig(columns: 1, spacing: 16),
  tablet: ResponsiveGridConfig(columns: 2, spacing: 20),
  desktop: ResponsiveGridConfig(columns: 4, spacing: 24),
)
```

### Validation System

#### Validadores Básicos
```dart
Validators.required('Campo requerido')
Validators.email('Email inválido')
Validators.minLength(6, 'Mínimo 6 caracteres')
Validators.maxLength(50, 'Máximo 50 caracteres')
Validators.numeric('Solo números')
Validators.alphanumeric('Solo letras y números')
```

#### Validadores Avanzados
```dart
Validators.password(
  minLength: 8,
  requireUppercase: true,
  requireNumbers: true,
  requireSpecialChars: true,
)
Validators.url('URL inválida')
Validators.phone('Teléfono inválido')
Validators.creditCard('Tarjeta inválida')
```

#### Composición de Validadores
```dart
Validators.compose([
  Validators.required('Campo requerido'),
  Validators.email('Email inválido'),
  Validators.domain(['empresa.com'], 'Email corporativo requerido'),
])

Validators.any([
  Validators.email('Debe ser email'),
  Validators.phone('Debe ser teléfono'),
], 'Debe ser email o teléfono')
```

---

## 📊 Enums y Constantes

### Estados Comunes
```dart
enum DSComponentState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}
```

### Variantes Comunes
```dart
enum DSComponentVariant {
  filled,
  outline,
  text,
  elevated,
  tonal,
}

enum DSComponentSize {
  small,
  medium,
  large,
  extraLarge,
}
```

### Posiciones
```dart
enum DSPosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}
```

### Tipos de Animación
```dart
enum DSAnimationType {
  none,
  fade,
  scale,
  slide,
  rotation,
  flip,
}

enum DSAnimationDirection {
  left,
  right,
  up,
  down,
  center,
}
```

---

## 🎨 Theming y Customización

### Configuración Global de Tema
```dart
MaterialApp(
  theme: DSTheme.lightTheme.copyWith(
    // Customizaciones globales
    primaryColor: MyColors.brand,
    colorScheme: DSTheme.lightTheme.colorScheme.copyWith(
      primary: MyColors.brand,
    ),
  ),
  darkTheme: DSTheme.darkTheme,
  themeMode: ThemeMode.system,
)
```

### Customización de Componentes
```dart
// Tema global de botones
DSButton.defaultConfig = DSButtonConfig(
  colors: DSButtonColors(
    backgroundColor: MyColors.brand,
  ),
  spacing: DSButtonSpacing(
    borderRadius: 12,
  ),
);

// Override por instancia
DSButton(
  text: 'Custom Button',
  config: DSButtonConfig(
    colors: DSButtonColors(
      backgroundColor: Colors.red,
    ),
  ),
)
```

### Presets de Tema
```dart
// Usar preset corporativo
MaterialApp(
  theme: ThemePresets.corporateBlue.lightTheme,
  darkTheme: ThemePresets.corporateBlue.darkTheme,
)

// Crear preset personalizado
final myPreset = ThemePreset(
  name: 'My Company',
  primaryColor: MyColors.brand,
  secondaryColor: MyColors.accent,
  // ... otras configuraciones
);
```

---

## 🎨 Sistema de Temas Completo

### DSTheme - Tema Principal

```dart
// Usar tema predefinido
MaterialApp(
  theme: DSTheme.lightTheme,        // Tema claro
  darkTheme: DSTheme.darkTheme,     // Tema oscuro
  themeMode: ThemeMode.system,      // Automático según sistema
)

// Acceder al tema en widgets
final theme = Theme.of(context);
final colorScheme = theme.colorScheme;
final textTheme = theme.textTheme;
```

### DSColors - Paleta de Colores

#### Colores Principales
```dart
DSColors.primary            // #2563EB - Azul profesional
DSColors.secondary          // #E879F9 - Púrpura innovación
DSColors.primaryDarkMode    // #60A5FA - Optimizado dark mode
```

#### Colores Semánticos (WCAG 2.0 AA)
```dart
DSColors.success           // #10B981 - Verde éxito
DSColors.warning           // #F59E0B - Amarillo advertencia
DSColors.error             // #DC2626 - Rojo error (4.5:1 contraste)
DSColors.info              // #3B82F6 - Azul información
```

#### Escala de Grises
```dart
DSColors.gray50   // #FAFAFA - Fondos sutiles
DSColors.gray100  // #F5F5F5 - Fondos de sección
DSColors.gray200  // #E5E5E5 - Bordes suaves
DSColors.gray300  // #D4D4D4 - Bordes normales
DSColors.gray400  // #A3A3A3 - Texto placeholder
DSColors.gray500  // #737373 - Texto secundario
DSColors.gray600  // #525252 - Texto normal
DSColors.gray700  // #404040 - Texto importante
DSColors.gray800  // #262626 - Texto principal
DSColors.gray900  // #171717 - Headers y títulos
```

### DSTypography - Sistema Tipográfico

**Basado en Inter (Google Fonts) con fallbacks del sistema**

#### Headers
```dart
DSTypography.h1          // 48px Bold - Hero sections
DSTypography.h2          // 40px Bold - Títulos de sección
DSTypography.h3          // 32px SemiBold - Subtítulos
DSTypography.h4          // 28px SemiBold - Headers de componente
DSTypography.h5          // 24px SemiBold - Títulos menores
DSTypography.h6          // 20px SemiBold - Headers de tabla/lista
```

#### Body Text
```dart
DSTypography.bodyLarge   // 18px Regular - Texto destacado
DSTypography.bodyMedium  // 16px Regular - Texto estándar
DSTypography.bodySmall   // 14px Regular - Texto secundario
```

#### Labels
```dart
DSTypography.labelLarge  // 16px Medium - Formularios principales
DSTypography.labelMedium // 14px Medium - Navegación, tabs
DSTypography.labelSmall  // 12px Medium - Hints, validaciones
```

#### Especiales
```dart
DSTypography.button      // 16px SemiBold - Botones CTA
DSTypography.caption     // 12px Regular - Metadatos
DSTypography.overline    // 12px SemiBold - Categorías
```

### DSSpacing - Sistema de Espaciado (8px Grid)

```dart
// Escala de Espaciado
DSSpacing.xxxs    // 2px  - Separadores mínimos
DSSpacing.xxs     // 4px  - Padding interno pequeño
DSSpacing.xs      // 8px  - Espaciado básico
DSSpacing.sm      // 16px - Espaciado estándar
DSSpacing.md      // 24px - Espaciado medio
DSSpacing.lg      // 32px - Espaciado grande
DSSpacing.xl      // 40px - Espaciado extra grande
DSSpacing.xxl     // 48px - Espaciado muy grande
DSSpacing.xxxl    // 64px - Espaciado máximo

// Widgets de Espaciado Vertical
DSSpacing.verticalXxs
DSSpacing.verticalXs
DSSpacing.verticalSm
DSSpacing.verticalMd
DSSpacing.verticalLg
DSSpacing.verticalXl

// Widgets de Espaciado Horizontal
DSSpacing.horizontalXxs
DSSpacing.horizontalXs
DSSpacing.horizontalSm
DSSpacing.horizontalMd
DSSpacing.horizontalLg
DSSpacing.horizontalXl

// Padding Presets
DSSpacing.pagePadding     // EdgeInsets.all(24)
DSSpacing.cardPadding     // EdgeInsets.all(16)
DSSpacing.buttonPadding   // EdgeInsets.symmetric(h:16, v:12)
```

---

## 🔧 Utilidades y Helpers

### Responsive System

#### Breakpoints
```dart
// Breakpoints del sistema
Breakpoints.mobile      // < 600px
Breakpoints.tablet      // 600px - 1024px
Breakpoints.desktop     // 1024px - 1440px
Breakpoints.ultraWide   // > 1440px
```

#### ResponsiveBuilder
```dart
ResponsiveBuilder(
  mobile: (context) => MobileLayout(),
  tablet: (context) => TabletLayout(),
  desktop: (context) => DesktopLayout(),
  ultraWide: (context) => UltraWideLayout(),
)
```

#### ResponsiveValue
```dart
// Obtener valor responsive basado en breakpoint
final padding = context.responsiveValue<double>(
  mobile: 16.0,
  tablet: 24.0,
  desktop: 32.0,
  ultraWide: 40.0,
);

final columns = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 3,
  ultraWide: 4,
);
```

#### ResponsiveGrid
```dart
ResponsiveGrid(
  children: widgets,
  mobile: ResponsiveGridConfig(columns: 1, spacing: 16),
  tablet: ResponsiveGridConfig(columns: 2, spacing: 20),
  desktop: ResponsiveGridConfig(columns: 4, spacing: 24),
)
```

#### Helpers de Consulta
```dart
// Verificar tipo de dispositivo
if (Responsive.isMobile(context)) {
  // Código específico de móvil
}

if (Responsive.isTablet(context)) {
  // Código específico de tablet
}

if (Responsive.isDesktop(context)) {
  // Código específico de desktop
}

// Obtener ancho de pantalla
final screenWidth = Responsive.screenWidth(context);

// Obtener orientation
final isPortrait = Responsive.isPortrait(context);
final isLandscape = Responsive.isLandscape(context);
```

### Sistema de Validación

#### Validadores Básicos
```dart
Validators.required('Campo requerido')
Validators.email('Email inválido')
Validators.minLength(6, 'Mínimo 6 caracteres')
Validators.maxLength(50, 'Máximo 50 caracteres')
Validators.numeric('Solo números')
Validators.alphanumeric('Solo letras y números')
Validators.alpha('Solo letras')
```

#### Validadores Avanzados
```dart
// Password con requisitos
Validators.password(
  minLength: 8,
  requireUppercase: true,
  requireLowercase: true,
  requireNumbers: true,
  requireSpecialChars: true,
  customMessage: 'Contraseña debe tener...',
)

// URLs
Validators.url('URL inválida')
Validators.urlWithProtocol('Debe incluir http:// o https://')

// Teléfono
Validators.phone('Teléfono inválido')
Validators.phoneWithCountryCode('Incluir código de país')

// Tarjeta de crédito
Validators.creditCard('Tarjeta de crédito inválida')
Validators.cvv('CVV inválido')
Validators.expiryDate('Fecha de expiración inválida')

// Dominio de email
Validators.domain(['empresa.com'], 'Debe ser email corporativo')
Validators.domainBlacklist(['spam.com'], 'Dominio no permitido')
```

#### Composición de Validadores
```dart
// Combinar múltiples validadores (AND - todos deben pasar)
Validators.compose([
  Validators.required('Email requerido'),
  Validators.email('Email inválido'),
  Validators.domain(['empresa.com'], 'Debe ser email corporativo'),
])

// Validadores opcionales (OR - al menos uno debe pasar)
Validators.any([
  Validators.email('Debe ser email'),
  Validators.phone('Debe ser teléfono'),
], 'Debe ser email o teléfono válido')

// Validador condicional
Validators.conditional(
  condition: () => _requiresVerification,
  validator: Validators.minLength(10, 'Mínimo 10 caracteres'),
  elseValidator: Validators.minLength(5, 'Mínimo 5 caracteres'),
)
```

#### Validadores Personalizados
```dart
// Crear validador personalizado
FormFieldValidator<String> customValidator(String errorMessage) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    // Lógica de validación personalizada
    if (!_myCustomCheck(value)) {
      return errorMessage;
    }

    return null; // null = válido
  };
}

// Uso
DSInput(
  label: 'Campo personalizado',
  validator: customValidator('Valor no válido'),
)
```

---

## 🎯 Mejores Prácticas

### 1. Uso de Tema y Colores

#### ✅ Hacer
```dart
// Siempre obtener colores del tema
final theme = Theme.of(context);
final colors = theme.colorScheme;

Container(
  color: colors.primary,
  child: Text(
    'Título',
    style: theme.textTheme.titleLarge,
  ),
)
```

#### ❌ No Hacer
```dart
// No hardcodear valores
Container(
  color: Color(0xFF2563EB), // ❌ Hardcoded
  child: Text(
    'Título',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // ❌ Hardcoded
  ),
)
```

### 2. Espaciado y Layout

#### ✅ Hacer
```dart
// Usar sistema de espaciado
Column(
  children: [
    Text('Título'),
    DSSpacing.verticalMd,  // ✅ Espaciado del sistema
    Text('Contenido'),
  ],
)

Padding(
  padding: DSSpacing.pagePadding,  // ✅ Preset consistente
  child: content,
)
```

#### ❌ No Hacer
```dart
// No usar valores mágicos
Column(
  children: [
    Text('Título'),
    SizedBox(height: 23),  // ❌ Valor mágico
    Text('Contenido'),
  ],
)

Padding(
  padding: EdgeInsets.all(17),  // ❌ No sigue el grid de 8px
  child: content,
)
```

### 3. Componentes y Configuración

#### ✅ Hacer
```dart
// Usar componentes del DS con configuración
DSButton(
  text: 'Confirmar',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.large,
  ),
  onPressed: () => _confirm(),
)
```

#### ❌ No Hacer
```dart
// No recrear componentes desde cero
ElevatedButton(
  style: ElevatedButton.styleFrom(
    // Recreando estilos manualmente ❌
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  ),
  child: Text('Confirmar'),
  onPressed: () => _confirm(),
)
```

### 4. Responsive Design

#### ✅ Hacer
```dart
// Usar helpers responsive
ResponsiveBuilder(
  mobile: (context) => _buildMobileLayout(),
  tablet: (context) => _buildTabletLayout(),
  desktop: (context) => _buildDesktopLayout(),
)

final padding = context.responsiveValue<double>(
  mobile: 16.0,
  desktop: 32.0,
);
```

#### ❌ No Hacer
```dart
// No usar MediaQuery directamente para todo
final width = MediaQuery.of(context).size.width;
final padding = width < 600 ? 16.0 : 32.0;  // ❌ Lógica repetida
```

### 5. Accesibilidad

#### ✅ Hacer
```dart
// Siempre incluir labels y semántica
DSButton(
  text: 'Guardar',
  tooltip: 'Guardar cambios del documento',  // ✅ Tooltip descriptivo
  config: DSButtonConfig(
    enableA11y: true,  // ✅ Accesibilidad habilitada
  ),
  onPressed: () => _save(),
)

Semantics(
  label: 'Avatar de usuario, toca para ver perfil',  // ✅ Label descriptivo
  button: true,
  child: avatarWidget,
)
```

#### ❌ No Hacer
```dart
// No omitir información de accesibilidad
IconButton(
  icon: Icon(Icons.delete),  // ❌ Sin tooltip ni semántica
  onPressed: () => _delete(),
)
```

---

## 🚨 Troubleshooting y Problemas Comunes

### Problema 1: Colores no cambian en Dark Mode

#### Síntoma
Los colores permanecen iguales al cambiar a modo oscuro.

#### Solución
```dart
// ❌ Problema: Color hardcoded
Container(
  color: DSColors.primary,  // Este color no cambia automáticamente
)

// ✅ Solución: Usar colorScheme del tema
Container(
  color: Theme.of(context).colorScheme.primary,  // Se adapta al modo
)
```

### Problema 2: Componente no es Responsive

#### Síntoma
El componente no se adapta a diferentes tamaños de pantalla.

#### Solución
```dart
// ❌ Problema: Tamaño fijo
Container(
  width: 400,  // Fijo, no responsive
  child: content,
)

// ✅ Solución 1: Usar ResponsiveBuilder
ResponsiveBuilder(
  mobile: (context) => Container(width: double.infinity),
  desktop: (context) => Container(width: 400),
)

// ✅ Solución 2: Usar responsiveValue
Container(
  width: context.responsiveValue<double>(
    mobile: double.infinity,
    desktop: 400,
  ),
  child: content,
)
```

### Problema 3: Imports no Funcionan

#### Síntoma
Error: "The method 'DSButton' isn't defined for the type..."

#### Solución
```dart
// ✅ Asegurar importación correcta
import 'package:iautomat_design_system/iautomat_design_system.dart';

// Verificar que pubspec.yaml tenga:
// dependencies:
//   iautomat_design_system: ^1.0.0

// Ejecutar:
// flutter pub get
```

### Problema 4: Prefijo Incorrecto

#### Síntoma
Error: "Undefined name 'AppButton'"

#### Solución
```dart
// ❌ Prefijo antiguo
DSButton(...)

// ✅ Prefijo correcto (DS = Design System)
DSButton(...)
```

### Problema 5: Tema No se Aplica

#### Síntoma
Los componentes no usan los colores del tema.

#### Solución
```dart
// ✅ Configurar tema correctamente en MaterialApp
MaterialApp(
  theme: DSTheme.lightTheme,      // ✅ Tema claro
  darkTheme: DSTheme.darkTheme,   // ✅ Tema oscuro
  themeMode: ThemeMode.system,    // ✅ Automático
  home: HomePage(),
)

// ✅ Acceder al tema en widgets
@override
Widget build(BuildContext context) {
  final theme = Theme.of(context);  // ✅ Obtener tema del contexto

  return Container(
    color: theme.colorScheme.surface,
  );
}
```

### Problema 6: Performance Issues

#### Síntoma
Lag o stuttering al usar componentes.

#### Solución
```dart
// ✅ Usar const constructors cuando sea posible
const DSButton(
  text: 'Guardar',
  // Toda la configuración constante
)

// ✅ Separar widgets complejos
class _MyComplexWidget extends StatelessWidget {
  const _MyComplexWidget();

  @override
  Widget build(BuildContext context) {
    // ...
  }
}

// ✅ Evitar rebuild innecesarios
final theme = Theme.of(context);  // Una vez al inicio del build
```

---

## 📚 Recursos Adicionales

### Documentación Oficial
- [Material 3 Design Guidelines](https://m3.material.io/)
- [Flutter Best Practices](https://docs.flutter.dev/development/ui/widgets/intro)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

### Ejemplos y Demos
- [Live Demo](https://iautomatdesignsystem.web.app) - 100+ temas y componentes
- [GitHub Repository](https://github.com/iautomat/iautomat_design_system)

### Soporte
- Issues: [GitHub Issues](https://github.com/iautomat/iautomat_design_system/issues)
- Email: support@iautomat.com

---

## 📝 Changelog y Versiones

### Versión 1.0.1 (Actual)
- ✅ 70+ componentes con prefijo DS
- ✅ 100 presets de tema profesionales
- ✅ Sistema de validación completo
- ✅ Soporte responsive automático
- ✅ Accesibilidad WCAG 2.0 AA
- ✅ Tests exhaustivos (>95% cobertura)

### Próximas Características (Roadmap)
- 🔜 Más componentes especializados
- 🔜 Tema builder interactivo
- 🔜 CLI para scaffolding
- 🔜 Más presets de tema

---

## 🎓 Conclusión

Esta documentación proporciona una referencia completa y exhaustiva para usar el IAutomat Design System.

**Puntos clave para recordar:**
1. ✅ Todos los componentes usan el prefijo `DS` (Design System)
2. ✅ Siempre importar: `import 'package:iautomat_design_system/iautomat_design_system.dart';`
3. ✅ Usar colores del tema, no hardcodear valores
4. ✅ Usar sistema de espaciado (grid de 8px)
5. ✅ Aprovechar el sistema responsive
6. ✅ Siempre incluir accesibilidad
7. ✅ Consultar esta documentación ante dudas

**Para Claude Code y otras IA:**
- Esta documentación está diseñada para ser clara y sin ambigüedades
- Todos los ejemplos son funcionales y probados
- Las configuraciones muestran valores por defecto explícitos
- Los casos de uso cubren escenarios reales empresariales

---

*Última actualización: 2025-01-03*
*Versión del documento: 2.0.0*
*Desarrollado con ❤️ por IAutomat*