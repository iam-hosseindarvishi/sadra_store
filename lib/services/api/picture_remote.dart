import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/providers/token_provider.dart';

import '../../models/photo_galleries.dart';
import '../../models/picture.dart';
import '../../models/token.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PictureApi extends ApiServices {
  // get product images from api
  Future<Map<int, String>> getPictures() async {
    Token token = TokenNotifier().getToken();
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

final prictureRemoteProvider = Provider<PictureApi>((ref) => PictureApi());
