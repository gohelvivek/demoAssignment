class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double originalPrice;
  final String discount;
  final String taxInfo;
  final List<String> images;
  final double rating;
  final bool isFavorite;
  final List<String> availableSizes;
  String selectedSize;
  final DeliveryServices deliveryServices;
  final ProductDetails productDetails;
  final String extraInfo;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.taxInfo,
    required this.images,
    required this.rating,
    required this.isFavorite,
    required this.availableSizes,
    required this.selectedSize,
    required this.deliveryServices,
    required this.productDetails,
    required this.extraInfo,
  });

  // Factory method to create an instance of Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      originalPrice: json['originalPrice'].toDouble(),
      discount: json['discount'],
      taxInfo: json['taxInfo'],
      images: List<String>.from(json['images']),
      rating: json['rating'].toDouble(),
      isFavorite: json['isFavorite'],
      availableSizes: List<String>.from(json['availableSizes']),
      selectedSize: json['selectedSize'],
      deliveryServices: DeliveryServices.fromJson(json['deliveryServices']),
      productDetails: ProductDetails.fromJson(json['productDetails']),
      extraInfo: json['extraInfo'],
    );
  }

  // Convert the Product object back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'originalPrice': originalPrice,
      'discount': discount,
      'taxInfo': taxInfo,
      'images': images,
      'rating': rating,
      'isFavorite': isFavorite,
      'availableSizes': availableSizes,
      'selectedSize': selectedSize,
      'deliveryServices': deliveryServices.toJson(),
      'productDetails': productDetails.toJson(),
      'extraInfo': extraInfo,
    };
  }
}

class DeliveryServices {
  String pincode;
  String status;

  DeliveryServices({required this.pincode, required this.status});

  factory DeliveryServices.fromJson(Map<String, dynamic> json) {
    return DeliveryServices(
      pincode: json['pincode'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pincode': pincode,
      'status': status,
    };
  }
}

class ProductDetails {
  final String details1;
  final String details2;
  final String details3;
  final String details4;
  final String details5;

  ProductDetails({
    required this.details1,
    required this.details2,
    required this.details3,
    required this.details4,
    required this.details5,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      details1: json['details1'],
      details2: json['details2'],
      details3: json['details3'],
      details4: json['details4'],
      details5: json['details5'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details1': details1,
      'details2': details2,
      'details3': details3,
      'details4': details4,
      'details5': details5,
    };
  }
}
