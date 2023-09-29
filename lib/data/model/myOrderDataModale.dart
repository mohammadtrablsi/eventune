class MyOrderDataModale {
  int? id;
  int? userId;
  int? storeId;
  String? date;
  String? time;
  String? status;
  String? createdAt;
  int? cost;
  List<Products>? products;
  List<Location>? location;
  CostumLocation? costumLocation;
  Store? store;

  MyOrderDataModale(
      {this.id,
        this.userId,
        this.storeId,
        this.date,
        this.time,
        this.status,
        this.createdAt,
        this.cost,
        this.products,
        this.location,
        this.costumLocation,
        this.store});

  MyOrderDataModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    createdAt = json['created_at'];
    cost = json['cost'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['location'] != null) {
      location = <Location>[];
      json['location'].forEach((v) {
        location!.add(new Location.fromJson(v));
      });
    }
    costumLocation = json['costum_location'] != null
        ? new CostumLocation.fromJson(json['costum_location'])
        : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['cost'] = this.cost;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.map((v) => v.toJson()).toList();
    }
    if (this.costumLocation != null) {
      data['costum_location'] = this.costumLocation!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  int? price;
  Pivot? pivot;
  Product? product;

  Products({this.id, this.price, this.pivot, this.product});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? storeProductId;
  int? quantity;

  Pivot({this.storeProductId, this.quantity});

  Pivot.fromJson(Map<String, dynamic> json) {
    storeProductId = json['store_product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_product_id'] = this.storeProductId;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  List<Photos>? photos;

  Product({this.id, this.name, this.description, this.photos});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
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

class Location {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? longitude;
  String? latitude;

  Location(
      {this.id,
        this.userId,
        this.name,
        this.description,
        this.longitude,
        this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class CostumLocation {
  int? id;
  int? orderId;
  String? longitude;
  String? latitude;

  CostumLocation({this.id, this.orderId, this.longitude, this.latitude});

  CostumLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Store {
  int? id;
  String? name;
  List<Phones>? phones;

  Store({this.id, this.name, this.phones});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phones {
  int? id;
  String? phoneNumber;

  Phones({this.id, this.phoneNumber});

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}