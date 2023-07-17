class PhotoGalleries {
  int? photoGalleryId;
  int? pictureId;
  int? itemCode;
  String? url;
  PhotoGalleries(
      {this.photoGalleryId, this.itemCode, this.pictureId, this.url});

  factory PhotoGalleries.fromJson(Map<String, dynamic> json) => PhotoGalleries(
      photoGalleryId: json["PhotoGalleryId"] as int?,
      pictureId: json["PictureId"] as int?,
      itemCode: json["ItemCode"]);
}
