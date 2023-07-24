import '../../models/product_category.dart';
import '../../models/token.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CategoryApi extends ApiServices {
  // get product categories form api
  Future<List<ProductCategory>> getCategories() async {
    List<ProductCategory> categories = [];
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromProductCategoryVersion": 0,
    });
    var respone = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.token}"
        },
        body: body);
    if (respone.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    // Map<String, dynamic> categoryMap = convert.jsonDecode(respone.body);
    List<dynamic> items = convert.jsonDecode(respone.body)["Data"]["Objects"]
        ["ProductCategories"];
    categories.addAll(items.map((e) {
      return ProductCategory.fromJson(e);
    }));
    return categories;
  }
}
