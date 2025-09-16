import 'package:flutter/material.dart';
import '../theme/spacing.dart';

/// Enumeración para los tipos de breakpoints disponibles
enum BreakpointType {
  /// Móvil - pantallas pequeñas
  mobile,

  /// Tablet - pantallas medianas
  tablet,

  /// Desktop - pantallas grandes
  desktop,

  /// Ultra wide - pantallas muy grandes
  ultraWide,
}

/// Enumeraci�n para orientaci�n del dispositivo
enum DeviceOrientation {
  /// Orientaci�n portrait (vertical)
  portrait,

  /// Orientaci�n landscape (horizontal)
  landscape,
}

/// Sistema de utilidades responsive para el Design System de IAutomat
///
/// Proporciona herramientas completas para crear interfaces adaptativas
/// que respondan apropiadamente a diferentes tama�os de pantalla y orientaciones.
///
/// Caracter�sticas:
/// - Breakpoints configurables y est�ndar de la industria
/// - Detecci�n autom�tica de tipo de dispositivo
/// - Widgets adaptativos para layouts responsive
/// - Valores din�micos seg�n breakpoint
/// - Helpers para tipograf�a, spacing y layouts
/// - Soporte completo para orientaci�n
///
/// Ejemplo de uso:
/// ```dart
/// if (Responsive.isMobile(context)) {
///   return MobileLayout();
/// } else {
///   return DesktopLayout();
/// }
/// ```
class Responsive {
  Responsive._();

  // ==========================================================================
  // BREAKPOINTS CONFIGURABLES
  // ==========================================================================

  /// Breakpoint para m�viles (0 - 599px)
  static const double mobileBreakpoint = 600;

  /// Breakpoint para tablets (600 - 899px)
  static const double tabletBreakpoint = 900;

  /// Breakpoint para desktop (900 - 1199px)
  static const double desktopBreakpoint = 1200;

  /// Breakpoint para ultra wide (1200px+)
  static const double ultraWideBreakpoint = 1600;

  /// Mapa de breakpoints para uso program�tico
  static const Map<BreakpointType, double> breakpoints = {
    BreakpointType.mobile: mobileBreakpoint,
    BreakpointType.tablet: tabletBreakpoint,
    BreakpointType.desktop: desktopBreakpoint,
    BreakpointType.ultraWide: ultraWideBreakpoint,
  };

  // ==========================================================================
  // M�TODOS DE DETECCI�N DE DISPOSITIVO
  // ==========================================================================

  /// Determina si el dispositivo actual es m�vil
  ///
  /// [context] BuildContext para obtener el MediaQuery
  ///
  /// Retorna true si el ancho de pantalla es menor a [mobileBreakpoint]
  static bool isMobile(BuildContext context) {
    return getScreenWidth(context) < mobileBreakpoint;
  }

  /// Determina si el dispositivo actual es tablet
  ///
  /// [context] BuildContext para obtener el MediaQuery
  ///
  /// Retorna true si el ancho est� entre [mobileBreakpoint] y [tabletBreakpoint]
  static bool isTablet(BuildContext context) {
    final width = getScreenWidth(context);
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Determina si el dispositivo actual es desktop
  ///
  /// [context] BuildContext para obtener el MediaQuery
  ///
  /// Retorna true si el ancho est� entre [tabletBreakpoint] y [desktopBreakpoint]
  static bool isDesktop(BuildContext context) {
    final width = getScreenWidth(context);
    return width >= tabletBreakpoint && width < ultraWideBreakpoint;
  }

  /// Determina si el dispositivo actual es ultra wide
  ///
  /// [context] BuildContext para obtener el MediaQuery
  ///
  /// Retorna true si el ancho es mayor a [ultraWideBreakpoint]
  static bool isUltraWide(BuildContext context) {
    return getScreenWidth(context) >= ultraWideBreakpoint;
  }

  /// Determina si la pantalla es peque�a (m�vil o tablet en portrait)
  static bool isSmallScreen(BuildContext context) {
    return isMobile(context) || (isTablet(context) && isPortrait(context));
  }

  /// Determina si la pantalla es grande (desktop o ultra wide)
  static bool isLargeScreen(BuildContext context) {
    return isDesktop(context) || isUltraWide(context);
  }

  // ==========================================================================
  // M�TODOS DE ORIENTACI�N
  // ==========================================================================

  /// Determina si el dispositivo est� en orientaci�n portrait
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// Determina si el dispositivo est� en orientaci�n landscape
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Obtiene la orientaci�n actual como enum
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static DeviceOrientation getDeviceOrientation(BuildContext context) {
    return isPortrait(context)
        ? DeviceOrientation.portrait
        : DeviceOrientation.landscape;
  }

  // ==========================================================================
  // M�TODOS DE INFORMACI�N DE PANTALLA
  // ==========================================================================

  /// Obtiene el breakpoint actual del dispositivo
  ///
  /// [context] BuildContext para obtener el MediaQuery
  ///
  /// Retorna el [BreakpointType] correspondiente al ancho actual
  static BreakpointType getCurrentBreakpoint(BuildContext context) {
    final width = getScreenWidth(context);

    if (width >= ultraWideBreakpoint) return BreakpointType.ultraWide;
    if (width >= tabletBreakpoint) return BreakpointType.desktop;
    if (width >= mobileBreakpoint) return BreakpointType.tablet;
    return BreakpointType.mobile;
  }

  /// Obtiene el ancho de la pantalla
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Obtiene la altura de la pantalla
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Obtiene el tama�o completo de la pantalla
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Obtiene el pixel ratio del dispositivo
  ///
  /// [context] BuildContext para obtener el MediaQuery
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // ==========================================================================
  // HELPERS RESPONSIVE ESPEC�FICOS
  // ==========================================================================

  /// Obtiene un tama�o de fuente responsive
  ///
  /// [context] BuildContext para determinar el breakpoint
  /// [mobile] Tama�o para m�vil
  /// [tablet] Tama�o para tablet (opcional, usa mobile si no se proporciona)
  /// [desktop] Tama�o para desktop (opcional, usa tablet si no se proporciona)
  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? ultraWide,
  }) {
    return ResponsiveValue<double>(
      mobile: mobile,
      tablet: tablet ?? mobile * 1.1,
      desktop: desktop ?? tablet ?? mobile * 1.2,
      ultraWide: ultraWide ?? desktop ?? tablet ?? mobile * 1.3,
    ).getValue(context);
  }

  /// Obtiene espaciado responsive
  ///
  /// [context] BuildContext para determinar el breakpoint
  /// [mobile] Espaciado para m�vil
  /// [tablet] Espaciado para tablet
  /// [desktop] Espaciado para desktop
  static double getResponsiveSpacing(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? ultraWide,
  }) {
    return ResponsiveValue<double>(
      mobile: mobile,
      tablet: tablet ?? mobile * 1.2,
      desktop: desktop ?? tablet ?? mobile * 1.5,
      ultraWide: ultraWide ?? desktop ?? tablet ?? mobile * 1.8,
    ).getValue(context);
  }

  /// Obtiene n�mero de columnas para grids responsive
  ///
  /// [context] BuildContext para determinar el breakpoint
  /// [mobile] Columnas para m�vil (default: 1)
  /// [tablet] Columnas para tablet (default: 2)
  /// [desktop] Columnas para desktop (default: 3)
  static int getResponsiveColumns(
    BuildContext context, {
    int mobile = 1,
    int tablet = 2,
    int desktop = 3,
    int ultraWide = 4,
  }) {
    return ResponsiveValue<int>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      ultraWide: ultraWide,
    ).getValue(context);
  }

  /// Obtiene padding responsive basado en el tama�o de pantalla
  ///
  /// [context] BuildContext para determinar el breakpoint
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return AppSpacing.pagePaddingMobile;
    } else if (isTablet(context)) {
      return AppSpacing.pagePadding;
    } else {
      return EdgeInsets.all(AppSpacing.lg);
    }
  }

  /// Obtiene el ancho m�ximo para contenido centrado
  ///
  /// [context] BuildContext para determinar el breakpoint
  static double getMaxContentWidth(BuildContext context) {
    return ResponsiveValue<double>(
      mobile: AppSpacing.maxCompactWidth,
      tablet: AppSpacing.maxContentWidth,
      desktop: AppSpacing.maxExpandedWidth,
      ultraWide: AppSpacing.maxFullWidth,
    ).getValue(context);
  }
}

// ==========================================================================
// RESPONSIVE VALUE CLASS
// ==========================================================================

/// Clase para definir valores que cambian seg�n el breakpoint
///
/// Permite especificar diferentes valores para cada tama�o de pantalla
/// y obtiene autom�ticamente el valor apropiado seg�n el contexto actual.
///
/// Ejemplo:
/// ```dart
/// final fontSize = ResponsiveValue<double>(
///   mobile: 14,
///   tablet: 16,
///   desktop: 18,
/// );
///
/// Text('Hello', style: TextStyle(fontSize: fontSize.getValue(context)))
/// ```
class ResponsiveValue<T> {
  /// Valor para m�vil
  final T mobile;

  /// Valor para tablet
  final T tablet;

  /// Valor para desktop
  final T desktop;

  /// Valor para ultra wide
  final T ultraWide;

  /// Crear un ResponsiveValue
  const ResponsiveValue({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.ultraWide,
  });

  /// Constructor con valor por defecto
  ///
  /// Usa el valor por defecto para todos los breakpoints no especificados
  ResponsiveValue.all(T value)
      : mobile = value,
        tablet = value,
        desktop = value,
        ultraWide = value;

  /// Constructor solo con mobile y desktop
  ///
  /// Tablet hereda de mobile, ultra wide hereda de desktop
  ResponsiveValue.simple({
    required this.mobile,
    required this.desktop,
  })  : tablet = mobile,
        ultraWide = desktop;

  /// Obtiene el valor apropiado para el contexto actual
  ///
  /// [context] BuildContext para determinar el breakpoint
  T getValue(BuildContext context) {
    final breakpoint = Responsive.getCurrentBreakpoint(context);

    switch (breakpoint) {
      case BreakpointType.mobile:
        return mobile;
      case BreakpointType.tablet:
        return tablet;
      case BreakpointType.desktop:
        return desktop;
      case BreakpointType.ultraWide:
        return ultraWide;
    }
  }

  /// Obtiene el valor para un breakpoint espec�fico
  T getValueForBreakpoint(BreakpointType breakpoint) {
    switch (breakpoint) {
      case BreakpointType.mobile:
        return mobile;
      case BreakpointType.tablet:
        return tablet;
      case BreakpointType.desktop:
        return desktop;
      case BreakpointType.ultraWide:
        return ultraWide;
    }
  }

  /// Crea una copia con valores modificados
  ResponsiveValue<T> copyWith({
    T? mobile,
    T? tablet,
    T? desktop,
    T? ultraWide,
  }) {
    return ResponsiveValue<T>(
      mobile: mobile ?? this.mobile,
      tablet: tablet ?? this.tablet,
      desktop: desktop ?? this.desktop,
      ultraWide: ultraWide ?? this.ultraWide,
    );
  }
}

// ==========================================================================
// RESPONSIVE BUILDER WIDGET
// ==========================================================================

/// Widget builder que se adapta autom�ticamente seg�n el breakpoint
///
/// Permite construir diferentes layouts para cada tama�o de pantalla
/// de manera declarativa y eficiente.
///
/// Ejemplo:
/// ```dart
/// ResponsiveBuilder(
///   mobile: (context) => MobileLayout(),
///   tablet: (context) => TabletLayout(),
///   desktop: (context) => DesktopLayout(),
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  /// Builder para m�vil
  final Widget Function(BuildContext context)? mobile;

  /// Builder para tablet
  final Widget Function(BuildContext context)? tablet;

  /// Builder para desktop
  final Widget Function(BuildContext context)? desktop;

  /// Builder para ultra wide
  final Widget Function(BuildContext context)? ultraWide;

  /// Builder por defecto si no se especifica uno para el breakpoint actual
  final Widget Function(BuildContext context)? defaultBuilder;

  /// Crear un ResponsiveBuilder
  const ResponsiveBuilder({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.ultraWide,
    this.defaultBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final breakpoint = Responsive.getCurrentBreakpoint(context);

    Widget Function(BuildContext context)? builder;

    switch (breakpoint) {
      case BreakpointType.mobile:
        builder = mobile ?? tablet ?? desktop ?? ultraWide ?? defaultBuilder;
        break;
      case BreakpointType.tablet:
        builder = tablet ?? mobile ?? desktop ?? ultraWide ?? defaultBuilder;
        break;
      case BreakpointType.desktop:
        builder = desktop ?? tablet ?? mobile ?? ultraWide ?? defaultBuilder;
        break;
      case BreakpointType.ultraWide:
        builder = ultraWide ?? desktop ?? tablet ?? mobile ?? defaultBuilder;
        break;
    }

    if (builder == null) {
      throw FlutterError(
        'ResponsiveBuilder: No builder found for breakpoint $breakpoint. '
        'Provide at least one builder or a defaultBuilder.',
      );
    }

    return builder(context);
  }
}

// ==========================================================================
// RESPONSIVE LAYOUT WIDGET
// ==========================================================================

/// Widget que cambia autom�ticamente entre layouts seg�n el tama�o de pantalla
///
/// Versi�n simplificada del ResponsiveBuilder para casos comunes donde
/// solo necesitas distinguir entre peque�o, mediano y grande.
class ResponsiveLayout extends StatelessWidget {
  /// Layout para pantallas peque�as (m�vil)
  final Widget? small;

  /// Layout para pantallas medianas (tablet)
  final Widget? medium;

  /// Layout para pantallas grandes (desktop+)
  final Widget? large;

  /// Layout por defecto
  final Widget? defaultLayout;

  /// Crear un ResponsiveLayout
  const ResponsiveLayout({
    super.key,
    this.small,
    this.medium,
    this.large,
    this.defaultLayout,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context) && small != null) {
      return small!;
    }

    if (Responsive.isTablet(context) && medium != null) {
      return medium!;
    }

    if (Responsive.isLargeScreen(context) && large != null) {
      return large!;
    }

    // Fallback hierarchy
    if (Responsive.isMobile(context)) {
      return medium ?? large ?? defaultLayout ?? Container();
    }

    if (Responsive.isTablet(context)) {
      return large ?? small ?? defaultLayout ?? Container();
    }

    // Desktop/UltraWide
    return medium ?? small ?? defaultLayout ?? Container();
  }
}

// ==========================================================================
// RESPONSIVE GRID WIDGET
// ==========================================================================

/// Grid que se adapta autom�ticamente seg�n el tama�o de pantalla
///
/// Cambia el n�mero de columnas basado en breakpoints y
/// ajusta el spacing apropiadamente.
class ResponsiveGrid extends StatelessWidget {
  /// Lista de widgets a mostrar en el grid
  final List<Widget> children;

  /// N�mero de columnas para cada breakpoint
  final ResponsiveValue<int> columns;

  /// Espaciado entre elementos
  final ResponsiveValue<double>? spacing;

  /// Aspect ratio de los elementos
  final double childAspectRatio;

  /// Si el grid debe ser shrinkWrap
  final bool shrinkWrap;

  /// Physics del scroll
  final ScrollPhysics? physics;

  /// Padding del grid
  final EdgeInsets? padding;

  /// Crear un ResponsiveGrid
  const ResponsiveGrid({
    super.key,
    required this.children,
    ResponsiveValue<int>? columns,
    this.spacing,
    this.childAspectRatio = 1.0,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  }) : columns = columns ??
            const ResponsiveValue<int>(
              mobile: 1,
              tablet: 2,
              desktop: 3,
              ultraWide: 4,
            );

  @override
  Widget build(BuildContext context) {
    final columnCount = columns.getValue(context);
    final gridSpacing = spacing?.getValue(context) ?? AppSpacing.md;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GridView.count(
        crossAxisCount: columnCount,
        crossAxisSpacing: gridSpacing,
        mainAxisSpacing: gridSpacing,
        childAspectRatio: childAspectRatio,
        shrinkWrap: shrinkWrap,
        physics: physics,
        children: children,
      ),
    );
  }
}

// ==========================================================================
// RESPONSIVE WRAP WIDGET
// ==========================================================================

/// Wrap que adapta su spacing seg�n el tama�o de pantalla
class ResponsiveWrap extends StatelessWidget {
  /// Lista de widgets para el wrap
  final List<Widget> children;

  /// Espaciado entre elementos
  final ResponsiveValue<double>? spacing;

  /// Espaciado entre filas
  final ResponsiveValue<double>? runSpacing;

  /// Alineaci�n principal
  final WrapAlignment alignment;

  /// Alineaci�n cruzada
  final WrapCrossAlignment crossAxisAlignment;

  /// Direcci�n del wrap
  final Axis direction;

  /// Crear un ResponsiveWrap
  const ResponsiveWrap({
    super.key,
    required this.children,
    this.spacing,
    this.runSpacing,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.center,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final wrapSpacing = spacing?.getValue(context) ?? AppSpacing.sm;
    final wrapRunSpacing = runSpacing?.getValue(context) ?? AppSpacing.sm;

    return Wrap(
      spacing: wrapSpacing,
      runSpacing: wrapRunSpacing,
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      children: children,
    );
  }
}

// ==========================================================================
// RESPONSIVE TEXT WIDGET
// ==========================================================================

/// Text widget que adapta su tama�o autom�ticamente
class ResponsiveText extends StatelessWidget {
  /// Texto a mostrar
  final String text;

  /// Tama�o base para m�vil
  final double baseFontSize;

  /// Factor de escala para tablet
  final double tabletScale;

  /// Factor de escala para desktop
  final double desktopScale;

  /// Factor de escala para ultra wide
  final double ultraWideScale;

  /// TextStyle base
  final TextStyle? style;

  /// Alineaci�n del texto
  final TextAlign? textAlign;

  /// Overflow del texto
  final TextOverflow? overflow;

  /// N�mero m�ximo de l�neas
  final int? maxLines;

  /// Crear un ResponsiveText
  const ResponsiveText(
    this.text, {
    super.key,
    this.baseFontSize = 16,
    this.tabletScale = 1.1,
    this.desktopScale = 1.2,
    this.ultraWideScale = 1.3,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveValue<double>(
      mobile: baseFontSize,
      tablet: baseFontSize * tabletScale,
      desktop: baseFontSize * desktopScale,
      ultraWide: baseFontSize * ultraWideScale,
    ).getValue(context);

    return Text(
      text,
      style: (style ?? const TextStyle()).copyWith(fontSize: fontSize),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

// ==========================================================================
// EXTENSIONES �TILES
// ==========================================================================

/// Extensiones para BuildContext que facilitan el uso de responsive
extension ResponsiveExtension on BuildContext {
  /// Acceso directo a m�todos responsive
  bool get isMobile => Responsive.isMobile(this);
  bool get isTablet => Responsive.isTablet(this);
  bool get isDesktop => Responsive.isDesktop(this);
  bool get isUltraWide => Responsive.isUltraWide(this);
  bool get isPortrait => Responsive.isPortrait(this);
  bool get isLandscape => Responsive.isLandscape(this);

  /// Obtiene informaci�n de pantalla
  BreakpointType get breakpoint => Responsive.getCurrentBreakpoint(this);
  double get screenWidth => Responsive.getScreenWidth(this);
  double get screenHeight => Responsive.getScreenHeight(this);
  Size get screenSize => Responsive.getScreenSize(this);

  /// Obtiene valores responsive comunes
  EdgeInsets get responsivePadding => Responsive.getResponsivePadding(this);
  double get maxContentWidth => Responsive.getMaxContentWidth(this);
}
