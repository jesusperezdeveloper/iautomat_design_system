import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class InputsDemoScreen extends StatefulWidget {
  const InputsDemoScreen({super.key});

  @override
  State<InputsDemoScreen> createState() => _InputsDemoScreenState();
}

class _InputsDemoScreenState extends State<InputsDemoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _commentsController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Inputs Demo'),
        backRoute: '/components',
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Campos de Entrada', style: DSTypography.h2),
              const SizedBox(height: 24),

              _buildSection(
                'Campos Básicos',
                'Campos de texto estándar con diferentes configuraciones',
                _buildBasicInputs(),
              ),

              _buildSection(
                'Campos con Validación',
                'Campos con validación y mensajes de error',
                _buildValidatedInputs(),
              ),

              _buildSection(
                'Campos Especializados',
                'Campos para casos específicos',
                _buildSpecializedInputs(),
              ),

              _buildSection(
                'Estados de Campos',
                'Diferentes estados: enabled, disabled, error',
                _buildInputStates(),
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _validateForm,
                  child: const Text('Validar Formulario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h4),
        const SizedBox(height: 8),
        Text(description, style: DSTypography.bodyMedium),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildBasicInputs() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Nombre',
            hintText: 'Ingresa tu nombre completo',
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'ejemplo@correo.com',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Teléfono',
            hintText: '+1 234 567 8900',
            prefixIcon: Icon(Icons.phone),
            suffixIcon: Icon(Icons.help_outline),
          ),
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildValidatedInputs() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email *',
            hintText: 'Ingresa tu email',
            prefixIcon: Icon(Icons.email),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Email es requerido';
            }
            if (!value!.contains('@')) {
              return 'Email no válido';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            labelText: 'Contraseña *',
            hintText: 'Mínimo 8 caracteres',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Contraseña es requerida';
            }
            if (value!.length < 8) {
              return 'Contraseña debe tener al menos 8 caracteres';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Confirmar Contraseña *',
            hintText: 'Repite tu contraseña',
            prefixIcon: Icon(Icons.lock_outline),
          ),
          obscureText: true,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Confirmación es requerida';
            }
            if (value != _passwordController.text) {
              return 'Las contraseñas no coinciden';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSpecializedInputs() {
    return Column(
      children: [
        TextFormField(
          controller: _commentsController,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Comentarios',
            hintText: 'Escribe tus comentarios aquí...',
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Búsqueda',
            hintText: 'Buscar...',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.clear),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Precio',
            hintText: '0.00',
            prefixText: '\$ ',
            suffixText: 'USD',
          ),
        ),
      ],
    );
  }

  Widget _buildInputStates() {
    return Column(
      children: [
        // Enabled
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Campo Habilitado',
            hintText: 'Puedes escribir aquí',
          ),
        ),
        const SizedBox(height: 16),

        // Disabled
        TextFormField(
          enabled: false,
          decoration: const InputDecoration(
            labelText: 'Campo Deshabilitado',
            hintText: 'No puedes escribir aquí',
          ),
        ),
        const SizedBox(height: 16),

        // Con valor inicial
        TextFormField(
          initialValue: 'Texto predefinido',
          decoration: const InputDecoration(
            labelText: 'Con Valor Inicial',
            hintText: 'Texto por defecto',
          ),
        ),
        const SizedBox(height: 16),

        // Con error (simulado)
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Campo con Error',
            hintText: 'Ingresa un valor válido',
            errorText: 'Este campo contiene un error',
          ),
        ),
      ],
    );
  }

  void _validateForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Formulario válido!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor corrige los errores'),
        ),
      );
    }
  }
}