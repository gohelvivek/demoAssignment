import 'package:demoassignment/single_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  RxList<Product> products = <Product>[
    Product(
      id: 1,
      title: "Greenfab",
      description: "Cotton Khadi Kurta Set",
      price: 1500,
      originalPrice: 2000,
      discount: "25% off",
      taxInfo: "Inclusive of all taxes",
      images: ["assets/image1.jpeg"],
      rating: 4.6,
      isFavorite: true,
      availableSizes: ["XS", "S", "M", "L", "XL"],
      selectedSize: "XS",
      deliveryServices: DeliveryServices(
        pincode: "",
        status: "pending",
      ),
      productDetails: ProductDetails(
        details1: "Lorem ipsum : dolor s",
        details2: "Lore : dolor sit amet",
        details3: "Lorem ipsum : dolor",
        details4: "Lorem ipsum : doloet",
        details5: "Lorem ipsum : dolomet",
      ),
      extraInfo: "100% Genuine Khadi Product",
    ),
    // You can add additional products here in a similar way
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products.first.title),
        actions: [
          IconButton(
            icon: Icon(
              products.first.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: products.first.isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              // Handle favorite toggle
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(
              products.first.images.isNotEmpty
                  ? products.first.images[0]
                  : 'assets/image.jpeg',
              height: 300,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title, Price, and Discount
                  Text(
                    products.first.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "₹${products.first.price}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹${products.first.originalPrice}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        products.first.discount,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    products.first.taxInfo,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  // Size selection
                  const SizedBox(height: 16),
                  const Text(
                    "Available Sizes",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: products.first.availableSizes.map((size) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: ChoiceChip(
                          label: Text(size),
                          selected: products.first.selectedSize == size,
                          onSelected: (bool selected) {
                            // Handle size selection
                          },
                        ),
                      );
                    }).toList(),
                  ),

                  // Add to Bag and Wishlist Buttons
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add to cart action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Add to Bag',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Add to wishlist action
                          },
                          child: const Text(
                            'Wishlist',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Delivery Services
                  const SizedBox(height: 16),
                  const Text(
                    "Delivery and Services",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter Pincode',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Delivery status: ${products.first.deliveryServices.status}",
                    style: const TextStyle(color: Colors.grey),
                  ),

                  // Product Details
                  const SizedBox(height: 16),
                  const Text(
                    "Product Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildProductDetails(products.first.productDetails),

                  // Extra Information
                  const SizedBox(height: 16),
                  Text(
                    products.first.extraInfo,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails(ProductDetails details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(details.details1),
        Text(details.details2),
        Text(details.details3),
        Text(details.details4),
        Text(details.details5),
      ],
    );
  }
}
