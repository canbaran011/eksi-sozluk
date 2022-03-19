

class PinnedIndexItem {
    PinnedIndexItem({
        this.title,
        this.topicId,
    });

    String? title;
    int? topicId;

    factory PinnedIndexItem.fromJson(Map<String, dynamic> json) => PinnedIndexItem(
        title: json["Title"] == null ? null : json["Title"],
        topicId: json["TopicId"] == null ? null : json["TopicId"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "TopicId": topicId == null ? null : topicId,
    };
}