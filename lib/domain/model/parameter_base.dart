class ParameterBase {
  ParameterBase({
    this.paramGroup,
    this.paramName,
    this.value,
  });

  ParameterBase.fromJson(Map<String, dynamic> json) {
    paramGroup = json['paramGroup'] as String?;
    paramName = json['paramName'] as String?;
    value = json['value'] as String?;
  }

  String? paramGroup;
  String? paramName;
  String? value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'paramGroup': paramGroup,
        'paramName': paramName,
        'value': value,
      };
}
