// import 'package:json_annotation/json_annotation.dart';
// import '../../domain/entity/order.entity.dart';
//
// @JsonSerializable()
// class OrderAPIModel {
//   @JsonKey(name: 'userId')
//   final String userId;
//
//   @JsonKey(name: 'cartItems')
//   final List<CartItemAPIModel> cartItems;
//
//   @JsonKey(name: 'total')
//   final double total;
//
//   @JsonKey(name: 'status')
//   final String status;
//
//   @JsonKey(name: 'orderId')
//   final String orderId;
//
//   @JsonKey(name: 'address')
//   final String address;
//
//   OrderAPIModel({
//     required this.userId,
//     required this.cartItems,
//     required this.total,
//     required this.status,
//     required this.orderId,
//     required this.address,
//   });
//
//   factory OrderAPIModel.fromJson(Map<String, dynamic> json) =>
//       _$OrderAPIModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$OrderAPIModelToJson(this);
//
//   factory OrderAPIModel.fromEntity(OrderEntity entity) {
//     return OrderAPIModel(
//       userId: entity.userId,
//       cartItems: entity.cartItems
//           .map((cartItem) => CartItemAPIModel.fromEntity(cartItem))
//           .toList(),
//       total: entity.total,
//       status: entity.status,
//       orderId: entity.orderId,
//       address: entity.address,
//     );
//   }
//
//   static OrderEntity toEntity(OrderAPIModel model) {
//     return OrderEntity(
//       userId: model.userId,
//       cartItems: model.cartItems
//           .map((cartItem) => CartItemAPIModel.toEntity(cartItem))
//           .toList(),
//       total: model.total,
//       status: model.status,
//       orderId: model.orderId,
//       address: model.address,
//     );
//   }
// }
//
// @JsonSerializable()
// class CartItemAPIModel {
//   @JsonKey(name: 'productId')
//   final String productId;
//
//   @JsonKey(name: 'quantity')
//   final int quantity;
//
//   CartItemAPIModel({
//     required this.productId,
//     required this.quantity,
//   });
//
//   factory CartItemAPIModel.fromJson(Map<String, dynamic> json) =>
//       _$CartItemAPIModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CartItemAPIModelToJson(this);
//
//   factory CartItemAPIModel.fromEntity(CartItemEntity entity) {
//     return CartItemAPIModel(
//       productId: entity.productId,
//       quantity: entity.quantity,
//     );
//   }
//
//   static CartItemEntity toEntity(CartItemAPIModel model) {
//     return CartItemEntity(
//       productId: model.productId,
//       quantity: model.quantity,
//     );
//   }
// }
