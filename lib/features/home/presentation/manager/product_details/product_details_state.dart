part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {
  final int qty;
  final int colorIndex;
  final bool readMore;
  const ProductDetailsState({required this.qty, required this.colorIndex, required this.readMore});
}

final class ProductDetailsInitialState extends ProductDetailsState {
  const ProductDetailsInitialState() : super(qty: 1, colorIndex: 0, readMore: false);
}

final class ProductDetailsQtyState extends ProductDetailsState {
  const ProductDetailsQtyState({required super.qty, required super.colorIndex, required super.readMore});
}

final class ProductDetailsColorState extends ProductDetailsState {
  const ProductDetailsColorState({required super.qty, required super.colorIndex, required super.readMore});
}

final class ProductDetailsReadMoreState extends ProductDetailsState {
  const ProductDetailsReadMoreState({required super.qty, required super.colorIndex, required super.readMore});
}