
class Topic {
    Topic({
        this.day,
        this.matchedCount,
        this.topicId,
        this.fullCount,
        this.title,
    });

    String? day;
    int? matchedCount;
    int? topicId;
    int? fullCount;
    String? title;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        day: json["Day"] == null ? null : json["Day"],
        matchedCount: json["MatchedCount"] == null ? null : json["MatchedCount"],
        topicId: json["TopicId"] == null ? null : json["TopicId"],
        fullCount: json["FullCount"] == null ? null : json["FullCount"],
        title: json["Title"] == null ? null : json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "Day": day == null ? null : day,
        "MatchedCount": matchedCount == null ? null : matchedCount,
        "TopicId": topicId == null ? null : topicId,
        "FullCount": fullCount == null ? null : fullCount,
        "Title": title == null ? null : title,
    };
}
