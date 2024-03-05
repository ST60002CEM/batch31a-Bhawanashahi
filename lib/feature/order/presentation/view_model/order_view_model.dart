// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../domain/usecase/get_all_order_usecase.dart';
// import '../state/order_state.dart';

// final homeViewModelProvider =
//     StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
//   (ref) => HomeViewModel(
//     getAllProductUsecase: ref.read(getAllProductsUsecaseProvider ),
//   ),
// );

// class HomeViewModel extends StateNotifier<HomeState> {
//   final GetAllHomeUsecase getAllProductUsecase;

//   HomeViewModel({
//     required this.getAllProductUsecase,
//   }) : super(HomeState.initialState()) {
//     getAllProducts();
//   }


//   void getAllProducts() {
//     state = state.copyWith(isLoading: true);
//     getAllProductUsecase. getAllProducts().then((value) {
//       value.fold(
//         (failure) => state = state.copyWith(isLoading: false),
//         (products) {
//           state = state.copyWith(isLoading: false, products: products);
//         },
//       );
//     });
//   }

//   void resetMessage(bool value) {
//     state = state.copyWith(showMessage: value);
//   }
// }
