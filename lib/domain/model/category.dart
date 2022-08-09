class Category {
  Category({
    this.categoryNameVi,
    this.categoryNameEn,
    this.localCategory = false,
    this.removable = true, // Được phép sửa đổi
    this.listSecQuotesCode,
    this.categoryId, // Danh mục user tạo lưu trên server
    this.isCustomerPortfolio = false, // Danh mục đầu tư
    this.marketIndexId, // Danh sách chỉ số, VN30, HNX.....
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryNameVi = json['categoryNameVi'] as String?;
    categoryNameEn = json['categoryNameEn'] as String?;
    removable = json['removable'] as bool;
    listSecQuotesCode = json['listSecQuotesCode'] != null
        ? json['listSecQuotesCode']?.cast<String>() as List<String>
        : <String>[];
    categoryId = json['categoryId'] as int?;
    isCustomerPortfolio = json['isCustomerPortfolio'] as bool?;
    marketIndexId = json['marketIndexId'] as int?;
    localCategory = json['localCategory'] as bool? ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryNameVi'] = categoryNameVi;
    data['categoryNameEn'] = categoryNameEn;
    data['removable'] = removable;
    data['listSecQuotesCode'] = listSecQuotesCode;
    data['categoryId'] = categoryId;
    data['isCustomerPortfolio'] = isCustomerPortfolio;
    data['marketIndexId'] = marketIndexId;
    data['localCategory'] = localCategory;
    return data;
  }

  String? categoryNameVi;
  String? categoryNameEn;
  bool? removable;
  List<String>? listSecQuotesCode = <String>[];

  int? categoryId;
  bool? isCustomerPortfolio;
  int? marketIndexId;
  late bool localCategory;

  // Có đươc phéo thao tác trên danh mục hay không ??
  bool get cellRemovable {
    if (isCustomerPortfolio ?? false) {
      return false;
    }

    if (marketIndexId != null) {
      return false;
    }

    // if (removable != null && !removable!) {
    //   return false;
    // }
    return true;
  }
}
