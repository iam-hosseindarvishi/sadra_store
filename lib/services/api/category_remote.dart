import '../../models/product_category.dart';
import '../../models/token.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class CategoryApi extends ApiServices {
  // get product categories form api
  Future<List<ProductCategory>> getCategories() async {
    final dio=Dio();
    dio.options.headers["Content-Type"] = "application/json";
    List<ProductCategory> categories = [];
    Token token =Token.getToken;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options,handler){
        // اضافه کردن توکن به درخواست
        options.headers["Authorization"]="Bearer ${token.token}";
        handler.next(options);
      }
    ));
    var body = convert.jsonEncode({
      "fromProductCategoryVersion": 0,
    });
    var response = await dio.post("$endPoint/API/v3/Sync/GetAllData",data: body);

    if (response.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    // Map<String, dynamic> categoryMap = convert.jsonDecode(response.body);
    List<dynamic> items = response.data["Data"]["Objects"]
        ["ProductCategories"];
    categories.addAll(items.map((e) {
      return ProductCategory.fromJson(e);
    }));
    return categories;
  }
}
