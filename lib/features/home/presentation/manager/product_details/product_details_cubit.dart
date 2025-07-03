import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitialState());

  void incQty() => emit(ProductDetailsQtyState(qty: state.qty + 1, colorIndex: state.colorIndex, readMore: state.readMore));
  void decQty() => emit(ProductDetailsQtyState(qty: state.qty > 1 ? state.qty - 1 : 1, colorIndex: state.colorIndex, readMore: state.readMore));
  void selectColor(int i) => emit(ProductDetailsColorState(qty: state.qty, colorIndex: i, readMore: state.readMore));
  void toggleReadMore() => emit(ProductDetailsReadMoreState(qty: state.qty, colorIndex: state.colorIndex, readMore: !state.readMore));
}
