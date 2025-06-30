import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100.h
                ),
                Expanded(
                  child: ListTile(
                    
                    leading: CircleAvatar(
                      child: Icon(Icons.person, size: 30.sp,),
                    ),
                    title: Text("Hi, ",),
                    subtitle: const Text("Let's go shopping",),
                  ),
                ),
                Icon(Icons.search, size: 30.sp,),
                SizedBox(width: 10.w,),
                Icon(Icons.notifications_outlined, size: 30.sp,),
              ],
            ),
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductItem(
                  prodId: index,
                  prodName: "Product $index",
                  prodPicture:
                      "https://images.unsplash.com/photo-1523275335684-37898b6baf30?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
                  prodPrice: 100,
                  prodOldPrice: 200,
                  prodDetails: "Details $index",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
