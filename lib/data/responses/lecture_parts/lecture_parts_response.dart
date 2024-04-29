import 'package:json_annotation/json_annotation.dart';

part 'lecture_parts_response.g.dart';

@JsonSerializable()
class LecturePartsResponse {
  @JsonKey(name: "model")
  ModelResponse? model;

  // @JsonKey(name: "previous")
  // List<dynamic>? previous;
 // @JsonKey(name: "next")
  // List<NextResponse>? next;

  LecturePartsResponse({
    this.model,
    // this.previous,
    // this.next,
  });

  factory LecturePartsResponse.fromJson(Map<String, dynamic> json) =>
      _$LecturePartsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LecturePartsResponseToJson(this);
}

@JsonSerializable()
class ModelResponse {
  @JsonKey(name: "material")
  MaterialResponse? material;
  @JsonKey(name: "IsMaterialAvaliable")
  bool? isMaterialAvaliable;
  @JsonKey(name: "parts")
  List<PartsResponse>? parts;
  @JsonKey(name: "userID")
  int? userID;
  @JsonKey(name: "ExamsSolved")
  bool? examsSolved;

  ModelResponse({
    this.material,
    this.isMaterialAvaliable,
    this.parts,
    this.userID,
    this.examsSolved,
  });

  factory ModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModelResponseToJson(this);
}

@JsonSerializable()
class MaterialResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "isMandatory")
  bool? isMandatory;
  @JsonKey(name: "state")
  bool? state;
  @JsonKey(name: "material_name")
  String? materialName;
  @JsonKey(name: "IsAvaliable")
  bool? isAvaliable;

  MaterialResponse({
    this.id,
    this.isMandatory,
    this.state,
    this.materialName,
    this.isAvaliable,
  });

  factory MaterialResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialResponseToJson(this);
}

@JsonSerializable()
class PartsResponse {
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "materialId")
  int? materialId;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Path")
  String? path;
  @JsonKey(name: "SecondaryPath")
  String? secondaryPath;
  @JsonKey(name: "Views_Limit")
  int? viewsLimit;
  @JsonKey(name: "canStudentWatch")
  bool? canStudentWatch;
  @JsonKey(name: "view_percentage")
  int? viewPercentage;
  @JsonKey(name: "videoTypeId")
  int? videoTypeId;
  @JsonKey(name: "Token")
  String? token;
  @JsonKey(name: "VimeoID")
  String? vimeoID;
  @JsonKey(name: "isVimeo")
  bool? isVimeo;
  @JsonKey(name: "isComplete")
  bool? isComplete;
  @JsonKey(name: "state")
  bool? state;

  PartsResponse({
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
  });

  factory PartsResponse.fromJson(Map<String, dynamic> json) =>
      _$PartsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PartsResponseToJson(this);
}

@JsonSerializable()
class NextResponse {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "order")
  int? order;

  NextResponse({this.type, this.id, this.order});

  factory NextResponse.fromJson(Map<String, dynamic> json) =>
      _$NextResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NextResponseToJson(this);
}
