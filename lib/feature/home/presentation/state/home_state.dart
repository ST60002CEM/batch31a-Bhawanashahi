
import '../../domain/entity/home.entity.dart';

class HomeState {
  final bool isLoading;
  final List<HomeEntity> products;
  final bool showMessage;

  HomeState({
    required this.isLoading,
    required this.products,
    required this.showMessage,
  });

  factory HomeState.initialState() => HomeState(
        isLoading: false,
        products: [],
        showMessage: false,
      );

 HomeState copyWith({
    bool? isLoading,
    List<HomeEntity>? products,
    bool? showMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}
