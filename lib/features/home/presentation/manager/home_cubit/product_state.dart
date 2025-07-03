import 'package:meta/meta.dart';

import '../../../data/product_model.dart';

@immutable
sealed class ProductState {}

final class ProductInitialState extends ProductState {}

// ====== Product States ========
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

// ========== Banner States ==========
class BannerChanged extends ProductState {
  final int currentIndex;

  BannerChanged(this.currentIndex);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerChanged && other.currentIndex == currentIndex;
  }

  @override
  int get hashCode => currentIndex.hashCode;
}
