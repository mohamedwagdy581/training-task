import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/product_model.dart';
import '../../product_cubit/product_cubit.dart';
import 'product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState || state is ProductInitialState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductErrorState) {
          return Center(child: Text(state.error));
        }
        if (state is ProductSuccessState) {
          final List<ProductModel> products = state.products;
          //final List<String> categories = state.categories;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person, size: 30.sp),
                          ),
                          title: Text("Hi, "),
                          subtitle: const Text("Let's go shopping"),
                        ),
                      ),
                      Icon(Icons.search, size: 30.sp),
                      SizedBox(width: 10.w),
                      Icon(Icons.notifications_outlined, size: 30.sp),
                    ],
                  ),
                  // SizedBox(
                  //   height: 40.h,
                  //   child: ListView.separated(
                  //     padding: EdgeInsets.symmetric(horizontal: 8.w),
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: categories.length,
                  //     separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  //     itemBuilder: (context, idx) => ActionChip(
                  //       label: Text(categories[idx]),
                  //       onPressed: () => context
                  //           .read<ProductCubit>()
                  //           .fetchByCategory(categories[idx]),
                  //     ),
                  //   ),
                  // ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      
                      final itemWidth = (constraints.maxWidth - 8 * (2 - 1)) / 2; // 2 columns
                      const textHeight = 104; // estimated card content below image
                      final itemHeight = itemWidth + textHeight;
                      final ratio = itemWidth / itemHeight;
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: ratio,
                            ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final bool isFav = context.read<ProductCubit>().isFav(product.id);

                          return ProductCard(product: product, isFav: isFav, onTap: () => context.read<ProductCubit>().toggleFavourite(product.id),);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
