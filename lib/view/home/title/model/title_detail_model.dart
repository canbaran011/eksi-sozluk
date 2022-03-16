import 'entries.dart';
import 'package:json_annotation/json_annotation.dart';


part 'title_detail_model.g.dart';

@JsonSerializable()
class TitleDetailModel {
  String? id;
  List<String>? disambiguationTitles;
  List<String>? disambiguationLinks;
  String? title;
  String? slug;
  int? totalPage;
  int? currentPage;
  List<String>? tags;
  List<Entries>? entries;

  TitleDetailModel fromJson(Map<String, dynamic> json) {
    return _$TitleDetailModelFromJson(json);
  }

  Map<String, dynamic>? toJson() {
    return _$TitleDetailModelToJson(this);
  }
}
