import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/dashboard/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/dashboard/domain/usecase/add_cart_usecase.dart';

import '../../domain/usecase/get_all_product_usecase.dart';
import '../state/product_state.dart';

final productViewModelProvider =
    StateNotifierProvider.autoDispose<ProductViewModel, ProductState>(
  (ref) => ProductViewModel(
    addCartUsecase: ref.read(addCartUsecaseProvider),
    getAllProductUsecase: ref.read(getAllProductsUsecaseProvider ),
  ),
);

class ProductViewModel extends StateNotifier<ProductState> {
   final AddCartUsecase addCartUsecase;
  final GetAllProductUsecase getAllProductUsecase;

  ProductViewModel({
    required this.addCartUsecase,
    required this.getAllProductUsecase,
  }) : super(ProductState.initialState()) {
    getAllProduct();
  }

  void addCart(ProductEntity product) {
    state = state.copyWith(isLoading: true);
    addCartUsecase.addCart(product).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          getAllProduct();
        },
      );
    });
  }



  void getAllProduct() {
    state = state.copyWith(isLoading: true);
    getAllProductUsecase. getAllProduct().then((value) {
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
