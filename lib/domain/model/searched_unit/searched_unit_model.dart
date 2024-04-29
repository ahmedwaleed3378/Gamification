class SearchedUnitModel {
  int id;
  int subjectId;
  String unitArName;
  String unitEnName;
  bool state;
  int sesemesterID;
  int unitThumbnailId;
  String unitDescription;
  int creationUserId;
  String creationDate;
  int editedUserId;
  String editedDate;
  int centerId;
  int createBranchId;
  int updateBranchId;
  int orderNum;
  bool isMandatory;
  // String unitThumb;
  String thumbnailPic;
  double totalPrice;
  double discountPrice;
  int firstMaterialId;
  double matCount;
  double examCount;
  int docAttachCount;
  int offlineMatCount;
  String attachPath;

  SearchedUnitModel(
    this.id,
    this.subjectId,
    this.unitArName,
    this.unitEnName,
    this.state,
    this.sesemesterID,
    this.unitThumbnailId,
    this.unitDescription,
    this.creationUserId,
    this.creationDate,
    this.editedUserId,
    this.editedDate,
    this.centerId,
    this.createBranchId,
    this.updateBranchId,
    this.orderNum,
    this.isMandatory,
    // this.unitThumb,
    this.thumbnailPic,
    this.totalPrice,
    this.discountPrice,
    this.firstMaterialId,
    this.matCount,
    this.examCount,
    this.docAttachCount,
    this.offlineMatCount,
    this.attachPath,
  );
}
