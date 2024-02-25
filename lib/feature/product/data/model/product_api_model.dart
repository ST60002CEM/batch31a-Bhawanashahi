import 'package:json_annotation/json_annotation.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';



@JsonSerializable()
class ProductAPIModel {
  @JsonKey(name: '_id')
  // Server ko name lai batchId sanga map gareko
  final String? productId;
  // J name server ma cha tei name ya lekhne
  final String productName;

  final int productPrice;
  final String productCategory;
  final String  productImageUrl;

  ProductAPIModel({this.productId, required this.productName, required this.productPrice, required this.productCategory, required this.productImageUrl});

  // To Json and fromJson without freezed
  factory ProductAPIModel.fromJson(Map<String, dynamic> json) {
    return ProductAPIModel(
      productId: json['_id'],
      productName: json['productName'],
      productPrice: json['productPrice'],
      productCategory: json['productCategory'],
      productImageUrl: json['productImageUrl']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productImageUrl':productImageUrl
    };
  }

  // From entity to model
  factory ProductAPIModel.fromEntity(ProductEntity entity) {
    return ProductAPIModel(
      productId: entity.productId,
      productName: entity.productName,
      productPrice: entity.productPrice,
      productCategory: entity.productCategory,
      productImageUrl: entity.productImageUrl,
    );
  }

  // From model to entity
  static ProductEntity toEntity(ProductAPIModel model) {
    return ProductEntity(
      productId: model.productId,
      productName: model.productName,
      productPrice: model.productPrice,
      productCategory: model.productCategory,
      productImageUrl: model.productImageUrl,
    );
  }
}
