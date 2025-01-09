class Movie {
  String? id;
  String? title;
  String? imagUrl;

  Movie({this.id, this.title, this.imagUrl});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imagUrl = json['imagUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imagUrl'] = this.imagUrl;
    return data;
  }
}
