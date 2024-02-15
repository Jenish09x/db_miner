class HomeModel {
  int? id;
  String? category;
  List<dynamic>? quotes;
  List<dynamic>? author;

  HomeModel({this.id, this.category, this.quotes, this.author});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      category: m1['category'],
      author: m1['author'],
      quotes: m1['quotes'],
    );
  }
}
