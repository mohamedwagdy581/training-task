import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());
}
