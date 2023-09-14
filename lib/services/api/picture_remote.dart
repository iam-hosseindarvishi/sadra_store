import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/photo_galleries.dart';
import '../../models/picture.dart';
import '../../models/token.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class PictureApi extends ApiServices {
  // get product images from api
  Future<Map<int, String>> getPictures() async {
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
    var body = convert
        .jsonEncode({"fromPhotoGalleryVersion": 0, "fromPictureVersion": 0});
    var response = await dio.post("$endPoint/API/v3/Sync/GetAllData",data: body);

    if (response.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    List<dynamic> galleriesMap =
       response.data["Data"]["Objects"]["PhotoGalleries"];
    List<dynamic> picturesMap =
       response.data["Data"]["Objects"]["Pictures"];
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

final prictureRemoteProvider = Provider<PictureApi>((ref) => PictureApi());
