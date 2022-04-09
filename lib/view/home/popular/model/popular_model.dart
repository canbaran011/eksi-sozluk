import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

@JsonSerializable()
class PopularModel extends INetworkModel<PopularModel>{
    PopularModel({
        this.success,
        this.message,
        this.data,
    });

    bool? success;
    String? message;
    PopularData? data;

    PopularModel fromJson(Map<String, dynamic> json) => PopularModel(
        success: json["Success"] == null ? null : json["Success"],
        message: json["Message"] == null ? null : json["Message"],
        data: json["Data"] == null ? null : PopularData.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Success": success == null ? null : success,
        "Message": message == null ? null : message,
        "Data": data == null ? null : data!.toJson(),
    };
}

class PopularData {
    PopularData({
        this.topics,
        this.pageCount,
        this.pageSize,
        this.pageIndex,
        this.hasPinnedIndexItem,
        this.pinnedIndexItem,
    });

    List<PopularTopic>? topics;
    int? pageCount;
    int? pageSize;
    int? pageIndex;
    bool? hasPinnedIndexItem;
    PopularPinnedIndexItem? pinnedIndexItem;

    factory PopularData.fromJson(Map<String, dynamic> json) => PopularData(
        topics: json["Topics"] == null ? null : List<PopularTopic>.from(json["Topics"].map((x) => PopularTopic.fromJson(x))),
        pageCount: json["PageCount"] == null ? null : json["PageCount"],
        pageSize: json["PageSize"] == null ? null : json["PageSize"],
        pageIndex: json["PageIndex"] == null ? null : json["PageIndex"],
        hasPinnedIndexItem: json["HasPinnedIndexItem"] == null ? null : json["HasPinnedIndexItem"],
        pinnedIndexItem: json["PinnedIndexItem"] == null ? null : PopularPinnedIndexItem.fromJson(json["PinnedIndexItem"]),
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

class PopularPinnedIndexItem {
    PopularPinnedIndexItem({
        this.title,
        this.topicId,
    });

    String? title;
    int? topicId;

    factory PopularPinnedIndexItem.fromJson(Map<String, dynamic> json) => PopularPinnedIndexItem(
        title: json["Title"] == null ? null : json["Title"],
        topicId: json["TopicId"] == null ? null : json["TopicId"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "TopicId": topicId == null ? null : topicId,
    };
}


class PopularTopic {
    PopularTopic({
        this.matchedCount,
        this.topicId,
        this.fullCount,
        this.title,
    });

    int? matchedCount;
    int? topicId;
    int? fullCount;
    String? title;

    factory PopularTopic.fromJson(Map<String, dynamic> json) => PopularTopic(
        matchedCount: json["MatchedCount"] == null ? null : json["MatchedCount"],
        topicId: json["TopicId"] == null ? null : json["TopicId"],
        fullCount: json["FullCount"] == null ? null : json["FullCount"],
        title: json["Title"] == null ? null : json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "MatchedCount": matchedCount == null ? null : matchedCount,
        "TopicId": topicId == null ? null : topicId,
        "FullCount": fullCount == null ? null : fullCount,
        "Title": title == null ? null : title,
    };
}