import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class ButtonsDemoScreen extends StatelessWidget {
  const ButtonsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Botones Demo'),
        backRoute: '/components',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Botones', style: DSTypography.h2),
            const SizedBox(height: 24),

            _buildSection(
              'Botones Elevados',
              'Botones principales con elevación y fondo sólido',
              _buildElevatedButtons(context),
            ),

            _buildSection(
              'Botones Outlined',
              'Botones secundarios con borde y fondo transparente',
              _buildOutlinedButtons(context),
            ),

            _buildSection(
              'Botones Filled',
              'Botones con relleno de color secundario',
              _buildFilledButtons(context),
            ),

            _buildSection(
              'Botones de Texto',
              'Botones sin elevación ni fondo',
              _buildTextButtons(context),
            ),

            _buildSection(
              'Estados de Botones',
              'Diferentes estados: normal, disabled, loading',
              _buildButtonStates(context),
            ),

            _buildSection(
              'Tamaños de Botones',
              'Diferentes tamaños disponibles',
              _buildButtonSizes(context),
            ),
          ],
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

  Widget _buildElevatedButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ElevatedButton(
          onPressed: () => _showMessage(context, 'ElevatedButton pressed'),
          child: const Text('Primary'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showMessage(context, 'ElevatedButton with icon pressed'),
          icon: const Icon(Icons.add),
          label: const Text('Con Ícono'),
        ),
        const ElevatedButton(
          onPressed: null,
          child: Text('Disabled'),
        ),
      ],
    );
  }

  Widget _buildOutlinedButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        OutlinedButton(
          onPressed: () => _showMessage(context, 'OutlinedButton pressed'),
          child: const Text('Secondary'),
        ),
        OutlinedButton.icon(
          onPressed: () => _showMessage(context, 'OutlinedButton with icon pressed'),
          icon: const Icon(Icons.edit),
          label: const Text('Con Ícono'),
        ),
        const OutlinedButton(
          onPressed: null,
          child: Text('Disabled'),
        ),
      ],
    );
  }

  Widget _buildFilledButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        FilledButton(
          onPressed: () => _showMessage(context, 'FilledButton pressed'),
          child: const Text('Filled'),
        ),
        FilledButton.icon(
          onPressed: () => _showMessage(context, 'FilledButton with icon pressed'),
          icon: const Icon(Icons.save),
          label: const Text('Con Ícono'),
        ),
        const FilledButton(
          onPressed: null,
          child: Text('Disabled'),
        ),
      ],
    );
  }

  Widget _buildTextButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        TextButton(
          onPressed: () => _showMessage(context, 'TextButton pressed'),
          child: const Text('Text Button'),
        ),
        TextButton.icon(
          onPressed: () => _showMessage(context, 'TextButton with icon pressed'),
          icon: const Icon(Icons.info),
          label: const Text('Con Ícono'),
        ),
        const TextButton(
          onPressed: null,
          child: Text('Disabled'),
        ),
      ],
    );
  }

  Widget _buildButtonStates(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _showMessage(context, 'Normal state'),
              child: const Text('Normal'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Simulación de botón loading
        ElevatedButton(
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 8),
              Text('Loading...'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSizes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Small buttons
        Row(
          children: [
            SizedBox(
              height: 32,
              child: ElevatedButton(
                onPressed: () => _showMessage(context, 'Small button'),
                child: const Text('Small'),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 32,
              child: OutlinedButton(
                onPressed: () => _showMessage(context, 'Small outlined'),
                child: const Text('Small'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Regular buttons
        Row(
          children: [
            ElevatedButton(
              onPressed: () => _showMessage(context, 'Regular button'),
              child: const Text('Regular'),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () => _showMessage(context, 'Regular outlined'),
              child: const Text('Regular'),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Large buttons
        Row(
          children: [
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () => _showMessage(context, 'Large button'),
                child: const Text('Large'),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 56,
              child: OutlinedButton(
                onPressed: () => _showMessage(context, 'Large outlined'),
                child: const Text('Large'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Full width button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _showMessage(context, 'Full width button'),
            child: const Text('Full Width'),
          ),
        ),
      ],
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}