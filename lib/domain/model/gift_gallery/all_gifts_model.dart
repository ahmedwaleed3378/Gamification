import '../header_profile_data/header_profile_data.dart';

class AllGiftsModel {
  ProfileDataModel profileData;
  List<GiftModel> allGifts;
  AllGiftsModel(this.profileData, this.allGifts);
}

class GiftModel {
  int giftId;
  String giftArName;
  String giftEnName;
  String giftPicture;
  int giftQuantity;
  double giftPoints;
  int giftCategory;
  String giftDescreption;
  int giftCreationUserId;

  GiftModel(
    this.giftId,
    this.giftArName,
    this.giftEnName,
    this.giftPicture,
    this.giftQuantity,
    this.giftPoints,
    this.giftCategory,
    this.giftDescreption,
    this.giftCreationUserId,
  );
}
