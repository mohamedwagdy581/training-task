import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final int prodId;
  final String prodName;
  final String prodPicture;
  final int prodPrice;
  final int prodOldPrice;
  final String prodDetails;
  const ProductItem({
    super.key,
    required this.prodId,
    required this.prodName,
    required this.prodPicture,
    required this.prodPrice,
    required this.prodOldPrice,
    required this.prodDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text(prodName),
        child: Material(
          child: InkWell(
            onTap: () {
              // navigateTo(
              //   context,
              //   ProductDetailsScreen(
              //     productDetailsId: prodId,
              //     productDetailsName: prodName,
              //     productDetailsPicture: prodPicture,
              //     productDetailsPrice: prodPrice,
              //     productDetailsOldPrice: prodOldPrice,
              //     productDetails: prodDetails,
              //     productDetailsBrand: prodBrand,
              //     productDetailsColor: prodColor,
              //     productDetailsSize: prodSize,
              //   ),
              // );
            },
            child: GridTile(
              footer: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                height: 55.h,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 1.0,
                    bottom: 1.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          prodName,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '$prodPrice \$',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: ClipRRect(
                child: Image.network(prodPicture, fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
