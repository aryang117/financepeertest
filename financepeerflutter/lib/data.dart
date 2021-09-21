class Data {
  final int id;
  final int userId;
  final String body;
  final String title;

  Data(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id1'],
        userId: json['userId'],
        body: json['body'],
        title: json['title']);
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'userId': this.userId,
        'body': this.body,
        title: this.title
      };
}
