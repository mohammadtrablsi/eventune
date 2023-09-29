class AcceptModale {
  int? id;
  int? venueId;
  String? description;
  int? capacity;
  int? price;
  Name? name;
  List<Events>? events;

  AcceptModale(
      {this.id,
      this.venueId,
      this.description,
      this.capacity,
      this.price,
      this.name,
      this.events});

  AcceptModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    description = json['description'];
    capacity = json['capacity'];
    price = json['price'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
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
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
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

class Events {
  int? id;
  int? sectionId;
  int? userId;
  String? name;
  String? description;
  int? capacity;
  String? date;
  String? startTime;
  String? endTime;
  String? privacy;
  String? status;
  List<Photos>? photos;
  Pivot? pivot;
  Ticket? ticket;
  Name? user;

  Events(
      {this.id,
      this.sectionId,
      this.userId,
      this.name,
      this.description,
      this.capacity,
      this.date,
      this.startTime,
      this.endTime,
      this.privacy,
      this.status,
      this.photos,
      this.pivot,
      this.ticket,
      this.user});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    capacity = json['capacity'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    privacy = json['privacy'];
    status = json['status'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    user = json['user'] != null ? new Name.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section_id'] = this.sectionId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['privacy'] = this.privacy;
    data['status'] = this.status;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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

class Pivot {
  int? id;
  Level? level;

  Pivot({this.id, this.level});

  Pivot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? level;
  int? price;

  Level({this.id, this.level, this.price});

  Level.fromJson(Map<String, dynamic> json) {
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

class Ticket {
  int? id;
  int? price;

  Ticket({this.id, this.price});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    return data;
  }
}
