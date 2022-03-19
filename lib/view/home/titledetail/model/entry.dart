


import 'package:eksi_sozluk/view/home/titledetail/model/author.dart';

class Entry {
    Entry({
        this.id,
        this.content,
        this.author,
        this.created,
        this.lastUpdated,
        this.isFavorite,
        this.favoriteCount,
        this.hidden,
        this.active,
        this.commentCount,
        this.commentSummary,
        this.avatarUrl,
        this.media,
    });

    int? id;
    String? content;
    Author? author;
    String? created;
    String? lastUpdated;
    bool? isFavorite;
    int? favoriteCount;
    bool? hidden;
    bool? active;
    int? commentCount;
    dynamic? commentSummary;
    dynamic? avatarUrl;
    List<String>? media;

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        id: json["Id"] == null ? null : json["Id"],
        content: json["Content"] == null ? null : json["Content"],
        author: json["Author"] == null ? null : Author.fromJson(json["Author"]),
        created: json["Created"] == null ? null : json["Created"],
        lastUpdated: json["LastUpdated"] == null ? null : json["LastUpdated"],
        isFavorite: json["IsFavorite"] == null ? null : json["IsFavorite"],
        favoriteCount: json["FavoriteCount"] == null ? null : json["FavoriteCount"],
        hidden: json["Hidden"] == null ? null : json["Hidden"],
        active: json["Active"] == null ? null : json["Active"],
        commentCount: json["CommentCount"] == null ? null : json["CommentCount"],
        commentSummary: json["CommentSummary"],
        avatarUrl: json["AvatarUrl"],
        media: json["Media"] == null ? null : List<String>.from(json["Media"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Content": content == null ? null : content,
        "Author": author == null ? null : author!.toJson(),
        "Created": created == null ? null : created,
        "LastUpdated": lastUpdated == null ? null : lastUpdated,
        "IsFavorite": isFavorite == null ? null : isFavorite,
        "FavoriteCount": favoriteCount == null ? null : favoriteCount,
        "Hidden": hidden == null ? null : hidden,
        "Active": active == null ? null : active,
        "CommentCount": commentCount == null ? null : commentCount,
        "CommentSummary": commentSummary,
        "AvatarUrl": avatarUrl,
        "Media": media == null ? null : List<dynamic>.from(media!.map((x) => x)),
    };
}