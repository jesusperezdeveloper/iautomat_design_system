/// Validadores comunes para formularios en el Design System de IAutomat
///
/// Proporciona un conjunto completo de validadores reutilizables que
/// mantienen consistencia en los mensajes de error y la lógica de validación
/// a través de toda la aplicación.
///
/// Todos los validadores retornan null si la validación pasa,
/// o un String con el mensaje de error si falla.
///
/// Ejemplo de uso:
/// ```dart
/// AppInput(
///   validator: Validators.compose([
///     Validators.required('Este campo es obligatorio'),
///     Validators.email('Ingresa un email válido'),
///   ]),
/// )
/// ```
class Validators {
  Validators._();

  // ==========================================================================
  // VALIDADORES BÁSICOS
  // ==========================================================================

  /// Valida que el campo no esté vacío
  ///
  /// [message] Mensaje personalizado de error
  static String? Function(String?) required([
    String message = 'Este campo es obligatorio',
  ]) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return message;
      }
      return null;
    };
  }

  /// Valida longitud mínima del texto
  ///
  /// [minLength] Longitud mínima requerida
  /// [message] Mensaje personalizado de error
  static String? Function(String?) minLength(
    int minLength, [
    String? message,
  ]) {
    return (String? value) {
      if (value == null || value.length < minLength) {
        return message ?? 'Debe tener al menos $minLength caracteres';
      }
      return null;
    };
  }

  /// Valida longitud máxima del texto
  ///
  /// [maxLength] Longitud máxima permitida
  /// [message] Mensaje personalizado de error
  static String? Function(String?) maxLength(
    int maxLength, [
    String? message,
  ]) {
    return (String? value) {
      if (value != null && value.length > maxLength) {
        return message ?? 'No puede tener más de $maxLength caracteres';
      }
      return null;
    };
  }

  /// Valida que la longitud esté en un rango específico
  ///
  /// [min] Longitud mínima
  /// [max] Longitud máxima
  /// [message] Mensaje personalizado de error
  static String? Function(String?) lengthRange(
    int min,
    int max, [
    String? message,
  ]) {
    return (String? value) {
      if (value == null || value.length < min || value.length > max) {
        return message ?? 'Debe tener entre $min y $max caracteres';
      }
      return null;
    };
  }

  // ==========================================================================
  // VALIDADORES DE FORMATO
  // ==========================================================================

  /// Valida formato de email
  ///
  /// [message] Mensaje personalizado de error
  static String? Function(String?) email([
    String message = 'Ingresa un email válido',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// Valida formato de teléfono
  ///
  /// [message] Mensaje personalizado de error
  static String? Function(String?) phone([
    String message = 'Ingresa un número de teléfono válido',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      // Remover espacios y caracteres especiales
      final cleanValue = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

      // Validar que contenga solo números y tenga longitud apropiada
      final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');

      if (!phoneRegex.hasMatch(cleanValue)) {
        return message;
      }
      return null;
    };
  }

  /// Valida que contenga solo números
  ///
  /// [message] Mensaje personalizado de error
  static String? Function(String?) numeric([
    String message = 'Solo se permiten números',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final numericRegex = RegExp(r'^[0-9]+$');

      if (!numericRegex.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// Valida que sea un número decimal válido
  ///
  /// [message] Mensaje personalizado de error
  static String? Function(String?) decimal([
    String message = 'Ingresa un número válido',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (double.tryParse(value) == null) {
        return message;
      }
      return null;
    };
  }

  /// Valida formato de URL
  ///
  /// [message] Mensaje personalizado de error
  static String? Function(String?) url([
    String message = 'Ingresa una URL válida',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final urlRegex = RegExp(
        r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
      );

      if (!urlRegex.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  // ==========================================================================
  // VALIDADORES DE CONTRASEÑA
  // ==========================================================================

  /// Valida contraseña con requisitos básicos
  ///
  /// [minLength] Longitud mínima (default: 8)
  /// [message] Mensaje personalizado de error
  static String? Function(String?) password([
    int minLength = 8,
    String? message,
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (value.length < minLength) {
        return message ?? 'La contraseña debe tener al menos $minLength caracteres';
      }

      return null;
    };
  }

  /// Valida contraseña fuerte con múltiples requisitos
  ///
  /// [minLength] Longitud mínima (default: 8)
  /// [requireUppercase] Requiere al menos una mayúscula
  /// [requireLowercase] Requiere al menos una minúscula
  /// [requireNumbers] Requiere al menos un número
  /// [requireSpecialChars] Requiere al menos un carácter especial
  /// [message] Mensaje personalizado de error
  static String? Function(String?) strongPassword({
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireNumbers = true,
    bool requireSpecialChars = true,
    String? message,
  }) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final List<String> errors = [];

      if (value.length < minLength) {
        errors.add('$minLength caracteres mínimo');
      }

      if (requireUppercase && !value.contains(RegExp(r'[A-Z]'))) {
        errors.add('una mayúscula');
      }

      if (requireLowercase && !value.contains(RegExp(r'[a-z]'))) {
        errors.add('una minúscula');
      }

      if (requireNumbers && !value.contains(RegExp(r'[0-9]'))) {
        errors.add('un número');
      }

      if (requireSpecialChars && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        errors.add('un carácter especial');
      }

      if (errors.isNotEmpty) {
        return message ?? 'La contraseña debe incluir: ${errors.join(', ')}';
      }

      return null;
    };
  }

  /// Valida que dos contraseñas coincidan
  ///
  /// [password] La contraseña original a comparar
  /// [message] Mensaje personalizado de error
  static String? Function(String?) confirmPassword(
    String password, [
    String message = 'Las contraseñas no coinciden',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (value != password) {
        return message;
      }
      return null;
    };
  }

  // ==========================================================================
  // VALIDADORES NUMÉRICOS
  // ==========================================================================

  /// Valida que el número sea mayor que un valor mínimo
  ///
  /// [min] Valor mínimo
  /// [message] Mensaje personalizado de error
  static String? Function(String?) min(
    double min, [
    String? message,
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final number = double.tryParse(value);
      if (number == null || number < min) {
        return message ?? 'Debe ser mayor o igual a $min';
      }
      return null;
    };
  }

  /// Valida que el número sea menor que un valor máximo
  ///
  /// [max] Valor máximo
  /// [message] Mensaje personalizado de error
  static String? Function(String?) max(
    double max, [
    String? message,
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final number = double.tryParse(value);
      if (number == null || number > max) {
        return message ?? 'Debe ser menor o igual a $max';
      }
      return null;
    };
  }

  /// Valida que el número esté en un rango específico
  ///
  /// [min] Valor mínimo
  /// [max] Valor máximo
  /// [message] Mensaje personalizado de error
  static String? Function(String?) range(
    double min,
    double max, [
    String? message,
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final number = double.tryParse(value);
      if (number == null || number < min || number > max) {
        return message ?? 'Debe estar entre $min y $max';
      }
      return null;
    };
  }

  // ==========================================================================
  // VALIDADORES PERSONALIZADOS
  // ==========================================================================

  /// Valida usando una expresión regular personalizada
  ///
  /// [regex] Expresión regular a aplicar
  /// [message] Mensaje de error
  static String? Function(String?) pattern(
    RegExp regex,
    String message,
  ) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (!regex.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// Valida usando una función personalizada
  ///
  /// [validator] Función que retorna true si es válido
  /// [message] Mensaje de error
  static String? Function(String?) custom(
    bool Function(String) validator,
    String message,
  ) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      if (!validator(value)) {
        return message;
      }
      return null;
    };
  }

  // ==========================================================================
  // COMPOSICIÓN DE VALIDADORES
  // ==========================================================================

  /// Compone múltiples validadores en uno solo
  ///
  /// Ejecuta todos los validadores y retorna el primer error encontrado
  ///
  /// [validators] Lista de validadores a ejecutar
  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  /// Compone validadores con lógica OR
  ///
  /// Retorna error solo si TODOS los validadores fallan
  ///
  /// [validators] Lista de validadores alternativos
  /// [message] Mensaje de error si todos fallan
  static String? Function(String?) any(
    List<String? Function(String?)> validators,
    String message,
  ) {
    return (String? value) {
      for (final validator in validators) {
        if (validator(value) == null) {
          return null; // Al menos uno pasó
        }
      }
      return message; // Todos fallaron
    };
  }

  // ==========================================================================
  // VALIDADORES ESPECÍFICOS PARA IAUTOMAT
  // ==========================================================================

  /// Valida nombre completo (nombre y apellido)
  static String? Function(String?) fullName([
    String message = 'Ingresa tu nombre completo',
  ]) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;

      final parts = value.trim().split(RegExp(r'\s+'));
      if (parts.length < 2) {
        return message;
      }

      // Validar que cada parte tenga al menos 2 caracteres
      for (final part in parts) {
        if (part.length < 2) {
          return 'Cada nombre debe tener al menos 2 caracteres';
        }
      }

      return null;
    };
  }

  /// Valida código postal colombiano
  static String? Function(String?) colombianPostalCode([
    String message = 'Código postal inválido',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      // Código postal colombiano: 6 dígitos
      final postalCodeRegex = RegExp(r'^[0-9]{6}$');

      if (!postalCodeRegex.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// Valida cédula colombiana
  static String? Function(String?) colombianId([
    String message = 'Cédula inválida',
  ]) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      // Remover puntos y espacios
      final cleanValue = value.replaceAll(RegExp(r'[\.\s]'), '');

      // Validar que sean solo números y longitud apropiada
      if (!RegExp(r'^[0-9]{6,10}$').hasMatch(cleanValue)) {
        return message;
      }

      return null;
    };
  }

  // ==========================================================================
  // MENSAJES DE ERROR ESTÁNDAR
  // ==========================================================================

  /// Mensajes de error estandarizados para consistencia
  static const Map<String, String> standardMessages = {
    'required': 'Este campo es obligatorio',
    'email': 'Ingresa un email válido',
    'phone': 'Ingresa un número de teléfono válido',
    'password': 'La contraseña debe tener al menos 8 caracteres',
    'confirmPassword': 'Las contraseñas no coinciden',
    'numeric': 'Solo se permiten números',
    'url': 'Ingresa una URL válida',
    'minLength': 'Texto demasiado corto',
    'maxLength': 'Texto demasiado largo',
    'fullName': 'Ingresa tu nombre completo',
  };

  /// Obtiene un mensaje estándar por clave
  static String getMessage(String key) {
    return standardMessages[key] ?? 'Valor inválido';
  }
}