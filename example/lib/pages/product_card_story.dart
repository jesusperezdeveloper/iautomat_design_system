import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story de DSProductCard con ejemplos y casos de uso
class ProductCardStory extends StatefulWidget {
  const ProductCardStory({super.key});

  @override
  State<ProductCardStory> createState() => _ProductCardStoryState();
}

class _ProductCardStoryState extends State<ProductCardStory> {
  // Estado de la configuración
  DSProductCardVariant _selectedVariant = DSProductCardVariant.discount;
  DSProductCardLayout _selectedLayout = DSProductCardLayout.vertical;
  DSProductCardState _selectedState = DSProductCardState.defaultState;
  bool _showImage = true;
  bool _showDiscountChip = true;
  bool _showAdditionalInfo = true;
  bool _showBadge = true;
  bool _darkMode = false;
  final Set<int> _selectedProducts = {};

  // Datos de ejemplo
  final List<ProductData> _products = [
    ProductData(
      id: 1,
      title: 'iPhone 15 Pro Max',
      price: 1199.99,
      originalPrice: 1399.99,
      image: 'https://via.placeholder.com/400/007AFF/FFFFFF?text=iPhone',
      discount: '-14%',
      badge: 'NEW',
      additionalInfo: 'Free shipping',
    ),
    ProductData(
      id: 2,
      title: 'Samsung Galaxy S24 Ultra',
      price: 1099.99,
      originalPrice: 1299.99,
      image: 'https://via.placeholder.com/400/1428A0/FFFFFF?text=Galaxy',
      discount: '-15%',
      badge: 'HOT',
      additionalInfo: '2-day delivery',
    ),
    ProductData(
      id: 3,
      title: 'MacBook Pro 16"',
      price: 2499.99,
      originalPrice: 2999.99,
      image: 'https://via.placeholder.com/400/5E5CE6/FFFFFF?text=MacBook',
      discount: '-17%',
      badge: 'SALE',
      additionalInfo: 'In stock',
    ),
    ProductData(
      id: 4,
      title: 'iPad Pro 12.9"',
      price: 999.99,
      originalPrice: 1199.99,
      image: 'https://via.placeholder.com/400/FF3B30/FFFFFF?text=iPad',
      discount: '-17%',
      additionalInfo: 'Limited offer',
    ),
    ProductData(
      id: 5,
      title: 'AirPods Pro 2',
      price: 199.99,
      originalPrice: 249.99,
      image: 'https://via.placeholder.com/400/34C759/FFFFFF?text=AirPods',
      discount: '-20%',
      additionalInfo: 'Best seller',
    ),
    ProductData(
      id: 6,
      title: 'Apple Watch Ultra 2',
      price: 799.99,
      originalPrice: null,
      image: 'https://via.placeholder.com/400/FF9500/FFFFFF?text=Watch',
      additionalInfo: 'New arrival',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = _darkMode ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: theme,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: _buildAppBar(),
        body: Row(
          children: [
            // Panel de control
            _buildControlPanel(),
            // Área de visualización
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('DSProductCard Story'),
      actions: [
        // Toggle dark mode
        IconButton(
          icon: Icon(_darkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            setState(() {
              _darkMode = !_darkMode;
            });
          },
        ),
        // Clear selection
        if (_selectedProducts.isNotEmpty)
          TextButton.icon(
            icon: const Icon(Icons.clear_all),
            label: Text('Clear (${_selectedProducts.length})'),
            onPressed: () {
              setState(() {
                _selectedProducts.clear();
              });
            },
          ),
      ],
    );
  }

  Widget _buildControlPanel() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Configuración'),
          const SizedBox(height: 16),

          // Variante
          _buildDropdown<DSProductCardVariant>(
            label: 'Variante',
            value: _selectedVariant,
            items: DSProductCardVariant.values,
            onChanged: (value) {
              setState(() {
                _selectedVariant = value!;
              });
            },
            itemLabel: (variant) => variant.displayName,
          ),
          const SizedBox(height: 16),

          // Layout
          _buildDropdown<DSProductCardLayout>(
            label: 'Layout',
            value: _selectedLayout,
            items: DSProductCardLayout.values,
            onChanged: (value) {
              setState(() {
                _selectedLayout = value!;
              });
            },
            itemLabel: (layout) => layout.name,
          ),
          const SizedBox(height: 16),

          // Estado
          _buildDropdown<DSProductCardState>(
            label: 'Estado',
            value: _selectedState,
            items: DSProductCardState.values,
            onChanged: (value) {
              setState(() {
                _selectedState = value!;
              });
            },
            itemLabel: (state) => state.displayName,
          ),
          const SizedBox(height: 24),

          _buildSectionTitle('Opciones'),
          const SizedBox(height: 16),

          SwitchListTile(
            title: const Text('Mostrar imagen'),
            value: _showImage,
            onChanged: (value) {
              setState(() {
                _showImage = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text('Mostrar chip descuento'),
            value: _showDiscountChip,
            onChanged: (value) {
              setState(() {
                _showDiscountChip = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text('Mostrar info adicional'),
            value: _showAdditionalInfo,
            onChanged: (value) {
              setState(() {
                _showAdditionalInfo = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text('Mostrar badge'),
            value: _showBadge,
            onChanged: (value) {
              setState(() {
                _showBadge = value;
              });
            },
          ),
          const SizedBox(height: 24),

          _buildSectionTitle('Ejemplos'),
          const SizedBox(height: 16),

          // Botones de ejemplos
          ElevatedButton(
            onPressed: _showEcommerceExample,
            child: const Text('E-commerce'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _showComparisonExample,
            child: const Text('Comparación'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _showAccessibilityExample,
            child: const Text('Accesibilidad'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        // Información de selección
        if (_selectedProducts.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  '${_selectedProducts.length} productos seleccionados',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Acción con productos seleccionados
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Productos seleccionados: ${_selectedProducts.join(", ")}',
                        ),
                      ),
                    );
                  },
                  child: const Text('Procesar'),
                ),
              ],
            ),
          ),

        // Grid de productos
        Expanded(
          child: _buildProductGrid(),
        ),
      ],
    );
  }

  Widget _buildProductGrid() {
    final isCompact = _selectedLayout == DSProductCardLayout.compact;
    final isHorizontal = _selectedLayout == DSProductCardLayout.horizontal;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isCompact
            ? 1
            : isHorizontal
                ? 2
                : _selectedLayout == DSProductCardLayout.overlay
                    ? 2
                    : 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: isCompact
            ? 4.0
            : isHorizontal
                ? 1.5
                : _selectedLayout == DSProductCardLayout.overlay
                    ? 1.0
                    : 0.7,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(ProductData product) {
    return DSProductCard(
      title: product.title,
      price: DSProductPrice(
        amount: product.price,
        currency: '\$',
        originalPrice: product.originalPrice,
        format: DSPriceFormat.withThousands,
      ),
      image: _showImage
          ? DSProductImage(
              url: product.image,
              errorWidget: const Center(
                child: Icon(Icons.image_not_supported, size: 48),
              ),
            )
          : null,
      discountChip: _showDiscountChip &&
              _selectedVariant == DSProductCardVariant.discount &&
              product.discount != null
          ? DSDiscountChip(
              text: product.discount!,
              icon: Icons.local_offer,
            )
          : null,
      variant: _selectedVariant,
      initialState: _selectedState,
      layout: _selectedLayout,
      selected: _selectedProducts.contains(product.id),
      enabled: _selectedState != DSProductCardState.disabled,
      additionalInfo: _showAdditionalInfo && product.additionalInfo != null
          ? Row(
              children: [
                Icon(
                  _getAdditionalInfoIcon(product.additionalInfo!),
                  size: 14,
                  color: Colors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  product.additionalInfo!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            )
          : null,
      badge: _showBadge && product.badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getBadgeColor(product.badge!),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                product.badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      onTap: () {
        setState(() {
          if (_selectedProducts.contains(product.id)) {
            _selectedProducts.remove(product.id);
          } else {
            _selectedProducts.add(product.id);
          }
        });
      },
      onLongPress: () {
        _showProductDetails(product);
      },
    );
  }

  IconData _getAdditionalInfoIcon(String info) {
    if (info.contains('shipping')) return Icons.local_shipping;
    if (info.contains('delivery')) return Icons.delivery_dining;
    if (info.contains('stock')) return Icons.inventory;
    if (info.contains('offer')) return Icons.local_offer;
    if (info.contains('seller')) return Icons.star;
    return Icons.info;
  }

  Color _getBadgeColor(String badge) {
    switch (badge) {
      case 'NEW':
        return Colors.blue;
      case 'HOT':
        return Colors.red;
      case 'SALE':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _showProductDetails(ProductData product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_showImage)
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.image, size: 48),
                  ),
                ),
              const SizedBox(height: 16),
              Text('Precio: \$${product.price}'),
              if (product.originalPrice != null)
                Text(
                  'Precio original: \$${product.originalPrice}',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              if (product.discount != null)
                Text('Descuento: ${product.discount}'),
              if (product.additionalInfo != null)
                Text('Info: ${product.additionalInfo}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  if (_selectedProducts.contains(product.id)) {
                    _selectedProducts.remove(product.id);
                  } else {
                    _selectedProducts.add(product.id);
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text(
                _selectedProducts.contains(product.id)
                    ? 'Deseleccionar'
                    : 'Seleccionar',
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEcommerceExample() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _EcommerceExample(),
      ),
    );
  }

  void _showComparisonExample() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _ComparisonExample(),
      ),
    );
  }

  void _showAccessibilityExample() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _AccessibilityExample(),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) itemLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(itemLabel(item)),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }
}

// Ejemplo de E-commerce
class _EcommerceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-commerce Example')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Productos destacados
          Text(
            'Productos destacados',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 250,
                  child: DSProductCard(
                    title: 'Producto Premium ${index + 1}',
                    price: DSProductPrice(
                      amount: 299.99 + (index * 100),
                      currency: '\$',
                      originalPrice: 399.99 + (index * 100),
                    ),
                    image: DSProductImage(
                      url: 'https://via.placeholder.com/400',
                    ),
                    variant: DSProductCardVariant.discount,
                    discountChip: DSDiscountChip(
                      text: '-25%',
                      backgroundColor: Colors.red,
                    ),
                    badge: Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.orange,
                      child: const Text(
                        'OFERTA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    additionalInfo: const Row(
                      children: [
                        Icon(Icons.flash_on, size: 14, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          'Envío rápido',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Producto ${index + 1} añadido al carrito'),
                          action: SnackBarAction(
                            label: 'DESHACER',
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Ejemplo de comparación
class _ComparisonExample extends StatefulWidget {
  @override
  State<_ComparisonExample> createState() => _ComparisonExampleState();
}

class _ComparisonExampleState extends State<_ComparisonExample> {
  final Set<int> _selectedForComparison = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparison Example'),
        actions: [
          if (_selectedForComparison.length >= 2)
            TextButton.icon(
              icon: const Icon(Icons.compare_arrows),
              label: Text('Comparar (${_selectedForComparison.length})'),
              onPressed: () {
                // Mostrar comparación
              },
            ),
        ],
      ),
      body: Column(
        children: [
          if (_selectedForComparison.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                'Selecciona al menos 2 productos para comparar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                final isSelected = _selectedForComparison.contains(index);
                return DSProductCard(
                  title: 'Laptop ${index + 1}',
                  price: DSProductPrice(
                    amount: 999.99 + (index * 200),
                    currency: '\$',
                  ),
                  image: DSProductImage(
                    url: 'https://via.placeholder.com/400',
                  ),
                  selected: isSelected,
                  onSelectionChanged: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedForComparison.add(index);
                      } else {
                        _selectedForComparison.remove(index);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Ejemplo de accesibilidad
class _AccessibilityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility Example')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Navegación por teclado',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text('• Tab: Navegar entre productos'),
                  const Text('• Enter: Activar/Ver detalles'),
                  const Text('• Espacio: Seleccionar/Deseleccionar'),
                  const Text('• Esc: Cancelar selección'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Productos con soporte completo de accesibilidad
          SizedBox(
            height: 400,
            child: DSProductCard(
              title: 'Producto con accesibilidad completa',
              price: const DSProductPrice(
                amount: 149.99,
                currency: '\$',
                originalPrice: 199.99,
              ),
              image: const DSProductImage(
                url: 'https://via.placeholder.com/400',
              ),
              variant: DSProductCardVariant.discount,
              discountChip: const DSDiscountChip(text: '-25%'),
              config: const DSProductCardConfig(
                a11yConfig: DSProductCardA11yConfig(
                  productLabel: 'Producto tecnológico',
                  priceLabel: 'Precio actual',
                  discountLabel: 'Descuento aplicado',
                  imageDescription: 'Imagen del producto mostrando sus características',
                  announceSelection: true,
                  announcePrice: true,
                  announceDiscount: true,
                  enableKeyboardNavigation: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Modelo de datos del producto
class ProductData {
  final int id;
  final String title;
  final double price;
  final double? originalPrice;
  final String image;
  final String? discount;
  final String? badge;
  final String? additionalInfo;

  ProductData({
    required this.id,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.image,
    this.discount,
    this.badge,
    this.additionalInfo,
  });
}