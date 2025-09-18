# 📚 Component API Reference

**Referencia completa de la API de componentes del IAutomat Design System**

---

## 📋 Índice de Componentes

### 💠 Base Components (12)
- [AppButton](#appbutton) - Sistema completo de botones
- [AppInput](#appinput) - Campos de entrada inteligentes
- [AppCard](#appcard) - Cards empresariales
- [AppFab](#appfab) - Floating Action Button
- [AppIconButton](#appiconbutton) - Botones de icono
- [AppSwitch](#appswitch) - Interruptores
- [AppCheckbox](#appcheckbox) - Checkboxes
- [AppRadio](#appradio) - Radio buttons
- [AppTextField](#apptextfield) - Campos de texto avanzados
- [AppTextArea](#apptextarea) - Áreas de texto
- [AppSelect](#appselect) - Selectores dropdown
- [AppSlider](#appslider) - Controles deslizantes

### 📝 Form Components (8)
- [AppCombobox](#appcombobox) - Combo boxes
- [AppStepper](#appstepper) - Steppers de proceso
- [AppDatePicker](#appdatepicker) - Selectores de fecha
- [AppColorPicker](#appcolorpicker) - Selectores de color
- [AppFilePicker](#appfilepicker) - Selectores de archivo
- [AppCurrencyInput](#appcurrencyinput) - Input de moneda
- [AppCheckoutForms](#appcheckoutforms) - Formularios de checkout
- [AppAuthScreens](#appauthscreens) - Pantallas de autenticación

### 🗂️ Data Components (10)
- [AppDataTable](#appdatatable) - Tablas de datos avanzadas
- [AppSimpleTable](#appsimpletable) - Tablas simples
- [AppListItem](#applistitem) - Items de lista
- [AppDescriptionList](#appdescriptionlist) - Listas descriptivas
- [AppMetricCard](#appmetriccard) - Cards de métricas
- [AppCalendar](#appcalendar) - Calendario
- [AppChart](#appchart) - Gráficos
- [AppKanban](#appkanban) - Tableros Kanban
- [AppOutlineTree](#appoutlinetree) - Árboles jerárquicos
- [AppFilterBar](#appfilterbar) - Barras de filtro

### 🧭 Navigation Components (8)
- [AppScaffold](#appscaffold) - Scaffold personalizado
- [AppTopAppBar](#apptopappbar) - App bars superiores
- [AppNavigation](#appnavigation) - Navegación principal
- [AppTabs](#apptabs) - Sistema de pestañas
- [AppBreadcrumbs](#appbreadcrumbs) - Breadcrumbs
- [AppDrawer](#appdrawer) - Navegación lateral
- [AppMenu](#appmenu) - Menús contextuales
- [AppPagination](#apppagination) - Paginación

### 🎯 Feedback Components (6)
- [AppToast](#apptoast) - Notificaciones toast
- [AppBanner](#appbanner) - Banners informativos
- [AppTooltip](#apptooltip) - Tooltips
- [AppProgress](#appprogress) - Indicadores de progreso
- [AppEmptyState](#appemptystate) - Estados vacíos
- [AppStatusDot](#appstatusdot) - Indicadores de estado

### 🎭 Display Components (8)
- [AppBadge](#appbadge) - Badges y contadores
- [AppAvatar](#appavatar) - Avatares de usuario
- [AppTag](#apptag) - Etiquetas
- [AppTimeline](#apptimeline) - Líneas de tiempo
- [AppImage](#appimage) - Gestión de imágenes
- [AppLightbox](#applightbox) - Visualizador de imágenes
- [AppMediaViewer](#appmediaviewer) - Visor multimedia
- [AppSkeleton](#appskeleton) - Estados de carga

### 🔧 Layout Components (6)
- [AppSplitView](#appsplitview) - Vistas divididas
- [AppDivider](#appdivider) - Divisores
- [AppAccordion](#appaccordion) - Acordeones
- [AppChip](#appchip) - Chips informativos
- [AppToggleView](#apptoggleview) - Vistas alternables
- [AppCommandPalette](#appcommandpalette) - Paleta de comandos

### 🏪 E-commerce Components (4)
- [AppProductCard](#appproductcard) - Cards de producto
- [AppCartWidget](#appcartwidget) - Widget de carrito
- [AppMap](#appmap) - Mapas interactivos
- [AppCameraPicker](#appcamerapicker) - Selector de cámara

### ⚙️ Specialty Components (8)
- [AppProfilePreferences](#appprofilepreferences) - Configuración de perfil
- [AppRoleVisibility](#approlevisibility) - Control de visibilidad por roles
- [AppClipboardShare](#appclipboardshare) - Compartir portapapeles
- [AppBackToTop](#appbacktotop) - Botón volver arriba
- [AppInPageSearch](#appinpagesearch) - Búsqueda en página
- [AppDialog](#appdialog) - Diálogos modales
- [AppBottomSheet](#appbottomsheet) - Bottom sheets
- [AppTour](#apptour) - Tours guiados

---

## 💠 Base Components

### AppButton

**Sistema completo de botones empresariales con 6 variantes y 8 estados**

#### Constructor
```dart
AppButton({
  Key? key,
  required String text,                    // Texto del botón
  VoidCallback? onPressed,                 // Callback de acción
  VoidCallback? onLongPress,               // Callback de presión larga
  Widget? prefixIcon,                      // Icono antes del texto
  Widget? suffixIcon,                      // Icono después del texto
  bool loading = false,                    // Estado de carga
  bool disabled = false,                   // Estado deshabilitado
  String? tooltip,                         // Tooltip del botón
  FocusNode? focusNode,                    // Focus node personalizado
  bool autofocus = false,                  // Auto-focus inicial
  AppButtonConfig? config,                 // Configuración completa
})
```

#### Configuración (AppButtonConfig)
```dart
@freezed
class AppButtonConfig with _$AppButtonConfig {
  const factory AppButtonConfig({
    @Default(ButtonVariant.filled) ButtonVariant variant,    // filled, tonal, outline, text, icon, segmented
    @Default(ButtonSize.medium) ButtonSize size,             // small, medium, large
    @Default(AppButtonState.defaultState) AppButtonState state, // default, hover, pressed, focus, selected, disabled, loading, skeleton
    AppButtonColors? colors,                                 // Configuración de colores
    AppButtonSpacing? spacing,                               // Espaciado y dimensiones
    AppButtonAnimations? animations,                         // Animaciones
    AppButtonAccessibility? accessibility,                   // Accesibilidad
  }) = _AppButtonConfig;
}
```

#### AppButtonColors
```dart
@freezed
class AppButtonColors with _$AppButtonColors {
  const factory AppButtonColors({
    Color? backgroundColor,          // Color de fondo
    Color? foregroundColor,          // Color del texto/icono
    Color? borderColor,              // Color del borde
    Color? shadowColor,              // Color de la sombra
    Color? overlayColor,             // Color de overlay (hover/press)
    @Default(1.0) double opacity,    // Opacidad general (0.0-1.0)
    @Default(0.12) double hoverOpacity,     // Opacidad en hover
    @Default(0.16) double pressedOpacity,   // Opacidad al presionar
    @Default(0.38) double disabledOpacity,  // Opacidad deshabilitado
  }) = _AppButtonColors;
}
```

#### AppButtonSpacing
```dart
@freezed
class AppButtonSpacing with _$AppButtonSpacing {
  const factory AppButtonSpacing({
    EdgeInsets? padding,             // Padding interno
    EdgeInsets? margin,              // Margin externo
    @Default(8.0) double borderRadius,      // Radio de bordes
    @Default(2.0) double borderWidth,       // Ancho del borde
    @Default(4.0) double elevation,         // Elevación/sombra
    @Default(48.0) double minimumHeight,    // Altura mínima
    @Default(64.0) double minimumWidth,     // Ancho mínimo
    @Default(8.0) double iconSpacing,       // Espaciado del icono
  }) = _AppButtonSpacing;
}
```

#### Ejemplos de Uso
```dart
// Botón básico
AppButton(
  text: 'Guardar',
  onPressed: () => _save(),
)

// Botón con icono y configuración
AppButton(
  text: 'Descargar',
  prefixIcon: Icon(Icons.download),
  config: AppButtonConfig(
    variant: ButtonVariant.outline,
    size: ButtonSize.large,
    colors: AppButtonColors(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
  ),
)

// Botón de carga
AppButton(
  text: 'Procesando...',
  loading: true,
  disabled: true,
)
```

---

### AppInput

**Campos de entrada inteligentes con validación avanzada**

#### Constructor
```dart
AppInput({
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
  AppInputConfig? config,                  // Configuración completa
})
```

#### Configuración (AppInputConfig)
```dart
@freezed
class AppInputConfig with _$AppInputConfig {
  const factory AppInputConfig({
    @Default(AppInputVariant.outline) AppInputVariant variant, // outline, filled, underline
    @Default(AppInputState.defaultState) AppInputState state,  // default, focus, error, disabled, readonly
    AppInputColors? colors,                                     // Configuración de colores
    AppInputSpacing? spacing,                                   // Espaciado y dimensiones
    AppInputValidation? validation,                             // Configuración de validación
    AppInputAccessibility? accessibility,                       // Accesibilidad
  }) = _AppInputConfig;
}
```

#### AppInputValidation
```dart
@freezed
class AppInputValidation with _$AppInputValidation {
  const factory AppInputValidation({
    @Default(true) bool enabled,             // Validación habilitada
    @Default(false) bool realTimeValidation, // Validación en tiempo real
    @Default(false) bool showProgress,       // Mostrar progreso de validación
    @Default(true) bool showErrorIcon,       // Mostrar icono de error
    @Default(true) bool showSuccessIcon,     // Mostrar icono de éxito
    int? maxLength,                          // Longitud máxima
    int? minLength,                          // Longitud mínima
    RegExp? pattern,                         // Patrón regex
    List<String>? allowedDomains,            // Dominios permitidos (email)
  }) = _AppInputValidation;
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
AppInput(
  label: 'Email',
  hint: 'usuario@empresa.com',
  keyboardType: TextInputType.emailAddress,
  validator: Validators.compose([
    Validators.required('Email requerido'),
    Validators.email('Email inválido'),
  ]),
)

// Input de contraseña
AppInput(
  label: 'Contraseña',
  obscureText: true,
  validator: Validators.password(
    minLength: 8,
    requireUppercase: true,
    requireNumbers: true,
  ),
  config: AppInputConfig(
    validation: AppInputValidation(
      realTimeValidation: true,
      showProgress: true,
    ),
  ),
)

// Input con formato personalizado
AppInput(
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

### AppCard

**Cards empresariales con configuración avanzada**

#### Constructor
```dart
AppCard({
  Key? key,
  required Widget child,                   // Contenido de la card
  VoidCallback? onTap,                     // Callback de tap
  VoidCallback? onLongPress,               // Callback de presión larga
  bool interactive = false,                // Si es interactiva
  String? semanticsLabel,                  // Etiqueta semántica
  AppCardConfig? config,                   // Configuración completa
})
```

#### Configuración (AppCardConfig)
```dart
@freezed
class AppCardConfig with _$AppCardConfig {
  const factory AppCardConfig({
    @Default(AppCardVariant.elevated) AppCardVariant variant, // elevated, filled, outline
    @Default(AppCardState.defaultState) AppCardState state,   // default, hover, pressed, focus, selected, disabled
    AppCardColors? colors,                                     // Configuración de colores
    AppCardSpacing? spacing,                                   // Espaciado y dimensiones
    AppCardAnimations? animations,                             // Animaciones
  }) = _AppCardConfig;
}
```

#### AppCardSpacing
```dart
@freezed
class AppCardSpacing with _$AppCardSpacing {
  const factory AppCardSpacing({
    EdgeInsets? padding,                     // Padding interno
    EdgeInsets? margin,                      // Margin externo
    @Default(12.0) double borderRadius,      // Radio de bordes
    @Default(1.0) double borderWidth,        // Ancho del borde
    @Default(4.0) double elevation,          // Elevación/sombra
    @Default(double.infinity) double width,  // Ancho
    double? height,                          // Alto
  }) = _AppCardSpacing;
}
```

#### Ejemplos de Uso
```dart
// Card básica
AppCard(
  child: Padding(
    padding: AppSpacing.cardPadding,
    child: Column(
      children: [
        Text('Título', style: AppTypography.h5),
        AppSpacing.verticalSm,
        Text('Contenido...'),
      ],
    ),
  ),
)

// Card interactiva
AppCard(
  interactive: true,
  onTap: () => _openDetails(),
  config: AppCardConfig(
    variant: AppCardVariant.outline,
    spacing: AppCardSpacing(
      borderRadius: 16,
      elevation: 8,
    ),
    animations: AppCardAnimations(
      duration: Duration(milliseconds: 200),
      hoverScale: 1.02,
    ),
  ),
  child: _buildCardContent(),
)
```

---

## 📝 Form Components

### AppCurrencyInput

**Input especializado para moneda con formateo automático**

#### Constructor
```dart
AppCurrencyInput({
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
  AppCurrencyInputConfig? config,          // Configuración completa
})
```

#### Configuración (AppCurrencyInputConfig)
```dart
@freezed
class AppCurrencyInputConfig with _$AppCurrencyInputConfig {
  const factory AppCurrencyInputConfig({
    AppCurrencyFormatting? formatting,      // Configuración de formato
    AppCurrencyValidation? validation,      // Validación específica
    AppCurrencyColors? colors,              // Colores personalizados
    AppCurrencyBehavior? behavior,          // Comportamiento
  }) = _AppCurrencyInputConfig;
}
```

#### AppCurrencyFormatting
```dart
@freezed
class AppCurrencyFormatting with _$AppCurrencyFormatting {
  const factory AppCurrencyFormatting({
    @Default(2) int decimalDigits,           // Dígitos decimales
    @Default(true) bool showCurrencySymbol,  // Mostrar símbolo
    @Default(',') String thousandSeparator,  // Separador de miles
    @Default('.') String decimalSeparator,   // Separador decimal
    @Default(true) bool compactFormat,       // Formato compacto (1K, 1M)
    @Default(false) bool showTrailingZeros,  // Mostrar ceros finales
  }) = _AppCurrencyFormatting;
}
```

#### Ejemplos de Uso
```dart
// Input básico de moneda
AppCurrencyInput(
  label: 'Precio',
  currency: 'USD',
  initialValue: 1500.00,
  onChanged: (value) => _updatePrice(value),
)

// Input avanzado con validación
AppCurrencyInput(
  label: 'Salario Anual',
  currency: 'USD',
  locale: 'en_US',
  validator: (value) {
    if (value == null || value < 30000) {
      return 'Salario mínimo \$30,000';
    }
    return null;
  },
  config: AppCurrencyInputConfig(
    formatting: AppCurrencyFormatting(
      decimalDigits: 0,
      compactFormat: true,
    ),
    validation: AppCurrencyValidation(
      min: 30000,
      max: 500000,
      required: true,
    ),
  ),
)
```

---

### AppDatePicker

**Selector de fecha empresarial**

#### Constructor
```dart
AppDatePicker({
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
  AppDatePickerConfig? config,             // Configuración completa
})
```

#### Configuración (AppDatePickerConfig)
```dart
@freezed
class AppDatePickerConfig with _$AppDatePickerConfig {
  const factory AppDatePickerConfig({
    @Default(AppDatePickerVariant.dialog) AppDatePickerVariant variant, // dialog, bottomSheet, inline
    @Default(AppDatePickerMode.date) AppDatePickerMode mode,             // date, time, dateTime
    AppDatePickerLocalization? localization,  // Localización
    AppDatePickerBehavior? behavior,          // Comportamiento
    AppDatePickerColors? colors,              // Colores personalizados
  }) = _AppDatePickerConfig;
}
```

#### Ejemplos de Uso
```dart
// Selector básico
AppDatePicker(
  label: 'Fecha de nacimiento',
  firstDate: DateTime(1950),
  lastDate: DateTime.now(),
  onDateSelected: (date) => _updateBirthDate(date),
)

// Selector de fecha y hora
AppDatePicker(
  label: 'Fecha y hora de reunión',
  initialDate: DateTime.now().add(Duration(days: 1)),
  config: AppDatePickerConfig(
    mode: AppDatePickerMode.dateTime,
    variant: AppDatePickerVariant.bottomSheet,
  ),
)
```

---

## 🗂️ Data Components

### AppDataTable

**Tabla de datos empresarial con funcionalidades avanzadas**

#### Constructor
```dart
AppDataTable<T>({
  Key? key,
  required List<AppDataColumn<T>> columns,      // Definición de columnas
  required List<T> data,                        // Datos de la tabla
  AppDataTableController<T>? controller,        // Controlador de tabla
  ValueChanged<List<T>>? onSelectionChanged,    // Callback de selección
  ValueChanged<T>? onRowTap,                    // Callback de tap en fila
  ValueChanged<T>? onRowDoubleTap,              // Callback de doble tap
  AppDataTableConfig<T>? config,                // Configuración completa
})
```

#### AppDataColumn
```dart
@freezed
class AppDataColumn<T> with _$AppDataColumn<T> {
  const factory AppDataColumn({
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
  }) = _AppDataColumn<T>;
}
```

#### Configuración (AppDataTableConfig)
```dart
@freezed
class AppDataTableConfig<T> with _$AppDataTableConfig<T> {
  const factory AppDataTableConfig({
    AppDataTablePagination? pagination,         // Configuración de paginación
    AppDataTableSelection<T>? selection,        // Configuración de selección
    AppDataTableSorting? sorting,               // Configuración de ordenamiento
    AppDataTableFiltering? filtering,           // Configuración de filtros
    AppDataTableStyling? styling,               // Estilos visuales
    AppDataTableBehavior? behavior,             // Comportamiento
  }) = _AppDataTableConfig<T>;
}
```

#### Ejemplos de Uso
```dart
// Tabla básica
AppDataTable<Employee>(
  columns: [
    AppDataColumn<Employee>(
      key: 'name',
      title: 'Nombre',
      width: 200,
      sortable: true,
      cellBuilder: (employee) => Text(employee.fullName),
    ),
    AppDataColumn<Employee>(
      key: 'email',
      title: 'Email',
      width: 250,
      filterable: true,
    ),
    AppDataColumn<Employee>(
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
AppDataTable<Employee>(
  columns: _buildColumns(),
  data: employees,
  config: AppDataTableConfig<Employee>(
    pagination: AppDataTablePagination(
      pageSize: 25,
      showPageSizeSelector: true,
      pageSizeOptions: [10, 25, 50, 100],
    ),
    selection: AppDataTableSelection<Employee>(
      multiSelect: true,
      selectAllVisible: true,
      onSelectionChanged: (selected) => _handleSelection(selected),
    ),
    sorting: AppDataTableSorting(
      defaultSortColumn: 'name',
      defaultSortDirection: SortDirection.ascending,
    ),
    filtering: AppDataTableFiltering(
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

### AppChart

**Sistema de gráficos profesionales**

#### Constructor
```dart
AppChart({
  Key? key,
  required AppChartType type,               // Tipo de gráfico
  required List<ChartData> data,            // Datos del gráfico
  String? title,                            // Título del gráfico
  String? subtitle,                         // Subtítulo
  AppChartConfig? config,                   // Configuración completa
})
```

#### Tipos de Gráfico (AppChartType)
```dart
enum AppChartType {
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

#### Configuración (AppChartConfig)
```dart
@freezed
class AppChartConfig with _$AppChartConfig {
  const factory AppChartConfig({
    AppChartAxis? xAxis,                     // Configuración eje X
    AppChartAxis? yAxis,                     // Configuración eje Y
    AppChartLegend? legend,                  // Configuración leyenda
    AppChartColors? colors,                  // Colores del gráfico
    AppChartAnimations? animations,          // Animaciones
    AppChartInteractions? interactions,      // Interacciones
    AppChartGrid? grid,                      // Rejilla
    AppChartTooltip? tooltip,                // Tooltips
  }) = _AppChartConfig;
}
```

#### Ejemplos de Uso
```dart
// Gráfico de líneas básico
AppChart(
  type: AppChartType.line,
  title: 'Ventas Mensuales',
  data: salesData,
  config: AppChartConfig(
    xAxis: AppChartAxis(
      title: 'Meses',
      labelFormat: DateFormat('MMM'),
    ),
    yAxis: AppChartAxis(
      title: 'Ventas (USD)',
      labelFormat: NumberFormat.currency(symbol: '\$'),
    ),
    colors: AppChartColors(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    animations: AppChartAnimations(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    ),
  ),
)

// Gráfico circular interactivo
AppChart(
  type: AppChartType.pie,
  title: 'Distribución por Departamento',
  data: departmentData,
  config: AppChartConfig(
    legend: AppChartLegend(
      position: LegendPosition.right,
      showPercentages: true,
    ),
    interactions: AppChartInteractions(
      enableSelection: true,
      enableZoom: false,
      onSegmentTap: (segment) => _showDetails(segment),
    ),
  ),
)
```

---

## 🧭 Navigation Components

### AppDrawer

**Navegación lateral empresarial**

#### Constructores
```dart
// Drawer permanente
AppDrawer.permanent({
  Key? key,
  required Widget content,                 // Contenido del drawer
  double? width,                           // Ancho del drawer
  AppDrawerConfig? config,                 // Configuración
})

// Drawer modal
AppDrawer.modal({
  Key? key,
  required Widget content,                 // Contenido del drawer
  VoidCallback? onClose,                   // Callback de cierre
  AppDrawerConfig? config,                 // Configuración
})

// Drawer temporal
AppDrawer.temporary({
  Key? key,
  required Widget content,                 // Contenido del drawer
  Duration? autoCloseDelay,                // Tiempo de auto-cierre
  AppDrawerConfig? config,                 // Configuración
})
```

#### Configuración (AppDrawerConfig)
```dart
@freezed
class AppDrawerConfig with _$AppDrawerConfig {
  const factory AppDrawerConfig({
    @Default(AppDrawerVariant.permanent) AppDrawerVariant variant, // permanent, modal, temporary
    @Default(DrawerSide.left) DrawerSide side,                     // left, right
    AppDrawerColors? colors,                                       // Colores
    AppDrawerBehavior? behavior,                                   // Comportamiento
    AppDrawerAnimations? animations,                               // Animaciones
  }) = _AppDrawerConfig;
}
```

#### Ejemplos de Uso
```dart
// Drawer permanente con navegación
AppDrawer.permanent(
  width: 280,
  content: Column(
    children: [
      _buildHeader(),
      Expanded(child: _buildNavigationMenu()),
      _buildFooter(),
    ],
  ),
  config: AppDrawerConfig(
    colors: AppDrawerColors(
      backgroundColor: AppColors.gray50,
      selectedColor: AppColors.primary,
    ),
    behavior: AppDrawerBehavior(
      collapsible: true,
      autoHideOnMobile: true,
    ),
  ),
)

// Drawer modal con overlay
AppDrawer.modal(
  content: _buildMobileMenu(),
  onClose: () => Navigator.pop(context),
  config: AppDrawerConfig(
    side: DrawerSide.right,
    animations: AppDrawerAnimations(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
  ),
)
```

---

### AppBreadcrumbs

**Navegación de ruta**

#### Constructor
```dart
AppBreadcrumbs({
  Key? key,
  required List<AppBreadcrumbItem> items,  // Items del breadcrumb
  Widget? separator,                       // Separador personalizado
  int? maxItems,                           // Máximo de items visibles
  AppBreadcrumbsConfig? config,            // Configuración
})
```

#### AppBreadcrumbItem
```dart
@freezed
class AppBreadcrumbItem with _$AppBreadcrumbItem {
  const factory AppBreadcrumbItem({
    required String label,                   // Texto del item
    Widget? icon,                            // Icono opcional
    VoidCallback? onTap,                     // Callback de tap
    @Default(false) bool isActive,           // Si es el item activo
    String? tooltip,                         // Tooltip
  }) = _AppBreadcrumbItem;
}
```

#### Ejemplos de Uso
```dart
// Breadcrumbs básico
AppBreadcrumbs(
  items: [
    AppBreadcrumbItem(
      label: 'Dashboard',
      icon: Icon(Icons.dashboard, size: 16),
      onTap: () => _navigateTo('/dashboard'),
    ),
    AppBreadcrumbItem(
      label: 'Empleados',
      onTap: () => _navigateTo('/employees'),
    ),
    AppBreadcrumbItem(
      label: 'Juan Pérez',
      isActive: true,
    ),
  ],
)

// Breadcrumbs con configuración avanzada
AppBreadcrumbs(
  items: navigationPath,
  maxItems: 5,
  config: AppBreadcrumbsConfig(
    separator: Icon(Icons.chevron_right, size: 16),
    overflow: AppBreadcrumbsOverflow.ellipsis,
    style: AppBreadcrumbsStyle(
      activeColor: AppColors.primary,
      inactiveColor: AppColors.gray600,
      fontSize: 14,
    ),
  ),
)
```

---

## 🎯 Feedback Components

### AppToast

**Sistema de notificaciones inteligentes**

#### Métodos Estáticos
```dart
// Mostrar toast básico
static void show(
  BuildContext context,
  String message,                          // Mensaje a mostrar
  {
    AppToastType type = AppToastType.info,  // Tipo de toast
    Duration? duration,                     // Duración
    AppToastConfig? config,                 // Configuración
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

#### Tipos de Toast (AppToastType)
```dart
enum AppToastType {
  success,        // Éxito (verde)
  error,          // Error (rojo)
  warning,        // Advertencia (amarillo)
  info,           // Información (azul)
  loading,        // Cargando
  custom,         // Personalizado
}
```

#### Configuración (AppToastConfig)
```dart
@freezed
class AppToastConfig with _$AppToastConfig {
  const factory AppToastConfig({
    @Default(Duration(seconds: 4)) Duration duration,           // Duración
    @Default(AppToastPosition.bottom) AppToastPosition position, // Posición
    AppToastAnimations? animations,                             // Animaciones
    List<AppToastAction>? actions,                              // Acciones
    bool? dismissible,                                          // Descartable
    Widget? icon,                                               // Icono personalizado
    EdgeInsets? margin,                                         // Margen
  }) = _AppToastConfig;
}
```

#### Ejemplos de Uso
```dart
// Toast básico
AppToast.show(
  context,
  'Documento guardado exitosamente',
  type: AppToastType.success,
)

// Toast con acciones
AppToast.show(
  context,
  'Error al subir archivo',
  type: AppToastType.error,
  config: AppToastConfig(
    duration: Duration(seconds: 8),
    actions: [
      AppToastAction(
        label: 'Reintentar',
        onPressed: () => _retryUpload(),
      ),
      AppToastAction(
        label: 'Ver detalles',
        onPressed: () => _showErrorDetails(),
      ),
    ],
  ),
)

// Toast de carga
AppToast.show(
  context,
  'Procesando archivo...',
  type: AppToastType.loading,
  config: AppToastConfig(
    duration: Duration.zero, // No se oculta automáticamente
    dismissible: false,
  ),
)
```

---

### AppProgress

**Indicadores de progreso profesionales**

#### Constructor
```dart
AppProgress({
  Key? key,
  double? value,                           // Valor del progreso (0.0-1.0)
  AppProgressType type = AppProgressType.linear, // Tipo de progreso
  AppProgressState state = AppProgressState.active, // Estado
  String? label,                           // Etiqueta del progreso
  String Function(double)? formatter,      // Formateador de valor
  AppProgressConfig? config,               // Configuración
})
```

#### Tipos de Progreso (AppProgressType)
```dart
enum AppProgressType {
  linear,         // Barra lineal
  circular,       // Círculo
  ring,           // Anillo
  step,           // Por pasos
  radial,         // Radial
}
```

#### Estados (AppProgressState)
```dart
enum AppProgressState {
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
AppProgress(
  value: 0.65,
  type: AppProgressType.linear,
  label: 'Descargando archivo...',
  config: AppProgressConfig(
    showPercentage: true,
    colors: AppProgressColors(
      activeColor: AppColors.primary,
      backgroundColor: AppColors.gray200,
    ),
  ),
)

// Progreso circular con formato personalizado
AppProgress(
  value: uploadProgress,
  type: AppProgressType.circular,
  formatter: (value) => '${(value * 100).round()}% completado',
  config: AppProgressConfig(
    size: 80,
    strokeWidth: 6,
    showValue: true,
    animations: AppProgressAnimations(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    ),
  ),
)

// Progreso por pasos
AppProgress(
  value: currentStep / totalSteps,
  type: AppProgressType.step,
  config: AppProgressConfig(
    steps: totalSteps,
    stepLabels: stepNames,
    showStepNumbers: true,
  ),
)
```

---

## 🏪 E-commerce Components

### AppProductCard

**Cards de producto para e-commerce**

#### Constructor
```dart
AppProductCard({
  Key? key,
  required Product product,                // Datos del producto
  VoidCallback? onTap,                     // Callback de tap
  VoidCallback? onAddToCart,               // Callback agregar al carrito
  VoidCallback? onToggleFavorite,          // Callback favorito
  VoidCallback? onShare,                   // Callback compartir
  AppProductCardConfig? config,            // Configuración
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

#### Configuración (AppProductCardConfig)
```dart
@freezed
class AppProductCardConfig with _$AppProductCardConfig {
  const factory AppProductCardConfig({
    @Default(AppProductCardVariant.standard) AppProductCardVariant variant, // standard, compact, detailed
    @Default(true) bool showRating,          // Mostrar calificación
    @Default(true) bool showPrice,           // Mostrar precio
    @Default(false) bool showQuickActions,   // Mostrar acciones rápidas
    @Default(false) bool showBadges,         // Mostrar badges (nuevo, oferta)
    @Default(16/9) double imageAspectRatio,  // Ratio de imagen
    AppProductCardColors? colors,            // Colores personalizados
    AppProductCardAnimations? animations,    // Animaciones
  }) = _AppProductCardConfig;
}
```

#### Ejemplos de Uso
```dart
// Card de producto básica
AppProductCard(
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
AppProductCard(
  product: product,
  onTap: () => _viewProduct(product.id),
  onAddToCart: () => _addToCart(product.id),
  onToggleFavorite: () => _toggleFavorite(product.id),
  onShare: () => _shareProduct(product.id),
  config: AppProductCardConfig(
    variant: AppProductCardVariant.detailed,
    showQuickActions: true,
    showBadges: true,
    imageAspectRatio: 1.0,
    animations: AppProductCardAnimations(
      hoverScale: 1.05,
      duration: Duration(milliseconds: 200),
    ),
  ),
)
```

---

### AppCartWidget

**Widget de carrito de compras**

#### Constructor
```dart
AppCartWidget({
  Key? key,
  required List<CartItem> items,           // Items del carrito
  ValueChanged<String, int>? onUpdateQuantity, // Callback actualizar cantidad
  ValueChanged<String>? onRemoveItem,      // Callback remover item
  VoidCallback? onCheckout,                // Callback checkout
  VoidCallback? onClear,                   // Callback limpiar carrito
  AppCartWidgetConfig? config,             // Configuración
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

#### Configuración (AppCartWidgetConfig)
```dart
@freezed
class AppCartWidgetConfig with _$AppCartWidgetConfig {
  const factory AppCartWidgetConfig({
    @Default(AppCartWidgetVariant.sidebar) AppCartWidgetVariant variant, // sidebar, modal, fab, mini
    @Default(true) bool showTotals,          // Mostrar totales
    @Default(true) bool enableQuantityControls, // Controles de cantidad
    @Default(true) bool showImages,          // Mostrar imágenes
    @Default(false) bool showDiscounts,      // Mostrar descuentos
    AppCartWidgetAnimations? animations,     // Animaciones
    AppCartWidgetColors? colors,             // Colores
  }) = _AppCartWidgetConfig;
}
```

#### Ejemplos de Uso
```dart
// Carrito lateral
AppCartWidget(
  items: cartItems,
  onUpdateQuantity: (productId, quantity) =>
    _updateCartQuantity(productId, quantity),
  onRemoveItem: (productId) => _removeFromCart(productId),
  onCheckout: () => _proceedToCheckout(),
  config: AppCartWidgetConfig(
    variant: AppCartWidgetVariant.sidebar,
    showTotals: true,
    enableQuantityControls: true,
    animations: AppCartWidgetAnimations(
      itemAddDuration: Duration(milliseconds: 400),
      itemRemovalDuration: Duration(milliseconds: 300),
    ),
  ),
)

// FAB de carrito
AppCartWidget(
  items: cartItems,
  config: AppCartWidgetConfig(
    variant: AppCartWidgetVariant.fab,
    showTotals: false,
  ),
  onTap: () => _openCartSidebar(),
)
```

---

## ⚙️ Specialty Components

### AppBackToTop

**Botón para volver al inicio**

#### Constructor
```dart
AppBackToTop({
  Key? key,
  ScrollController? scrollController,      // Controlador de scroll
  bool interactive = true,                 // Si es interactivo
  VoidCallback? onPressed,                 // Callback personalizado
  ValueChanged<AppBackToTopState>? onStateChanged, // Callback de estado
  AppBackToTopConfig? config,              // Configuración
})
```

#### Configuración (AppBackToTopConfig)
```dart
@freezed
class AppBackToTopConfig with _$AppBackToTopConfig {
  const factory AppBackToTopConfig({
    @Default(AppBackToTopVariant.webOnly) AppBackToTopVariant variant,
    @Default(AppBackToTopState.defaultState) AppBackToTopState state,
    AppBackToTopColors? colors,
    AppBackToTopSpacing? spacing,
    AppBackToTopAnimations? animations,
    AppBackToTopBehavior? behavior,
    AppBackToTopAccessibility? accessibility,
  }) = _AppBackToTopConfig;
}
```

#### AppBackToTopBehavior
```dart
@freezed
class AppBackToTopBehavior with _$AppBackToTopBehavior {
  const factory AppBackToTopBehavior({
    @Default(200.0) double showAfterPixels,  // Mostrar después de scroll
    @Default(0.0) double hideAfterPixels,    // Ocultar después de scroll
    @Default(true) bool autoHide,            // Auto-ocultar
    @Default(true) bool showOnScrollUp,      // Mostrar al scroll arriba
    @Default(false) bool hideOnScrollDown,   // Ocultar al scroll abajo
    @Default(true) bool smoothScrolling,     // Scroll suave
    @Default(true) bool hapticFeedback,      // Feedback háptico
    @Default(true) bool showTooltip,         // Mostrar tooltip
    Duration? autoHideDelay,                 // Delay de auto-ocultar
  }) = _AppBackToTopBehavior;
}
```

#### Ejemplos de Uso
```dart
// Botón básico
AppBackToTop(
  scrollController: _scrollController,
)

// Botón con configuración avanzada
AppBackToTop(
  scrollController: _scrollController,
  config: AppBackToTopConfig(
    variant: AppBackToTopVariant.webOnly,
    behavior: AppBackToTopBehavior(
      showAfterPixels: 300,
      smoothScrolling: true,
      autoHide: true,
      autoHideDelay: Duration(seconds: 3),
    ),
    spacing: AppBackToTopSpacing(
      position: AppBackToTopPosition.bottomRight,
      size: 56,
      margin: EdgeInsets.all(20),
    ),
    animations: AppBackToTopAnimations(
      duration: Duration(milliseconds: 250),
      scrollDuration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    ),
  ),
)

// Con overlay provider
AppBackToTopOverlay(
  scrollController: _scrollController,
  child: YourPageContent(),
)
```

---

### AppCommandPalette

**Paleta de comandos estilo VS Code**

#### Constructor
```dart
AppCommandPalette({
  Key? key,
  required List<AppCommand> commands,      // Lista de comandos
  String? placeholder,                     // Placeholder de búsqueda
  ValueChanged<AppCommand>? onCommandExecuted, // Callback de ejecución
  VoidCallback? onDismiss,                 // Callback de cerrar
  AppCommandPaletteConfig? config,         // Configuración
})
```

#### AppCommand
```dart
@freezed
class AppCommand with _$AppCommand {
  const factory AppCommand({
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
  }) = _AppCommand;
}
```

#### Configuración (AppCommandPaletteConfig)
```dart
@freezed
class AppCommandPaletteConfig with _$AppCommandPaletteConfig {
  const factory AppCommandPaletteConfig({
    @Default('Buscar comandos...') String placeholder,
    @Default(10) int maxResults,             // Máximo de resultados
    @Default(true) bool showShortcuts,       // Mostrar atajos
    @Default(true) bool showCategories,      // Mostrar categorías
    @Default(true) bool fuzzySearch,         // Búsqueda difusa
    AppCommandPaletteColors? colors,         // Colores
    AppCommandPaletteAnimations? animations, // Animaciones
  }) = _AppCommandPaletteConfig;
}
```

#### Ejemplos de Uso
```dart
// Paleta básica
AppCommandPalette(
  commands: [
    AppCommand(
      id: 'new_project',
      title: 'Crear Nuevo Proyecto',
      description: 'Inicia un nuevo proyecto desde cero',
      icon: Icon(Icons.add),
      keywords: ['nuevo', 'crear', 'proyecto'],
      shortcut: 'Ctrl+N',
      onExecute: () => _createProject(),
    ),
    AppCommand(
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
enum AppComponentState {
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
enum AppComponentVariant {
  filled,
  outline,
  text,
  elevated,
  tonal,
}

enum AppComponentSize {
  small,
  medium,
  large,
  extraLarge,
}
```

### Posiciones
```dart
enum AppPosition {
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
enum AppAnimationType {
  none,
  fade,
  scale,
  slide,
  rotation,
  flip,
}

enum AppAnimationDirection {
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
  theme: AppTheme.lightTheme.copyWith(
    // Customizaciones globales
    primaryColor: MyColors.brand,
    colorScheme: AppTheme.lightTheme.colorScheme.copyWith(
      primary: MyColors.brand,
    ),
  ),
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
)
```

### Customización de Componentes
```dart
// Tema global de botones
AppButton.defaultConfig = AppButtonConfig(
  colors: AppButtonColors(
    backgroundColor: MyColors.brand,
  ),
  spacing: AppButtonSpacing(
    borderRadius: 12,
  ),
);

// Override por instancia
AppButton(
  text: 'Custom Button',
  config: AppButtonConfig(
    colors: AppButtonColors(
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

Esta documentación de API proporciona una referencia completa para todos los componentes del IAutomat Design System. Cada componente está diseñado para ser altamente configurable, accesible y responsive, siguiendo las mejores prácticas de Flutter y Material Design 3.