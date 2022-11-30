import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resource_model.g.dart';

int _fetchCustom(int data) {
  return 5;
}

@JsonSerializable(
    // createToJson: false
    // fieldRename: FieldRename.kebab
    )
class ResourceModel {
  ResourceModel({this.data});

  List<Data>? data;

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Data extends Equatable {
  const Data(
      {this.id,
      this.name,
      this.year,
      this.color,
      this.pantoneValue,
      this.price,
      this.status});

  final int? id;
  final String? name;
  final int? year;
  @JsonKey(name: 'renk')
  final String? color;
  final String? pantoneValue;
  @JsonKey(fromJson: _fetchCustom)
  final int? price;
  @JsonEnum()
  final StatusCode? status;

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
  
  @override
  List<Object?> get props => [id, name, price];
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(5000)
  weird
}
