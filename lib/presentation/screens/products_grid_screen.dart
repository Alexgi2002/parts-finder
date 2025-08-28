import 'package:flutter/material.dart';
import '../../domain/models/site.dart';
import '../../data/api_service.dart';
import '../widgets/product_card.dart';

class ProductsGridScreen extends StatefulWidget {
  const ProductsGridScreen({super.key});

  @override
  State<ProductsGridScreen> createState() => _ProductsGridScreenState();
}

class _ProductsGridScreenState extends State<ProductsGridScreen> with TickerProviderStateMixin {
  late final TextEditingController _controller = TextEditingController();
  String _query = '';
  bool _loading = false;
  List<Site> _sites = [];
  // int _selectedTab = 0;
  final ApiService _apiService = ApiService();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TextEditingController(text: widget.initialQuery ?? '');
  //   _query = widget.initialQuery ?? '';
  //   if (widget.products.isNotEmpty) {
  //     // Si hay productos iniciales, crear un Site ficticio
  //     _sites = [Site(success: true, site: 'Results', products: widget.products)];
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    if (_query.trim().isEmpty) return;
    setState(() { _loading = true; });
    try {
      final sites = await _apiService.searchSites(_query);
      setState(() {
        _sites = sites;
      });
    } catch (e) {
      setState(() { _sites = []; });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading results: ' + e.toString())),
      );
    } finally {
      setState(() { _loading = false; });
    }
  }

  // List<Product> get filteredProducts {
  //   if (_query.isEmpty) return widget.products;
  //   return widget.products.where((p) => p.name.toLowerCase().contains(_query.toLowerCase())).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final tabs = _sites.map((s) => s.site).toList();
    final products = _sites.map((s) => s.products).toList();
    // final errors = _sites.map((s) => s.error).toList();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PartsFinder', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          // backgroundColor: Colors.white,
          elevation: 0,
          // foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                onChanged: (value) => setState(() => _query = value),
                onSubmitted: (_) => _search(),
                decoration: InputDecoration(
                  hintText: 'Search for tools',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _controller.clear();
                            setState(() { _query = ''; _sites = []; });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: const Color.fromARGB(159, 223, 223, 223),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              if (_loading)
                const LinearProgressIndicator(minHeight: 2),
              if (!_loading && tabs.isNotEmpty)
                SizedBox(
                  height: 36,
                  child: TabBar(
                    tabs: tabs.map((e) => Tab(text: e)).toList(),
                    isScrollable: true,
                    dividerColor: const Color.fromARGB(200, 238, 238, 238),
                    indicatorColor: Theme.of(context).iconTheme.color,
                    labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).iconTheme.color),
                    unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey[600]),
                  )
                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: tabs.length,
                  //   itemBuilder: (context, i) => GestureDetector(
                  //     onTap: () => setState(() => _selectedTab = i),
                  //     child: _TabChip(label: tabs[i], selected: i == _selectedTab),
                  //   ),
                  // ),
                ),
              if (!_loading) const SizedBox(height: 16),
              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : products.isEmpty ? const Center(child: Text('No products found'))
                    : TabBarView(
                      children: products.map((e) => 
                        e==null? const Center(child: Text('Error loading products'))
                        : e.isEmpty
                        ? const Center(child: Text('No products found'))
                        : GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: e.length,
                            itemBuilder: (context, index) {
                              return ProductCard(product: e[index]);
                            },
                          )
                      ).toList(),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _TabChip extends StatelessWidget {
//   final String label;
//   final bool selected;
//   const _TabChip({required this.label, this.selected = false});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 12.0),
//       child: Text(
//         label,
//         style: TextStyle(
//           fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//           fontSize: 15,
//           color: selected ? Colors.black : Colors.grey[600],
//         ),
//       ),
//     );
//   }
// }
