class api_model {
  int id;
  String title;
  String description;
  int price;
  var rating;
  String category;
  String thumbnail;
  List images;

  api_model({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.images,
    required this.price,
    required this.rating,
    required this.thumbnail,
  });

  factory api_model.fromApi({required Map<String, dynamic> data}) {
    return api_model(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      category: data['category'],
      images: data['images'],
      price: data['price'],
      rating: data['rating'],
      thumbnail: data['thumbnail'],
    );
  }
}
