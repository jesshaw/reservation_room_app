class PostResponse {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostResponse({this.userId, this.id, this.title, this.body});

  PostResponse.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];
}
