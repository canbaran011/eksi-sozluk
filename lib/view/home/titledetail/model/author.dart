
class Author {
    Author({
        this.nick,
        this.id,
    });

    String? nick;
    int? id;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        nick: json["Nick"] == null ? null : json["Nick"],
        id: json["Id"] == null ? null : json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Nick": nick == null ? null : nick,
        "Id": id == null ? null : id,
    };
}