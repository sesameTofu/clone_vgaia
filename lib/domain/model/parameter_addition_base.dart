class ParameterAdditionBase {
  ParameterAdditionBase({
    this.paramGroup,
    this.paramName,
    this.scope,
    this.value,
  });

  ParameterAdditionBase.fromJson(Map<String, dynamic> json) {
    paramGroup = json['paramGroup'] as String?;
    paramName = json['paramName'] as String?;
    scope = json['scope'] as String?;
    value = json['value'] as String?;
  }

  String? paramGroup;
  String? paramName;
  String? scope;
  String? value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'paramGroup': paramGroup,
        'paramName': paramName,
        'scope': scope,
        'value': value,
      };
}
