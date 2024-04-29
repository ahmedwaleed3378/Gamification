class GiftGalleryModel {
  List<GiftGalleryContentModel>? giftGallery;
  int itemsCount;

  GiftGalleryModel(
    this.giftGallery,
    this.itemsCount,
  );
}

class GiftGalleryContentModel {
  int id;
  String arabicName;
  String englishName;
  int qty;
  double points;
  String description;
  String attachPath;

  GiftGalleryContentModel(
    this.id,
    this.arabicName,
    this.englishName,
    this.qty,
    this.points,
    this.description,
    this.attachPath,
  );
}
