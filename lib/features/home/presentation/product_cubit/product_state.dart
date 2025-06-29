part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitialState extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  final List<ProductModel> products;
  ProductSuccessState({required this.products});
}

final class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState({required this.error});
}
