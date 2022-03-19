import 'package:eksi_sozluk/view/home/title/model/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';



@JsonSerializable()
class TitleModel extends INetworkModel<TitleModel> {
    TitleModel({
        this.success,
        this.message,
        this.data,
    });

    bool? success;
    String? message;
    Data? data;

    TitleModel fromJson(Map<String, dynamic> json) => TitleModel(
        success: json["Success"] == null ? null : json["Success"],
        message: json["Message"] == null ? null : json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Success": success == null ? null : success,
        "Message": message == null ? null : message,
        "Data": data == null ? null : data!.toJson(),
    };

}