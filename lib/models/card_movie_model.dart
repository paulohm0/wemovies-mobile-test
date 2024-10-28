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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardMovieModel &&
          runtimeType == other.runtimeType &&
          idMovie == other.idMovie &&
          titleMovie == other.titleMovie &&
          priceMovie == other.priceMovie &&
          imageMovie == other.imageMovie;

  @override
  int get hashCode =>
      idMovie.hashCode ^
      titleMovie.hashCode ^
      priceMovie.hashCode ^
      imageMovie.hashCode;
}
