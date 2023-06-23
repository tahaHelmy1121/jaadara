class Offers {
  List<Data>? data;
  var message;
  var status;

  Offers({this.data, this.message, this.status});

  Offers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  var id;
  var title;
  var photo;
  var discount;
  var price;
  var isFavorite;

  Data(
      {this.id,
        this.title,
        this.photo,
        this.discount,
        this.price,
        this.isFavorite});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    photo = json['photo'];
    discount = json['discount'];
    price = json['price'];
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['photo'] = this.photo;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['is_favorite'] = this.isFavorite;
    return data;
  }
}