# API de Componentes - IAutomat Design System

> Documentación completa de los 70+ componentes del Design System de IAutomat

## Índice

- [Introducción](#introducción)
- [Convenciones](#convenciones)
- [Componentes por Categoría](#componentes-por-categoría)

### Categorías

1. [Componentes Básicos](#1-componentes-básicos)
   - [DSButton](#dsbutton)
   - [DSCard](#dscard)
   - [DSChip](#dschip)
   - [DSBadge](#dsbadge)
   - [DSTag](#dstag)
   - [DSAvatar](#dsavatar)
   - [DSDivider](#dsdivider)
   - [DSStatusDot](#dsstatusdot)

2. [Componentes de Formulario](#2-componentes-de-formulario)
   - [DSInput](#dsinput)
   - [DSTextField](#dstextfield)
   - [DSTextArea](#dstextarea)
   - [DSCheckbox](#dscheckbox)
   - [DSRadio](#dsradio)
   - [DSSwitch](#dsswitch)
   - [DSSelect](#dsselect)
   - [DSCombobox](#dscombobox)
   - [DSSlider](#dsslider)
   - [DSDatePicker](#dsdatepicker)
   - [DSColorPicker](#dscolorpicker)
   - [DSFilePicker](#dsfilepicker)
   - [DSCurrencyInput](#dscurrencyinput)
   - [DSCameraPicker](#dscamerapicker)

3. [Componentes de Navegación](#3-componentes-de-navegación)
   - [DSScaffold](#dsscaffold)
   - [DSBars (AppBar/TopBar)](#dsbars-appbartopbar)
   - [DSNavigation](#dsnavigation)
   - [DSTabs](#dstabs)
   - [DSBreadcrumbs](#dsbreadcrumbs)
   - [DSDrawer](#dsdrawer)
   - [DSMenu](#dsmenu)
   - [DSPagination](#dspagination)

4. [Componentes de Datos](#4-componentes-de-datos)
   - [DSDataTable](#dsdatatable)
   - [DSSimpleTable](#dssimpletable)
   - [DSListItem](#dslistitem)
   - [DSDescriptionList](#dsdescriptionlist)
   - [DSMetricCard](#dsmetriccard)
   - [DSCalendar](#dscalendar)
   - [DSChart](#dschart)
   - [DSTimeline](#dstimeline)
   - [DSKanban](#dskanban)
   - [DSOutlineTree](#dsoutlinetree)

5. [Componentes de Feedback](#5-componentes-de-feedback)
   - [DSToast](#dstoast)
   - [DSDialog](#dsdialog)
   - [DSBottomSheet](#dsbottomsheet)
   - [DSBanner](#dsbanner)
   - [DSProgress](#dsprogress)
   - [DSEmptyState](#dsemptystate)
   - [DSSkeleton](#dsskeleton)
   - [DSTooltip](#dstooltip)

6. [Componentes de Acción](#6-componentes-de-acción)
   - [DSIconButton](#dsiconbutton)
   - [DSFab](#dsfab)
   - [DSBackToTop](#dsbacktotop)
   - [DSStepper](#dsstepper)

7. [Componentes de Layout](#7-componentes-de-layout)
   - [DSSplitView](#dssplitview)
   - [DSFilterBar](#dsfilterbar)
   - [DSToggleView](#dstoggleview)
   - [DSAccordion](#dsaccordion)

8. [Componentes de Media](#8-componentes-de-media)
   - [DSImage](#dsimage)
   - [DSLightbox](#dslightbox)
   - [DSMediaViewer](#dsmediaviewer)

9. [Componentes Especializados](#9-componentes-especializados)
   - [DSCommandPalette](#dscommandpalette)
   - [DSInPageSearch](#dsinpagesearch)
   - [DSTour](#dstour)
   - [DSClipboardShare](#dsclipboardshare)
   - [DSRoleVisibility](#dsrolevisibility)

10. [Componentes E-commerce](#10-componentes-e-commerce)
    - [DSProductCard](#dsproductcard)
    - [DSCartWidget](#dscartwidget)
    - [DSCheckoutForms](#dscheckoutforms)

11. [Componentes de Autenticación](#11-componentes-de-autenticación)
    - [DSAuthScreens](#dsauthscreens)
    - [DSProfilePreferences](#dsprofilepreferences)

12. [Componentes Auxiliares](#12-componentes-auxiliares)
    - [DSMap](#dsmap)

---

## Introducción

Este documento proporciona la API completa de todos los componentes del IAutomat Design System. Cada componente está documentado con:

- **Descripción**: Qué hace el componente y cuándo usarlo
- **Import**: Cómo importar el componente
- **Parámetros**: Lista completa de parámetros con tipos
- **Configuración**: Objetos DSConfig disponibles
- **Ejemplos**: Código funcional de uso básico y avanzado
- **Helpers**: Utilidades de accesibilidad y plataforma
- **Notas**: Consideraciones especiales

## Convenciones

### Prefijo DS

Todos los componentes principales llevan el prefijo `DS` (Design System):
```dart
DSButton, DSCard, DSInput, etc.
```

### Configuración con Freezed

Los componentes complejos usan objetos de configuración inmutables generados con Freezed:
```dart
DSButtonConfig, DSCardConfig, DSInputConfig, etc.
```

### Patrón de Uso

```dart
// Patrón básico
DSComponent(
  config: DSComponentConfig(
    // configuración...
  ),
  // parámetros directos...
)

// Patrón con valores por defecto
DSComponent(
  // solo parámetros necesarios
)
```

### Material 3

Todos los componentes siguen las especificaciones de Material 3 y se adaptan automáticamente al tema de la aplicación.

### Accesibilidad

Los componentes incluyen soporte completo para accesibilidad (WCAG 2.0 AA):
- Labels semánticos
- Soporte de lector de pantalla
- Navegación por teclado
- Alto contraste

---

## Componentes por Categoría

## 1. Componentes Básicos

### DSButton

Botón versátil con múltiples variantes, estados y animaciones.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSButtonConfig` | Configuración del botón | `DSButtonConfig()` |
| `label` | `String?` | Texto del botón | `null` |
| `leading` | `Widget?` | Widget antes del texto | `null` |
| `trailing` | `Widget?` | Widget después del texto | `null` |
| `size` | `DSButtonSize?` | Tamaño del botón | `null` |
| `isDanger` | `bool?` | Si es un botón de peligro | `false` |
| `width` | `double?` | Ancho personalizado | `null` |
| `height` | `double?` | Alto personalizado | `null` |

#### Configuración (DSButtonConfig)

```dart
DSButtonConfig({
  DSButtonVariant variant = DSButtonVariant.filled,
  DSButtonState state = DSButtonState.defaultState,
  DSButtonSize size = DSButtonSize.medium,
  bool isDanger = false,
  bool isAdaptive = true,
  bool isRtl = false,
  bool enableA11y = true,
  bool enableKeyboardSupport = true,
  bool isInteractive = true,
  DSButtonColors? colors,
  DSButtonSpacing? spacing,
  DSButtonElevation? elevation,
  DSButtonBehavior? behavior,
  DSButtonAnimation? animation,
  VoidCallback? onPressed,
  VoidCallback? onLongPress,
  ValueChanged<bool>? onHover,
  ValueChanged<bool>? onFocusChange,
})
```

**Enums:**

- `DSButtonVariant`: `filled`, `tonal`, `outline`, `text`, `icon`, `segmented`
- `DSButtonState`: `defaultState`, `hover`, `pressed`, `focus`, `selected`, `disabled`, `loading`, `skeleton`
- `DSButtonSize`: `small`, `medium`, `large`

#### Ejemplo Básico

```dart
DSButton(
  label: 'Guardar',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.medium,
    onPressed: () {
      print('Botón presionado');
    },
  ),
)
```

#### Ejemplo Avanzado

```dart
DSButton(
  label: 'Crear Cuenta',
  leading: Icon(Icons.person_add),
  trailing: Icon(Icons.arrow_forward),
  size: DSButtonSize.large,
  width: 200,
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    state: DSButtonState.defaultState,
    colors: DSButtonColors(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    spacing: DSButtonSpacing(
      horizontalPadding: 24.0,
      verticalPadding: 12.0,
      iconSpacing: 12.0,
      borderRadius: 16.0,
    ),
    elevation: DSButtonElevation(
      defaultElevation: 2.0,
      hoveredElevation: 6.0,
    ),
    animation: DSButtonAnimation(
      type: DSButtonAnimationType.scale,
      duration: 300,
      curve: Curves.easeInOut,
      enableHoverAnimation: true,
      enablePressAnimation: true,
    ),
    behavior: DSButtonBehavior(
      enableHapticFeedback: true,
      enableRipple: true,
    ),
    onPressed: () async {
      // Lógica de creación de cuenta
    },
    onLongPress: () {
      // Acción alternativa
    },
    onHover: (isHovering) {
      print('Hover: $isHovering');
    },
  ),
)
```

#### Variantes Comunes

```dart
// Botón primario (filled)
DSButton(
  label: 'Primario',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    onPressed: () {},
  ),
)

// Botón secundario (tonal)
DSButton(
  label: 'Secundario',
  config: DSButtonConfig(
    variant: DSButtonVariant.tonal,
    onPressed: () {},
  ),
)

// Botón de borde (outline)
DSButton(
  label: 'Outline',
  config: DSButtonConfig(
    variant: DSButtonVariant.outline,
    onPressed: () {},
  ),
)

// Botón de texto
DSButton(
  label: 'Texto',
  config: DSButtonConfig(
    variant: DSButtonVariant.text,
    onPressed: () {},
  ),
)

// Botón de peligro
DSButton(
  label: 'Eliminar',
  isDanger: true,
  leading: Icon(Icons.delete),
  config: DSButtonConfig(
    onPressed: () {},
  ),
)

// Botón con estado de carga
DSButton(
  label: 'Guardando...',
  config: DSButtonConfig(
    state: DSButtonState.loading,
  ),
)

// Botón deshabilitado
DSButton(
  label: 'Deshabilitado',
  config: DSButtonConfig(
    state: DSButtonState.disabled,
  ),
)
```

#### Notas

- Los botones se adaptan automáticamente al tema (light/dark)
- Soporte completo para RTL
- Animaciones de hover, press y loading incluidas
- Feedback háptico opcional
- Estados de skeleton para carga progresiva

---

### DSCard

Tarjeta contenedora con soporte para header, body y footer.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSCardConfig` | Configuración de la tarjeta | `DSCardConfig()` |
| `header` | `Widget?` | Widget del encabezado | `null` |
| `body` | `Widget?` | Contenido principal | `null` |
| `footer` | `Widget?` | Widget del pie | `null` |
| `padding` | `EdgeInsetsGeometry?` | Padding personalizado | `null` |
| `elevation` | `double?` | Elevación de la tarjeta | `null` |
| `width` | `double?` | Ancho | `null` |
| `height` | `double?` | Alto | `null` |
| `decoration` | `Decoration?` | Decoración personalizada | `null` |

#### Configuración (DSCardConfig)

```dart
DSCardConfig({
  DSCardVariant variant = DSCardVariant.elevated,
  DSCardState state = DSCardState.defaultState,
  bool isInteractive = false,
  bool isRtl = false,
  bool enableA11y = true,
  bool enableKeyboardSupport = true,
  DSCardColors? colors,
  DSCardSpacing? spacing,
  DSCardElevation? elevation,
  DSCardBehavior? behavior,
  DSCardAnimation? animation,
  VoidCallback? onTap,
  VoidCallback? onDoubleTap,
  VoidCallback? onLongPress,
  ValueChanged<bool>? onHover,
  ValueChanged<bool>? onFocusChange,
})
```

**Enums:**

- `DSCardVariant`: `elevated`, `filled`, `outlined`
- `DSCardState`: `defaultState`, `hover`, `pressed`, `focus`, `selected`, `disabled`, `loading`, `skeleton`

#### Ejemplo Básico

```dart
DSCard(
  header: Text('Título de la Tarjeta'),
  body: Text('Contenido de la tarjeta con información relevante.'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      DSButton(
        label: 'Cancelar',
        config: DSButtonConfig(
          variant: DSButtonVariant.text,
          onPressed: () {},
        ),
      ),
      SizedBox(width: 8),
      DSButton(
        label: 'Aceptar',
        config: DSButtonConfig(onPressed: () {}),
      ),
    ],
  ),
)
```

#### Ejemplo Avanzado

```dart
DSCard(
  config: DSCardConfig(
    variant: DSCardVariant.elevated,
    isInteractive: true,
    colors: DSCardColors(
      backgroundColor: Colors.white,
      headerTextColor: Colors.black87,
      bodyTextColor: Colors.black54,
    ),
    spacing: DSCardSpacing(
      padding: 16.0,
      borderRadius: 12.0,
      headerPadding: 16.0,
      bodyPadding: 16.0,
      footerPadding: 16.0,
    ),
    elevation: DSCardElevation(
      defaultElevation: 2.0,
      hoveredElevation: 8.0,
    ),
    onTap: () {
      print('Card tapped');
    },
    onHover: (isHovering) {
      print('Hover: $isHovering');
    },
  ),
  header: Row(
    children: [
      Icon(Icons.info_outline),
      SizedBox(width: 8),
      Text('Información Importante'),
    ],
  ),
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Este es el contenido principal de la tarjeta.'),
      SizedBox(height: 8),
      Text('Puede incluir múltiples widgets.'),
    ],
  ),
  footer: Text(
    'Última actualización: Hoy',
    style: TextStyle(fontSize: 12, color: Colors.grey),
  ),
  width: 400,
)
```

#### Notas

- Las tarjetas pueden ser interactivas (clickeables) o estáticas
- Soporte para estados de loading y skeleton
- Transiciones animadas entre estados
- Elevación dinámica en hover

---

### DSChip

Chip compacto para etiquetas, filtros o selecciones.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String` | Texto del chip | requerido |
| `avatar` | `Widget?` | Avatar o icono inicial | `null` |
| `onDeleted` | `VoidCallback?` | Callback al eliminar | `null` |
| `onPressed` | `VoidCallback?` | Callback al presionar | `null` |
| `selected` | `bool` | Si está seleccionado | `false` |
| `enabled` | `bool` | Si está habilitado | `true` |

#### Ejemplo Básico

```dart
DSChip(
  label: 'Flutter',
  onPressed: () {
    print('Chip presionado');
  },
)
```

#### Ejemplo con Avatar y Delete

```dart
DSChip(
  label: 'Usuario',
  avatar: CircleAvatar(
    child: Text('U'),
  ),
  onDeleted: () {
    print('Chip eliminado');
  },
  selected: true,
)
```

---

### DSBadge

Badge numérico o de estado para notificaciones.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `child` | `Widget` | Widget a decorar | requerido |
| `count` | `int?` | Número a mostrar | `null` |
| `showZero` | `bool` | Mostrar cuando es 0 | `false` |
| `position` | `BadgePosition` | Posición del badge | `topEnd` |
| `color` | `Color?` | Color del badge | `null` |

#### Ejemplo Básico

```dart
DSBadge(
  count: 5,
  child: Icon(Icons.notifications),
)
```

#### Ejemplo con Color Personalizado

```dart
DSBadge(
  count: 99,
  color: Colors.red,
  position: BadgePosition.topEnd,
  child: Icon(Icons.mail),
)
```

---

### DSTag

Etiqueta coloreada para categorización.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String` | Texto del tag | requerido |
| `color` | `Color?` | Color del tag | `null` |
| `size` | `TagSize` | Tamaño | `medium` |
| `onTap` | `VoidCallback?` | Callback al tocar | `null` |

#### Ejemplo Básico

```dart
DSTag(
  label: 'Nuevo',
  color: Colors.green,
)
```

---

### DSAvatar

Avatar circular o cuadrado con imagen, iniciales o icono.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `imageUrl` | `String?` | URL de la imagen | `null` |
| `initials` | `String?` | Iniciales a mostrar | `null` |
| `icon` | `IconData?` | Icono a mostrar | `null` |
| `size` | `double` | Tamaño del avatar | `40.0` |
| `shape` | `AvatarShape` | Forma (circle/square) | `circle` |

#### Ejemplo Básico

```dart
DSAvatar(
  initials: 'JD',
  size: 48.0,
)
```

#### Ejemplo con Imagen

```dart
DSAvatar(
  imageUrl: 'https://example.com/avatar.jpg',
  size: 64.0,
  shape: AvatarShape.circle,
)
```

---

### DSDivider

Separador horizontal o vertical.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSDividerConfig` | Configuración | `DSDividerConfig()` |
| `isVertical` | `bool` | Si es vertical | `false` |
| `thickness` | `double?` | Grosor | `null` |
| `color` | `Color?` | Color | `null` |

#### Ejemplo Básico

```dart
DSDivider()
```

#### Ejemplo Vertical

```dart
DSDivider(
  isVertical: true,
  thickness: 2.0,
  color: Colors.grey,
)
```

---

### DSStatusDot

Indicador de estado con punto coloreado.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `status` | `StatusType` | Tipo de estado | requerido |
| `label` | `String?` | Etiqueta opcional | `null` |
| `size` | `double` | Tamaño del dot | `8.0` |
| `animate` | `bool` | Si debe animar | `false` |

#### Ejemplo Básico

```dart
DSStatusDot(
  status: StatusType.success,
  label: 'Conectado',
)
```

#### Ejemplo con Animación

```dart
DSStatusDot(
  status: StatusType.warning,
  label: 'Procesando',
  animate: true,
  size: 12.0,
)
```

---

## 2. Componentes de Formulario

### DSInput

Input de texto base con validación y múltiples tipos.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `controller` | `TextEditingController?` | Controlador del texto | `null` |
| `initialValue` | `String?` | Valor inicial | `null` |
| `label` | `String?` | Etiqueta del campo | `null` |
| `hint` | `String?` | Texto de ayuda | `null` |
| `helper` | `String?` | Texto de ayuda inferior | `null` |
| `type` | `InputType` | Tipo de input | `text` |
| `validator` | `String? Function(String?)?` | Función de validación | `null` |
| `onChanged` | `void Function(String)?` | Callback al cambiar | `null` |
| `enabled` | `bool` | Si está habilitado | `true` |
| `readOnly` | `bool` | Si es solo lectura | `false` |
| `obscureText` | `bool` | Si ocultar texto | `false` |
| `maxLength` | `int?` | Longitud máxima | `null` |
| `maxLines` | `int?` | Líneas máximas | `1` |
| `showCounter` | `bool` | Mostrar contador | `false` |
| `showClearButton` | `bool` | Mostrar botón limpiar | `true` |
| `prefixIcon` | `IconData?` | Icono prefijo | `null` |
| `suffixIcon` | `IconData?` | Icono sufijo | `null` |

#### Tipos de Input (InputType)

- `text`: Texto general
- `email`: Email con teclado apropiado
- `password`: Contraseña con toggle de visibilidad
- `number`: Números con teclado numérico
- `multiline`: Área de texto multilínea
- `search`: Búsqueda con icono
- `url`: URLs
- `phone`: Teléfono

#### Ejemplo Básico

```dart
DSInput(
  label: 'Nombre',
  hint: 'Ingresa tu nombre',
  onChanged: (value) {
    print('Valor: $value');
  },
)
```

#### Ejemplo con Validación

```dart
DSInput(
  label: 'Email',
  type: InputType.email,
  prefixIcon: Icons.email,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'El email es requerido';
    }
    if (!value.contains('@')) {
      return 'Email inválido';
    }
    return null;
  },
  onChanged: (value) {
    // Actualizar estado
  },
)
```

#### Constructores Especializados

```dart
// Input de email
DSInput.email(
  label: 'Email',
  validator: (value) => value?.isEmpty == true ? 'Requerido' : null,
)

// Input de contraseña
DSInput.password(
  label: 'Contraseña',
  showVisibilityToggle: true,
)

// Área de texto
DSInput.multiline(
  label: 'Descripción',
  maxLines: 4,
  showCounter: true,
  maxLength: 500,
)

// Input de búsqueda
DSInput.search(
  hint: 'Buscar...',
  onChanged: (query) {
    // Realizar búsqueda
  },
)
```

#### Notas

- Validación automática con FormField
- Botón de limpiar automático cuando hay texto
- Toggle de visibilidad para passwords
- Contador de caracteres opcional
- Estados visuales: normal, focused, error, disabled, success

---

### DSTextField

Campo de texto estándar (similar a DSInput pero con configuración extendida).

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

Similar a DSInput con configuración adicional mediante `TextFieldConfig`.

#### Ejemplo

```dart
DSTextField(
  label: 'Apellido',
  helper: 'Ingresa tu apellido completo',
  maxLength: 50,
)
```

---

### DSTextArea

Área de texto multilínea.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String?` | Etiqueta | `null` |
| `hint` | `String?` | Placeholder | `null` |
| `minLines` | `int` | Líneas mínimas | `3` |
| `maxLines` | `int?` | Líneas máximas | `null` |
| `maxLength` | `int?` | Longitud máxima | `null` |
| `showCounter` | `bool` | Mostrar contador | `true` |

#### Ejemplo

```dart
DSTextArea(
  label: 'Comentarios',
  hint: 'Escribe tus comentarios aquí',
  minLines: 3,
  maxLines: 8,
  maxLength: 1000,
  showCounter: true,
)
```

---

### DSCheckbox

Casilla de verificación.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `value` | `bool` | Estado del checkbox | requerido |
| `onChanged` | `ValueChanged<bool>?` | Callback al cambiar | `null` |
| `label` | `String?` | Etiqueta | `null` |
| `tristate` | `bool` | Soporte para 3 estados | `false` |

#### Ejemplo

```dart
bool accepted = false;

DSCheckbox(
  value: accepted,
  label: 'Acepto los términos y condiciones',
  onChanged: (value) {
    setState(() {
      accepted = value;
    });
  },
)
```

---

### DSRadio

Botón de radio para selección única.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `value` | `T` | Valor del radio | requerido |
| `groupValue` | `T?` | Valor del grupo | `null` |
| `onChanged` | `ValueChanged<T>?` | Callback al cambiar | `null` |
| `label` | `String?` | Etiqueta | `null` |

#### Ejemplo

```dart
String selectedOption = 'option1';

Column(
  children: [
    DSRadio<String>(
      value: 'option1',
      groupValue: selectedOption,
      label: 'Opción 1',
      onChanged: (value) {
        setState(() {
          selectedOption = value!;
        });
      },
    ),
    DSRadio<String>(
      value: 'option2',
      groupValue: selectedOption,
      label: 'Opción 2',
      onChanged: (value) {
        setState(() {
          selectedOption = value!;
        });
      },
    ),
  ],
)
```

---

### DSSwitch

Interruptor on/off.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSSwitchConfig` | Configuración | `DSSwitchConfig()` |
| `value` | `bool` | Estado del switch | requerido |
| `onChanged` | `ValueChanged<bool>?` | Callback al cambiar | `null` |
| `label` | `String?` | Etiqueta | `null` |

#### Ejemplo

```dart
bool notificationsEnabled = true;

DSSwitch(
  value: notificationsEnabled,
  label: 'Habilitar notificaciones',
  onChanged: (value) {
    setState(() {
      notificationsEnabled = value;
    });
  },
)
```

---

### DSSelect

Selector dropdown.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String?` | Etiqueta | `null` |
| `hint` | `String?` | Texto placeholder | `null` |
| `value` | `T?` | Valor seleccionado | `null` |
| `items` | `List<SelectItem<T>>` | Items del select | requerido |
| `onChanged` | `ValueChanged<T>?` | Callback al cambiar | `null` |
| `enabled` | `bool` | Si está habilitado | `true` |

#### Ejemplo

```dart
String? selectedCountry;

DSSelect<String>(
  label: 'País',
  hint: 'Selecciona un país',
  value: selectedCountry,
  items: [
    SelectItem(value: 'mx', label: 'México'),
    SelectItem(value: 'us', label: 'Estados Unidos'),
    SelectItem(value: 'es', label: 'España'),
  ],
  onChanged: (value) {
    setState(() {
      selectedCountry = value;
    });
  },
)
```

---

### DSCombobox

Combobox con búsqueda y autocompletado.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String?` | Etiqueta | `null` |
| `hint` | `String?` | Placeholder | `null` |
| `items` | `List<T>` | Items disponibles | requerido |
| `onChanged` | `ValueChanged<T>?` | Callback al seleccionar | `null` |
| `itemBuilder` | `Widget Function(T)` | Builder de items | requerido |
| `searchable` | `bool` | Si permite búsqueda | `true` |

#### Ejemplo

```dart
DSCombobox<String>(
  label: 'Ciudad',
  hint: 'Busca una ciudad',
  items: ['Ciudad de México', 'Guadalajara', 'Monterrey'],
  itemBuilder: (city) => Text(city),
  searchable: true,
  onChanged: (city) {
    print('Seleccionado: $city');
  },
)
```

---

### DSSlider

Control deslizante de valor.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `value` | `double` | Valor actual | requerido |
| `min` | `double` | Valor mínimo | `0.0` |
| `max` | `double` | Valor máximo | `100.0` |
| `divisions` | `int?` | Divisiones | `null` |
| `label` | `String?` | Etiqueta del valor | `null` |
| `onChanged` | `ValueChanged<double>?` | Callback al cambiar | `null` |

#### Ejemplo

```dart
double volume = 50.0;

DSSlider(
  value: volume,
  min: 0.0,
  max: 100.0,
  divisions: 10,
  label: '${volume.toInt()}%',
  onChanged: (value) {
    setState(() {
      volume = value;
    });
  },
)
```

---

### DSDatePicker

Selector de fecha.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String?` | Etiqueta | `null` |
| `selectedDate` | `DateTime?` | Fecha seleccionada | `null` |
| `firstDate` | `DateTime` | Fecha mínima | requerido |
| `lastDate` | `DateTime` | Fecha máxima | requerido |
| `onDateSelected` | `ValueChanged<DateTime>?` | Callback al seleccionar | `null` |

#### Ejemplo

```dart
DateTime? birthDate;

DSDatePicker(
  label: 'Fecha de nacimiento',
  selectedDate: birthDate,
  firstDate: DateTime(1900),
  lastDate: DateTime.now(),
  onDateSelected: (date) {
    setState(() {
      birthDate = date;
    });
  },
)
```

---

### DSColorPicker

Selector de color.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `color` | `Color` | Color actual | requerido |
| `onColorChanged` | `ValueChanged<Color>?` | Callback al cambiar | `null` |
| `showAlpha` | `bool` | Mostrar control alpha | `true` |

#### Ejemplo

```dart
Color selectedColor = Colors.blue;

DSColorPicker(
  color: selectedColor,
  showAlpha: true,
  onColorChanged: (color) {
    setState(() {
      selectedColor = color;
    });
  },
)
```

---

### DSFilePicker

Selector de archivos.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `label` | `String?` | Etiqueta | `null` |
| `allowedExtensions` | `List<String>?` | Extensiones permitidas | `null` |
| `allowMultiple` | `bool` | Permitir múltiples | `false` |
| `onFileSelected` | `ValueChanged<FilePickerResult>?` | Callback | `null` |

#### Ejemplo

```dart
DSFilePicker(
  label: 'Seleccionar documento',
  allowedExtensions: ['pdf', 'doc', 'docx'],
  allowMultiple: false,
  onFileSelected: (result) {
    if (result != null) {
      print('Archivo: ${result.files.first.name}');
    }
  },
)
```

---

### DSCurrencyInput

Input especializado para moneda.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSCurrencyInputConfig` | Configuración | `DSCurrencyInputConfig()` |
| `controller` | `TextEditingController?` | Controlador | `null` |
| `label` | `String?` | Etiqueta | `null` |
| `currency` | `String` | Símbolo de moneda | `'$'` |
| `onChanged` | `ValueChanged<double>?` | Callback al cambiar | `null` |

#### Helpers

- `DSCurrencyInputA11yHelper`: Helpers de accesibilidad
- `DSCurrencyInputValidationHelper`: Helpers de validación
- `DSCurrencyInputPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
double? amount;

DSCurrencyInput(
  label: 'Monto',
  currency: '\$',
  config: DSCurrencyInputConfig(
    locale: 'es_MX',
    decimalDigits: 2,
  ),
  onChanged: (value) {
    setState(() {
      amount = value;
    });
  },
)
```

---

### DSCameraPicker

Selector de cámara/foto.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSCameraPickerConfig` | Configuración | `DSCameraPickerConfig()` |
| `onImageSelected` | `ValueChanged<XFile>?` | Callback al seleccionar | `null` |

#### Helpers

- `DSCameraPickerA11yHelper`: Helpers de accesibilidad
- `DSCameraPickerPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSCameraPicker(
  config: DSCameraPickerConfig(
    preferredCameraType: CameraType.rear,
    maxWidth: 1920,
    maxHeight: 1080,
    imageQuality: 85,
  ),
  onImageSelected: (file) {
    print('Imagen: ${file.path}');
  },
)
```

---

## 3. Componentes de Navegación

### DSScaffold

Scaffold con configuración extendida del Design System.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSScaffoldConfig` | Configuración | `DSScaffoldConfig()` |
| `appBar` | `PreferredSizeWidget?` | AppBar | `null` |
| `body` | `Widget` | Contenido principal | requerido |
| `drawer` | `Widget?` | Drawer lateral | `null` |
| `bottomNavigationBar` | `Widget?` | Barra inferior | `null` |
| `floatingActionButton` | `Widget?` | FAB | `null` |

#### Ejemplo

```dart
DSScaffold(
  appBar: AppBar(
    title: Text('Mi App'),
  ),
  body: Center(
    child: Text('Contenido'),
  ),
  drawer: DSDrawer(
    items: [],
  ),
  floatingActionButton: DSFab(
    icon: Icons.add,
    onPressed: () {},
  ),
)
```

---

### DSBars (AppBar/TopBar)

Barra superior de aplicación.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Componentes

- `DSTopAppBar`: Barra superior estándar
- `DSBars`: Utilidades para barras

#### Ejemplo

```dart
DSTopAppBar(
  config: DSTopAppBarConfig(
    title: 'Título',
    showBackButton: true,
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
  ),
)
```

---

### DSNavigation

Navegación lateral o inferior.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSNavigationConfig` | Configuración | `DSNavigationConfig()` |
| `items` | `List<NavigationItem>` | Items de navegación | requerido |
| `selectedIndex` | `int` | Índice seleccionado | `0` |
| `onItemSelected` | `ValueChanged<int>?` | Callback al seleccionar | `null` |

#### Ejemplo

```dart
int selectedIndex = 0;

DSNavigation(
  items: [
    NavigationItem(
      icon: Icons.home,
      label: 'Inicio',
    ),
    NavigationItem(
      icon: Icons.search,
      label: 'Buscar',
    ),
    NavigationItem(
      icon: Icons.person,
      label: 'Perfil',
    ),
  ],
  selectedIndex: selectedIndex,
  onItemSelected: (index) {
    setState(() {
      selectedIndex = index;
    });
  },
)
```

---

### DSTabs

Pestañas de navegación.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSTabsConfig` | Configuración | `DSTabsConfig()` |
| `tabs` | `List<TabItem>` | Lista de tabs | requerido |
| `children` | `List<Widget>` | Contenido de cada tab | requerido |

#### Ejemplo

```dart
DSTabs(
  tabs: [
    TabItem(label: 'Tab 1', icon: Icons.home),
    TabItem(label: 'Tab 2', icon: Icons.settings),
    TabItem(label: 'Tab 3', icon: Icons.info),
  ],
  children: [
    Center(child: Text('Contenido Tab 1')),
    Center(child: Text('Contenido Tab 2')),
    Center(child: Text('Contenido Tab 3')),
  ],
)
```

---

### DSBreadcrumbs

Breadcrumbs de navegación jerárquica.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSBreadcrumbsConfig` | Configuración | `DSBreadcrumbsConfig()` |
| `items` | `List<BreadcrumbItem>` | Items del breadcrumb | requerido |

#### Ejemplo

```dart
DSBreadcrumbs(
  items: [
    BreadcrumbItem(
      label: 'Inicio',
      onTap: () => Navigator.pushNamed(context, '/'),
    ),
    BreadcrumbItem(
      label: 'Productos',
      onTap: () => Navigator.pushNamed(context, '/products'),
    ),
    BreadcrumbItem(
      label: 'Detalles',
      isActive: true,
    ),
  ],
)
```

---

### DSDrawer

Drawer lateral de navegación.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSDrawerConfig` | Configuración | `DSDrawerConfig()` |
| `header` | `Widget?` | Header del drawer | `null` |
| `items` | `List<DrawerItem>` | Items del drawer | requerido |
| `footer` | `Widget?` | Footer del drawer | `null` |

#### Ejemplo

```dart
DSDrawer(
  config: DSDrawerConfig(
    width: 280.0,
  ),
  header: UserAccountsDrawerHeader(
    accountName: Text('Usuario'),
    accountEmail: Text('usuario@example.com'),
  ),
  items: [
    DrawerItem(
      icon: Icons.home,
      title: 'Inicio',
      onTap: () {},
    ),
    DrawerItem(
      icon: Icons.settings,
      title: 'Configuración',
      onTap: () {},
    ),
  ],
  footer: ListTile(
    leading: Icon(Icons.logout),
    title: Text('Cerrar sesión'),
    onTap: () {},
  ),
)
```

---

### DSMenu

Menú contextual o dropdown.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `items` | `List<MenuItem>` | Items del menú | requerido |
| `child` | `Widget` | Widget que abre el menú | requerido |

#### Ejemplo

```dart
DSMenu(
  items: [
    MenuItem(
      icon: Icons.edit,
      label: 'Editar',
      onTap: () {},
    ),
    MenuItem(
      icon: Icons.delete,
      label: 'Eliminar',
      onTap: () {},
    ),
  ],
  child: IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () {},
  ),
)
```

---

### DSPagination

Paginación para listas y tablas.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `currentPage` | `int` | Página actual | requerido |
| `totalPages` | `int` | Total de páginas | requerido |
| `onPageChanged` | `ValueChanged<int>?` | Callback al cambiar | `null` |
| `itemsPerPage` | `int` | Items por página | `10` |

#### Ejemplo

```dart
int currentPage = 1;

DSPagination(
  currentPage: currentPage,
  totalPages: 10,
  onPageChanged: (page) {
    setState(() {
      currentPage = page;
    });
    // Cargar datos de la página
  },
)
```

---

## 4. Componentes de Datos

### DSDataTable

Tabla de datos con ordenamiento, filtrado y paginación.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `columns` | `List<DataColumn>` | Columnas de la tabla | requerido |
| `rows` | `List<DataRow>` | Filas de datos | requerido |
| `sortable` | `bool` | Si permite ordenamiento | `true` |
| `selectable` | `bool` | Si permite selección | `false` |

#### Ejemplo

```dart
DSDataTable(
  columns: [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Nombre')),
    DataColumn(label: Text('Email')),
  ],
  rows: [
    DataRow(cells: [
      DataCell(Text('1')),
      DataCell(Text('Juan')),
      DataCell(Text('juan@example.com')),
    ]),
    DataRow(cells: [
      DataCell(Text('2')),
      DataCell(Text('María')),
      DataCell(Text('maria@example.com')),
    ]),
  ],
)
```

---

### DSSimpleTable

Tabla simple para datos básicos.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `headers` | `List<String>` | Encabezados | requerido |
| `data` | `List<List<String>>` | Datos | requerido |
| `showBorders` | `bool` | Mostrar bordes | `true` |

#### Ejemplo

```dart
DSSimpleTable(
  headers: ['Producto', 'Precio', 'Stock'],
  data: [
    ['Laptop', '\$999', '5'],
    ['Mouse', '\$29', '15'],
    ['Teclado', '\$59', '8'],
  ],
)
```

---

### DSListItem

Item de lista con diseño consistente.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `title` | `String` | Título principal | requerido |
| `subtitle` | `String?` | Subtítulo | `null` |
| `leading` | `Widget?` | Widget inicial | `null` |
| `trailing` | `Widget?` | Widget final | `null` |
| `onTap` | `VoidCallback?` | Callback al tocar | `null` |

#### Ejemplo

```dart
DSListItem(
  leading: Icon(Icons.person),
  title: 'Juan Pérez',
  subtitle: 'juan@example.com',
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () {
    // Navegar a detalles
  },
)
```

---

### DSDescriptionList

Lista de descripción clave-valor.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `items` | `List<DescriptionItem>` | Items de descripción | requerido |
| `layout` | `DescriptionLayout` | Layout (vertical/horizontal) | `vertical` |

#### Ejemplo

```dart
DSDescriptionList(
  items: [
    DescriptionItem(
      term: 'Nombre',
      description: 'Juan Pérez',
    ),
    DescriptionItem(
      term: 'Email',
      description: 'juan@example.com',
    ),
    DescriptionItem(
      term: 'Teléfono',
      description: '+52 55 1234 5678',
    ),
  ],
  layout: DescriptionLayout.vertical,
)
```

---

### DSMetricCard

Tarjeta para mostrar métricas/estadísticas.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `title` | `String` | Título de la métrica | requerido |
| `value` | `String` | Valor de la métrica | requerido |
| `icon` | `IconData?` | Icono | `null` |
| `trend` | `TrendType?` | Tendencia (up/down) | `null` |
| `trendValue` | `String?` | Valor de tendencia | `null` |

#### Ejemplo

```dart
DSMetricCard(
  title: 'Ventas del mes',
  value: '\$45,231',
  icon: Icons.attach_money,
  trend: TrendType.up,
  trendValue: '+12.5%',
)
```

---

### DSCalendar

Calendario para selección de fechas o visualización de eventos.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `selectedDate` | `DateTime?` | Fecha seleccionada | `null` |
| `events` | `Map<DateTime, List<Event>>?` | Eventos por fecha | `null` |
| `onDateSelected` | `ValueChanged<DateTime>?` | Callback al seleccionar | `null` |

#### Ejemplo

```dart
DSCalendar(
  selectedDate: DateTime.now(),
  events: {
    DateTime.now(): [
      Event(title: 'Reunión', time: '10:00'),
    ],
  },
  onDateSelected: (date) {
    print('Fecha seleccionada: $date');
  },
)
```

---

### DSChart

Componente de gráficos.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Tipos de Gráficos

- `LineChart`: Gráfico de líneas
- `BarChart`: Gráfico de barras
- `PieChart`: Gráfico circular
- `AreaChart`: Gráfico de área

#### Ejemplo

```dart
DSChart.line(
  data: [
    ChartData(x: 'Ene', y: 30),
    ChartData(x: 'Feb', y: 45),
    ChartData(x: 'Mar', y: 60),
  ],
  title: 'Ventas mensuales',
)
```

---

### DSTimeline

Timeline para mostrar eventos cronológicos.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `items` | `List<TimelineItem>` | Items del timeline | requerido |
| `orientation` | `TimelineOrientation` | Orientación | `vertical` |

#### Ejemplo

```dart
DSTimeline(
  items: [
    TimelineItem(
      title: 'Pedido realizado',
      date: '10:00 AM',
      description: 'Tu pedido fue recibido',
      icon: Icons.check_circle,
    ),
    TimelineItem(
      title: 'En preparación',
      date: '10:30 AM',
      description: 'Estamos preparando tu pedido',
      icon: Icons.hourglass_empty,
    ),
  ],
)
```

---

### DSKanban

Tablero Kanban para gestión de tareas.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `columns` | `List<KanbanColumn>` | Columnas del tablero | requerido |
| `onCardMoved` | `Function(String, String)?` | Callback al mover card | `null` |

#### Ejemplo

```dart
DSKanban(
  columns: [
    KanbanColumn(
      id: 'todo',
      title: 'Por hacer',
      cards: [
        KanbanCard(id: '1', title: 'Tarea 1'),
      ],
    ),
    KanbanColumn(
      id: 'in_progress',
      title: 'En progreso',
      cards: [],
    ),
    KanbanColumn(
      id: 'done',
      title: 'Completado',
      cards: [],
    ),
  ],
  onCardMoved: (cardId, columnId) {
    print('Card $cardId movido a $columnId');
  },
)
```

---

### DSOutlineTree

Árbol jerárquico desplegable.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `items` | `List<TreeNode>` | Nodos del árbol | requerido |
| `onNodeTap` | `ValueChanged<TreeNode>?` | Callback al tocar | `null` |

#### Ejemplo

```dart
DSOutlineTree(
  items: [
    TreeNode(
      id: '1',
      label: 'Carpeta 1',
      children: [
        TreeNode(id: '1.1', label: 'Archivo 1.1'),
        TreeNode(id: '1.2', label: 'Archivo 1.2'),
      ],
    ),
    TreeNode(
      id: '2',
      label: 'Carpeta 2',
      children: [],
    ),
  ],
  onNodeTap: (node) {
    print('Node seleccionado: ${node.label}');
  },
)
```

---

## 5. Componentes de Feedback

### DSToast

Notificaciones toast temporales.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Métodos Estáticos

```dart
// Mostrar toast de éxito
DSToast.success(
  context,
  message: 'Operación exitosa',
  duration: Duration(seconds: 3),
);

// Mostrar toast de error
DSToast.error(
  context,
  message: 'Ocurrió un error',
);

// Mostrar toast de advertencia
DSToast.warning(
  context,
  message: 'Advertencia',
);

// Mostrar toast informativo
DSToast.info(
  context,
  message: 'Información',
);
```

#### Ejemplo

```dart
ElevatedButton(
  onPressed: () {
    DSToast.success(
      context,
      message: 'Datos guardados correctamente',
      duration: Duration(seconds: 2),
    );
  },
  child: Text('Guardar'),
)
```

---

### DSDialog

Diálogo modal.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Métodos Estáticos

```dart
// Mostrar diálogo de confirmación
await DSDialog.confirm(
  context,
  title: '¿Confirmar eliminación?',
  message: 'Esta acción no se puede deshacer',
  confirmText: 'Eliminar',
  cancelText: 'Cancelar',
);

// Mostrar diálogo de alerta
await DSDialog.alert(
  context,
  title: 'Error',
  message: 'No se pudo completar la operación',
);

// Mostrar diálogo personalizado
await DSDialog.custom(
  context,
  child: YourCustomWidget(),
);
```

#### Ejemplo

```dart
Future<void> _handleDelete() async {
  final confirmed = await DSDialog.confirm(
    context,
    title: 'Eliminar usuario',
    message: '¿Estás seguro de eliminar este usuario?',
    confirmText: 'Eliminar',
    cancelText: 'Cancelar',
  );

  if (confirmed) {
    // Realizar eliminación
  }
}
```

---

### DSBottomSheet

Bottom sheet modal o persistente.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Métodos Estáticos

```dart
// Mostrar bottom sheet modal
await DSBottomSheet.show(
  context,
  builder: (context) => YourWidget(),
);

// Mostrar bottom sheet con altura específica
await DSBottomSheet.show(
  context,
  height: 400,
  builder: (context) => YourWidget(),
);
```

#### Ejemplo

```dart
Future<void> _showOptions() async {
  await DSBottomSheet.show(
    context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Editar'),
          onTap: () {
            Navigator.pop(context);
            // Acción editar
          },
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Eliminar'),
          onTap: () {
            Navigator.pop(context);
            // Acción eliminar
          },
        ),
      ],
    ),
  );
}
```

---

### DSBanner

Banner informativo en la parte superior.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `message` | `String` | Mensaje del banner | requerido |
| `type` | `BannerType` | Tipo (info/warning/error) | `info` |
| `showCloseButton` | `bool` | Mostrar botón cerrar | `true` |
| `onClose` | `VoidCallback?` | Callback al cerrar | `null` |

#### Ejemplo

```dart
DSBanner(
  message: 'Hay una actualización disponible',
  type: BannerType.info,
  showCloseButton: true,
  onClose: () {
    // Ocultar banner
  },
)
```

---

### DSProgress

Indicadores de progreso.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Tipos

```dart
// Progreso circular
DSProgress.circular()

// Progreso lineal
DSProgress.linear(value: 0.5)

// Progreso circular con valor
DSProgress.circularWithValue(
  value: 0.75,
  label: '75%',
)
```

#### Ejemplo

```dart
// Progreso indeterminado
Column(
  children: [
    DSProgress.circular(),
    SizedBox(height: 16),
    Text('Cargando...'),
  ],
)

// Progreso con valor
Column(
  children: [
    DSProgress.linear(value: 0.6),
    SizedBox(height: 8),
    Text('60% completado'),
  ],
)
```

---

### DSEmptyState

Estado vacío para listas o vistas sin contenido.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `icon` | `IconData?` | Icono | `null` |
| `title` | `String` | Título | requerido |
| `message` | `String?` | Mensaje descriptivo | `null` |
| `action` | `Widget?` | Botón de acción | `null` |

#### Ejemplo

```dart
DSEmptyState(
  icon: Icons.inbox,
  title: 'No hay elementos',
  message: 'Aún no has agregado ningún elemento a esta lista',
  action: DSButton(
    label: 'Agregar primero',
    config: DSButtonConfig(
      onPressed: () {
        // Agregar elemento
      },
    ),
  ),
)
```

---

### DSSkeleton

Skeleton loader para carga progresiva.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSSkeletonConfig` | Configuración | `DSSkeletonConfig()` |
| `width` | `double?` | Ancho | `null` |
| `height` | `double?` | Alto | `null` |
| `shape` | `SkeletonShape` | Forma | `rectangle` |

#### Helpers

- `DSSkeletonA11yHelper`: Helpers de accesibilidad
- `DSSkeletonPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
// Skeleton rectangular
DSSkeleton(
  width: 200,
  height: 100,
)

// Skeleton circular (para avatar)
DSSkeleton(
  width: 48,
  height: 48,
  shape: SkeletonShape.circle,
)

// Skeleton de texto
Column(
  children: [
    DSSkeleton(width: double.infinity, height: 16),
    SizedBox(height: 8),
    DSSkeleton(width: 200, height: 16),
    SizedBox(height: 8),
    DSSkeleton(width: 150, height: 16),
  ],
)
```

---

### DSTooltip

Tooltip informativo.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `message` | `String` | Mensaje del tooltip | requerido |
| `child` | `Widget` | Widget a decorar | requerido |
| `position` | `TooltipPosition?` | Posición | `null` |

#### Ejemplo

```dart
DSTooltip(
  message: 'Información adicional',
  child: Icon(Icons.info_outline),
)
```

---

## 6. Componentes de Acción

### DSIconButton

Botón circular solo con icono.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSIconButtonConfig` | Configuración | `DSIconButtonConfig()` |
| `icon` | `IconData` | Icono | requerido |
| `onPressed` | `VoidCallback?` | Callback al presionar | `null` |
| `size` | `double?` | Tamaño | `null` |

#### Ejemplo

```dart
DSIconButton(
  icon: Icons.search,
  onPressed: () {
    // Realizar búsqueda
  },
)
```

---

### DSFab

Floating Action Button.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSFabConfig` | Configuración | `DSFabConfig()` |
| `icon` | `IconData` | Icono | requerido |
| `label` | `String?` | Etiqueta (FAB extendido) | `null` |
| `onPressed` | `VoidCallback?` | Callback al presionar | `null` |

#### Ejemplo

```dart
// FAB simple
DSFab(
  icon: Icons.add,
  onPressed: () {
    // Agregar item
  },
)

// FAB extendido
DSFab(
  icon: Icons.add,
  label: 'Agregar',
  onPressed: () {
    // Agregar item
  },
)
```

---

### DSBackToTop

Botón para volver al inicio de la página.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSBackToTopConfig` | Configuración | `DSBackToTopConfig()` |
| `scrollController` | `ScrollController` | Controlador del scroll | requerido |
| `showAfterScroll` | `double` | Distancia para mostrar | `300.0` |

#### Helpers

- `DSBackToTopA11yHelper`: Helpers de accesibilidad
- `DSBackToTopPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
final ScrollController scrollController = ScrollController();

Scaffold(
  body: ListView.builder(
    controller: scrollController,
    itemCount: 100,
    itemBuilder: (context, index) => ListTile(
      title: Text('Item $index'),
    ),
  ),
  floatingActionButton: DSBackToTop(
    scrollController: scrollController,
    showAfterScroll: 200.0,
  ),
)
```

---

### DSStepper

Stepper para procesos multi-paso.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `steps` | `List<StepItem>` | Pasos del stepper | requerido |
| `currentStep` | `int` | Paso actual | `0` |
| `onStepTapped` | `ValueChanged<int>?` | Callback al tocar paso | `null` |
| `onStepContinue` | `VoidCallback?` | Callback continuar | `null` |
| `onStepCancel` | `VoidCallback?` | Callback cancelar | `null` |

#### Ejemplo

```dart
int currentStep = 0;

DSStepper(
  currentStep: currentStep,
  steps: [
    StepItem(
      title: 'Información personal',
      content: FormStep1(),
      isActive: currentStep >= 0,
    ),
    StepItem(
      title: 'Dirección',
      content: FormStep2(),
      isActive: currentStep >= 1,
    ),
    StepItem(
      title: 'Confirmación',
      content: FormStep3(),
      isActive: currentStep >= 2,
    ),
  ],
  onStepContinue: () {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    } else {
      // Completar proceso
    }
  },
  onStepCancel: () {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  },
)
```

---

## 7. Componentes de Layout

### DSSplitView

Vista dividida para layouts master-detail.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSSplitViewConfig` | Configuración | `DSSplitViewConfig()` |
| `primary` | `Widget` | Vista principal | requerido |
| `secondary` | `Widget` | Vista secundaria | requerido |
| `initialRatio` | `double` | Ratio inicial | `0.3` |
| `minRatio` | `double` | Ratio mínimo | `0.2` |
| `maxRatio` | `double` | Ratio máximo | `0.8` |

#### Ejemplo

```dart
DSSplitView(
  primary: ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(items[index].title),
      onTap: () {
        // Seleccionar item
      },
    ),
  ),
  secondary: selectedItem != null
      ? DetailView(item: selectedItem)
      : Center(child: Text('Selecciona un item')),
  initialRatio: 0.3,
)
```

---

### DSFilterBar

Barra de filtros para listas y tablas.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `filters` | `List<FilterItem>` | Filtros disponibles | requerido |
| `onFiltersChanged` | `ValueChanged<Map<String, dynamic>>?` | Callback al cambiar | `null` |

#### Ejemplo

```dart
DSFilterBar(
  filters: [
    FilterItem(
      id: 'category',
      label: 'Categoría',
      type: FilterType.select,
      options: ['Todos', 'Electrónica', 'Ropa', 'Hogar'],
    ),
    FilterItem(
      id: 'price',
      label: 'Precio',
      type: FilterType.range,
      min: 0,
      max: 1000,
    ),
  ],
  onFiltersChanged: (filters) {
    print('Filtros aplicados: $filters');
    // Aplicar filtros a datos
  },
)
```

---

### DSToggleView

Toggle entre diferentes vistas (lista/grid).

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `currentView` | `ViewType` | Vista actual | requerido |
| `onViewChanged` | `ValueChanged<ViewType>?` | Callback al cambiar | `null` |

#### Ejemplo

```dart
ViewType currentView = ViewType.list;

DSToggleView(
  currentView: currentView,
  onViewChanged: (view) {
    setState(() {
      currentView = view;
    });
  },
)
```

---

### DSAccordion

Accordion desplegable.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSAccordionConfig` | Configuración | `DSAccordionConfig()` |
| `items` | `List<AccordionItem>` | Items del accordion | requerido |
| `allowMultiple` | `bool` | Permitir múltiples abiertos | `false` |

#### Helpers

- `DSAccordionA11yHelper`: Helpers de accesibilidad
- `DSAccordionPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSAccordion(
  items: [
    AccordionItem(
      title: 'Pregunta 1',
      content: Text('Respuesta 1'),
    ),
    AccordionItem(
      title: 'Pregunta 2',
      content: Text('Respuesta 2'),
    ),
  ],
  allowMultiple: false,
)
```

---

## 8. Componentes de Media

### DSImage

Imagen con carga progresiva y manejo de errores.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSImageConfig` | Configuración | `DSImageConfig()` |
| `imageUrl` | `String?` | URL de la imagen | `null` |
| `assetPath` | `String?` | Path del asset | `null` |
| `width` | `double?` | Ancho | `null` |
| `height` | `double?` | Alto | `null` |
| `fit` | `BoxFit?` | Ajuste de la imagen | `null` |
| `placeholder` | `Widget?` | Widget de carga | `null` |
| `errorWidget` | `Widget?` | Widget de error | `null` |

#### Ejemplo

```dart
// Imagen desde URL
DSImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  placeholder: DSProgress.circular(),
  errorWidget: Icon(Icons.error),
)

// Imagen desde asset
DSImage(
  assetPath: 'assets/images/logo.png',
  width: 150,
  height: 150,
)
```

---

### DSLightbox

Visor de imágenes en pantalla completa.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSLightboxConfig` | Configuración | `DSLightboxConfig()` |
| `images` | `List<String>` | URLs de imágenes | requerido |
| `initialIndex` | `int` | Índice inicial | `0` |

#### Ejemplo

```dart
// Abrir lightbox
await DSLightbox.show(
  context,
  images: [
    'https://example.com/img1.jpg',
    'https://example.com/img2.jpg',
    'https://example.com/img3.jpg',
  ],
  initialIndex: 0,
);

// En un widget
GestureDetector(
  onTap: () {
    DSLightbox.show(
      context,
      images: imageUrls,
    );
  },
  child: DSImage(imageUrl: imageUrls[0]),
)
```

---

### DSMediaViewer

Visor de media (imágenes, videos, PDFs).

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSMediaViewerConfig` | Configuración | `DSMediaViewerConfig()` |
| `mediaItems` | `List<MediaItem>` | Items de media | requerido |
| `initialIndex` | `int` | Índice inicial | `0` |

#### Helpers

- `DSMediaViewerA11yHelper`: Helpers de accesibilidad
- `DSMediaViewerControls`: Controles del visor
- `DSMediaViewerHelpers`: Utilidades

#### Ejemplo

```dart
DSMediaViewer(
  mediaItems: [
    MediaItem(
      type: MediaType.image,
      url: 'https://example.com/image.jpg',
    ),
    MediaItem(
      type: MediaType.video,
      url: 'https://example.com/video.mp4',
    ),
  ],
  initialIndex: 0,
)
```

---

## 9. Componentes Especializados

### DSCommandPalette

Paleta de comandos estilo VS Code.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `commands` | `List<Command>` | Comandos disponibles | requerido |
| `onCommandSelected` | `ValueChanged<Command>?` | Callback al seleccionar | `null` |

#### Ejemplo

```dart
// Mostrar command palette
await DSCommandPalette.show(
  context,
  commands: [
    Command(
      id: 'new_file',
      label: 'Nuevo archivo',
      icon: Icons.note_add,
      action: () {
        // Crear archivo
      },
    ),
    Command(
      id: 'settings',
      label: 'Configuración',
      icon: Icons.settings,
      action: () {
        // Abrir configuración
      },
    ),
  ],
);

// Con shortcut
KeyboardListener(
  onKeyEvent: (event) {
    if (event.isControlPressed && event.logicalKey == LogicalKeyboardKey.keyP) {
      DSCommandPalette.show(context, commands: commands);
    }
  },
  child: YourApp(),
)
```

---

### DSInPageSearch

Búsqueda dentro de la página actual.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `onSearch` | `ValueChanged<String>?` | Callback de búsqueda | `null` |
| `placeholder` | `String?` | Texto placeholder | `null` |

#### Ejemplo

```dart
DSInPageSearch(
  placeholder: 'Buscar en esta página',
  onSearch: (query) {
    // Realizar búsqueda en contenido
    print('Buscando: $query');
  },
)
```

---

### DSTour

Tour guiado de la aplicación.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSTourConfig` | Configuración | `DSTourConfig()` |
| `steps` | `List<TourStep>` | Pasos del tour | requerido |
| `onComplete` | `VoidCallback?` | Callback al completar | `null` |

#### Ejemplo

```dart
DSTour(
  steps: [
    TourStep(
      targetKey: homeButtonKey,
      title: 'Inicio',
      description: 'Este es el botón de inicio',
    ),
    TourStep(
      targetKey: settingsButtonKey,
      title: 'Configuración',
      description: 'Aquí puedes configurar la app',
    ),
  ],
  onComplete: () {
    print('Tour completado');
  },
)
```

---

### DSClipboardShare

Componente para copiar al portapapeles y compartir.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSClipboardShareConfig` | Configuración | `DSClipboardShareConfig()` |
| `text` | `String` | Texto a copiar/compartir | requerido |
| `showCopyButton` | `bool` | Mostrar botón copiar | `true` |
| `showShareButton` | `bool` | Mostrar botón compartir | `true` |

#### Helpers

- `DSClipboardShareA11yHelper`: Helpers de accesibilidad
- `DSClipboardSharePlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSClipboardShare(
  text: 'https://example.com/share/123',
  showCopyButton: true,
  showShareButton: true,
  config: DSClipboardShareConfig(
    onCopied: () {
      DSToast.success(context, message: 'Copiado al portapapeles');
    },
    onShared: () {
      print('Compartido');
    },
  ),
)
```

---

### DSRoleVisibility

Control de visibilidad basado en roles.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSRoleVisibilityConfig` | Configuración | `DSRoleVisibilityConfig()` |
| `allowedRoles` | `List<String>` | Roles permitidos | requerido |
| `child` | `Widget` | Widget a mostrar | requerido |
| `fallback` | `Widget?` | Widget alternativo | `null` |

#### Helpers

- `DSRoleVisibilityA11yHelper`: Helpers de accesibilidad
- `DSRoleVisibilityPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSRoleVisibility(
  allowedRoles: ['admin', 'editor'],
  child: DSButton(
    label: 'Eliminar',
    config: DSButtonConfig(onPressed: () {}),
  ),
  fallback: SizedBox.shrink(),
)
```

---

## 10. Componentes E-commerce

### DSProductCard

Tarjeta de producto para e-commerce.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSProductCardConfig` | Configuración | `DSProductCardConfig()` |
| `imageUrl` | `String` | URL de la imagen | requerido |
| `name` | `String` | Nombre del producto | requerido |
| `price` | `String` | Precio | requerido |
| `rating` | `double?` | Calificación | `null` |
| `onTap` | `VoidCallback?` | Callback al tocar | `null` |
| `onAddToCart` | `VoidCallback?` | Callback agregar al carrito | `null` |

#### Helpers

- `DSProductCardA11yHelper`: Helpers de accesibilidad
- `DSProductCardPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSProductCard(
  imageUrl: 'https://example.com/product.jpg',
  name: 'Laptop Gaming',
  price: '\$999.99',
  rating: 4.5,
  onTap: () {
    // Ver detalles
  },
  onAddToCart: () {
    // Agregar al carrito
    DSToast.success(context, message: 'Agregado al carrito');
  },
)
```

---

### DSCartWidget

Widget del carrito de compras.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSCartWidgetConfig` | Configuración | `DSCartWidgetConfig()` |
| `items` | `List<CartItem>` | Items del carrito | requerido |
| `onItemRemoved` | `ValueChanged<CartItem>?` | Callback al eliminar | `null` |
| `onCheckout` | `VoidCallback?` | Callback al pagar | `null` |

#### Helpers

- `DSCartWidgetA11yHelper`: Helpers de accesibilidad
- `DSCartWidgetPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSCartWidget(
  items: [
    CartItem(
      id: '1',
      name: 'Producto 1',
      price: 29.99,
      quantity: 2,
      imageUrl: 'https://example.com/p1.jpg',
    ),
  ],
  onItemRemoved: (item) {
    // Eliminar del carrito
  },
  onCheckout: () {
    // Ir a checkout
  },
)
```

---

### DSCheckoutForms

Formularios de checkout.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSCheckoutFormsConfig` | Configuración | `DSCheckoutFormsConfig()` |
| `onSubmit` | `ValueChanged<CheckoutData>?` | Callback al enviar | `null` |

#### Helpers

- `DSCheckoutFormsA11yHelper`: Helpers de accesibilidad
- `DSCheckoutFormsPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSCheckoutForms(
  config: DSCheckoutFormsConfig(
    showShippingForm: true,
    showPaymentForm: true,
    showBillingForm: true,
  ),
  onSubmit: (data) {
    // Procesar checkout
    print('Datos: ${data.toJson()}');
  },
)
```

---

## 11. Componentes de Autenticación

### DSAuthScreens

Pantallas de autenticación (login, registro, recuperación).

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSAuthScreensConfig` | Configuración | `DSAuthScreensConfig()` |
| `onLogin` | `Function(String, String)?` | Callback login | `null` |
| `onRegister` | `Function(Map<String, dynamic>)?` | Callback registro | `null` |
| `onForgotPassword` | `Function(String)?` | Callback recuperar | `null` |

#### Helpers

- `DSAuthScreensA11yHelper`: Helpers de accesibilidad
- `DSAuthScreensPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
// Pantalla de login
DSAuthScreens.login(
  config: DSAuthScreensConfig(
    logoUrl: 'assets/logo.png',
    title: 'Bienvenido',
    showSocialLogin: true,
  ),
  onLogin: (email, password) async {
    // Realizar login
    try {
      await authService.login(email, password);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      DSToast.error(context, message: 'Error al iniciar sesión');
    }
  },
)

// Pantalla de registro
DSAuthScreens.register(
  onRegister: (data) async {
    // Realizar registro
  },
)

// Pantalla de recuperación
DSAuthScreens.forgotPassword(
  onForgotPassword: (email) async {
    // Enviar email de recuperación
  },
)
```

---

### DSProfilePreferences

Pantalla de perfil y preferencias.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSProfilePreferencesConfig` | Configuración | `DSProfilePreferencesConfig()` |
| `user` | `UserProfile` | Datos del usuario | requerido |
| `onSave` | `ValueChanged<UserProfile>?` | Callback al guardar | `null` |

#### Helpers

- `DSProfilePreferencesA11yHelper`: Helpers de accesibilidad
- `DSProfilePreferencesPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSProfilePreferences(
  user: UserProfile(
    name: 'Juan Pérez',
    email: 'juan@example.com',
    avatar: 'https://example.com/avatar.jpg',
  ),
  config: DSProfilePreferencesConfig(
    showThemeToggle: true,
    showLanguageSelector: true,
    showNotificationSettings: true,
  ),
  onSave: (profile) {
    // Guardar cambios
    print('Perfil actualizado: ${profile.name}');
  },
)
```

---

## 12. Componentes Auxiliares

### DSMap

Componente de mapa interactivo.

#### Import

```dart
import 'package:iautomat_design_system/iautomat_design_system.dart';
```

#### Parámetros

| Parámetro | Tipo | Descripción | Default |
|-----------|------|-------------|---------|
| `config` | `DSMapConfig` | Configuración | `DSMapConfig()` |
| `initialPosition` | `LatLng` | Posición inicial | requerido |
| `markers` | `List<MapMarker>?` | Marcadores | `null` |
| `onMarkerTapped` | `ValueChanged<MapMarker>?` | Callback al tocar marcador | `null` |

#### Helpers

- `DSMapA11yHelper`: Helpers de accesibilidad
- `DSMapPlatformAdapter`: Adaptador de plataforma

#### Ejemplo

```dart
DSMap(
  initialPosition: LatLng(19.4326, -99.1332), // Ciudad de México
  markers: [
    MapMarker(
      id: '1',
      position: LatLng(19.4326, -99.1332),
      title: 'Ubicación 1',
    ),
  ],
  onMarkerTapped: (marker) {
    print('Marcador: ${marker.title}');
  },
  config: DSMapConfig(
    zoom: 15.0,
    showMyLocation: true,
    showCompass: true,
  ),
)
```

---

## Patrones Comunes

### Uso de Configuración

La mayoría de los componentes complejos usan objetos de configuración para mantener la API limpia:

```dart
// En lugar de muchos parámetros
DSButton(
  label: 'Click',
  config: DSButtonConfig(
    variant: DSButtonVariant.filled,
    size: DSButtonSize.medium,
    colors: DSButtonColors(...),
    spacing: DSButtonSpacing(...),
    elevation: DSButtonElevation(...),
    animation: DSButtonAnimation(...),
    behavior: DSButtonBehavior(...),
    onPressed: () {},
  ),
)
```

### Estados de Componentes

Los componentes soportan múltiples estados:

```dart
enum DSButtonState {
  defaultState,  // Estado normal
  hover,         // Mouse sobre el componente
  pressed,       // Siendo presionado
  focus,         // Tiene el foco
  selected,      // Seleccionado
  disabled,      // Deshabilitado
  loading,       // Cargando
  skeleton,      // Skeleton loader
}
```

### Helpers de Accesibilidad

Los componentes complejos incluyen helpers A11y:

```dart
// Usar helpers de accesibilidad
DSCurrencyInputA11yHelper.announceValue(context, value);
DSCameraPickerA11yHelper.announceCameraReady(context);
```

### Platform Adapters

Adaptadores para comportamiento específico por plataforma:

```dart
// Los componentes se adaptan automáticamente
// pero puedes personalizar:
DSCurrencyInputPlatformAdapter.getKeyboardType(); // iOS vs Android
```

### Validación

Helpers de validación integrados:

```dart
DSInput(
  validator: (value) {
    if (value?.isEmpty == true) {
      return 'Campo requerido';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
      return 'Solo letras';
    }
    return null;
  },
)
```

---

## Temas y Personalización

### Aplicar Tema Global

```dart
MaterialApp(
  theme: DSTheme.light(), // o DSTheme.dark()
  darkTheme: DSTheme.dark(),
  themeMode: ThemeMode.system,
  home: MyApp(),
)
```

### Usar Presets de Tema

```dart
// Usar uno de los 100 presets disponibles
MaterialApp(
  theme: DSThemePresets.modernCorporate,
  home: MyApp(),
)
```

### Personalizar Colores

```dart
// Personalizar colores de un componente
DSButton(
  label: 'Custom',
  config: DSButtonConfig(
    colors: DSButtonColors(
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      hoverColor: Colors.purple.shade100,
    ),
    onPressed: () {},
  ),
)
```

---

## Mejores Prácticas

### 1. Usar const Constructors

```dart
// Bueno - usa const cuando sea posible
const DSButton(
  label: 'Static',
  config: DSButtonConfig(),
)

// Evitar - sin const innecesario
DSButton(
  label: 'Static',
  config: DSButtonConfig(),
)
```

### 2. Manejar Estados de Carga

```dart
bool isLoading = false;

DSButton(
  label: 'Guardar',
  config: DSButtonConfig(
    state: isLoading ? DSButtonState.loading : DSButtonState.defaultState,
    onPressed: isLoading ? null : () async {
      setState(() => isLoading = true);
      await saveData();
      setState(() => isLoading = false);
    },
  ),
)
```

### 3. Validación de Formularios

```dart
final formKey = GlobalKey<FormState>();

Form(
  key: formKey,
  child: Column(
    children: [
      DSInput(
        label: 'Email',
        validator: (v) => v?.isEmpty == true ? 'Requerido' : null,
      ),
      DSButton(
        label: 'Enviar',
        config: DSButtonConfig(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Enviar formulario
            }
          },
        ),
      ),
    ],
  ),
)
```

### 4. Responsive Design

```dart
// Adaptar según tamaño de pantalla
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return MobileLayout();
    } else if (constraints.maxWidth < 1200) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  },
)
```

### 5. Manejo de Errores

```dart
DSInput(
  label: 'Campo',
  validator: (value) {
    try {
      // Validación compleja
      return null;
    } catch (e) {
      return 'Error de validación';
    }
  },
)
```

---

## Recursos Adicionales

### Documentación

- [README.md](README.md): Documentación principal del proyecto
- [CLAUDE.md](CLAUDE.md): Guías para desarrollo con Claude Code

### Ejemplos

Revisa la carpeta `example/` para ver todos los componentes en acción:

```bash
cd example
flutter run
```

### Tests

Cada componente tiene tests completos en `test/components/`:

```bash
flutter test
```

### Contribuir

Para agregar nuevos componentes, sigue el checklist en [CLAUDE.md](CLAUDE.md#checklist-para-nuevos-componentes).

---

## Resumen de Componentes

**Total de componentes documentados: 70+**

### Por Categoría

- **Básicos**: 8 componentes
- **Formulario**: 14 componentes
- **Navegación**: 8 componentes
- **Datos**: 10 componentes
- **Feedback**: 8 componentes
- **Acción**: 4 componentes
- **Layout**: 4 componentes
- **Media**: 3 componentes
- **Especializados**: 5 componentes
- **E-commerce**: 3 componentes
- **Autenticación**: 2 componentes
- **Auxiliares**: 1 componente

### Helpers y Utilidades

- **30+ A11y Helpers**: Para accesibilidad completa
- **30+ Platform Adapters**: Para comportamiento específico por plataforma
- **Validation Helpers**: Para validación de formularios
- **Theme Presets**: 100 temas predefinidos profesionales

---

## Soporte

Para preguntas, issues o sugerencias:

1. Revisa la documentación completa
2. Verifica los ejemplos en `example/`
3. Consulta los tests para casos de uso
4. Abre un issue en el repositorio

---

**Última actualización**: 2025-10-03
**Versión del Design System**: 1.0.2
**Compatible con**: Flutter 3.35.3+ / Dart 3.9.2+
