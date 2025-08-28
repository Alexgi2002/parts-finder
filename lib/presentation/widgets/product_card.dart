import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../domain/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: product.link.isNotEmpty? () => launchUrlString(product.link, mode: LaunchMode.platformDefault) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: product.image,
              height: size.height * 0.15,
              width: size.width * 0.5,
              fit: BoxFit.cover,
              errorWidget: (context, error, stackTrace) => AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          // Text(
          //   product.availability,
          //   style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // Text(
          //   product.name,
          //   style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ],
      ),
    );
  }
}
