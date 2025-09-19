/// Exportaciones centralizadas de todas las colecciones de temas
///
/// Este archivo centraliza el acceso a las 10 colecciones de temas
/// profesionales del Design System de IAutomat, proporcionando
/// 100 temas categorizados y listos para usar.
library;

// Modelo base y enums
export 'theme_preset_model.dart';

// Catálogo central con búsqueda y filtros
export 'theme_catalog.dart';

// Colecciones individuales por categoría
export 'collections/corporate_collection.dart';
export 'collections/technology_collection.dart';
export 'collections/creative_collection.dart';
export 'collections/healthcare_collection.dart';
export 'collections/financial_collection.dart';
export 'collections/education_collection.dart';
export 'collections/retail_collection.dart';
export 'collections/industrial_collection.dart';
export 'collections/government_collection.dart';
export 'collections/specialized_collection.dart';