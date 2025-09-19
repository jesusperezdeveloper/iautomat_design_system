import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Página de demostración simplificada para temas corporativos
class CorporateThemeDemoPage extends StatefulWidget {
  const CorporateThemeDemoPage({super.key});

  @override
  State<CorporateThemeDemoPage> createState() => _CorporateThemeDemoPageState();
}

class _CorporateThemeDemoPageState extends State<CorporateThemeDemoPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // Crear un tema usando los presets existentes
    final currentTheme = _isDarkMode
        ? CorporateThemeCollection.executiveNavy.darkTheme
        : CorporateThemeCollection.executiveNavy.lightTheme;

    return Theme(
      data: currentTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo de Tema Corporativo'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildThemeSelector(),
              const SizedBox(height: 24),
              _buildThemePreviewSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seleccionar Tema',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Temas disponibles del Design System:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildThemeChip('Executive Navy', CorporateThemeCollection.executiveNavy),
                _buildThemeChip('Corporate Steel', CorporateThemeCollection.corporateSteel),
                _buildThemeChip('Professional Slate', CorporateThemeCollection.professionalSlate),
                _buildThemeChip('Business Charcoal', CorporateThemeCollection.businessCharcoal),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeChip(String name, DSThemePreset preset) {
    return FilterChip(
      label: Text(name),
      selected: false,
      onSelected: (selected) {
        // En una implementación real, aquí se cambiaría el tema
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tema "$name" seleccionado')),
        );
      },
    );
  }

  Widget _buildThemePreviewSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vista Previa del Tema',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            // Botones
            const Text('Botones:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Primario'),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Cards
            const Text('Cards:'),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _previewCard('Card 1', 'Contenido de ejemplo'),
                  const SizedBox(width: 8),
                  _previewCard('Card 2', 'Más contenido'),
                  const SizedBox(width: 8),
                  _previewCard('Card 3', 'Y más contenido'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Inputs
            const Text('Campos de entrada:'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Campo de texto',
                hintText: 'Ingresa algo aquí...',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Lista
            const Text('Lista:'),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text('Elemento $index'),
                subtitle: Text('Descripción del elemento $index'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _previewCard(String title, String content) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}