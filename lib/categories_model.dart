class CategoriesModel
{
  String? categoryStr;

  CategoriesModel.fromJson(Map<String, dynamic> json)
  {
    categoryStr = json['categories'][0]['strCategory'];
  }
}