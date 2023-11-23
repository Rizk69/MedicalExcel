import 'dart:convert';

class ProductModel {
  int? totalSize;
  List<Product>? _products;
  int? limit;
  int? offset;

  ProductModel(
      {int? totalSize, int? limit, int? offset, List<Product>? products}) {
    totalSize = totalSize;
    limit = limit;
    offset = offset;
    _products = products;
  }

  List<Product>? get products => _products;

  ProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = int.parse(json['limit'].toString());
    offset = int.parse(json['offset'].toString());
    if (json['products'] != null) {
      _products = products ?? [];
      json['products'].forEach((v) {
        _products!.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  int? _id;
  String? _addedBy;
  int? _userId;
  String? _name;
  String? _slug;
  String? _productType;
  List<CategoryIds>? _categoryIds;
  String? _unit;
  List<String>? _images;
  String? _thumbnail;
  List<ProductColors>? _colors;
  List<String>? _attributes;
  List<ChoiceOptions>? _choiceOptions;
  List<Variation>? _variation;
  double? _unitPrice;
  double? _purchasePrice;
  double? _tax;
  String? _taxModel;
  int? _minQty;
  int? _refundable;
  String? _digitalProductType;
  String? _digitalFileReady;
  String? _taxType;
  double? _discount;
  String? _discountType;
  int? _currentStock;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
  List<Rating>? _rating;
  double? _shippingCost;
  int? _isMultiPly;
  int? _reviewCount;
  String? _videoUrl;
  int? _minimumOrderQty;
  int? wishList;
  Brand? brand;

  Product({
    int? id,
    String? addedBy,
    int? userId,
    String? name,
    String? slug,
    String? productType,
    List<CategoryIds>? categoryIds,
    String? unit,
    int? minQty,
    int? refundable,
    String? digitalProductType,
    String? digitalFileReady,
    List<String>? images,
    String? thumbnail,
    List<ProductColors>? colors,
    String? variantProduct,
    List<String>? attributes,
    List<ChoiceOptions>? choiceOptions,
    List<Variation>? variation,
    double? unitPrice,
    double? purchasePrice,
    double? tax,
    String? taxModel,
    String? taxType,
    double? discount,
    String? discountType,
    int? currentStock,
    String? details,
    String? attachment,
    String? createdAt,
    String? updatedAt,
    int? featuredStatus,
    List<Rating>? rating,
    double? shippingCost,
    int? isMultiPly,
    int? reviewCount,
    String? videoUrl,
    int? minimumOrderQty,
    int? wishList,
    Brand? brand,
  }) {
    _id = id;
    _addedBy = addedBy;
    _userId = userId;
    _name = name;
    _slug = slug;
    _categoryIds = categoryIds;
    _unit = unit;
    _minQty = minQty;
    if (refundable != null) {
      _refundable = refundable;
    }
    if (digitalProductType != null) {
      _digitalProductType = digitalProductType;
    }
    if (digitalFileReady != null) {
      _digitalFileReady = digitalFileReady;
    }
    _images = images;
    _thumbnail = thumbnail;
    _colors = colors;
    _attributes = attributes;
    _choiceOptions = choiceOptions;
    _variation = variation;
    _unitPrice = unitPrice;
    _purchasePrice = purchasePrice;
    _tax = tax;
    _taxModel = taxModel;
    _taxType = taxType;
    _discount = discount;
    _discountType = discountType;
    _currentStock = currentStock;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _rating = rating;
    _shippingCost = shippingCost;
    _isMultiPly = isMultiPly;
    _reviewCount = reviewCount;
    if (videoUrl != null) {
      _videoUrl = videoUrl;
    }
    _minimumOrderQty = minimumOrderQty;
    this.wishList;
    this.brand;
  }

  int? get id => _id;
  String? get addedBy => _addedBy;
  int? get userId => _userId;
  String? get name => _name;
  String? get slug => _slug;
  String? get productType => _productType;
  List<CategoryIds>? get categoryIds => _categoryIds;
  String? get unit => _unit;
  int? get minQty => _minQty;
  int? get refundable => _refundable;
  String? get digitalProductType => _digitalProductType;
  String? get digitalFileReady => _digitalFileReady;
  List<String>? get images => _images;
  String? get thumbnail => _thumbnail;
  List<ProductColors>? get colors => _colors;
  List<String>? get attributes => _attributes;
  List<ChoiceOptions>? get choiceOptions => _choiceOptions;
  List<Variation>? get variation => _variation;
  double? get unitPrice => _unitPrice;
  double? get purchasePrice => _purchasePrice;
  double? get tax => _tax;
  String? get taxModel => _taxModel;
  String? get taxType => _taxType;
  double? get discount => _discount;
  String? get discountType => _discountType;
  int? get currentStock => _currentStock;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Rating>? get rating => _rating;
  double? get shippingCost => _shippingCost;
  int? get isMultiPly => _isMultiPly;
  int? get reviewCount => _reviewCount;
  String? get videoUrl => _videoUrl;
  int? get minimumOrderQuantity => _minimumOrderQty;

  // Product.fromJson(Map<String, dynamic> json) {
  //   _id = json['id'];
  //   _addedBy = json['added_by'];
  //   _userId = json['user_id'];
  //   _name = json['name'];
  //   _slug = json['slug'];
  //   _productType = json['product_type'];
  //   if (json['category_ids'] != null) {
  //     _categoryIds = [];
  //     if (json['category_ids'] is List) {
  //       json['category_ids'].forEach((v) {
  //         _categoryIds!.add(CategoryIds.fromJson(v));
  //       });
  //     }
  //   }
  //
  //   // if (json['category_ids'] != null) {
  //   //   _categoryIds = [];
  //   //   try{
  //   //     json['category_ids'].forEach((v) {
  //   //       _categoryIds!.add(CategoryIds.fromJson(v));
  //   //     });
  //   //   }catch(e){
  //   //     jsonDecode(json['category_ids']).forEach((v) {
  //   //       _categoryIds!.add(CategoryIds.fromJson(v));
  //   //     });
  //   //   }
  //   // }
  //   _unit = json['unit'];
  //   _minQty = json['min_qty'];
  //
  //   if (json['refundable'] != null) {
  //     _refundable = int.parse(json['refundable'].toString());
  //   }
  //   if (json['digital_product_type'] != null) {
  //     _digitalProductType = json['digital_product_type'];
  //   }
  //   if (json['digital_file_ready'] != null) {
  //     _digitalFileReady = json['digital_file_ready'];
  //   }
  //
  //   if (json['images'] != null) {
  //     try {
  //       _images = json['images'] != null ? json['images'].cast<String>() : [];
  //     } catch (e) {
  //       _images = json['images'] != null
  //           ? jsonDecode(json['images']).cast<String>()
  //           : [];
  //     }
  //   }
  //
  //   _thumbnail = json['thumbnail'];
  //   if (json['colors_formatted'] != null) {
  //     _colors = [];
  //     try {
  //       json['colors_formatted'].forEach((v) {
  //         _colors!.add(ProductColors.fromJson(v));
  //       });
  //     } catch (e) {
  //       jsonDecode(json['colors_formatted']).forEach((v) {
  //         _colors!.add(ProductColors.fromJson(v));
  //       });
  //     }
  //   }
  //   if (json['attributes'] != null) {
  //     try {
  //       _attributes = json['attributes'].cast<String>();
  //     } catch (e) {
  //       _attributes = jsonDecode(json['attributes']).cast<String>();
  //       print(e);
  //     }
  //   }
  //   if (json['choice_options'] != null) {
  //     _choiceOptions = [];
  //     try {
  //       json['choice_options'].forEach((v) {
  //         _choiceOptions!.add(ChoiceOptions.fromJson(v));
  //       });
  //     } catch (e) {
  //       jsonDecode(json['choice_options']).forEach((v) {
  //         _choiceOptions!.add(ChoiceOptions.fromJson(v));
  //       });
  //     }
  //   }
  //   if (json['variation'] != null) {
  //     _variation = [];
  //     try {
  //       json['variation'].forEach((v) {
  //         _variation!.add(Variation.fromJson(v));
  //       });
  //     } catch (e) {
  //       jsonDecode(json['variation']).forEach((v) {
  //         _variation!.add(Variation.fromJson(v));
  //       });
  //     }
  //   }
  //   if (json['unit_price'] != null) {
  //     _unitPrice = json['unit_price'].toDouble();
  //   }
  //   if (json['purchase_price'] != null) {
  //     _purchasePrice = json['purchase_price'].toDouble();
  //   }
  //
  //   if (json['tax'] != null) {
  //     _tax = json['tax'].toDouble();
  //   }
  //
  //   if (json['tax_model'] != null) {
  //     _taxModel = json['tax_model'];
  //   } else {
  //     _taxModel = 'exclude';
  //   }
  //
  //   _taxType = json['tax_type'];
  //   if (json['discount'] != null) {
  //     _discount = json['discount'].toDouble();
  //   }
  //   _discountType = json['discount_type'];
  //   _currentStock = json['current_stock'];
  //   _details = json['details'];
  //   _createdAt = json['created_at'];
  //   _updatedAt = json['updated_at'];
  //   if (json['rating'] != null) {
  //     _rating = [];
  //     json['rating'].forEach((v) {
  //       _rating!.add(Rating.fromJson(v));
  //     });
  //   } else {}
  //   if (json['shipping_cost'] != null) {
  //     _shippingCost = double.parse(json['shipping_cost'].toString());
  //   }
  //   if (json['multiply_qty'] != null) {
  //     _isMultiPly = int.parse(json['multiply_qty'].toString());
  //   }
  //   if (json['reviews_count'] != null) {
  //     _reviewCount = int.parse(json['reviews_count'].toString());
  //   }
  //   _videoUrl = json['video_url'];
  //   if (json['minimum_order_qty'] != null) {
  //     try {
  //       _minimumOrderQty = json['minimum_order_qty'];
  //     } catch (e) {
  //       _minimumOrderQty = int.parse(json['minimum_order_qty'].toString());
  //     }
  //   }
  //   if (json['wish_list_count'] != null) {
  //     try {
  //       wishList = json['wish_list_count'];
  //     } catch (e) {
  //       wishList = int.parse(json['wish_list_count'].toString());
  //     }
  //   }
  //   brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  // }
  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addedBy = json['added_by'];
    _userId = json['user_id'];
    _name = json['name'];
    _slug = json['slug'];
    _productType = json['product_type'];

    if (json['category_ids'] != null) {
      _categoryIds = [];
      if (json['category_ids'] is List) {
        (json['category_ids'] as List).forEach((v) {
          if (v is Map<String, dynamic>) {
            _categoryIds!.add(CategoryIds.fromJson(v));
          }
        });
      }
    }

    _unit = json['unit'];
    _minQty = json['min_qty'];

    _refundable = json['refundable'] != null ? int.parse(json['refundable'].toString()) : 0;
    _digitalProductType = json['digital_product_type'];
    _digitalFileReady = json['digital_file_ready'];

    _images = json['images'] != null
        ? (json['images'] is List ? List<String>.from(json['images']) : [json['images'].toString()])
        : [];

    _thumbnail = json['thumbnail'];

    if (json['colors_formatted'] != null) {
      _colors = [];
      if (json['colors_formatted'] is List) {
        (json['colors_formatted'] as List).forEach((v) {
          if (v is Map<String, dynamic>) {
            _colors!.add(ProductColors.fromJson(v));
          }
        });
      }
    }

    _attributes = json['attributes'] != null ? (json['attributes'] is List ? List<String>.from(json['attributes']) : [json['attributes'].toString()]) : [];

    _choiceOptions = json['choice_options'] != null
        ? (json['choice_options'] is List ? List<ChoiceOptions>.from(json['choice_options'].map((x) => ChoiceOptions.fromJson(x))) : [])
        : [];

    _variation = json['variation'] != null
        ? (json['variation'] is List ? List<Variation>.from(json['variation'].map((x) => Variation.fromJson(x))) : [])
        : [];

    _unitPrice = json['unit_price']?.toDouble() ?? 0.0;
    _purchasePrice = json['purchase_price']?.toDouble() ?? 0.0;

    // _tax = json['tax']?.toDouble() ?? 0.0;
    if (json['tax'] != null) {
      if (json['tax'] is num) {
        // If 'tax' is already a number, use it directly
        _tax = json['tax'].toDouble();
      } else if (json['tax'] is String) {
        // If 'tax' is a string, attempt to convert it to a double
        _tax = double.tryParse(json['tax']) ?? 0.0;
      } else {
        // Handle other cases if necessary
        _tax = 0.0; // Default value or appropriate handling
      }
    } else {
      _tax = 0.0; // Default value if 'tax' is null
    }

    _taxModel = json['tax_model'] ?? 'exclude';

    _taxType = json['tax_type'];
    _discount = json['discount']?.toDouble() ?? 0.0;
    _discountType = json['discount_type'];
    _currentStock = json['current_stock'];
    _details = json['details'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];

    _rating = json['rating'] != null
        ? (json['rating'] is List ? List<Rating>.from(json['rating'].map((x) => Rating.fromJson(x))) : [])
        : [];

    _shippingCost = json['shipping_cost']?.toDouble() ?? 0.0;
    _isMultiPly = json['multiply_qty']?.toInt() ?? 0;
    _reviewCount = json['reviews_count']?.toInt() ?? 0;

    _videoUrl = json['video_url'];
    _minimumOrderQty = json['minimum_order_qty']?.toInt() ?? 0;
    wishList = json['wish_list_count']?.toInt() ?? 0;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

}

class CategoryIds {
  int? _position;

  CategoryIds({int? position}) {
    _position = position;
  }

  int? get position => _position;

  CategoryIds.fromJson(Map<String, dynamic> json) {
    _position = json['position'];
  }
}

class ProductColors {
  String? _name;
  String? _code;

  ProductColors({String? name, String? code}) {
    _name = name;
    _code = code;
  }

  String? get name => _name;
  String? get code => _code;

  ProductColors.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }
}

class ChoiceOptions {
  String? _name;
  String? _title;
  List<String>? _options;

  ChoiceOptions({String? name, String? title, List<String>? options}) {
    _name = name;
    _title = title;
    _options = options;
  }

  String? get name => _name;
  String? get title => _title;
  List<String>? get options => _options;

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _title = json['title'];
    if (json['options'] != null) {
      _options = json['options'].cast<String>();
    }
  }
}

class Variation {
  String? _type;
  double? _price;
  String? _sku;
  int? _qty;

  Variation({String? type, double? price, String? sku, int? qty}) {
    _type = type;
    _price = price;
    _sku = sku;
    _qty = qty;
  }

  String? get type => _type;
  double? get price => _price;
  String? get sku => _sku;
  int? get qty => _qty;

  Variation.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _price = json['price'].toDouble();
    _sku = json['sku'];
    _qty = json['qty'];
  }
}

class Rating {
  String? _average;
  int? _productId;

  Rating({String? average, int? productId}) {
    _average = average;
    _productId = productId;
  }

  String? get average => _average;
  int? get productId => _productId;

  Rating.fromJson(Map<String, dynamic> json) {
    _average = json['average'].toString();
    _productId = json['product_id'];
  }
}

class Brand {
  String? name;

  Brand({
    this.name,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
