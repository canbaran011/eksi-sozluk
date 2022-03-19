


import 'package:eksi_sozluk/view/home/titledetail/model/entry.dart';

class TitleDetailData {
    TitleDetailData({
        this.id,
        this.title,
        this.entries,
    });

    int? id;
    String? title;
    List<Entry>? entries;

    factory TitleDetailData.fromJson(Map<String, dynamic> json) => TitleDetailData(
        id: json["Id"] == null ? null : json["Id"],
        title: json["Title"] == null ? null : json["Title"],
        entries: json["Entries"] == null ? null : List<Entry>.from(json["Entries"].map((x) => Entry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Title": title == null ? null : title,
        "Entries": entries == null ? null : List<dynamic>.from(entries!.map((x) => x.toJson())),
    };
}