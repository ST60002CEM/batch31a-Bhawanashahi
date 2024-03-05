import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String userId;
  final List<CartItemEntity> cartItems;
  final double total;
  final String status;
  final String orderId;
  final String address;

  OrderEntity({
    required this.userId,
    required this.cartItems,
    required this.total,
    required this.status,
    required this.orderId,
    required this.address,
  });

  @override
  List<Object?> get props =>
      [userId, cartItems, total, status, orderId, address];

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      userId: json['userId'],
      cartItems: (json['cartItems'] as List)
          .map((itemJson) => CartItemEntity.fromJson(itemJson))
          .toList(),
      total: json['total'].toDouble(),
      status: json['status'],
      orderId: json['orderId'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'orderId': orderId,
      'address': address,
    };
  }
}

class CartItemEntity extends Equatable {
  final String productId;
  final int quantity;

  CartItemEntity({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];

  factory CartItemEntity.fromJson(Map<String, dynamic> json) {
    return CartItemEntity(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
