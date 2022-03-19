



import 'package:eksi_sozluk/view/home/title/model/pinnedindexitem.dart';
import 'package:eksi_sozluk/view/home/title/model/topic.dart';

class Data {
    Data({
        this.topics,
        this.pageCount,
        this.pageSize,
        this.pageIndex,
        this.hasPinnedIndexItem,
        this.pinnedIndexItem,
    });

    List<Topic>? topics;
    int? pageCount;
    int? pageSize;
    int? pageIndex;
    bool? hasPinnedIndexItem;
    PinnedIndexItem? pinnedIndexItem;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        topics: json["Topics"] == null ? null : List<Topic>.from(json["Topics"].map((x) => Topic.fromJson(x))),
        pageCount: json["PageCount"] == null ? null : json["PageCount"],
        pageSize: json["PageSize"] == null ? null : json["PageSize"],
        pageIndex: json["PageIndex"] == null ? null : json["PageIndex"],
        hasPinnedIndexItem: json["HasPinnedIndexItem"] == null ? null : json["HasPinnedIndexItem"],
        pinnedIndexItem: json["PinnedIndexItem"] == null ? null : PinnedIndexItem.fromJson(json["PinnedIndexItem"]),
    );

    Map<String, dynamic> toJson() => {
        "Topics": topics == null ? null : List<dynamic>.from(topics!.map((x) => x.toJson())),
        "PageCount": pageCount == null ? null : pageCount,
        "PageSize": pageSize == null ? null : pageSize,
        "PageIndex": pageIndex == null ? null : pageIndex,
        "HasPinnedIndexItem": hasPinnedIndexItem == null ? null : hasPinnedIndexItem,
        "PinnedIndexItem": pinnedIndexItem == null ? null : pinnedIndexItem!.toJson(),
    };
}