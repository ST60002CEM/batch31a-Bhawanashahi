import 'package:json_annotation/json_annotation.dart';

import '../model/product_api_model.dart';


part 'get_all_product_dto.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GetAllProductDTO {
  final bool success;
  final int count;
  final List<ProductAPIModel> data;

  GetAllProductDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllProductDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllHomeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductDTOToJson(this);
}
