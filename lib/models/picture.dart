class Picture {
  int? pictureId;
  String? url;
  Picture({this.pictureId, this.url});
  factory Picture.fromJson(Map<String, dynamic> json) =>
      Picture(pictureId: json["PictureId"], url: json["Url"]);
}
