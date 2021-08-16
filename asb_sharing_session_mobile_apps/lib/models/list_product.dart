class ListProduct {
  String version;
  List<Result> result;

  ListProduct({this.version, this.result});

  ListProduct.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int id;
  String name;
  String image;
  double price;
  int qtyAvailable;

  Result({this.id, this.name, this.image, this.price, this.qtyAvailable});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    qtyAvailable = json['qty_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['qty_available'] = this.qtyAvailable;
    return data;
  }
}
