import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/photo_galleries.dart';
import '../../constants/constants.dart';
import '../../models/picture.dart';
import '../../models/product.dart';
import '../../models/product_category.dart';
import '../../models/product_detail.dart';
import '../../models/token.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../database/token_db.dart';

class ApiServices {
  String endPoint = "mahakacc.mahaksoft.com";
  //  get token from api
  Future<Token> getToken() async {
    Token token = Token();
    var uri = Uri.https(endPoint, "/API/v3/Sync/login");
    var body = convert.jsonEncode(apiInfo);
    var respone = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    if (respone.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(respone.body);
      // print(token.fromJson(jsonResponse).token);
      token.token = jsonResponse["Data"]["UserToken"];
      await TokenDb().checkTokenExsist() != true
          ? await TokenDb().store(token)
          : await TokenDb().update(token);

      return token;
    }
    return token;
  }

  // get user form api
  Future<User> getUser(String phone, String password) async {
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromPersonVersion": 0,
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
    Map<String, dynamic> userMap = convert.jsonDecode(respone.body);
    List<dynamic> users = userMap["Data"]["Objects"]["People"];
    late User? user;
    for (var el in users) {
      if (el["Phone"] == phone && el["Password"] == password) {
        user = User.fromJson(el);
        break;
      }
    }
    if (user == null) {
      return throw Exception("نام کاربری یا کلمه عبور اشتباه است");
    }
    return user;
  }

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

  // get products from api
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromProductVersion": 0,
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
    List<dynamic> productsList =
        convert.jsonDecode(respone.body)["Data"]["Objects"]["Products"];
    products.addAll(productsList.map((e) {
      return Product.fromJson(e);
    }));
    return products;
  }

// get product datails from api
  Future<List<ProductDetail>> getProductsDatails() async {
    List<ProductDetail> productsDatails = [];
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromProductDetailVersion": 0,
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
    List<dynamic> productsDatailsList =
        convert.jsonDecode(respone.body)["Data"]["Objects"]["ProductDetails"];
    productsDatails.addAll(productsDatailsList.map((e) {
      return ProductDetail.fromJson(e);
    }));
    return productsDatails;
  }

  // get product images from api
  Future<Map<int, String>> getPictures() async {
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert
        .jsonEncode({"fromPhotoGalleryVersion": 0, "fromPictureVersion": 0});
    var respone = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.token}"
        },
        body: body);
    if (respone.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    List<dynamic> galleriesMap =
        convert.jsonDecode(respone.body)["Data"]["Objects"]["PhotoGalleries"];
    List<dynamic> picturesMap =
        convert.jsonDecode(respone.body)["Data"]["Objects"]["Pictures"];
    List<PhotoGalleries> galleriesList =
        List.from(galleriesMap.map((e) => PhotoGalleries.fromJson(e)));
    List<Picture> picturesList =
        List.from(picturesMap.map((e) => Picture.fromJson(e)));

    Map<int, String> pictures = {};
    for (var gallery in galleriesList) {
      pictures.addAll({
        gallery.itemCode!:
            "https://mahakacc.mahaksoft.com${picturesList.singleWhere((element) => element.pictureId == gallery.pictureId).url!}"
      });
    }
    return pictures;
  }
}

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
