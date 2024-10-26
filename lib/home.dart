import 'package:demoassignment/single_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'design_model.dart';

class Home extends StatelessWidget {
  Home({super.key});

  RxList<Product> products = <Product>[
    Product(
        id: 1,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image1.jpeg",
        rating: 4.6,
        isFavorite: false),
    Product(
        id: 2,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image2.jpeg",
        rating: 4.6,
        isFavorite: true),
    Product(
        id: 3,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image3.jpeg",
        rating: 4.6,
        isFavorite: false),
    Product(
        id: 4,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image4.jpeg",
        rating: 4.6,
        isFavorite: true),
    Product(
        id: 5,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image5.jpeg",
        rating: 4.6,
        isFavorite: false),
    Product(
        id: 6,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image6.jpeg",
        rating: 4.6,
        isFavorite: true),
    Product(
        id: 7,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image7.jpeg",
        rating: 4.6,
        isFavorite: false),
    Product(
        id: 8,
        title: "Greenfab",
        description: "Cotton khadi kurta set",
        price: 1500,
        image: "assets/image8.jpeg",
        rating: 4.6,
        isFavorite: true),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
            child: Text(
          'Kurtis',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Obx(
        () {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return InkWell(
                  onTap: () {
                    Get.to(
                      ProductDetailScreen(),
                    );
                  },
                  child: ProductCard(product: product));
            },
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              product.image,
              fit: BoxFit.fitHeight,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(product.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
