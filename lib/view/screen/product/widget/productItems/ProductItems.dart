// import 'package:flutter/material.dart';
//
// import 'package:flutter_sixvalley_ecommerce/data/model/response/product_details_model.dart'
//     as pd;
// import '../../../../../helper/price_converter.dart';
// import '../../../../../utill/color_resources.dart';
// import '../../../../../utill/custom_themes.dart';
// import '../../../../../utill/dimensions.dart';
//
// import '../seller_view.dart';
//
// class ProductItem extends StatelessWidget {
//   final pd.ProductDetailsModel productSellerModel;
//
//   ProductItem({required this.productSellerModel});
//
//   @override
//   Widget build(BuildContext context) {
//     double? startingPrice = 0;
//     double? endingPrice;
//     if (productSellerModel.variation != null &&
//         productSellerModel.variation!.isNotEmpty) {
//       List<double?> priceList = [];
//       for (var variation in productSellerModel.variation!) {
//         priceList.add(variation.price);
//       }
//       priceList.sort((a, b) => a!.compareTo(b!));
//       startingPrice = priceList[0];
//       if (priceList[0]! < priceList[priceList.length - 1]!) {
//         endingPrice = priceList[priceList.length - 1];
//       }
//     } else {
//       startingPrice = productSellerModel.unitPrice;
//     }
//     return Column(
//       children: [
//         if (productSellerModel.addedBy == 'seller')
//           SellerView(
//             sellerId: productSellerModel.userId.toString(),
//           )
//         else
//           const SizedBox.shrink(),
//         Row(
//           children: [
//             Text('Salary :',
//                 style: titilliumSemiBold.copyWith(
//                     fontSize: Dimensions.fontSizeLarge)),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               '${startingPrice != null ? PriceConverter.convertPrice(context, startingPrice, discount: productSellerModel.discount, discountType: productSellerModel.discountType) : ''}'
//               '${endingPrice != null ? ' - ${PriceConverter.convertPrice(context, endingPrice, discount: productSellerModel.discount, discountType: productSellerModel.discountType)}' : ''}',
//               style: titilliumBold.copyWith(
//                 color: ColorResources.getPrimary(context),
//                 fontSize: Dimensions.fontSizeLarge,
//               ),
//             ),
//             productSellerModel.discount != null &&
//                     productSellerModel.discount! > 0
//                 ? Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: Dimensions.paddingSizeSmall,
//                       ),
//                       child: Text(
//                         '${PriceConverter.convertPrice(context, startingPrice)}'
//                         '${endingPrice != null ? ' - ${PriceConverter.convertPrice(context, endingPrice)}' : ''}',
//                         style: titilliumRegular.copyWith(
//                           color: Theme.of(context).hintColor,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                     ),
//                   )
//                 : const SizedBox(),
//             Container(
//               padding: const EdgeInsets.all(
//                 Dimensions.paddingSizeExtraSmall,
//               ),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.error.withOpacity(.20),
//                 borderRadius: BorderRadius.circular(
//                   Dimensions.paddingSizeExtraSmall,
//                 ),
//               ),
//               child: Text(
//                 PriceConverter.percentageCalculation(
//                   context,
//                   productSellerModel.unitPrice,
//                   productSellerModel.discount,
//                   productSellerModel.discountType,
//                 ),
//                 style: textRegular.copyWith(
//                   color: Theme.of(context).colorScheme.error,
//                   fontSize: Dimensions.fontSizeLarge,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_details_model.dart' as pd;
import '../../../../../helper/price_converter.dart';
import '../../../../../utill/color_resources.dart';
import '../../../../../utill/custom_themes.dart';
import '../../../../../utill/dimensions.dart';

import '../seller_view.dart';

class ProductItem extends StatelessWidget {
  final pd.ProductDetailsModel productSellerModel;

  ProductItem({required this.productSellerModel});

  @override
  Widget build(BuildContext context) {
    double? startingPrice = getStartingPrice();
    double? endingPrice = getEndingPrice(startingPrice);

    return Column(
      children: [
        if (productSellerModel.addedBy == 'seller')
          SellerView(sellerId: productSellerModel.userId.toString())
        else SizedBox.shrink(),
        Row(
          children: [
            Text(
              'Salary :',
              style: titilliumSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge),
            ),
            SizedBox(width: 10),
            Text(
              getPriceRangeText(context, startingPrice, endingPrice),
              style: titilliumBold.copyWith(
                color: ColorResources.getPrimary(context),
                fontSize: Dimensions.fontSizeLarge,
              ),
            ),
            if (productSellerModel.discount != null && productSellerModel.discount! > 0)
              Flexible(child: buildDiscountedPrice(context, startingPrice, endingPrice)),
            buildDiscountContainer(context),
          ],
        ),
      ],
    );
  }

  double? getStartingPrice() {
    if (productSellerModel.variation != null && productSellerModel.variation!.isNotEmpty) {
      List<double?> priceList = productSellerModel.variation!.map((variation) => variation.price).toList();
      priceList.sort((a, b) => a!.compareTo(b!));
      return priceList[0];
    } else {
      return productSellerModel.unitPrice;
    }
  }

  double? getEndingPrice(double? startingPrice) {
    if (productSellerModel.variation != null && productSellerModel.variation!.isNotEmpty) {
      List<double?> priceList = productSellerModel.variation!.map((variation) => variation.price).toList();
      priceList.sort((a, b) => a!.compareTo(b!));
      if (startingPrice! < priceList[priceList.length - 1]!) {
        return priceList[priceList.length - 1];
      }
    }
    return null;
  }

  String getPriceRangeText(BuildContext context, double? startingPrice, double? endingPrice) {
    return '${startingPrice != null ? PriceConverter.convertPrice(context, startingPrice, discount: productSellerModel.discount, discountType: productSellerModel.discountType) : ''}'
        '${endingPrice != null ? ' - ${PriceConverter.convertPrice(context, endingPrice, discount: productSellerModel.discount, discountType: productSellerModel.discountType)}' : ''}';
  }

  Widget buildDiscountedPrice(BuildContext context, double? startingPrice, double? endingPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      child: Text(
        '${PriceConverter.convertPrice(context, startingPrice)}${endingPrice != null ? ' - ${PriceConverter.convertPrice(context, endingPrice)}' : ''}',
        style: titilliumRegular.copyWith(
          color: Theme.of(context).hintColor,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }

  Widget buildDiscountContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withOpacity(.20),
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
      ),
      child: Text(
        PriceConverter.percentageCalculation(
          context,
          productSellerModel.unitPrice,
          productSellerModel.discount,
          productSellerModel.discountType,
        ),
        style: textRegular.copyWith(
          color: Theme.of(context).colorScheme.error,
          fontSize: Dimensions.fontSizeLarge,
        ),
      ),
    );
  }
}
