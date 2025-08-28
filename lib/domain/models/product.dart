class Product {
  String name;
  String sku;
  String price;
  String image;
  String link;
  String site;
  String availability;
  String description;
  String manufacturer;

  Product({
    required this.name,
    required this.sku,
    required this.price,
    required this.image,
    required this.link,
    required this.site,
    required this.availability,
    required this.description,
    required this.manufacturer,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      sku: json['sku'],
      price: json['price'],
      image: json['image'],
      link: json['link'],
      site: json['site'],
      availability: json['availability'],
      description: json['description'],
      manufacturer: json['manufacturer'],
    );
  }

    Map<String, dynamic> toMap() {
      return {
        'name': name,
        'sku': sku,
        'price': price,
        'image': image,
        'link': link,
        'site': site,
        'availability': availability,
        'description': description,
        'manufacturer': manufacturer,
      };
    }
}
