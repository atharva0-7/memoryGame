class CardModel {
  String title;
  String id;
  bool isSelected;
  String imageUrl;

  CardModel(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.isSelected});
}
