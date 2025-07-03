import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../data/product_model.dart';
import '../manager/product_details/product_details_cubit.dart';
import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(),
      child: Scaffold(
        backgroundColor: AppColorScheme.white,
        body: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
