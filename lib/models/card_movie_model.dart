class CardMovieModel {
  final int? idMovie;
  final String? titleMovie;
  final double? priceMovie;
  final String? imageMovie;

  CardMovieModel({
    required this.idMovie,
    required this.titleMovie,
    required this.priceMovie,
    required this.imageMovie,
  });

  factory CardMovieModel.fromJson(Map<String, dynamic> json) {
    return CardMovieModel(
      idMovie: json["id"],
      titleMovie: json["title"],
      priceMovie: json["price"],
      imageMovie: json["image"],
    );
  }
}
