import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSCartWidgetStory extends StatefulWidget {
  const DSCartWidgetStory({super.key});

  @override
  State<DSCartWidgetStory> createState() => _DSCartWidgetStoryState();
}

class _DSCartWidgetStoryState extends State<DSCartWidgetStory>
    with TickerProviderStateMixin {
  DSCartVariant _selectedVariant = DSCartVariant.full;
  DSCartState _selectedState = DSCartState.defaultState;
  bool _isDarkMode = false;
  bool _isRTL = false;

  List<DSCartItem> _cartItems = [
    const DSCartItem(
      id: '1',
      name: 'Smartphone Premium',
      price: 899.99,
      quantity: 1,
      imageUrl: 'https://picsum.photos/200/200?random=1',
      description: 'Último modelo con características avanzadas y diseño elegante',
    ),
    const DSCartItem(
      id: '2',
      name: 'Auriculares Bluetooth',
      price: 149.99,
      quantity: 2,
      imageUrl: 'https://picsum.photos/200/200?random=2',
      description: 'Audio de alta calidad con cancelación de ruido',
    ),
    const DSCartItem(
      id: '3',
      name: 'Cargador Inalámbrico',
      price: 39.99,
      quantity: 1,
      imageUrl: 'https://picsum.photos/200/200?random=3',
      description: 'Carga rápida compatible con múltiples dispositivos',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSCartWidget Story',
      theme: _isDarkMode ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true),
      home: Directionality(
        textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('DSCartWidget Story'),
            actions: [
              IconButton(
                icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
                tooltip: _isDarkMode ? 'Modo claro' : 'Modo oscuro',
              ),
              IconButton(
                icon: const Icon(Icons.translate),
                onPressed: () => setState(() => _isRTL = !_isRTL),
                tooltip: _isRTL ? 'LTR' : 'RTL',
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildControls(),
                const SizedBox(height: 24),
                _buildCartDemo(),
                const SizedBox(height: 32),
                _buildExamples(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Controles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Variante:', style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      SegmentedButton<DSCartVariant>(
                        segments: const [
                          ButtonSegment(
                            value: DSCartVariant.mini,
                            label: Text('Mini'),
                            icon: Icon(Icons.summarize),
                          ),
                          ButtonSegment(
                            value: DSCartVariant.full,
                            label: Text('Full'),
                            icon: Icon(Icons.list),
                          ),
                        ],
                        selected: {_selectedVariant},
                        onSelectionChanged: (Set<DSCartVariant> selection) {
                          setState(() => _selectedVariant = selection.first);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Estado:', style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      DropdownButton<DSCartState>(
                        value: _selectedState,
                        isExpanded: true,
                        items: DSCartState.values.map((state) {
                          return DropdownMenuItem(
                            value: state,
                            child: Text(state.name),
                          );
                        }).toList(),
                        onChanged: (state) {
                          if (state != null) {
                            setState(() => _selectedState = state);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _addRandomItem,
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Agregar Item'),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _cartItems.isNotEmpty ? _removeLastItem : null,
                  icon: const Icon(Icons.remove_shopping_cart),
                  label: const Text('Remover Item'),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _cartItems.isNotEmpty ? _clearCart : null,
                  icon: const Icon(Icons.clear),
                  label: const Text('Limpiar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Demo - ${_selectedVariant.name.toUpperCase()} (${_selectedState.name})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: _selectedVariant == DSCartVariant.mini ? 200 : 500,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: DSCartWidget(
                  items: _cartItems,
                  variant: _selectedVariant,
                  initialState: _selectedState,
                  onQtyChange: _handleQuantityChange,
                  onCheckout: _handleCheckout,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejemplos de Uso',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Mini Variant Examples
        _buildExampleSection(
          'Variante Mini',
          'Perfecta para mostrar un resumen compacto del carrito',
          [
            _buildExampleCard(
              'Mini - Estado por defecto',
              DSCartWidget(
                items: _cartItems.take(2).toList(),
                variant: DSCartVariant.mini,
                onQtyChange: _handleQuantityChange,
                onCheckout: _handleCheckout,
              ),
              height: 150,
            ),
            _buildExampleCard(
              'Mini - Carrito vacío',
              const DSCartWidget(
                items: [],
                variant: DSCartVariant.mini,
              ),
              height: 150,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Full Variant Examples
        _buildExampleSection(
          'Variante Full',
          'Vista completa del carrito con todos los detalles',
          [
            _buildExampleCard(
              'Full - Con múltiples items',
              DSCartWidget(
                items: _cartItems,
                variant: DSCartVariant.full,
                onQtyChange: _handleQuantityChange,
                onCheckout: _handleCheckout,
              ),
              height: 400,
            ),
            _buildExampleCard(
              'Full - Estado loading',
              DSCartWidget(
                items: _cartItems,
                variant: DSCartVariant.full,
                initialState: DSCartState.loading,
              ),
              height: 400,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Custom Configuration Examples
        _buildExampleSection(
          'Configuraciones Personalizadas',
          'Ejemplos con configuraciones específicas',
          [
            _buildExampleCard(
              'Colores personalizados',
              DSCartWidget(
                items: _cartItems.take(2).toList(),
                config: const DSCartWidgetConfig(
                  variant: DSCartVariant.full,
                  colors: DSCartColors(
                    backgroundColor: Color(0xFFF8F9FA),
                    borderColor: Colors.grey,
                    headerColor: Colors.purple,
                    headerTextColor: Colors.white,
                    titleColor: Colors.black,
                    descriptionColor: Colors.grey,
                    priceColor: Colors.black,
                    totalColor: Colors.purple,
                    buttonPrimaryColor: Colors.purple,
                    buttonSecondaryColor: Colors.amber,
                    buttonTextColor: Colors.white,
                  ),
                ),
                onQtyChange: _handleQuantityChange,
                onCheckout: _handleCheckout,
              ),
              height: 350,
            ),
            _buildExampleCard(
              'Estado skeleton',
              const DSCartWidget(
                items: [],
                variant: DSCartVariant.full,
                initialState: DSCartState.skeleton,
              ),
              height: 350,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExampleSection(String title, String description, List<Widget> examples) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        ...examples.map((example) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: example,
        )),
      ],
    );
  }

  Widget _buildExampleCard(String title, Widget child, {double height = 300}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  void _addRandomItem() {
    final random = DateTime.now().millisecondsSinceEpoch;
    final newItem = DSCartItem(
      id: 'item_$random',
      name: 'Producto ${_cartItems.length + 1}',
      price: 50.0 + (random % 100),
      quantity: 1,
      imageUrl: 'https://picsum.photos/200/200?random=$random',
      description: 'Descripción del producto ${_cartItems.length + 1}',
    );

    setState(() {
      _cartItems = [..._cartItems, newItem];
    });
  }

  void _removeLastItem() {
    if (_cartItems.isNotEmpty) {
      setState(() {
        _cartItems = _cartItems.sublist(0, _cartItems.length - 1);
      });
    }
  }

  void _clearCart() {
    setState(() {
      _cartItems = [];
    });
  }

  void _handleQuantityChange(String itemId, int newQuantity) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        final item = _cartItems[index];
        _cartItems[index] = DSCartItem(
          id: item.id,
          name: item.name,
          price: item.price,
          quantity: newQuantity,
          description: item.description,
          imageUrl: item.imageUrl,
          category: item.category,
          available: item.available,
          maxQuantity: item.maxQuantity,
          minQuantity: item.minQuantity,
          originalPrice: item.originalPrice,
          metadata: item.metadata,
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cantidad actualizada para item $itemId: $newQuantity'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleCheckout(DSCartSummary summary) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Checkout'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Items: ${summary.itemCount}'),
            Text('Cantidad total: ${summary.totalQuantity}'),
            Text('Subtotal: \$${summary.subtotal.toStringAsFixed(2)}'),
            Text('Impuestos: \$${summary.taxes.toStringAsFixed(2)}'),
            Text('Envío: \$${summary.shipping.toStringAsFixed(2)}'),
            if (summary.discount > 0)
              Text('Descuento: -\$${summary.discount.toStringAsFixed(2)}'),
            const Divider(),
            Text(
              'Total: \$${summary.total.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Checkout completado!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}