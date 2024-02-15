class DbModel {
  String? quotes, author, category;
  int? id;

  DbModel({this.id,this.quotes, this.author, this.category});

  factory DbModel.mapToModel(Map m1) {
    return DbModel(
      id: m1['id'],
      category: m1['category'],
      quotes: m1['quotes'],
      author: m1['author'],
    );
  }
}