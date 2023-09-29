class SectionsModale {
  int? id;
  int? venueId;
  String? description;
  int? capacity;
  int? price;
  Name? name;
  List<Photos>? photos;
  List<CategoriesPivot>? categoriesPivot;

  SectionsModale(
      {this.id,
        this.venueId,
        this.description,
        this.capacity,
        this.price,
        this.name,
        this.photos,
        this.categoriesPivot});

  SectionsModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    description = json['description'];
    capacity = json['capacity'];
    price = json['price'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    if (json['categories_pivot'] != null) {
      categoriesPivot = <CategoriesPivot>[];
      json['categories_pivot'].forEach((v) {
        categoriesPivot!.add(new CategoriesPivot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.categoriesPivot != null) {
      data['categories_pivot'] =
          this.categoriesPivot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  int? id;
  String? name;

  Name({this.id, this.name});

  Name.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Photos {
  int? id;
  String? path;

  Photos({this.id, this.path});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}

class CategoriesPivot {
  int? id;
  List<Levels>? levels;
  Name? category;

  CategoriesPivot({this.id, this.levels, this.category});

  CategoriesPivot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
    category =
    json['category'] != null ? new Name.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Levels {
  int? id;
  String? level;
  int? price;

  Levels({this.id, this.level, this.price});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['price'] = this.price;
    return data;
  }
}