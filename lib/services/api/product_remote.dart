import 'package:sadra_store/models/product_detail_store_assets.dart';
import '../../models/product.dart';
import '../../models/product_detail.dart';
import '../../models/token.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProductApi extends ApiServices {
  // get products from api
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    Token token = Token.getToken;
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
    Token token =Token.getToken;
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

  //  get product details store assets from api
  Future<List<ProductDetailStoreAssets>> getDetailAssets() async {
    List<ProductDetailStoreAssets> details = [];
    Token token = Token.getToken;
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromProductDetailStoreAssetVersion": 0,
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
    List<dynamic> productsDatailsList = convert.jsonDecode(respone.body)["Data"]
        ["Objects"]["ProductDetailStoreAssets"];
    details.addAll(productsDatailsList.map((e) {
      return ProductDetailStoreAssets.fromJson(e);
    }));
    return details;
  }
}

// final initProductsProvider = Provider<ProductApi>((ref) => ProductApi());
