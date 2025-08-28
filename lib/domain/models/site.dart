import 'package:parts_finder/domain/models/product.dart';

class Site {
  bool success;
  String site;
  List<Product>? products;
  String? error;

  Site({
    required this.success,
    required this.site,
    required this.products,
    this.error,
  });

  factory Site.fromMap(Map<String, dynamic> json) {
    return Site(
      success: json['success'],
      site: json['site'],
      products: json['data']!=null ? (json['data']['products'] as List?)?.map((e) => Product.fromMap(e as Map<String, dynamic>)).toList() ?? [] : null,
      error: json['error'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'site': site,
      'products': products?.map((e) => e.toMap()).toList(),
      'error': error,
    };
  }

}
