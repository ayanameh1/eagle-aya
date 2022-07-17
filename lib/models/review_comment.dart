class Review {
  int? userId;
  int? companyid;
  String? body;
  String? username;

  Review({this.userId, this. companyid,  this.body,this.username});

  Review.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    body = json['body'];
    username =json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['body'] = this.body;
    return data;
  }
}