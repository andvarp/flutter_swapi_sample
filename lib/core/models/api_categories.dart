class ApiCategories {
  Map<String, dynamic> categoriesMap = {};

  ApiCategories({this.categoriesMap});

  ApiCategories.fromJson(Map<String, dynamic> json) {
    categoriesMap = json;
  }

  Map<String, dynamic> toJson() {
    return categoriesMap;
  }

  bool get hasData {
    return (categoriesMap?.length ?? 0) > 0;
  }
}
