import 'entries.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'title_detail_model.g.dart';

@JsonSerializable()
class TitleDetailModel extends INetworkModel<TitleDetailModel> {
  String? id;
  List<String>? disambiguationTitles;
  List<String>? disambiguationLinks;
  String? title;
  String? slug;
  int? totalPage;
  int? currentPage;
  List<String>? tags;
  List<Entries>? entries;

  @override
  TitleDetailModel fromJson(Map<String, dynamic> json) {
    return _$TitleDetailModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$TitleDetailModelToJson(this);
  }
}
