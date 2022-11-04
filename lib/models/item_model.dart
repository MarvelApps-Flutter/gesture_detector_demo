class ItemModel {
  String? imageUrl;
  String? parentTitle;
  String? title;

  ItemModel({this.imageUrl, this.parentTitle, this.title});
}

List<ItemModel> itemLists = [
  ItemModel(imageUrl: "", parentTitle: "Tap", title: "OnTapDown"),
  ItemModel(imageUrl: "", parentTitle: "Tap", title: "OnTapUp"),
  ItemModel(imageUrl: "", parentTitle: "Tap", title: "OnTap"),
  ItemModel(imageUrl: "", parentTitle: "Tap", title: "OnTapCancel"),
  ItemModel(imageUrl: "", parentTitle: "Double tap", title: "OnDoubleTapDown"),
  ItemModel(imageUrl: "", parentTitle: "Double tap", title: "OnDoubleTap"),
  ItemModel(
      imageUrl: "", parentTitle: "Double tap", title: "OnDoubleTapCancel"),
  ItemModel(imageUrl: "", parentTitle: "Long press", title: "OnLongPressDown"),
  ItemModel(imageUrl: "", parentTitle: "Long press", title: "OnLongPressStart"),
  ItemModel(imageUrl: "", parentTitle: "Long press", title: "OnLongPress"),
  ItemModel(
      imageUrl: "", parentTitle: "Long press", title: "OnLongPressMoveUpdate"),
  ItemModel(imageUrl: "", parentTitle: "Long press", title: "OnLongPressEnd"),
  ItemModel(imageUrl: "", parentTitle: "Long press", title: "OnLongPressUp"),
  ItemModel(
      imageUrl: "", parentTitle: "Long press", title: "OnLongPressCancel"),
  ItemModel(imageUrl: "", parentTitle: "Scale", title: "OnScaleStart"),
  ItemModel(imageUrl: "", parentTitle: "Scale", title: "OnScaleUpdate"),
  ItemModel(imageUrl: "", parentTitle: "Scale", title: "OnScaleEnd"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "OnVerticalDragDown"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "OnVerticalDragStart"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "OnVerticalDragUpdate"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onVerticalDragEnd"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onVerticalDragCancel"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onHorizontalDragDown"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onHorizontalDragStart"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onHorizontalDragUpdate"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onHorizontalDragEnd"),
  ItemModel(imageUrl: "", parentTitle: "Drag", title: "onHorizontalDragCancel"),
];
