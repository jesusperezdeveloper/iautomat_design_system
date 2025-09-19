import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story que demuestra el uso del DSCurrencyInput
///
/// Incluye ejemplos de:
/// - Diferentes estados (default, focus, disabled, loading, skeleton)
/// - Diferentes monedas (USD, EUR, COP)
/// - Validación de rangos
/// - Formateo localizado
/// - Configuraciones personalizadas
class DSCurrencyInputStory extends StatefulWidget {
  const DSCurrencyInputStory({super.key});

  @override
  State<DSCurrencyInputStory> createState() => _DSCurrencyInputStoryState();
}

class _DSCurrencyInputStoryState extends State<DSCurrencyInputStory> {
  // Controllers para diferentes ejemplos
  final TextEditingController _basicController = TextEditingController();
  final TextEditingController _usdController = TextEditingController();
  final TextEditingController _eurController = TextEditingController();
  final TextEditingController _copController = TextEditingController();

  // Estados para demostrar diferentes configuraciones
  double _basicAmount = 0.0;
  double _usdAmount = 1250.50;
  double _eurAmount = 999.99;
  double _copAmount = 45000.0;

  bool _isLoading = false;
  bool _showSkeleton = false;

  @override
  void dispose() {
    _basicController.dispose();
    _usdController.dispose();
    _eurController.dispose();
    _copController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSCurrencyInput Story'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('DSCurrencyInput - Casos de Uso'),
            const SizedBox(height: 32),

            // Ejemplo básico
            _buildSection(
              'Ejemplo Básico',
              'Input básico de moneda con configuración por defecto',
              _buildBasicExample(),
            ),

            // Diferentes monedas
            _buildSection(
              'Diferentes Monedas',
              'Ejemplos con USD, EUR y COP con formateo localizado',
              _buildCurrencyExamples(),
            ),

            // Estados
            _buildSection(
              'Estados del Componente',
              'Demostración de diferentes estados visuales',
              _buildStateExamples(),
            ),

            // Validación
            _buildSection(
              'Validación y Rangos',
              'Ejemplos con validación de valores mínimos y máximos',
              _buildValidationExamples(),
            ),

            // Configuración personalizada
            _buildSection(
              'Configuración Personalizada',
              'Ejemplo con colores y espaciado personalizado',
              _buildCustomExample(),
            ),

            // Controles de prueba
            _buildSection(
              'Controles de Prueba',
              'Botones para probar diferentes estados',
              _buildTestControls(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
        ),
        const SizedBox(height: 16),
        content,
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Column(
      children: [
        DSCurrencyInput(
          controller: _basicController,
          amount: _basicAmount,
          currency: 'USD',
          label: 'Cantidad',
          hint: 'Ingrese una cantidad',
          helperText: 'Formato: \$1,234.56',
          onChanged: (value) {
            setState(() {
              _basicAmount = value.amount;
            });
          },
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Valor actual: \$${_basicAmount.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyExamples() {
    return Column(
      children: [
        // USD
        DSCurrencyInput(
          controller: _usdController,
          amount: _usdAmount,
          currency: 'USD',
          locale: const Locale('en', 'US'),
          label: 'Precio en USD',
          hint: 'Formato US',
          prefixIcon: Icons.attach_money,
          onChanged: (value) {
            setState(() {
              _usdAmount = value.amount;
            });
          },
        ),
        const SizedBox(height: 16),

        // EUR
        DSCurrencyInput(
          controller: _eurController,
          amount: _eurAmount,
          currency: 'EUR',
          locale: const Locale('es', 'ES'),
          label: 'Precio en EUR',
          hint: 'Formato europeo',
          prefixIcon: Icons.euro,
          onChanged: (value) {
            setState(() {
              _eurAmount = value.amount;
            });
          },
        ),
        const SizedBox(height: 16),

        // COP
        DSCurrencyInput(
          controller: _copController,
          amount: _copAmount,
          currency: 'COP',
          locale: const Locale('es', 'CO'),
          label: 'Precio en COP',
          hint: 'Formato colombiano',
          prefixIcon: Icons.payments,
          onChanged: (value) {
            setState(() {
              _copAmount = value.amount;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStateExamples() {
    return Column(
      children: [
        // Estado normal
        const DSCurrencyInput(
          amount: 150.0,
          currency: 'USD',
          label: 'Estado Normal',
          hint: 'Campo habilitado',
        ),
        const SizedBox(height: 16),

        // Estado deshabilitado
        const DSCurrencyInput(
          amount: 250.0,
          currency: 'USD',
          label: 'Estado Deshabilitado',
          hint: 'Campo deshabilitado',
          enabled: false,
        ),
        const SizedBox(height: 16),

        // Estado de solo lectura
        const DSCurrencyInput(
          amount: 350.0,
          currency: 'USD',
          label: 'Solo Lectura',
          hint: 'Campo de solo lectura',
          readOnly: true,
        ),
        const SizedBox(height: 16),

        // Estado loading
        DSCurrencyInput(
          amount: 450.0,
          currency: 'USD',
          label: 'Estado Loading',
          hint: 'Procesando...',
          initialState: _isLoading ? DSCurrencyInputState.loading : null,
        ),
        const SizedBox(height: 16),

        // Estado skeleton
        DSCurrencyInput(
          amount: 550.0,
          currency: 'USD',
          label: 'Estado Skeleton',
          hint: 'Cargando contenido...',
          initialState: _showSkeleton ? DSCurrencyInputState.skeleton : null,
        ),
      ],
    );
  }

  Widget _buildValidationExamples() {
    return Column(
      children: [
        // Validación con rango
        DSCurrencyInput(
          amount: 50.0,
          currency: 'USD',
          label: 'Rango 100-1000',
          hint: 'Mínimo \$100, máximo \$1000',
          helperText: 'Ingrese un valor entre \$100 y \$1000',
          validation: const DSCurrencyInputValidation(
            enabled: true,
            minAmount: 100.0,
            maxAmount: 1000.0,
          ),
          validator: (value) {
            if (value == null || value.amount < 100) {
              return 'El mínimo es \$100';
            }
            if (value.amount > 1000) {
              return 'El máximo es \$1000';
            }
            return null;
          },
          onChanged: (value) {
            // Manejar cambio
          },
        ),
        const SizedBox(height: 16),

        // Con error
        const DSCurrencyInput(
          amount: 50.0,
          currency: 'USD',
          label: 'Con Error',
          hint: 'Valor inválido',
          errorText: 'El valor debe ser mayor a \$100',
        ),
      ],
    );
  }

  Widget _buildCustomExample() {
    return DSCurrencyInput(
      amount: 1500.0,
      currency: 'USD',
      label: 'Configuración Personalizada',
      hint: 'Con colores y espaciado custom',
      helperText: 'Ejemplo con tema personalizado',
      config: DSCurrencyInputConfig(
        variant: DSCurrencyInputVariant.localized,
        colors: DSCurrencyInputColors(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1),
          borderColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          focusedBorderColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onSurface,
        ),
        spacing: const DSCurrencyInputSpacing(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          borderRadius: 12,
          borderWidth: 2,
        ),
      ),
      onChanged: (value) {
        // Manejar cambio
      },
    );
  }

  Widget _buildTestControls() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isLoading = !_isLoading;
            });
          },
          child: Text(_isLoading ? 'Quitar Loading' : 'Mostrar Loading'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showSkeleton = !_showSkeleton;
            });
          },
          child: Text(_showSkeleton ? 'Quitar Skeleton' : 'Mostrar Skeleton'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _basicAmount = 0.0;
              _usdAmount = 1250.50;
              _eurAmount = 999.99;
              _copAmount = 45000.0;
              _basicController.clear();
              _usdController.clear();
              _eurController.clear();
              _copController.clear();
            });
          },
          child: const Text('Reset Valores'),
        ),
      ],
    );
  }
}