import 'package:json_annotation/json_annotation.dart';

part 'help_support_response.g.dart';

@JsonSerializable()
class HelpSupportResponse {
  @JsonKey(name: "helpContent")
  HelpContentResponse? helpContent;
  @JsonKey(name: "commonQuestionsContent")
  List<CommonQuestionsContentResponse>? commonQuestionsContent;
  @JsonKey(name: "privacyContent")
  String? privacyContent;
  @JsonKey(name: "termsContent")
  String? termsContent;

  HelpSupportResponse({
    this.helpContent,
    this.commonQuestionsContent,
    this.privacyContent,
    this.termsContent,
  });

  factory HelpSupportResponse.fromJson(Map<String, dynamic> json) =>
      _$HelpSupportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HelpSupportResponseToJson(this);
}

@JsonSerializable()
class HelpContentResponse {
  @JsonKey(name: "companyNumbers")
  List<String>? companyNumbers;
  @JsonKey(name: "companyEmails")
  List<String>? companyEmails;

  HelpContentResponse({
    this.companyNumbers,
    this.companyEmails,
  });

  factory HelpContentResponse.fromJson(Map<String, dynamic> json) =>
      _$HelpContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HelpContentResponseToJson(this);
}

@JsonSerializable()
class CommonQuestionsContentResponse {
  @JsonKey(name: "Question")
  String? question;
  @JsonKey(name: "Answer")
  String? answer;

  CommonQuestionsContentResponse({this.question, this.answer});

  factory CommonQuestionsContentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonQuestionsContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonQuestionsContentResponseToJson(this);
}
