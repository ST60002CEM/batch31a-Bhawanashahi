import 'package:equatable/equatable.dart';
class ProductEntity extends Equatable {

  final  productId;
  final String productName;
  final int  productPrice;
  final String productCategory;
  final String productImageUrl;

 


  const ProductEntity( {   this.productId, required this.productName, required this.productPrice,required this.productCategory, required this.productImageUrl});
  
  @override
String toString(){
  return 'ProductEntity( productId: $productId, productName: $productName, productPrice:$productPrice, productCategory:$productCategory, productImageUrl:$productImageUrl)';
}

  @override
  // TODO: implement props
  List<Object?> get props => [productId,productName, productPrice, productImageUrl ];
}

