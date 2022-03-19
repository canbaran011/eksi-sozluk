import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';


part 'title_model.g.dart';

@JsonSerializable()
class TitleModel extends INetworkModel<TitleModel> {
  int? id;
  String? title;
  String? slug;
  String? entryCount;

  TitleModel({this.id, this.title, this.slug, this.entryCount});

  @override
  TitleModel fromJson(Map<String, dynamic> json) {
    return _$TitleModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$TitleModelToJson(this);
  }
}
