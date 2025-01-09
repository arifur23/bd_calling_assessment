class Series {
  String? id;
  String? title;
  String? imagUrl;
  String? episode;

  Series({this.id, this.title, this.imagUrl, this.episode});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imagUrl = json['imagUrl'];
    episode = json['episode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['imagUrl'] = imagUrl;
    data['episode'] = episode;
    return data;
  }
}
