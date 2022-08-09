class FavouriteCategoryBase {
  FavouriteCategoryBase({
    this.guidId,
    this.categoryId,
    this.favouriteName,
    this.isDefault,
    this.isAllowDelete,
  });

  FavouriteCategoryBase.fromJson(Map<String, dynamic> json) {
    guidId = json['guidId'] as String?;
    categoryId = json['categoryId'] as int?;
    favouriteName = json['favouriteName'] as String?;
    isDefault = json['isDefault'] as num?;
    isAllowDelete = json['isAllowDelete'] as bool?;
  }

  String? guidId;
  int? categoryId;
  String? favouriteName;
  num? isDefault;
  bool? isAllowDelete;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'guidId': guidId,
        'categoryId': categoryId,
        'favouriteName': favouriteName,
        'isDefault': isDefault,
        'isAllowDelete': isAllowDelete,
      };
}
