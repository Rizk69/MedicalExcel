import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/review_body.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_details_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/response_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/review_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/product_details_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsProvider extends ChangeNotifier {
  final ProductDetailsRepo? productDetailsRepo;
  ProductDetailsProvider({required this.productDetailsRepo});

  List<ReviewModel>? _reviewList;
  int? _imageSliderIndex;
  bool _wish = false;
  int? _quantity = 0;
  int? _variantIndex;
  List<int>? _variationIndex;
  int _rating = 0;
  bool _isLoading = false;
  int? _orderCount;
  int? _wishCount;
  String? _sharableLink;
  String? _errorText;
  bool _hasConnection = true;
  bool _isDetails = false;
  bool get isDetails => _isDetails;
  int _countOfSeller = 1;

  List<ReviewModel>? get reviewList => _reviewList;
  int? get imageSliderIndex => _imageSliderIndex;
  bool get isWished => _wish;
  int? get quantity => _quantity;
  int? get variantIndex => _variantIndex;
  List<int>? get variationIndex => _variationIndex;
  int get rating => _rating;
  int get countOfSeller => _countOfSeller;

  bool get isLoading => _isLoading;
  int? get orderCount => _orderCount;
  int? get wishCount => _wishCount;
  String? get sharableLink => _sharableLink;
  String? get errorText => _errorText;
  bool get hasConnection => _hasConnection;
  ProductDetailsModel? _productDetailsModel;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;
  ProductDetailsModel? _productDetailsSellerModel;
  ProductDetailsModel? get productDetailsSellerModel =>
      _productDetailsSellerModel;
  final List<ProductDetailsModel> _sellerProducts = [];
  List<ProductDetailsModel> get sellerProducts => _sellerProducts;

  // Future<void> getProductDetails(BuildContext context, String slug) async {
  //
  //   _isDetails = true;
  //   ApiResponse apiResponse = await productDetailsRepo!.getProduct(slug);
  //   if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
  //     _isDetails = false;
  //     print(_isDetails);
  //     print("_____________________${apiResponse.response}Rizk________________");
  //     _productDetailsModel = ProductDetailsModel.fromJson(apiResponse.response!.data);
  //     print(apiResponse.response!.data);
  //     print(_productDetailsModel);
  //
  //
  //     if(_productDetailsModel != null){
  //       print("Rizk");
  //       Provider.of<ProductProvider>(Get.context!, listen: false).getSellerProductList(Provider.of<ProductDetailsProvider>(Get.context!, listen: false).productDetailsModel!.userId.toString(), 1, Get.context!);
  //     }
  //
  //   } else {
  //     print("Rizk2");
  //
  //     _isDetails = false;
  //     if(context.mounted){}
  //     showCustomSnackBar(apiResponse.error.toString(), Get.context!);
  //   }
  //   _isDetails = false;
  //   notifyListeners();
  // }

  // Future<void> getProductDetails(BuildContext context, String slug) async {
  //   _isDetails = true;
  //   ApiResponse apiResponse = await productDetailsRepo!.getProduct(slug);
  //
  //   if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
  //     _isDetails = false;
  //     print(_isDetails);
  //     print("_____________________${apiResponse.response}Rizk________________");
  //
  //     // Check if the response is a List and not empty
  //     if (apiResponse.response!.data is List &&
  //         apiResponse.response!.data.isNotEmpty) {
  //       // Access the first element of the List, which should be a Map
  //       List<List<Map<String, dynamic>>> responseData = apiResponse.response!.data;
  //
  //       // Now you can use the Map to create your _productDetailsModel
  //       _productDetailsModel = ProductDetailsModel.fromJson(responseData[0][0]);
  //
  //       if (_productDetailsModel != null) {
  //         print("Rizk");
  //         Provider.of<ProductProvider>(Get.context!, listen: false)
  //             .getSellerProductList(
  //             Provider.of<ProductDetailsProvider>(Get.context!, listen: false)
  //                 .productDetailsModel!
  //                 .userId
  //                 .toString(),
  //             1,
  //             Get.context!);
  //       }
  //     } else {
  //       print("Rizk2");
  //       _isDetails = false;
  //       if (context.mounted) {}
  //       showCustomSnackBar(apiResponse.error.toString(), Get.context!);
  //     }
  //     _isDetails = false;
  //     notifyListeners();
  //   }
  // }

//   Future<void> getProductDetails(BuildContext context, String slug) async {
//     _isDetails = true;
//     ApiResponse apiResponse = await productDetailsRepo!.getProduct(slug);
//
//     if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//       _isDetails = false;
//       print(_isDetails);
//       print("_____________________${apiResponse.response}Rizk________________");
//
//       // Check if the response is a List and not empty
//       if (apiResponse.response!.data is List &&
//           apiResponse.response!.data.isNotEmpty) {
//         // Access the first element of the List, which should be a Map
//         List<List<Map<String, dynamic>>> responseData = apiResponse.response!.data;
//
//         // Now you can use the Map to create your _productDetailsModel
//         if (responseData.isNotEmpty) {
//
//           _productDetailsModel =
//               ProductDetailsModel.fromJson(responseData[0][0]);
//           _productDetailsSellerModel =
//               ProductDetailsModel.fromJson(responseData[1][0]);
//
// print(_productDetailsSellerModel);
//           if (_productDetailsModel != null) {
//             print("Rizk");
//             Provider.of<ProductProvider>(Get.context!, listen: false)
//                 .getSellerProductList(
//                 Provider.of<ProductDetailsProvider>(Get.context!,
//                     listen: false)
//                     .productDetailsModel!
//                     .userId
//                     .toString(),
//                 1,
//                 Get.context!);
//           }
//         }
//       } else {
//         print("Rizk2");
//         _isDetails = false;
//         if (context.mounted) {}
//         showCustomSnackBar(apiResponse.error.toString(), Get.context!);
//       }
//       _isDetails = false;
//       notifyListeners();
//     }
//   }
//   Future<void> getProductDetails(BuildContext context, String slug) async {
//     _isDetails = true;
//     notifyListeners();
//
//     try {
//       ApiResponse apiResponse = await productDetailsRepo!.getProduct(slug);
//
//       if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//         _isDetails = false;
//         print("_____________________${apiResponse.response}Rizk________________");
//
//         // Check if the response is a List and not empty
//         if (apiResponse.response!.data is List &&
//             apiResponse.response!.data.isNotEmpty) {
//           // Access the first element of the List, which should be a List
//           List<dynamic> responseData = apiResponse.response!.data;
//
//           // Now check if the first element is a List and not empty
//           if (responseData.isNotEmpty && responseData[0] is List) {
//             // Access the first inner list
//             List<dynamic> firstInnerList = responseData[0];
//
//             // Now you can use the inner list to create your _productDetailsModel
//             if (firstInnerList.isNotEmpty) {
//               _productDetailsModel = ProductDetailsModel.fromJson(firstInnerList[0]);
//               int count = 0;
//
// // Iterate through the outer list
//               for (var innerList in responseData) {
//                 // Iterate through the inner list
//                 for (var item in innerList) {
//                   // Check if "added_by" is equal to "seller"
//                   if (item["added_by"] == "seller") {
//                     count++;
//                   }
//                 }
//               }
//               if (kDebugMode) {
//                 print(count);
//               }
//               log(firstInnerList.length);
//
//               if (_productDetailsModel != null) {
//                 if (kDebugMode) {
//                   print("Rizk");
//                 }
//
//                 // Assuming the following condition is correct, you can proceed
//                 if (Provider.of<ProductDetailsProvider>(context, listen: false)
//                     .productDetailsModel !=
//                     null) {
//                   Provider.of<ProductProvider>(context, listen: false)
//                       .getSellerProductList(
//                     Provider.of<ProductDetailsProvider>(context, listen: false)
//                         .productDetailsModel!
//                         .userId
//                         .toString(),
//                     1,
//                     context,
//                   );
//                 }
//               }
//             }
//           }
//
//         } else {
//           print("Rizk2");
//           showCustomSnackBar(apiResponse.error.toString(), context);
//         }
//       } else {
//         // Handle other status codes or errors if needed
//         print("Error: ${apiResponse.error}");
//       }
//     } catch (error) {
//       // Handle exceptions that might occur during the API call
//       print("Error: $error");
//     } finally {
//       _isDetails = false;
//       notifyListeners();
//     }
//   }
  // run
//   Future<void> getProductDetails(BuildContext context, String slug) async {
//     _isDetails = true;
//     ApiResponse apiResponse = await productDetailsRepo!.getProduct(slug);
//
//     if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//       _isDetails = false;
//       print(_isDetails);
//       print("_____________________${apiResponse.response}Rizk________________");
//
//       // Check if the response is a List and not empty
//       if (apiResponse.response!.data is List &&
//           apiResponse.response!.data.isNotEmpty) {
//         List<dynamic> responseData = apiResponse.response!.data;
//
//         // Check if the first element is a List and not empty
//         if (responseData[0] is List && responseData[0].isNotEmpty) {
//           List<Map<String, dynamic>> innerList = List.castFrom(responseData[0]);
//
//           // Use the first item from the inner list
//           _productDetailsModel = ProductDetailsModel.fromJson(innerList[0]);
//
//           // Continue with the rest of your code...
//           if (_productDetailsModel != null) {
//             print("Rizk");
//             Provider.of<ProductProvider>(Get.context!, listen: false)
//                 .getSellerProductList(
//               Provider.of<ProductDetailsProvider>(Get.context!, listen: false)
//                   .productDetailsModel!
//                   .userId
//                   .toString(),
//               1,
//               Get.context!,
//             );
//           }
//         }
//       } else {
//         print("Rizk2");
//         _isDetails = false;
//         if (context.mounted) {}
//         showCustomSnackBar(apiResponse.error.toString(), Get.context!);
//       }
//       _isDetails = false;
//       notifyListeners();
//     }
//   }
  Future<List<ProductDetailsModel>> getProductDetails(
      BuildContext context, String slug) async {
    _isDetails = true;
    sellerProducts.clear();

    ApiResponse apiResponse = await productDetailsRepo!.getProduct(slug);
    List<ProductDetailsModel> productDetailsList = [];
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _isDetails = false;
      print(_isDetails);
      print("_____________________${apiResponse.response}Rizk________________");

      // Check if the response is a List and not empty
      if (apiResponse.response!.data is List &&
          apiResponse.response!.data.isNotEmpty) {
        List<List<dynamic>> responseData =
            List.castFrom(apiResponse.response!.data);
        _productDetailsModel = ProductDetailsModel.fromJson(
            (responseData[0][0] != null ? responseData[0][0] : responseData[1][0]) as Map<String, dynamic>
        );

// Iterate through the outer list
        for (var innerList in responseData) {
          // Iterate through the inner list
          for (var item in innerList) {
            // Check if "added_by" is equal to "seller"
            if (item["added_by"] == "seller") {
              print(sellerProducts.length);
              // Process the data for sellers here
              print(item);
              sellerProducts.add(ProductDetailsModel.fromJson(item));
              if (sellerProducts.length != 1 && sellerProducts.isNotEmpty) {
                for (int i = 1; i <= sellerProducts.length; i++) {
                  if (sellerProducts[0].seller?.fName ==
                          sellerProducts[i].seller?.fName &&
                      sellerProducts[0].discount ==
                          sellerProducts[i].discount) {
                    sellerProducts.remove(sellerProducts[i]);
                  }
                  break;
                }
              }
              print(sellerProducts.length);
            }
          }
        }

        // Continue with the rest of your code...
        if (productDetailsList.isNotEmpty) {
          print("Rizk");
          Provider.of<ProductProvider>(Get.context!, listen: false)
              .getSellerProductList(
            Provider.of<ProductDetailsProvider>(Get.context!, listen: false)
                .productDetailsModel!
                .userId
                .toString(),
            1,
            Get.context!,
          );
        }
      } else {
        print("Rizk2");
        _isDetails = false;
        if (context.mounted) {}
        showCustomSnackBar(apiResponse.error.toString(), Get.context!);
      }

      _isDetails = false;
      notifyListeners();
    }

    return productDetailsList;
  }

  // List<ProductDetailsModel> getSellerProducts(List<dynamic> responseData) {
  //   // Iterate through the outer list
  //   for (var innerList in responseData) {
  //     // Iterate through the inner list
  //     for (var item in innerList) {
  //       // Check if "added_by" is equal to "seller"
  //       if (item["added_by"] == "seller") {
  //         // Process the data for sellers here
  //         print(item);
  //         ProductDetailsModel productDetailsModel =
  //             ProductDetailsModel.fromJson(item);
  //
  //         sellerProducts.add(productDetailsModel);
  //       }
  //     }
  //   }
  //   return sellerProducts;
  // }

  Future<void> initProduct(
      int? productId, String? productSlug, BuildContext context) async {
    _hasConnection = true;
    _variantIndex = 0;
    ApiResponse reviewResponse =
        await productDetailsRepo!.getReviews(productId.toString());
    if (reviewResponse.response != null &&
        reviewResponse.response!.statusCode == 200) {
      _reviewList = [];
      reviewResponse.response!.data.forEach(
          (reviewModel) => _reviewList!.add(ReviewModel.fromJson(reviewModel)));
      _imageSliderIndex = 0;
      _quantity = 1;
    } else {
      if (context.mounted) {}
      ApiChecker.checkApi(reviewResponse);
    }
    notifyListeners();
  }

  void initData(ProductDetailsModel product, int? minimumOrderQuantity,
      BuildContext context) {
    _variantIndex = 0;
    _quantity = minimumOrderQuantity;
    _variationIndex = [];

    if (product.choiceOptions != null) {
      for (int i = 0; i < product.choiceOptions!.length; i++) {
        _variationIndex!.add(0);
      }
    }
  }

  void removePrevReview() {
    _reviewList = null;
    _sharableLink = null;
  }

  void getCount(String productID, BuildContext context) async {
    ApiResponse apiResponse = await productDetailsRepo!.getCount(productID);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _orderCount = apiResponse.response!.data['order_count'];
      _wishCount = apiResponse.response!.data['wishlist_count'];
    } else {
      if (context.mounted) {}
      ApiChecker.checkApi(apiResponse);
    }
    notifyListeners();
  }

  void getSharableLink(String productID, BuildContext context) async {
    ApiResponse apiResponse =
        await productDetailsRepo!.getSharableLink(productID);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _sharableLink = apiResponse.response!.data;
    } else {
      ApiChecker.checkApi(apiResponse);
    }
  }

  void setErrorText(String? error) {
    _errorText = error;
    notifyListeners();
  }

  void removeData() {
    _errorText = null;
    _rating = 0;
    notifyListeners();
  }

  void setImageSliderSelectedIndex(int selectedIndex) {
    _imageSliderIndex = selectedIndex;
    notifyListeners();
  }

  void changeWish() {
    _wish = !_wish;
    notifyListeners();
  }

  void setQuantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  void setCartVariantIndex(
      int? minimumOrderQuantity, int index, BuildContext context) {
    _variantIndex = index;
    _quantity = minimumOrderQuantity;
    notifyListeners();
  }

  void setCartVariationIndex(
      int? minimumOrderQuantity, int index, int i, BuildContext context) {
    _variationIndex![index] = i;
    _quantity = minimumOrderQuantity;
    notifyListeners();
  }

  void setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }

  Future<ResponseModel> submitReview(
      ReviewBody reviewBody, List<File> files, String token) async {
    _isLoading = true;
    notifyListeners();

    http.StreamedResponse response =
        await productDetailsRepo!.submitReview(reviewBody, files, token);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      Provider.of<OrderProvider>(Get.context!, listen: false).reviewImages = [];
      _rating = 0;
      responseModel = ResponseModel(
          '${getTranslated('Review submitted successfully', Get.context!)}',
          true);
      _errorText = null;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print('${response.statusCode} ${response.reasonPhrase}');
      }
      responseModel = ResponseModel(
          '${response.statusCode} ${response.reasonPhrase}', false);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
