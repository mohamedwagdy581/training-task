import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/colors/app_colors.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../data/product_model.dart';
import '../../manager/product_details/product_details_cubit.dart';
import 'qty_control.dart';

class ProductDetailsViewBody extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    const colors = [Colors.brown, Colors.black, Colors.teal, Colors.green];
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.41,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(product.image, fit: BoxFit.cover),
                    ),

                    Positioned(
                      top: MediaQuery.of(context).padding.top, // SafeArea
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_outlined),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          title: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              'Product Details',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_basket_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColorScheme.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 8.r),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4.w),
                        Text(
                          '4.8 (320 Review)',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const Spacer(),
                        const Text(
                          'Available in stock',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                      'Color',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 36.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (ctx, i) => GestureDetector(
                          onTap: () => context
                              .read<ProductDetailsCubit>()
                              .selectColor(i),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: colors[i],
                            child: state.colorIndex == i
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    Builder(
                      builder: (context) {
                        final isExpanded = state.readMore;
                        final desc = product.description;
                        final shouldTruncate = desc.length > 100;
                        final displayText = !shouldTruncate || isExpanded
                            ? desc
                            : '${desc.substring(0, 100)}...';

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displayText,
                              style: const TextStyle(color: Colors.black54),
                            ),
                            if (shouldTruncate)
                              TextButton(
                                onPressed: () => cubit.toggleReadMore(),
                                child: Text(
                                  isExpanded ? 'Read Less' : 'Read More',
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person, size: 30),
                      ),
                      title: const Text("Upbox Bag"),
                      subtitle: const Text("104 Products    1.3k Followers"),
                      trailing: SizedBox(
                        width: 90,
                        height: 36,
                        child: CustomButton(
                          onPressed: () {},
                          text: "Follw",
                          backgroundColor: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Divider(thickness: 1),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          "Choose amount: ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        QtyControl(
                          qty: state.qty,
                          incButton: cubit.incQty,
                          decButton: cubit.decQty,
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Text(
                              "\$ 24.00",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.shopping_cart_outlined),
                                Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
