class GestureModel
{
  String? imageUrl;
  String? title;

  GestureModel({this.imageUrl,this.title});
}

List<GestureModel> gestureItemList = [
  GestureModel(imageUrl: "", title: "Tap"),
  GestureModel(imageUrl: "", title: "Double tap"),
  GestureModel(imageUrl: "", title: "Long press"),
  GestureModel(imageUrl: "", title: "Scale"),
  GestureModel(imageUrl: "", title: "Drag"),
];