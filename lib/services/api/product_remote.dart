import 'package:sadra_store/models/product_detail_store_assets.dart';
import '../../models/product.dart';
import '../../models/product_detail.dart';
import '../../models/token.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class ProductApi extends ApiServices {
  // get products from api
  Future<List<Product>> getProducts() async {
    final dio=Dio();
    dio.options.headers["Content-Type"] = "application/json";
    List<Product> products = [];
    Token token = Token.getToken;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler){
          // اضافه کردن توکن به درخواست
          options.headers["Authorization"]="Bearer ${token.token}";
          handler.next(options);
        }
    ));
    var body = convert.jsonEncode({
      "fromProductVersion": 0,
    });
    var response = await dio.post("$endPoint/API/v3/Sync/GetAllData",data: body);

    if (response.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    // Map<String, dynamic> categoryMap = convert.jsonDecode(respone.body);
    List<dynamic> productsList =response.data["Data"]["Objects"]["Products"];
    products.addAll(productsList.map((e) {
      return Product.fromJson(e);
    }));
    return products;
  }

// get product datails from api
  Future<List<ProductDetail>> getProductsDatails() async {
    final dio=Dio();
    dio.options.headers["Content-Type"] = "application/json";
    List<ProductDetail> productsDatails = [];
    Token token =Token.getToken;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler){
          // اضافه کردن توکن به درخواست
          options.headers["Authorization"]="Bearer ${token.token}";
          handler.next(options);
        }
    ));
    var body = convert.jsonEncode({
      "fromProductDetailVersion": 0,
    });
    var response = await dio.post("$endPoint/API/v3/Sync/GetAllData",data: body);

    if (response.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    // Map<String, dynamic> categoryMap = convert.jsonDecode(respone.body);
    List<dynamic> productsDatailsList =response.data["Data"]["Objects"]["ProductDetails"];
    productsDatails.addAll(productsDatailsList.map((e) {
      return ProductDetail.fromJson(e);
    }));
    return productsDatails;
  }

  //  get product details store assets from api
  Future<List<ProductDetailStoreAssets>> getDetailAssets() async {
    List<ProductDetailStoreAssets> details = [];
    final dio=Dio();
    dio.options.headers["Content-Type"] = "application/json";
    Token token = Token.getToken;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler){
          // اضافه کردن توکن به درخواست
          options.headers["Authorization"]="Bearer ${token.token}";
          handler.next(options);
        }
    ));
    var body = convert.jsonEncode({
      "fromProductDetailStoreAssetVersion": 0,
    });
    var response = await dio.post("$endPoint/API/v3/Sync/GetAllData",data: body);

    if (response.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    List<dynamic> productsDatailsList = response.data["Data"]
        ["Objects"]["ProductDetailStoreAssets"];
    details.addAll(productsDatailsList.map((e) {
      return ProductDetailStoreAssets.fromJson(e);
    }));
    return details;
  }
}

// final initProductsProvider = Provider<ProductApi>((ref) => ProductApi());
