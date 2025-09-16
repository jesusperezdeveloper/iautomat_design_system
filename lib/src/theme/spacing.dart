import 'package:flutter/material.dart';

/// Sistema de espaciado completo para el Design System de IAutomat
///
/// Basado en una unidad base de 8px que se escala proporcionalmente
/// para crear un sistema consistente y predecible de espaciado.
///
/// El sistema incluye:
/// - Escala base de espaciado (xxxs a xxxl)
/// - Widgets SizedBox predefinidos para espaciado
/// - EdgeInsets presets para casos comunes
/// - Spacing responsive según dispositivo
/// - Grid system para layouts
/// - Max widths para contenido
///
/// Principios del sistema:
/// - Base de 8px (óptimo para múltiples resoluciones)
/// - Escala proporcional y predecible
/// - Spacing responsive automático
/// - Consistent vertical rhythm
class AppSpacing {
  AppSpacing._();

  // ==========================================================================
  // UNIDAD BASE Y ESCALA DE ESPACIADO
  // ==========================================================================

  /// Unidad base del sistema de espaciado
  ///
  /// 8px es la base recomendada por Material Design y proporciona
  /// una escala que funciona bien en m�ltiples densidades de pantalla.
  static const double unit = 8.0;

  /// Espaciado extra extra extra small - 4px
  ///
  /// Uso: Separaci�n m�nima entre elementos muy relacionados,
  /// padding interno de chips, spacing en iconos peque�os
  static const double xxxs = unit * 0.5; // 4px

  /// Espaciado extra extra small - 8px
  ///
  /// Uso: Padding interno de elementos peque�os, separaci�n entre
  /// elementos �ntimamente relacionados
  static const double xxs = unit * 1; // 8px

  /// Espaciado extra small - 12px
  ///
  /// Uso: Padding de elementos compactos, separaci�n en listas densas
  static const double xs = unit * 1.5; // 12px

  /// Espaciado small - 16px
  ///
  /// Uso: Padding est�ndar de elementos, separaci�n entre componentes relacionados
  static const double sm = unit * 2; // 16px

  /// Espaciado medium - 24px
  ///
  /// Uso: Separaci�n entre secciones, padding de cards, spacing vertical est�ndar
  static const double md = unit * 3; // 24px

  /// Espaciado large - 32px
  ///
  /// Uso: Separaci�n entre grupos de contenido, padding de p�ginas
  static const double lg = unit * 4; // 32px

  /// Espaciado extra large - 40px
  ///
  /// Uso: Separaci�n entre secciones importantes, spacing de hero sections
  static const double xl = unit * 5; // 40px

  /// Espaciado extra extra large - 48px
  ///
  /// Uso: Separaci�n entre secciones principales, padding de contenedores grandes
  static const double xxl = unit * 6; // 48px

  /// Espaciado extra extra extra large - 64px
  ///
  /// Uso: Separaci�n m�xima entre secciones, spacing de layouts principales
  static const double xxxl = unit * 8; // 64px

  // ==========================================================================
  // SIZEDBOX WIDGETS PREDEFINIDOS - VERTICAL
  // ==========================================================================

  /// Espaciado vertical extra extra extra small (4px)
  static const Widget verticalXxxs = SizedBox(height: xxxs);

  /// Espaciado vertical extra extra small (8px)
  static const Widget verticalXxs = SizedBox(height: xxs);

  /// Espaciado vertical extra small (12px)
  static const Widget verticalXs = SizedBox(height: xs);

  /// Espaciado vertical small (16px)
  static const Widget verticalSm = SizedBox(height: sm);

  /// Espaciado vertical medium (24px)
  static const Widget verticalMd = SizedBox(height: md);

  /// Espaciado vertical large (32px)
  static const Widget verticalLg = SizedBox(height: lg);

  /// Espaciado vertical extra large (40px)
  static const Widget verticalXl = SizedBox(height: xl);

  /// Espaciado vertical extra extra large (48px)
  static const Widget verticalXxl = SizedBox(height: xxl);

  /// Espaciado vertical extra extra extra large (64px)
  static const Widget verticalXxxl = SizedBox(height: xxxl);

  // ==========================================================================
  // SIZEDBOX WIDGETS PREDEFINIDOS - HORIZONTAL
  // ==========================================================================

  /// Espaciado horizontal extra extra extra small (4px)
  static const Widget horizontalXxxs = SizedBox(width: xxxs);

  /// Espaciado horizontal extra extra small (8px)
  static const Widget horizontalXxs = SizedBox(width: xxs);

  /// Espaciado horizontal extra small (12px)
  static const Widget horizontalXs = SizedBox(width: xs);

  /// Espaciado horizontal small (16px)
  static const Widget horizontalSm = SizedBox(width: sm);

  /// Espaciado horizontal medium (24px)
  static const Widget horizontalMd = SizedBox(width: md);

  /// Espaciado horizontal large (32px)
  static const Widget horizontalLg = SizedBox(width: lg);

  /// Espaciado horizontal extra large (40px)
  static const Widget horizontalXl = SizedBox(width: xl);

  /// Espaciado horizontal extra extra large (48px)
  static const Widget horizontalXxl = SizedBox(width: xxl);

  /// Espaciado horizontal extra extra extra large (64px)
  static const Widget horizontalXxxl = SizedBox(width: xxxl);

  // ==========================================================================
  // EDGEINSETS PRESETS - CASOS COMUNES
  // ==========================================================================

  /// Padding para p�ginas principales
  ///
  /// Uso: Padding principal de Scaffold, contenedores de p�gina
  static const EdgeInsets pagePadding = EdgeInsets.all(md);

  /// Padding para p�ginas en mobile (reducido)
  static const EdgeInsets pagePaddingMobile = EdgeInsets.all(sm);

  /// Padding para cards y contenedores
  ///
  /// Uso: Padding interno de Card, Container, superficie elevadas
  static const EdgeInsets cardPadding = EdgeInsets.all(sm);

  /// Padding para cards compactos
  static const EdgeInsets cardPaddingCompact = EdgeInsets.all(xs);

  /// Padding para botones
  ///
  /// Uso: Padding interno de ElevatedButton, OutlinedButton, TextButton
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: xs,
  );

  /// Padding para botones peque�os
  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: sm,
    vertical: xxs,
  );

  /// Padding para botones grandes
  static const EdgeInsets buttonPaddingLarge = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: sm,
  );

  /// Padding para list items
  ///
  /// Uso: Padding de ListTile, elementos de lista
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: sm,
    vertical: xs,
  );

  /// Padding para list items compactos
  static const EdgeInsets listItemPaddingCompact = EdgeInsets.symmetric(
    horizontal: sm,
    vertical: xxs,
  );

  /// Padding para inputs y campos de formulario
  ///
  /// Uso: contentPadding de TextField, InputDecoration
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: sm,
    vertical: xs,
  );

  /// Padding para inputs compactos
  static const EdgeInsets inputPaddingCompact = EdgeInsets.symmetric(
    horizontal: xs,
    vertical: xxs,
  );

  /// Padding para di�logos y modales
  ///
  /// Uso: Padding interno de Dialog, BottomSheet, modales
  static const EdgeInsets dialogPadding = EdgeInsets.all(md);

  /// Padding para secciones dentro de di�logos
  static const EdgeInsets dialogContentPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// Padding para app bars
  ///
  /// Uso: Padding de AppBar, headers, navigation bars
  static const EdgeInsets appBarPadding = EdgeInsets.symmetric(horizontal: sm);

  /// Padding para chips y badges
  ///
  /// Uso: Padding interno de Chip, badges peque�os
  static const EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: xs,
    vertical: xxxs,
  );

  // ==========================================================================
  // M�TODOS HELPER PARA SPACING DIN�MICO
  // ==========================================================================

  /// Crea espaciado vertical din�mico
  ///
  /// [height] Altura del espaciado en pixels
  ///
  /// �til para spacing calculado din�micamente o valores no est�ndar
  static Widget vertical(double height) => SizedBox(height: height);

  /// Crea espaciado horizontal din�mico
  ///
  /// [width] Ancho del espaciado en pixels
  static Widget horizontal(double width) => SizedBox(width: width);

  /// Crea EdgeInsets sim�tricas
  ///
  /// [horizontal] Padding horizontal
  /// [vertical] Padding vertical
  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );

  /// Crea EdgeInsets con valores espec�ficos para cada lado
  ///
  /// [top] Padding superior
  /// [right] Padding derecho
  /// [bottom] Padding inferior
  /// [left] Padding izquierdo
  static EdgeInsets only({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) =>
      EdgeInsets.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      );

  /// Multiplica un valor de spacing base por un factor
  ///
  /// [baseSpacing] Valor base de spacing
  /// [multiplier] Factor de multiplicaci�n
  ///
  /// �til para crear spacing proporcional
  static double scale(double baseSpacing, double multiplier) =>
      baseSpacing * multiplier;

  // ==========================================================================
  // RESPONSIVE SPACING
  // ==========================================================================

  /// Obtiene spacing responsive basado en el ancho de pantalla
  ///
  /// [context] BuildContext para obtener MediaQuery
  /// [mobileSpacing] Spacing para m�vil
  /// [tabletSpacing] Spacing para tablet
  /// [desktopSpacing] Spacing para desktop
  ///
  /// Breakpoints:
  /// - Mobile: < 600px
  /// - Tablet: 600px - 1200px
  /// - Desktop: > 1200px
  static double responsive(
    BuildContext context, {
    required double mobileSpacing,
    required double tabletSpacing,
    required double desktopSpacing,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return mobileSpacing;
    } else if (screenWidth < 1200) {
      return tabletSpacing;
    } else {
      return desktopSpacing;
    }
  }

  /// EdgeInsets responsive para padding de p�gina
  static EdgeInsets pageResponsive(BuildContext context) {
    return EdgeInsets.all(
      responsive(
        context,
        mobileSpacing: sm,
        tabletSpacing: md,
        desktopSpacing: lg,
      ),
    );
  }

  /// EdgeInsets responsive para contenedores
  static EdgeInsets containerResponsive(BuildContext context) {
    return EdgeInsets.all(
      responsive(
        context,
        mobileSpacing: xs,
        tabletSpacing: sm,
        desktopSpacing: md,
      ),
    );
  }

  /// Spacing vertical responsive entre secciones
  static Widget verticalSectionResponsive(BuildContext context) {
    return vertical(
      responsive(
        context,
        mobileSpacing: lg,
        tabletSpacing: xl,
        desktopSpacing: xxl,
      ),
    );
  }

  // ==========================================================================
  // CONSTANTES PARA MAX WIDTHS DE CONTENIDO
  // ==========================================================================

  /// Ancho m�ximo para contenido de texto (�ptimo para lectura)
  ///
  /// Basado en estudios de tipograf�a que recomiendan 45-75 caracteres por l�nea
  static const double maxContentWidth = 720.0;

  /// Ancho m�ximo para contenido compacto (formularios, cards)
  static const double maxCompactWidth = 480.0;

  /// Ancho m�ximo para contenido expandido (dashboards, tablas)
  static const double maxExpandedWidth = 1200.0;

  /// Ancho m�ximo para contenido full-width (hero sections, im�genes)
  static const double maxFullWidth = 1440.0;

  /// Ancho m�nimo para contenido (prevent excessive compression)
  static const double minContentWidth = 320.0;

  // ==========================================================================
  // GRID SPACING PARA LAYOUTS
  // ==========================================================================

  /// Spacing est�ndar para grids de contenido
  static const double gridSpacing = sm;

  /// Spacing compacto para grids densos
  static const double gridSpacingCompact = xs;

  /// Spacing expandido para grids con mucho aire
  static const double gridSpacingExpanded = md;

  /// Spacing para grids de cards
  static const double gridSpacingCards = md;

  /// Spacing para grids de im�genes
  static const double gridSpacingImages = xxs;

  /// Crea un SliverGrid con spacing est�ndar
  static SliverGridDelegateWithFixedCrossAxisCount gridDelegate({
    required int crossAxisCount,
    double crossAxisSpacing = gridSpacing,
    double mainAxisSpacing = gridSpacing,
    double childAspectRatio = 1.0,
  }) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
    );
  }

  /// Crea un GridView.count con spacing est�ndar
  static GridView gridView({
    required int crossAxisCount,
    required List<Widget> children,
    double crossAxisSpacing = gridSpacing,
    double mainAxisSpacing = gridSpacing,
    double childAspectRatio = 1.0,
    EdgeInsets padding = const EdgeInsets.all(sm),
    bool shrinkWrap = false,
  }) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
      padding: padding,
      shrinkWrap: shrinkWrap,
      children: children,
    );
  }

  // ==========================================================================
  // LAYOUT HELPERS
  // ==========================================================================

  /// Wrap que aplica spacing entre children
  static Wrap spacedWrap({
    required List<Widget> children,
    double spacing = sm,
    double runSpacing = sm,
    WrapAlignment alignment = WrapAlignment.start,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.center,
    Axis direction = Axis.horizontal,
  }) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      children: children,
    );
  }

  /// Column con spacing autom�tico entre children
  static Column spacedColumn({
    required List<Widget> children,
    double spacing = sm,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _insertSpacing(children, vertical(spacing)),
    );
  }

  /// Row con spacing autom�tico entre children
  static Row spacedRow({
    required List<Widget> children,
    double spacing = sm,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _insertSpacing(children, horizontal(spacing)),
    );
  }

  /// Helper privado para insertar spacing entre widgets
  static List<Widget> _insertSpacing(List<Widget> children, Widget spacer) {
    if (children.isEmpty) return children;

    final List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(spacer);
      }
    }
    return spacedChildren;
  }

  // ==========================================================================
  // CONSTANTES DE UTILIDAD
  // ==========================================================================

  /// Mapa de todos los valores de spacing para uso program�tico
  static const Map<String, double> spacingValues = {
    'xxxs': xxxs,
    'xxs': xxs,
    'xs': xs,
    'sm': sm,
    'md': md,
    'lg': lg,
    'xl': xl,
    'xxl': xxl,
    'xxxl': xxxl,
  };

  /// Lista de todos los espaciados disponibles
  static const List<double> allSpacings = [
    xxxs,
    xxs,
    xs,
    sm,
    md,
    lg,
    xl,
    xxl,
    xxxl,
  ];

  /// Breakpoints para responsive design
  static const Map<String, double> breakpoints = {
    'mobile': 600,
    'tablet': 900,
    'desktop': 1200,
    'wide': 1800,
  };

  /// Obtiene el nombre del spacing m�s cercano a un valor dado
  static String getSpacingName(double value) {
    double closestDiff = double.infinity;
    String closestName = 'sm';

    for (final entry in spacingValues.entries) {
      final diff = (entry.value - value).abs();
      if (diff < closestDiff) {
        closestDiff = diff;
        closestName = entry.key;
      }
    }

    return closestName;
  }

  /// Redondea un valor al spacing m�s cercano del sistema
  static double roundToSpacing(double value) {
    final name = getSpacingName(value);
    return spacingValues[name] ?? sm;
  }
}
