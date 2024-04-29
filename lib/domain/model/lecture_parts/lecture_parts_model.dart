class LecturePartsModel {
  ModelModel? model;

  // List<dynamic>? previous;
  // List<NextModel>? next;

  LecturePartsModel(
    this.model,
    // this.previous,
    // this.next,
  );
}

class ModelModel {
  MaterialModel? material;
  bool isMaterialAvaliable;
  List<PartsModel>? parts;
  int userID;
  bool examsSolved;

  ModelModel(
    this.material,
    this.isMaterialAvaliable,
    this.parts,
    this.userID,
    this.examsSolved,
  );
}

class MaterialModel {
  int id;
  bool isMandatory;
  bool state;
  String materialName;
  bool isAvaliable;

  MaterialModel(
    this.id,
    this.isMandatory,
    this.state,
    this.materialName,
    this.isAvaliable,
  );
}

class PartsModel {
  int id;
  int materialId;
  String name;
  String path;
  String secondaryPath;
  int viewsLimit;
  bool canStudentWatch;
  int viewPercentage;
  int videoTypeId;
  String token;
  String vimeoID;
  bool isVimeo;
  bool isComplete;
  bool state;

  PartsModel(
    this.id,
    this.materialId,
    this.name,
    this.path,
    this.secondaryPath,
    this.viewsLimit,
    this.canStudentWatch,
    this.viewPercentage,
    this.videoTypeId,
    this.token,
    this.vimeoID,
    this.isVimeo,
    this.isComplete,
    this.state,
  );
}

class NextModel {
  String type;
  int id;
  int order;

  NextModel(this.type, this.id, this.order);
}
