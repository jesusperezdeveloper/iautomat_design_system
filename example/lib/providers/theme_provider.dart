import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Provider para gestión global del estado de temas del Design System
///
/// Maneja la selección, aplicación y persistencia de los 100 temas profesionales,
/// incluyendo funcionalidades avanzadas como favoritos, historial y recomendaciones.
///
/// Funcionalidades principales:
/// - Aplicación de temas con transiciones suaves
/// - Sistema de favoritos persistente
/// - Historial de temas utilizados
/// - Recomendaciones inteligentes
/// - Persistencia de preferencias
/// - Analytics de uso
class DSThemeProvider extends ChangeNotifier {
  // ==========================================================================
  // ESTADO PRIVADO
  // ==========================================================================

  DSThemePreset _currentTheme = CorporateThemeCollection.executiveNavy;
  List<DSThemePreset> _favoriteThemes = [];
  List<DSThemePreset> _recentThemes = [];
  bool _isDarkMode = false;
  bool _isTransitioning = false;
  String? _lastSearchQuery;
  ThemeCategory? _lastFilterCategory;

  // ==========================================================================
  // GETTERS PÚBLICOS
  // ==========================================================================

  /// Tema actualmente aplicado
  DSThemePreset get currentTheme => _currentTheme;

  /// Lista de temas favoritos del usuario
  List<DSThemePreset> get favoriteThemes => List.unmodifiable(_favoriteThemes);

  /// Temas utilizados recientemente (máximo 10)
  List<DSThemePreset> get recentThemes => List.unmodifiable(_recentThemes);

  /// Si está en modo oscuro
  bool get isDarkMode => _isDarkMode;

  /// Si está en proceso de transición entre temas
  bool get isTransitioning => _isTransitioning;

  /// Último término de búsqueda utilizado
  String? get lastSearchQuery => _lastSearchQuery;

  /// Última categoría filtrada
  ThemeCategory? get lastFilterCategory => _lastFilterCategory;

  /// ThemeData para la aplicación (modo actual)
  ThemeData get themeData => _isDarkMode
      ? _currentTheme.darkTheme
      : _currentTheme.lightTheme;

  /// ThemeData para modo claro
  ThemeData get lightThemeData => _currentTheme.lightTheme;

  /// ThemeData para modo oscuro
  ThemeData get darkThemeData => _currentTheme.darkTheme;

  /// Verifica si un tema está en favoritos
  bool isFavorite(DSThemePreset theme) => _favoriteThemes.contains(theme);

  /// Número de temas favoritos
  int get favoritesCount => _favoriteThemes.length;

  /// Verifica si hay temas recientes
  bool get hasRecentThemes => _recentThemes.isNotEmpty;

  // ==========================================================================
  // GESTIÓN DE TEMAS
  // ==========================================================================

  /// Aplica un nuevo tema con transición suave
  Future<void> applyTheme(
    DSThemePreset theme, {
    bool animate = true,
    Duration duration = const Duration(milliseconds: 300),
  }) async {
    if (theme.id == _currentTheme.id) return;

    if (animate) {
      _isTransitioning = true;
      notifyListeners();
    }

    // Actualizar tema actual
    _currentTheme = theme;

    // Agregar a recientes (al inicio)
    _addToRecent(theme);

    // Aplicar transición si está habilitada
    if (animate) {
      await Future.delayed(duration);
      _isTransitioning = false;
    }

    // Feedback háptico sutil
    HapticFeedback.selectionClick();

    // Notificar cambios
    notifyListeners();

    // Persistir preferencias
    await _savePreferences();
  }

  /// Cambia entre modo claro y oscuro
  Future<void> toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;

    // Feedback háptico
    HapticFeedback.selectionClick();

    notifyListeners();
    await _savePreferences();
  }

  /// Establece el modo oscuro específicamente
  Future<void> setDarkMode(bool isDark) async {
    if (_isDarkMode == isDark) return;

    _isDarkMode = isDark;

    // Feedback háptico
    HapticFeedback.selectionClick();

    notifyListeners();
    await _savePreferences();
  }

  /// Aplica un tema por su ID
  Future<void> applyThemeById(String themeId) async {
    final theme = DSThemeCatalog.getById(themeId);
    if (theme != null) {
      await applyTheme(theme);
    }
  }

  /// Aplica un tema aleatorio de una categoría
  Future<void> applyRandomTheme([ThemeCategory? category]) async {
    final themes = category != null
        ? DSThemeCatalog.getByCategory(category)
        : DSThemeCatalog.allThemes;

    if (themes.isNotEmpty) {
      final randomTheme = themes[DateTime.now().millisecond % themes.length];
      await applyTheme(randomTheme);
    }
  }

  // ==========================================================================
  // GESTIÓN DE FAVORITOS
  // ==========================================================================

  /// Alterna un tema en favoritos
  Future<void> toggleFavorite(DSThemePreset theme) async {
    if (_favoriteThemes.contains(theme)) {
      _favoriteThemes.remove(theme);
    } else {
      _favoriteThemes.add(theme);
    }

    // Feedback háptico
    HapticFeedback.lightImpact();

    notifyListeners();
    await _savePreferences();
  }

  /// Añade un tema a favoritos
  Future<void> addToFavorites(DSThemePreset theme) async {
    if (!_favoriteThemes.contains(theme)) {
      _favoriteThemes.add(theme);

      // Feedback háptico
      HapticFeedback.lightImpact();

      notifyListeners();
      await _savePreferences();
    }
  }

  /// Elimina un tema de favoritos
  Future<void> removeFromFavorites(DSThemePreset theme) async {
    if (_favoriteThemes.remove(theme)) {
      // Feedback háptico
      HapticFeedback.lightImpact();

      notifyListeners();
      await _savePreferences();
    }
  }

  /// Limpia todos los favoritos
  Future<void> clearFavorites() async {
    if (_favoriteThemes.isNotEmpty) {
      _favoriteThemes.clear();

      // Feedback háptico
      HapticFeedback.mediumImpact();

      notifyListeners();
      await _savePreferences();
    }
  }

  // ==========================================================================
  // GESTIÓN DE RECIENTES
  // ==========================================================================

  /// Añade un tema a la lista de recientes
  void _addToRecent(DSThemePreset theme) {
    // Remover si ya existe
    _recentThemes.remove(theme);

    // Añadir al inicio
    _recentThemes.insert(0, theme);

    // Mantener máximo 10 elementos
    if (_recentThemes.length > 10) {
      _recentThemes = _recentThemes.take(10).toList();
    }
  }

  /// Limpia el historial de temas recientes
  Future<void> clearRecentThemes() async {
    if (_recentThemes.isNotEmpty) {
      _recentThemes.clear();

      // Feedback háptico
      HapticFeedback.mediumImpact();

      notifyListeners();
      await _savePreferences();
    }
  }

  // ==========================================================================
  // BÚSQUEDA Y FILTROS
  // ==========================================================================

  /// Actualiza el último término de búsqueda
  void updateLastSearchQuery(String query) {
    _lastSearchQuery = query.trim().isEmpty ? null : query;
    notifyListeners();
  }

  /// Actualiza la última categoría filtrada
  void updateLastFilterCategory(ThemeCategory? category) {
    _lastFilterCategory = category;
    notifyListeners();
  }

  /// Limpia los filtros de búsqueda
  void clearSearchFilters() {
    _lastSearchQuery = null;
    _lastFilterCategory = null;
    notifyListeners();
  }

  // ==========================================================================
  // RECOMENDACIONES
  // ==========================================================================

  /// Obtiene recomendaciones basadas en el tema actual
  List<DSThemePreset> getRecommendations({int limit = 5}) {
    return DSThemeCatalog.getRecommendations(
      _currentTheme,
      limit: limit,
      userFavorites: _favoriteThemes,
    );
  }

  /// Obtiene temas relacionados por categoría
  List<DSThemePreset> getRelatedThemes({int limit = 5}) {
    return DSThemeCatalog.getByCategory(_currentTheme.category)
        .where((theme) => theme.id != _currentTheme.id)
        .take(limit)
        .toList();
  }

  /// Obtiene temas populares
  List<DSThemePreset> getPopularThemes({int limit = 10}) {
    return DSThemeCatalog.getPopularThemes(limit: limit);
  }

  /// Obtiene temas nuevos
  List<DSThemePreset> getNewestThemes({int limit = 5}) {
    return DSThemeCatalog.getNewestThemes(limit: limit);
  }

  // ==========================================================================
  // PERSISTENCIA DE DATOS
  // ==========================================================================

  /// Guarda las preferencias del usuario
  Future<void> _savePreferences() async {
    // En una implementación real, esto guardaría en SharedPreferences
    // Por ahora es solo un placeholder
    try {
      // await SharedPreferences.getInstance().then((prefs) async {
      //   await prefs.setString('current_theme_id', _currentTheme.id);
      //   await prefs.setBool('is_dark_mode', _isDarkMode);
      //   await prefs.setStringList('favorite_theme_ids',
      //       _favoriteThemes.map((t) => t.id).toList());
      //   await prefs.setStringList('recent_theme_ids',
      //       _recentThemes.map((t) => t.id).toList());
      // });
    } catch (e) {
      debugPrint('Error saving theme preferences: $e');
    }
  }

  /// Carga las preferencias del usuario
  Future<void> loadPreferences() async {
    // En una implementación real, esto cargaría de SharedPreferences
    // Por ahora es solo un placeholder
    try {
      // final prefs = await SharedPreferences.getInstance();
      //
      // // Cargar tema actual
      // final themeId = prefs.getString('current_theme_id');
      // if (themeId != null) {
      //   final theme = DSThemeCatalog.getById(themeId);
      //   if (theme != null) _currentTheme = theme;
      // }
      //
      // // Cargar modo oscuro
      // _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
      //
      // // Cargar favoritos
      // final favoriteIds = prefs.getStringList('favorite_theme_ids') ?? [];
      // _favoriteThemes = favoriteIds
      //     .map((id) => DSThemeCatalog.getById(id))
      //     .where((theme) => theme != null)
      //     .cast<DSThemePreset>()
      //     .toList();
      //
      // // Cargar recientes
      // final recentIds = prefs.getStringList('recent_theme_ids') ?? [];
      // _recentThemes = recentIds
      //     .map((id) => DSThemeCatalog.getById(id))
      //     .where((theme) => theme != null)
      //     .cast<DSThemePreset>()
      //     .toList();

      notifyListeners();
    } catch (e) {
      debugPrint('Error loading theme preferences: $e');
    }
  }

  // ==========================================================================
  // UTILIDADES
  // ==========================================================================

  /// Obtiene información de debug del estado actual
  Map<String, dynamic> get debugInfo => {
    'currentTheme': _currentTheme.id,
    'isDarkMode': _isDarkMode,
    'favoritesCount': _favoriteThemes.length,
    'recentCount': _recentThemes.length,
    'isTransitioning': _isTransitioning,
    'lastSearchQuery': _lastSearchQuery,
    'lastFilterCategory': _lastFilterCategory?.name,
  };

  /// Resetea el provider a su estado inicial
  Future<void> reset() async {
    _currentTheme = CorporateThemeCollection.executiveNavy;
    _favoriteThemes.clear();
    _recentThemes.clear();
    _isDarkMode = false;
    _isTransitioning = false;
    _lastSearchQuery = null;
    _lastFilterCategory = null;

    notifyListeners();
    await _savePreferences();
  }

  /// Aplica configuración de tema específica para demo
  void applyDemoConfiguration() {
    // Añadir algunos favoritos para demo
    _favoriteThemes = [
      CorporateThemeCollection.executiveNavy,
      TechnologyThemeCollection.cyberNeon,
      CreativeThemeCollection.designerMagenta,
    ];

    // Añadir algunos recientes para demo
    _recentThemes = [
      HealthcareThemeCollection.medicalBlue,
      FinancialThemeCollection.investmentGreen,
      EducationThemeCollection.academicBlue,
    ];

    notifyListeners();
  }

  @override
  void dispose() {
    // Limpiar recursos si es necesario
    super.dispose();
  }
}