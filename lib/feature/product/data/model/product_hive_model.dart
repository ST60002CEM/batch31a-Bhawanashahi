import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constant/hive_table_constant.dart';
import '../../domain/entity/product.entity.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.productTableId)
class ProductHiveModel {
  @HiveField(0)
  final  productId;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  final int productPrice;

  @HiveField(3)
  final String productCategory;

  @HiveField(4)
  final String productImageUrl;




  // empty constructor
  ProductHiveModel.empty() : this(productId: '', productName: '', productPrice: 0, productCategory: '', productImageUrl:'');

  ProductHiveModel({
    String? productId,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productImageUrl,
  }) : productId = productId ?? const Uuid().v4();

  // Convert Entity to Hive Object
  factory ProductHiveModel.toHiveModel(ProductEntity entity) => ProductHiveModel(
    productName: entity.productName,
    productPrice: entity.productPrice,
    productCategory: entity.productCategory,
    productImageUrl: entity.productImageUrl,
  );


  // Convert Hive Object to Entity
  static ProductEntity toEntity(ProductHiveModel hiveModel) => ProductEntity(
    productId: hiveModel.productId,
    productName: hiveModel.productName,
    productPrice: hiveModel.productPrice,
    productCategory: hiveModel.productCategory,
    productImageUrl: hiveModel.productImageUrl,

  );

  @override
  String toString() {
    return 'productId: $productId, productName: $productName, productPrice:$productPrice, productCategory:$productCategory, productImageUrl:$productImageUrl ';
  }
}
