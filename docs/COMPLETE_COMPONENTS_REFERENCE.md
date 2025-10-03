# 📚 Referencia Completa de Componentes - IAutomat Design System

> **Documento completo con TODOS los 70+ componentes del Design System**
>
> Este documento proporciona una referencia exhaustiva de cada componente, sus propiedades, configuraciones y ejemplos de uso.

---

## 📋 Índice por Categoría

### 💠 Base Components (12 componentes)
1. [DSButton](#dsbutton) - Sistema de botones empresariales
2. [DSInput](#dsinput) - Campos de entrada inteligentes
3. [DSCard](#dscard) - Cards empresariales
4. [DSFab](#dsfab) - Floating Action Button
5. [DSIconButton](#dsiconbutton) - Botones de icono
6. [DSSwitch](#dsswitch) - Interruptores
7. [DSCheckbox](#dscheckbox) - Checkboxes
8. [DSRadio](#dsradio) - Radio buttons
9. [DSTextField](#dstextfield) - Campos de texto
10. [DSTextArea](#dstextarea) - Áreas de texto
11. [DSSelect](#dsselect) - Selectores dropdown
12. [DSSlider](#dsslider) - Controles deslizantes

### 📝 Form Components (8 componentes)
13. [DSCombobox](#dscombobox) - Combo boxes
14. [DSStepper](#dsstepper) - Steppers de proceso
15. [DSDatePicker](#dsdatepicker) - Selectores de fecha
16. [DSColorPicker](#dscolorpicker) - Selectores de color
17. [DSFilePicker](#dsfilepicker) - Selectores de archivo
18. [DSCurrencyInput](#dscurrencyinput) - Input de moneda
19. [DSCheckoutForms](#dscheckoutforms) - Formularios de checkout
20. [DSAuthScreens](#dsauthscreens) - Pantallas de autenticación

### 🗂️ Data Components (10 componentes)
21. [DSDataTable](#dsdatatable) - Tablas de datos avanzadas
22. [DSSimpleTable](#dssimpletable) - Tablas simples
23. [DSListItem](#dslistitem) - Items de lista
24. [DSDescriptionList](#dsdescriptionlist) - Listas descriptivas
25. [DSMetricCard](#dsmetriccard) - Cards de métricas
26. [DSCalendar](#dscalendar) - Calendario
27. [DSChart](#dschart) - Gráficos (fl_chart)
28. [DSKanban](#dskanban) - Tableros Kanban
29. [DSOutlineTree](#dsoutlinetree) - Árboles jerárquicos
30. [DSFilterBar](#dsfilterbar) - Barras de filtro

### 🧭 Navigation Components (8 componentes)
31. [DSScaffold](#dsscaffold) - Scaffold personalizado
32. [DSTopAppBar](#dstopappbar) - App bars superiores
33. [DSNavigation](#dsnavigation) - Navegación principal
34. [DSTabs](#dstabs) - Sistema de pestañas
35. [DSBreadcrumbs](#dsbreadcrumbs) - Breadcrumbs
36. [DSDrawer](#dsdrawer) - Navegación lateral
37. [DSMenu](#dsmenu) - Menús contextuales
38. [DSPagination](#dspagination) - Paginación

### 🎯 Feedback Components (6 componentes)
39. [DSToast](#dstoast) - Notificaciones toast
40. [DSBanner](#dsbanner) - Banners informativos
41. [DSTooltip](#dstooltip) - Tooltips
42. [DSProgress](#dsprogress) - Indicadores de progreso
43. [DSEmptyState](#dsemptystate) - Estados vacíos
44. [DSStatusDot](#dsstatusdot) - Indicadores de estado

### 🎭 Display Components (8 componentes)
45. [DSBadge](#dsbadge) - Badges y contadores
46. [DSAvatar](#dsavatar) - Avatares de usuario
47. [DSTag](#dstag) - Etiquetas
48. [DSTimeline](#dstimeline) - Líneas de tiempo
49. [DSImage](#dsimage) - Gestión de imágenes
50. [DSLightbox](#dslightbox) - Visualizador de imágenes
51. [DSMediaViewer](#dsmediaviewer) - Visor multimedia
52. [DSSkeleton](#dsskeleton) - Estados de carga

### 🔧 Layout Components (6 componentes)
53. [DSSplitView](#dssplitview) - Vistas divididas
54. [DSDivider](#dsdivider) - Divisores
55. [DSAccordion](#dsaccordion) - Acordeones
56. [DSChip](#dschip) - Chips informativos
57. [DSToggleView](#dstoggleview) - Vistas alternables
58. [DSCommandPalette](#dscommandpalette) - Paleta de comandos

### 🏪 E-commerce Components (4 componentes)
59. [DSProductCard](#dsproductcard) - Cards de producto
60. [DSCartWidget](#dscartwidget) - Widget de carrito
61. [DSMap](#dsmap) - Mapas interactivos
62. [DSCameraPicker](#dscamerapicker) - Selector de cámara

### ⚙️ Specialty Components (8 componentes)
63. [DSProfilePreferences](#dsprofilepreferences) - Configuración de perfil
64. [DSRoleVisibility](#dsrolevisibility) - Control de visibilidad por roles
65. [DSClipboardShare](#dsclipboardshare) - Compartir portapapeles
66. [DSBackToTop](#dsbacktotop) - Botón volver arriba
67. [DSInPageSearch](#dsinpagesearch) - Búsqueda en página
68. [DSDialog](#dsdialog) - Diálogos modales
69. [DSBottomSheet](#dsbottomsheet) - Bottom sheets
70. [DSTour](#dstour) - Tours guiados

---

## 📖 Guía Rápida de Referencia

### Formato de Cada Componente

Cada componente sigue esta estructura estándar:

```dart
// Constructor básico
DSComponentName({
  required prop1,      // Propiedad requerida
  prop2,               // Propiedad opcional
  DSComponentConfig? config,  // Configuración completa opcional
})

// Configuración (Modelo Freezed)
@freezed
class DSComponentConfig with _$DSComponentConfig {
  const factory DSComponentConfig({
    @Default(value) Type property,  // Con valor por defecto
    SubConfig? subConfig,            // Sub-configuración opcional
  }) = _DSComponentConfig;
}
```

---

## 💠 BASE COMPONENTS

### DSButton
**Sistema de botones empresariales con 6 variantes y 8 estados**

**Ubicación:** `lib/src/components/buttons/ds_button.dart`

**Constructor:**
```dart
DSButton({
  required String text,
  VoidCallback? onPressed,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool loading = false,
  bool disabled = false,
  String? tooltip,
  DSButtonConfig? config,
})
```

**Variantes:** `filled`, `tonal`, `outline`, `text`, `icon`, `segmented`
**Estados:** `defaultState`, `hover`, `pressed`, `focus`, `selected`, `disabled`, `loading`, `skeleton`
**Tamaños:** `small` (32px), `medium` (40px), `large` (48px)

**Ejemplo básico:**
```dart
DSButton(
  text: 'Guardar',
  onPressed: () => _save(),
)
```

**Ver documentación completa:** [COMPONENT_API.md - DSButton](../COMPONENT_API.md#dsbutton)

---

### DSInput
**Campos de entrada inteligentes con validación avanzada**

**Ubicación:** `lib/src/components/inputs/ds_input.dart`

**Constructor:**
```dart
DSInput({
  String? label,
  String? hint,
  String? helperText,
  String? errorText,
  TextEditingController? controller,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  bool obscureText = false,
  Widget? prefixIcon,
  Widget? suffixIcon,
  // ... más propiedades
})
```

**Tipos de validación incluidos:**
- `Validators.required()`, `email()`, `phone()`, `url()`
- `Validators.password()` con requisitos
- `Validators.compose()` para combinar
- `Validators.custom()` para lógica personalizada

**Ejemplo con validación:**
```dart
DSInput(
  label: 'Email',
  keyboardType: TextInputType.emailAddress,
  validator: Validators.compose([
    Validators.required('Email requerido'),
    Validators.email('Email inválido'),
  ]),
)
```

---

### DSCard
**Cards empresariales personalizables**

**Ubicación:** `lib/src/components/cards/ds_card.dart`

**Constructor:**
```dart
DSCard({
  required Widget child,
  VoidCallback? onTap,
  bool interactive = false,
  DSCardConfig? config,
})
```

**Variantes:** `elevated`, `filled`, `outline`
**Estados:** `defaultState`, `hover`, `pressed`, `focus`, `selected`, `disabled`

**Ejemplo:**
```dart
DSCard(
  interactive: true,
  onTap: () => _viewDetails(),
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
```

---

### DSFab
**Floating Action Button optimizado**

**Ubicación:** `lib/src/components/fab/ds_fab.dart`

**Constructor:**
```dart
DSFab({
  required Widget icon,
  VoidCallback? onPressed,
  String? tooltip,
  String? label,
  DSFabConfig? config,
})
```

**Variantes:** `standard`, `small`, `large`, `extended`

**Ejemplo:**
```dart
DSFab(
  icon: Icon(Icons.add),
  tooltip: 'Crear nuevo',
  onPressed: () => _create(),
)
```

---

### DSIconButton
**Botones de icono accesibles**

**Ubicación:** `lib/src/components/icon_button/ds_icon_button.dart`

**Constructor:**
```dart
DSIconButton({
  required Widget icon,
  VoidCallback? onPressed,
  String? tooltip,
  DSIconButtonConfig? config,
})
```

**Ejemplo:**
```dart
DSIconButton(
  icon: Icon(Icons.delete),
  tooltip: 'Eliminar',
  onPressed: () => _delete(),
)
```

---

### DSSwitch
**Interruptores empresariales**

**Ubicación:** `lib/src/components/switch/ds_switch.dart`

**Constructor:**
```dart
DSSwitch({
  required bool value,
  required ValueChanged<bool> onChanged,
  String? label,
  // ... más propiedades
})
```

---

### DSCheckbox
**Checkboxes accesibles**

**Ubicación:** `lib/src/components/checkbox/ds_checkbox.dart`

**Constructor:**
```dart
DSCheckbox({
  required bool value,
  required ValueChanged<bool> onChanged,
  String? label,
  bool tristate = false,
  // ... más propiedades
})
```

---

### DSRadio
**Radio buttons agrupables**

**Ubicación:** `lib/src/components/radio/ds_radio.dart`

**Constructor:**
```dart
DSRadio<T>({
  required T value,
  required T groupValue,
  required ValueChanged<T> onChanged,
  String? label,
  // ... más propiedades
})
```

---

## 📝 FORM COMPONENTS

### DSCurrencyInput
**Input especializado para moneda con formateo automático**

**Ubicación:** `lib/src/components/currency_input/ds_currency_input.dart`

**Constructor:**
```dart
DSCurrencyInput({
  String? label,
  double? initialValue,
  String currency = 'USD',
  String locale = 'en_US',
  ValueChanged<double>? onChanged,
  FormFieldValidator<double>? validator,
  DSCurrencyInputConfig? config,
})
```

**Características:**
- Formateo automático de moneda
- Soporte multi-moneda
- Validación de rangos
- Símbolos de moneda
- Separadores de miles

**Ejemplo:**
```dart
DSCurrencyInput(
  label: 'Precio',
  currency: 'USD',
  initialValue: 1500.00,
  validator: (value) {
    if (value == null || value < 0) {
      return 'Precio inválido';
    }
    return null;
  },
)
```

---

### DSDatePicker
**Selector de fecha empresarial**

**Ubicación:** `lib/src/components/date_picker/ds_date_picker.dart`

**Constructor:**
```dart
DSDatePicker({
  String? label,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  ValueChanged<DateTime>? onDateSelected,
  DSDatePickerConfig? config,
})
```

**Modos:** `date`, `time`, `dateTime`, `range`
**Variantes:** `dialog`, `bottomSheet`, `inline`

---

### DSColorPicker
**Selector de color avanzado**

**Ubicación:** `lib/src/components/color_picker/ds_color_picker.dart`

**Constructor:**
```dart
DSColorPicker({
  Color? initialColor,
  ValueChanged<Color>? onColorChanged,
  bool showAlpha = true,
  // ... más propiedades
})
```

---

### DSFilePicker
**Selector de archivos multi-plataforma**

**Ubicación:** `lib/src/components/file_picker/ds_file_picker.dart`

**Constructor:**
```dart
DSFilePicker({
  List<String>? allowedExtensions,
  bool allowMultiple = false,
  ValueChanged<List<File>>? onFilesPicked,
  // ... más propiedades
})
```

---

## 🗂️ DATA COMPONENTS

### DSDataTable
**Tabla de datos empresarial con funcionalidades avanzadas**

**Ubicación:** `lib/src/components/data_table/ds_data_table.dart`

**Constructor:**
```dart
DSDataTable<T>({
  required List<DSDataColumn<T>> columns,
  required List<T> data,
  DSDataTableController<T>? controller,
  ValueChanged<List<T>>? onSelectionChanged,
  ValueChanged<T>? onRowTap,
  DSDataTableConfig<T>? config,
})
```

**Características:**
- Paginación
- Ordenamiento
- Filtrado
- Selección múltiple
- Búsqueda global
- Exportación de datos
- Columnas redimensionables
- Acciones en fila

**Ejemplo:**
```dart
DSDataTable<Employee>(
  columns: [
    DSDataColumn<Employee>(
      key: 'name',
      title: 'Nombre',
      sortable: true,
      cellBuilder: (emp) => Text(emp.fullName),
    ),
    DSDataColumn<Employee>(
      key: 'email',
      title: 'Email',
      filterable: true,
    ),
  ],
  data: employees,
  config: DSDataTableConfig(
    pagination: DSDataTablePagination(pageSize: 25),
    sorting: DSDataTableSorting(defaultSortColumn: 'name'),
  ),
)
```

---

### DSChart
**Sistema de gráficos profesionales usando fl_chart**

**Ubicación:** `lib/src/components/charts/ds_chart.dart`

**Tipos disponibles:**
- `line` - Gráfico de líneas
- `bar` - Gráfico de barras
- `pie` - Gráfico circular
- `area` - Gráfico de área
- `scatter` - Gráfico de dispersión
- `radar` - Gráfico radar
- `candlestick` - Gráfico de velas (trading)

**Ejemplo:**
```dart
DSChart(
  type: DSChartType.line,
  title: 'Ventas Mensuales',
  data: salesData,
  config: DSChartConfig(
    xAxis: DSChartAxis(title: 'Meses'),
    yAxis: DSChartAxis(title: 'Ventas (USD)'),
  ),
)
```

---

### DSCalendar
**Calendario empresarial completo**

**Ubicación:** `lib/src/components/calendar/ds_calendar.dart`

**Modos:** `month`, `week`, `day`, `agenda`

---

### DSKanban
**Tablero Kanban drag & drop**

**Ubicación:** `lib/src/components/kanban/ds_kanban.dart`

**Características:**
- Drag & drop entre columnas
- Múltiples tableros
- Filtros y búsqueda
- WIP limits

---

## 🧭 NAVIGATION COMPONENTS

### DSTopAppBar
**App bar superior personalizable**

**Ubicación:** `lib/src/components/ds_bars/ds_top_app_bar.dart`

**Variantes:** `small`, `medium`, `large`, `center-aligned`

**Ejemplo:**
```dart
DSTopAppBar(
  title: 'Dashboard',
  leading: DSIconButton(
    icon: Icon(Icons.menu),
    onPressed: () => _openDrawer(),
  ),
  actions: [
    DSIconButton(
      icon: Icon(Icons.notifications),
      onPressed: () => _showNotifications(),
    ),
  ],
)
```

---

### DSDrawer
**Navegación lateral empresarial**

**Ubicación:** `lib/src/components/drawer/ds_drawer.dart`

**Variantes:** `permanent`, `modal`, `temporary`

**Ejemplo:**
```dart
DSDrawer.permanent(
  width: 280,
  content: Column(
    children: [
      _buildHeader(),
      Expanded(child: _buildNavigationMenu()),
      _buildFooter(),
    ],
  ),
)
```

---

### DSBreadcrumbs
**Navegación de ruta**

**Ubicación:** `lib/src/components/breadcrumbs/ds_breadcrumbs.dart`

**Ejemplo:**
```dart
DSBreadcrumbs(
  items: [
    DSBreadcrumbItem(
      label: 'Dashboard',
      icon: Icon(Icons.dashboard),
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
```

---

### DSTabs
**Sistema de pestañas**

**Ubicación:** `lib/src/components/tabs/ds_tabs.dart`

---

### DSNavigation
**Navegación principal (bottom nav, rail, etc)**

**Ubicación:** `lib/src/components/navigation/ds_navigation.dart`

---

### DSMenu
**Menús contextuales**

**Ubicación:** `lib/src/components/menu/ds_menu.dart`

---

### DSPagination
**Paginación de datos**

**Ubicación:** `lib/src/components/pagination/ds_pagination.dart`

---

## 🎯 FEEDBACK COMPONENTS

### DSToast
**Sistema de notificaciones inteligentes**

**Ubicación:** `lib/src/components/toast/ds_toast.dart`

**Tipos:** `info`, `success`, `warning`, `error`, `loading`, `custom`
**Posiciones:** Todas las combinaciones (top/bottom, start/center/end)

**Métodos estáticos:**
```dart
// Mostrar toast básico
DSToast.show(context, message: 'Guardado exitosamente', type: ToastType.success);

// Métodos convenientes
DSToast.success(context, message: 'Operación exitosa');
DSToast.error(context, message: 'Error al procesar');
DSToast.warning(context, message: 'Advertencia importante');
DSToast.info(context, message: 'Información relevante');
```

**Ejemplo con acciones:**
```dart
DSToast.show(
  context,
  message: 'Error al subir archivo',
  type: ToastType.error,
  action: ToastAction(
    label: 'Reintentar',
    onPressed: () => _retryUpload(),
  ),
  position: ToastPosition.bottom,
  duration: Duration(seconds: 8),
);
```

---

### DSProgress
**Indicadores de progreso**

**Ubicación:** `lib/src/components/progress/ds_progress.dart`

**Tipos:** `linear`, `circular`, `ring`, `step`, `radial`
**Estados:** `active`, `paused`, `completed`, `error`, `indeterminate`

---

### DSBanner
**Banners informativos**

**Ubicación:** `lib/src/components/banner/ds_banner.dart`

---

### DSTooltip
**Tooltips accesibles**

**Ubicación:** `lib/src/components/tooltip/ds_tooltip.dart`

---

### DSEmptyState
**Estados vacíos elegantes**

**Ubicación:** `lib/src/components/empty_state/ds_empty_state.dart`

---

### DSStatusDot
**Indicadores de estado**

**Ubicación:** `lib/src/components/status_dot/ds_status_dot.dart`

---

## 🎭 DISPLAY COMPONENTS

### DSBadge
**Badges y contadores**

**Ubicación:** `lib/src/components/badge/ds_badge.dart`

---

### DSAvatar
**Avatares de usuario**

**Ubicación:** `lib/src/components/avatar/ds_avatar.dart`

**Tipos:** `image`, `initials`, `icon`
**Tamaños:** `xs`, `sm`, `md`, `lg`, `xl`, `xxl`

---

### DSTag
**Etiquetas**

**Ubicación:** `lib/src/components/tag/ds_tag.dart`

---

### DSTimeline
**Líneas de tiempo**

**Ubicación:** `lib/src/components/timeline/ds_timeline.dart`

---

### DSImage
**Gestión de imágenes optimizada**

**Ubicación:** `lib/src/components/image/ds_image.dart`

**Características:**
- Caché automática
- Placeholders
- Manejo de errores
- Zoom y pan
- Lazy loading

---

### DSLightbox
**Visualizador de imágenes**

**Ubicación:** `lib/src/components/lightbox/ds_lightbox.dart`

---

### DSMediaViewer
**Visor multimedia (imagen/video)**

**Ubicación:** `lib/src/components/media_viewer/ds_media_viewer.dart`

---

### DSSkeleton
**Estados de carga skeleton**

**Ubicación:** `lib/src/components/skeleton/ds_skeleton.dart`

---

## 🔧 LAYOUT COMPONENTS

### DSAccordion
**Acordeones expandibles**

**Ubicación:** `lib/src/components/accordion/ds_accordion.dart`

---

### DSDivider
**Divisores visuales**

**Ubicación:** `lib/src/components/divider/ds_divider.dart`

---

### DSSplitView
**Vistas divididas**

**Ubicación:** `lib/src/components/split_view/ds_split_view.dart`

---

### DSChip
**Chips informativos**

**Ubicación:** `lib/src/components/chip/ds_chip.dart`

---

### DSToggleView
**Vistas alternables (grid/list)**

**Ubicación:** `lib/src/components/toggle_view/ds_toggle_view.dart`

---

### DSCommandPalette
**Paleta de comandos (estilo VS Code)**

**Ubicación:** `lib/src/components/command_palette/ds_command_palette.dart`

**Características:**
- Búsqueda fuzzy
- Atajos de teclado
- Categorías
- Comandos personalizados
- Historial

**Ejemplo:**
```dart
DSCommandPalette(
  commands: [
    DSCommand(
      id: 'new_project',
      title: 'Crear Nuevo Proyecto',
      icon: Icon(Icons.add),
      keywords: ['nuevo', 'crear', 'proyecto'],
      shortcut: 'Ctrl+N',
      onExecute: () => _createProject(),
    ),
    // ... más comandos
  ],
)
```

---

## 🏪 E-COMMERCE COMPONENTS

### DSProductCard
**Cards de producto para e-commerce**

**Ubicación:** `lib/src/components/product_card/ds_product_card.dart`

**Variantes:** `standard`, `compact`, `detailed`

**Ejemplo:**
```dart
DSProductCard(
  product: Product(
    id: 'prod_001',
    name: 'iPhone 15 Pro',
    price: 999.00,
    currency: 'USD',
    imageUrl: 'https://...',
    rating: 4.8,
    reviewCount: 1247,
  ),
  onTap: () => _viewProduct(),
  onAddToCart: () => _addToCart(),
  config: DSProductCardConfig(
    showQuickActions: true,
    showBadges: true,
  ),
)
```

---

### DSCartWidget
**Widget de carrito de compras**

**Ubicación:** `lib/src/components/cart_widget/ds_cart_widget.dart`

**Variantes:** `sidebar`, `modal`, `fab`, `mini`

---

### DSMap
**Mapas interactivos**

**Ubicación:** `lib/src/components/map/ds_map.dart`

---

### DSCameraPicker
**Selector de cámara**

**Ubicación:** `lib/src/components/camera_picker/ds_camera_picker.dart`

---

## ⚙️ SPECIALTY COMPONENTS

### DSBackToTop
**Botón para volver al inicio**

**Ubicación:** `lib/src/components/back_to_top/ds_back_to_top.dart`

**Características:**
- Aparece después de scroll
- Scroll suave animado
- Auto-ocultar
- Haptic feedback

**Ejemplo:**
```dart
DSBackToTop(
  scrollController: _scrollController,
  config: DSBackToTopConfig(
    variant: DSBackToTopVariant.webOnly,
    behavior: DSBackToTopBehavior(
      showAfterPixels: 300,
      smoothScrolling: true,
      autoHide: true,
    ),
  ),
)
```

---

### DSDialog
**Diálogos modales**

**Ubicación:** `lib/src/components/dialog/ds_dialog.dart`

---

### DSBottomSheet
**Bottom sheets**

**Ubicación:** `lib/src/components/bottom_sheet/ds_bottom_sheet.dart`

---

### DSTour
**Tours guiados (onboarding)**

**Ubicación:** `lib/src/components/tour/ds_tour.dart`

---

### DSProfilePreferences
**Configuración de perfil**

**Ubicación:** `lib/src/components/profile_preferences/ds_profile_preferences.dart`

---

### DSRoleVisibility
**Control de visibilidad por roles**

**Ubicación:** `lib/src/components/role_visibility/ds_role_visibility.dart`

---

### DSClipboardShare
**Compartir portapapeles**

**Ubicación:** `lib/src/components/clipboard_share/ds_clipboard_share.dart`

---

### DSInPageSearch
**Búsqueda en página**

**Ubicación:** `lib/src/components/in_page_search/ds_in_page_search.dart`

---

## 🎯 Patrones de Configuración Común

### Patrón Freezed
Todos los componentes complejos usan Freezed para configuraciones inmutables:

```dart
@freezed
class DSComponentConfig with _$DSComponentConfig {
  const factory DSComponentConfig({
    @Default(defaultValue) Type property,
    SubConfig? subConfig,
  }) = _DSComponentConfig;
}
```

### Patrón de Accesibilidad
Componentes complejos incluyen helper de accesibilidad:

```dart
// Archivo: ds_component_a11y_helper.dart
class DSComponentA11yHelper {
  static String getSemanticLabel(DSComponent component) {
    // Lógica de accesibilidad
  }
}
```

### Patrón de Adaptador de Plataforma
Componentes con comportamiento específico por plataforma:

```dart
// Archivo: ds_component_platform_adapter.dart
class DSComponentPlatformAdapter {
  static Widget buildForPlatform(BuildContext context) {
    if (Platform.isIOS) {
      return _buildCupertinoVersion();
    }
    return _buildMaterialVersion();
  }
}
```

---

## 📝 Notas de Implementación

### Todas las Configuraciones son Opcionales
Cada componente tiene valores por defecto sensatos:
```dart
// Sin configuración - usa defaults
DSButton(text: 'Click me', onPressed: () {});

// Con configuración personalizada
DSButton(
  text: 'Click me',
  config: DSButtonConfig(
    variant: DSButtonVariant.outline,
    size: DSButtonSize.large,
  ),
  onPressed: () {},
);
```

### Tema Automático
Todos los componentes respetan el tema de Material:
```dart
final theme = Theme.of(context);
final colors = theme.colorScheme;
final textTheme = theme.textTheme;
```

### Responsive por Defecto
Los componentes se adaptan automáticamente:
```dart
// El componente ajusta automáticamente según el dispositivo
DSDataTable(...); // Se adapta a mobile/tablet/desktop
```

---

## 🔍 Búsqueda Rápida por Caso de Uso

### Dashboard Ejecutivo
- `DSMetricCard` - Métricas KPI
- `DSChart` - Gráficos de análisis
- `DSDataTable` - Tablas de datos
- `DSTopAppBar` - Barra superior
- `DSDrawer` - Navegación lateral

### E-commerce
- `DSProductCard` - Tarjetas de producto
- `DSCartWidget` - Carrito de compras
- `DSCheckoutForms` - Formularios de pago
- `DSCurrencyInput` - Precios
- `DSRating` - Calificaciones

### Formularios
- `DSInput` - Campos de texto
- `DSCurrencyInput` - Moneda
- `DSDatePicker` - Fechas
- `DSColorPicker` - Colores
- `DSFilePicker` - Archivos
- `DSCheckbox` / `DSRadio` - Selección

### Autenticación
- `DSAuthScreens` - Login/Register
- `DSInput` - Email/Password
- `DSButton` - Submit

### Notificaciones
- `DSToast` - Mensajes temporales
- `DSBanner` - Mensajes persistentes
- `DSDialog` - Confirmaciones
- `DSBottomSheet` - Acciones

---

## 📚 Recursos Adicionales

- [COMPONENT_API.md](../COMPONENT_API.md) - API detallada de componentes principales
- [README.md](../README.md) - Documentación general del proyecto
- [CLAUDE.md](../CLAUDE.md) - Guías para desarrollo
- [Live Demo](https://iautomatdesignsystem.web.app) - Showcase interactivo

---

*Última actualización: 2025-01-03*
*Versión: 1.0.2*
*Total de componentes documentados: 70+*
