class Booth {
  late String boothname;
  late String price;
  late String size;


  Booth({required this.boothname,required this. price,required this.size});

  Booth.fromJson(Map<String, dynamic> json) {
    boothname = json['userId'];
    size = json['body'];
    price = json['id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.boothname;
    data['body'] = this.size;
    return data;
  }
}