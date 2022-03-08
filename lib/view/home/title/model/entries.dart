
import 'package:json_annotation/json_annotation.dart';
part 'entries.g.dart';
@JsonSerializable()
class Entries {
  String? id;
	String? body;
	String? author;
	String? authorId;
	String? favCount;
	String? createdAt;
	String? updatedAt;

	Entries({this.id, this.body, this.author, this.authorId, this.favCount, this.createdAt, this.updatedAt});

  factory Entries.fromJson(Map<String, dynamic> json) =>
      _$EntriesFromJson(json);


  Map<String, dynamic>? toJson() => _$EntriesToJson(this);

}