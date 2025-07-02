import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/storage/cache_helper.dart';
import '../../data/product_model.dart';
import '../../data/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;
  final Set<int> _favourites = {}; 
  ProductCubit(this.repository) : super(ProductInitialState());

// ============ Helpers ============
  bool isFav(int id) => _favourites.contains(id);

  Future<void> _loadCachedFavs() async {
    final cached = CacheHelper.getFavourites();
    _favourites.addAll(cached);
    // Trigger rebuild if already on success state
    if (state is ProductSuccessState) {
      final s = state as ProductSuccessState;
      emit(ProductSuccessState(products: s.products, categories: s.categories));
    }
  }

  Future<void> _persistFavs() async {
    await CacheHelper.saveFavourites(_favourites);
  }

   // ============ Public API ============
  Future<void> fetchProducts() async {
    emit(ProductLoadingState());
    try {
      await _loadCachedFavs();
      final products = await repository.getAllProducts();
      final categories = await repository.getCategories();
      emit(ProductSuccessState(products: products, categories: categories));
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }

  Future<void> fetchByCategory(String category) async {
    emit(ProductLoadingState());
    try {
      final products = await repository.getProductsByCategory(category);
      List<String> cats = [];
      if (state is ProductSuccessState) {
        cats = (state as ProductSuccessState).categories;
      }
      emit(ProductSuccessState(products: products, categories: cats));
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }

Future<void> toggleFavourite(int id) async {
    if (_favourites.contains(id)) {
      _favourites.remove(id);
    } else {
      _favourites.add(id);
    }
    await _persistFavs();

    if (state is ProductSuccessState) {
      final s = state as ProductSuccessState;
      emit(ProductSuccessState(products: s.products, categories: s.categories));
    }
  }
}
