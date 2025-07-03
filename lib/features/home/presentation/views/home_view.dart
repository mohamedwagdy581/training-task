import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/product_repository.dart';
import '../manager/home_cubit/product_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(ProductRepository())..fetchProducts(),
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
