import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/get_all_product_usecase.dart';
import '../state/product_state.dart';

final productViewModelProvider =
    StateNotifierProvider.autoDispose<ProductViewModel, ProductState>(
  (ref) => ProductViewModel(
    getAllProductUsecase: ref.read(getAllProductsUsecaseProvider ),
  ),
);

class ProductViewModel extends StateNotifier<ProductState> {
  final GetAllProductUsecase getAllProductUsecase;

  ProductViewModel({
    required this.getAllProductUsecase,
  }) : super(ProductState.initialState()) {
    getAllProducts();
  }


  void getAllProducts() {
    state = state.copyWith(isLoading: true);
    getAllProductUsecase. getAllProducts().then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (products) {
          state = state.copyWith(isLoading: false, products: products);
        },
      );
    });
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
