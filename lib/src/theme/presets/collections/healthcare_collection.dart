import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas healthcare limpios y calmantes
///
/// Temas diseñados para el sector salud, clínicas, hospitales y aplicaciones
/// de bienestar que requieren transmitir confianza, limpieza y tranquilidad.
///
/// Características:
/// - Colores limpios y calmantes
/// - Tipografía clara y legible
/// - Espaciado generoso para claridad
/// - Excelente contraste para accesibilidad médica
class HealthcareThemeCollection {
  HealthcareThemeCollection._();

  /// Listado completo de temas healthcare
  static List<DSThemePreset> get themes => [
    medicalBlue,
    hospitalGreen,
    clinicTeal,
    therapyLavender,
    wellnessMint,
    pharmaceuticalWhite,
    healthcareNavy,
    dentalAqua,
    surgicalSilver,
    caregivingPowder,
  ];

  // ==========================================================================
  // MEDICAL BLUE - Azul médico con acentos blancos
  // ==========================================================================

  /// Tema confiable azul médico con pureza blanca para máxima confianza
  ///
  /// Ideal para: Hospitales, clínicas generales, centros médicos, consultorios
  /// Personalidad: Confiable, profesional, limpio, seguro
  static final medicalBlue = DSThemePreset(
    id: 'healthcare_medical_blue',
    displayName: 'Medical Blue',
    description: 'Azul médico confiable con pureza blanca para centros de salud',
    category: ThemeCategory.healthcare,
    industries: ['hospital', 'medical_clinic', 'healthcare_center', 'general_practice', 'medical_services'],
    keywords: ['trustworthy', 'professional', 'clean', 'safe', 'medical'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1976D2), // Azul médico
      secondary: const Color(0xFFFFFFFF), // Blanco puro
      tertiary: const Color(0xFF42A5F5),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF0D47A1),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2196F3),
      secondary: const Color(0xFFF5F5F5),
      tertiary: const Color(0xFF64B5F6),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Espaciado generoso para claridad
      typographyScale: 1.0, // Legibilidad estándar
      defaultBorderRadius: 8.0, // Bordes suaves pero no excesivos
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // HOSPITAL GREEN - Verde hospital con acentos azul
  // ==========================================================================

  /// Tema calmante verde hospital con toques azul tranquilizadores
  ///
  /// Ideal para: Salas de emergencia, quirófanos, centros de recuperación
  /// Personalidad: Calmante, sanador, equilibrado, natural
  static final hospitalGreen = DSThemePreset(
    id: 'healthcare_hospital_green',
    displayName: 'Hospital Green',
    description: 'Verde hospital calmante con azul para espacios de recuperación',
    category: ThemeCategory.healthcare,
    industries: ['emergency_room', 'surgery_center', 'recovery_center', 'medical_facility', 'healing_center'],
    keywords: ['calming', 'healing', 'balanced', 'natural', 'therapeutic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF388E3C), // Verde hospital
      secondary: const Color(0xFF2196F3), // Azul tranquilizador
      tertiary: const Color(0xFF66BB6A),
      surface: const Color(0xFFF1F8E9),
      onSurface: const Color(0xFF1B5E20),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4CAF50),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFF81C784),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 0.98,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CLINIC TEAL - Teal clínica con acentos suaves
  // ==========================================================================

  /// Tema sereno teal clínica con acentos suaves y relajantes
  ///
  /// Ideal para: Consultorios privados, clínicas especializadas, centros de bienestar
  /// Personalidad: Sereno, profesional, moderno, accesible
  static final clinicTeal = DSThemePreset(
    id: 'healthcare_clinic_teal',
    displayName: 'Clinic Teal',
    description: 'Teal sereno de clínica con acentos suaves para consultorios',
    category: ThemeCategory.healthcare,
    industries: ['private_practice', 'specialized_clinic', 'wellness_center', 'outpatient_clinic', 'medical_office'],
    keywords: ['serene', 'professional', 'modern', 'accessible', 'gentle'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF26A69A), // Teal clínica
      secondary: const Color(0xFFE0F2F1), // Verde suave
      tertiary: const Color(0xFF4DB6AC),
      surface: const Color(0xFFF0FDFA),
      onSurface: const Color(0xFF00695C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4DB6AC),
      secondary: const Color(0xFFB2DFDB),
      tertiary: const Color(0xFF80CBC4),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.02,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // THERAPY LAVENDER - Lavanda terapia con acentos verde
  // ==========================================================================

  /// Tema relajante lavanda terapia con toques verde naturales
  ///
  /// Ideal para: Terapia psicológica, salud mental, centros de relajación
  /// Personalidad: Relajante, terapéutico, comprensivo, calmante
  static final therapyLavender = DSThemePreset(
    id: 'healthcare_therapy_lavender',
    displayName: 'Therapy Lavender',
    description: 'Lavanda relajante con verde para terapia y salud mental',
    category: ThemeCategory.healthcare,
    industries: ['mental_health', 'therapy_center', 'psychology_practice', 'counseling', 'relaxation_center'],
    keywords: ['relaxing', 'therapeutic', 'understanding', 'calming', 'supportive'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9C27B0), // Lavanda terapia
      secondary: const Color(0xFF4CAF50), // Verde natural
      tertiary: const Color(0xFFBA68C8),
      surface: const Color(0xFFF3E5F5),
      onSurface: const Color(0xFF4A148C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFCE93D8),
      secondary: const Color(0xFF81C784),
      tertiary: const Color(0xFFE1BEE7),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Espacioso para relajación
      typographyScale: 1.0,
      defaultBorderRadius: 16.0, // Más suave
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // WELLNESS MINT - Menta bienestar con acentos azul
  // ==========================================================================

  /// Tema refrescante menta bienestar con claridad azul
  ///
  /// Ideal para: Spas médicos, centros de wellness, medicina preventiva
  /// Personalidad: Refrescante, revitalizante, puro, energizante
  static final wellnessMint = DSThemePreset(
    id: 'healthcare_wellness_mint',
    displayName: 'Wellness Mint',
    description: 'Menta refrescante con azul para centros de bienestar',
    category: ThemeCategory.healthcare,
    industries: ['medical_spa', 'wellness_center', 'preventive_medicine', 'holistic_health', 'fitness_health'],
    keywords: ['refreshing', 'revitalizing', 'pure', 'energizing', 'wellness'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00BCD4), // Menta bienestar
      secondary: const Color(0xFF03A9F4), // Azul claridad
      tertiary: const Color(0xFF26C6DA),
      surface: const Color(0xFFE0F7FA),
      onSurface: const Color(0xFF006064),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4DD0E1),
      secondary: const Color(0xFF29B6F6),
      tertiary: const Color(0xFF80DEEA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.05,
      defaultBorderRadius: 14.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // PHARMACEUTICAL WHITE - Blanco farmacéutico con acentos azul
  // ==========================================================================

  /// Tema puro blanco farmacéutico con acentos azul científicos
  ///
  /// Ideal para: Farmacias, laboratorios, investigación médica, farmacéuticas
  /// Personalidad: Puro, científico, preciso, confiable
  static final pharmaceuticalWhite = DSThemePreset(
    id: 'healthcare_pharmaceutical_white',
    displayName: 'Pharmaceutical White',
    description: 'Blanco farmacéutico puro con azul científico para laboratorios',
    category: ThemeCategory.healthcare,
    industries: ['pharmacy', 'laboratory', 'pharmaceutical', 'medical_research', 'clinical_trials'],
    keywords: ['pure', 'scientific', 'precise', 'reliable', 'clinical'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFFFFF), // Blanco farmacéutico
      secondary: const Color(0xFF1565C0), // Azul científico
      tertiary: const Color(0xFFE3F2FD),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF0D47A1),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF5F5F5),
      secondary: const Color(0xFF1976D2),
      tertiary: const Color(0xFFBBDEFB),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 0.95, // Más conservador para científico
      defaultBorderRadius: 6.0, // Más angular para precisión
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // HEALTHCARE NAVY - Navy salud con acentos verde
  // ==========================================================================

  /// Tema autoritativo navy salud con acentos verde esperanzadores
  ///
  /// Ideal para: Administración hospitalaria, seguros de salud, gestión sanitaria
  /// Personalidad: Autoritativo, confiable, establecido, seguro
  static final healthcareNavy = DSThemePreset(
    id: 'healthcare_navy',
    displayName: 'Healthcare Navy',
    description: 'Navy autoritativo con verde esperanzador para gestión sanitaria',
    category: ThemeCategory.healthcare,
    industries: ['hospital_administration', 'health_insurance', 'healthcare_management', 'medical_administration', 'health_systems'],
    keywords: ['authoritative', 'trustworthy', 'established', 'secure', 'professional'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0D47A1), // Navy salud
      secondary: const Color(0xFF2E7D32), // Verde esperanza
      tertiary: const Color(0xFF1976D2),
      surface: const Color(0xFFF8F9FA),
      onSurface: const Color(0xFF01579B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1976D2),
      secondary: const Color(0xFF388E3C),
      tertiary: const Color(0xFF42A5F5),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 0.98,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // DENTAL AQUA - Aqua dental con acentos gris
  // ==========================================================================

  /// Tema limpio aqua dental con sofisticación gris
  ///
  /// Ideal para: Consultorios dentales, ortodoncia, cirugía oral, higiene dental
  /// Personalidad: Limpio, fresco, preciso, moderno
  static final dentalAqua = DSThemePreset(
    id: 'healthcare_dental_aqua',
    displayName: 'Dental Aqua',
    description: 'Aqua dental limpio con sofisticación gris para odontología',
    category: ThemeCategory.healthcare,
    industries: ['dental_clinic', 'orthodontics', 'oral_surgery', 'dental_hygiene', 'cosmetic_dentistry'],
    keywords: ['clean', 'fresh', 'precise', 'modern', 'hygienic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00ACC1), // Aqua dental
      secondary: const Color(0xFF78909C), // Gris sofisticado
      tertiary: const Color(0xFF26C6DA),
      surface: const Color(0xFFE0F6FF),
      onSurface: const Color(0xFF004D5C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF26C6DA),
      secondary: const Color(0xFF90A4AE),
      tertiary: const Color(0xFF4DD0E1),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.02,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SURGICAL SILVER - Plata quirúrgica con acentos azul
  // ==========================================================================

  /// Tema preciso plata quirúrgica con toques azul tecnológicos
  ///
  /// Ideal para: Quirófanos, cirugía especializada, medicina de precisión
  /// Personalidad: Preciso, tecnológico, sterile, avanzado
  static final surgicalSilver = DSThemePreset(
    id: 'healthcare_surgical_silver',
    displayName: 'Surgical Silver',
    description: 'Plata quirúrgica precisa con azul tecnológico para cirugía',
    category: ThemeCategory.healthcare,
    industries: ['surgery_center', 'operating_room', 'surgical_specialty', 'precision_medicine', 'medical_technology'],
    keywords: ['precise', 'technological', 'sterile', 'advanced', 'surgical'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF90A4AE), // Plata quirúrgica
      secondary: const Color(0xFF1976D2), // Azul tecnológico
      tertiary: const Color(0xFFCFD8DC),
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF263238),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFCFD8DC),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFFECEFF1),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0, // Más compacto para precisión
      typographyScale: 0.95,
      defaultBorderRadius: 4.0, // Muy angular para quirúrgico
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CAREGIVING POWDER - Polvo cuidador con acentos cálidos
  // ==========================================================================

  /// Tema cálido polvo cuidador con acentos cálidos para cuidados
  ///
  /// Ideal para: Cuidados paliativos, enfermería, hogares geriátricos, cuidados domiciliarios
  /// Personalidad: Cálido, compasivo, cuidador, humano
  static final caregivingPowder = DSThemePreset(
    id: 'healthcare_caregiving_powder',
    displayName: 'Caregiving Powder',
    description: 'Polvo cálido con acentos cálidos para cuidados compasivos',
    category: ThemeCategory.healthcare,
    industries: ['palliative_care', 'nursing_home', 'elder_care', 'home_healthcare', 'hospice_care'],
    keywords: ['warm', 'compassionate', 'caring', 'human', 'gentle'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEFEBE9), // Polvo cuidador
      secondary: const Color(0xFFFF8A65), // Naranja cálido
      tertiary: const Color(0xFFF5F5F5),
      surface: const Color(0xFFFFF8E1),
      onSurface: const Color(0xFF3E2723),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD7CCC8),
      secondary: const Color(0xFFFFAB91),
      tertiary: const Color(0xFFE0E0E0),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Espacioso para comodidad
      typographyScale: 1.05, // Más legible para todas las edades
      defaultBorderRadius: 16.0, // Muy suave
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );
}