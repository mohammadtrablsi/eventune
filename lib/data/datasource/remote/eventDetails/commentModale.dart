class CommentModale {
  int? id;
  String? name;
  Pivot? pivot;

  CommentModale({this.id, this.name, this.pivot});

  CommentModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? comment;
  String? createdAt;

  Pivot({this.comment, this.createdAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    return data;
  }
}