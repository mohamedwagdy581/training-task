part of 'product_cubit.dart';


@immutable
sealed class ProductState {}

final class ProductInitialState extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  final List<ProductModel> products;
  final List<String> categories;
  ProductSuccessState({required this.products, required this.categories});
}

final class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState({required this.error});
}
