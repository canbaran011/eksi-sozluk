

import 'package:eksi_sozluk/view/home/titledetail/model/titledetaildata.dart';
import 'package:vexana/vexana.dart';

class TitleDetailModel extends INetworkModel<TitleDetailModel> {
    TitleDetailModel({
        this.success,
        this.message,
        this.data,
    });

    bool? success;
    String? message;
    TitleDetailData? data;

    TitleDetailModel fromJson(Map<String, dynamic> json) => TitleDetailModel(
        success: json["Success"] == null ? null : json["Success"],
        message: json["Message"],
        data: json["Data"] == null ? null : TitleDetailData.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Success": success == null ? null : success,
        "Message": message == null ? null : message,
        "Data": data == null ? null : data!.toJson(),
    };


}