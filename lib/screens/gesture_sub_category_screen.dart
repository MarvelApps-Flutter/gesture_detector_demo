import 'package:flutter/material.dart';
import '../models/item_model.dart';

class GestureSubCategoryScreen extends StatefulWidget {
  final String? conditionalString;
  const GestureSubCategoryScreen({Key? key, this.conditionalString})
      : super(key: key);

  @override
  State<GestureSubCategoryScreen> createState() =>
      _GestureSubCategoryScreenState();
}

class _GestureSubCategoryScreenState extends State<GestureSubCategoryScreen> {
  List<ItemModel> itemModelList = [];
  bool? isBulbTapped;
  bool? isShapeTapped;
  double _scaleFactor = 3.0;
  double _baseScaleFactor = 3.0;
  String? dragDirection;
  String? startDXPoint;
  String? startDYPoint;
  String? dXPoint;
  String? dYPoint;
  String? velocity;

  @override
  void initState() {
    isBulbTapped = false;
    isShapeTapped = false;
    itemModelList = itemLists
        .where((element) => element.parentTitle == widget.conditionalString)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: const Color(0xffF2F5F8),
        body: buildBody(context),
      ),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          (widget.conditionalString == "Tap")
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isBulbTapped = !isBulbTapped!;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.lightbulb_outline,
                          size: 150,
                          color: isBulbTapped! ? Colors.yellow : Colors.grey),
                    ),
                  ))
              : (widget.conditionalString == "Double tap")
                  ? GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          isBulbTapped = !isBulbTapped!;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.lightbulb_outline,
                              size: 150,
                              color:
                                  isBulbTapped! ? Colors.yellow : Colors.grey),
                        ),
                      ))
                  : (widget.conditionalString == "Long press")
                      ? GestureDetector(
                          onLongPress: () {
                            setState(() {
                              isShapeTapped = !isShapeTapped!;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Card(
                              color: Colors.green,
                              shape: isShapeTapped!
                                  ? CircleBorder()
                                  : RoundedRectangleBorder(),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        )
                      : (widget.conditionalString == "Scale")
                          ? GestureDetector(
                              onScaleStart: (details) {
                                _baseScaleFactor = _scaleFactor;
                              },
                              onScaleUpdate: (details) {
                                setState(() {
                                  _scaleFactor =
                                      _baseScaleFactor * details.scale;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text('Scale',
                                        textScaleFactor: _scaleFactor,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.black)),
                                  ),
                                ),
                              ),
                            )
                          : (widget.conditionalString == "Drag")
                              ? GestureDetector(
                                  onHorizontalDragStart:
                                      _onHorizontalDragStartHandler,
                                  onVerticalDragStart:
                                      _onVerticalDragStartHandler,
                                  onHorizontalDragUpdate:
                                      _onHorizontalDragUpdateHandler,
                                  onVerticalDragUpdate:
                                      _onVerticalDragUpdateHandler,
                                  onHorizontalDragEnd: _onDragEnd,
                                  onVerticalDragEnd: _onDragEnd,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: MediaQuery.of(context).size.width,
                                      height: 400,
                                      child: velocity != null
                                          ? Center(
                                              child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(dragDirection!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black)),
                                                Text(
                                                    'Start DX point: $startDXPoint',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black)),
                                                Text(
                                                    'Start DY point: $startDYPoint',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black)),
                                              ],
                                            ))
                                          : Align(
                                              alignment: Alignment.center,
                                              child: TextFormField(
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Start drag here",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                    ),
                                  ),
                                )
                              : Container(),
          widget.conditionalString == "Drag"
              ? SizedBox(
                  height: 8,
                )
              : SizedBox(
                  height: 60,
                ),
          Align(
              alignment: Alignment.center,
              child: Text("Associated functions",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black))),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: widget.conditionalString == "Scale"
                ? 300
                : MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: ListView.separated(
              separatorBuilder: ((context, index) {
                return const Divider(
                  endIndent: 7,
                  indent: 7,
                );
              }),
              shrinkWrap: true,
              itemCount: itemModelList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(itemModelList[index].title!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
       leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      title: Text(widget.conditionalString!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black)),
    );
  }

  void _onHorizontalDragStartHandler(DragStartDetails details) {
    setState(() {
      dragDirection = "HORIZONTAL";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  void _onVerticalDragStartHandler(DragStartDetails details) {
    setState(() {
      dragDirection = "VERTICAL";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  void _onHorizontalDragUpdateHandler(DragUpdateDetails details) {
    setState(() {
      dragDirection = "HORIZONTAL Drag";
      dXPoint = '${details.globalPosition.dx.floorToDouble()}';
      dYPoint = '${details.globalPosition.dy.floorToDouble()}';
      velocity = '';
    });
  }

  void _onVerticalDragUpdateHandler(DragUpdateDetails details) {
    setState(() {
      dragDirection = "VERTICAL Drag";
      dXPoint = '${details.globalPosition.dx.floorToDouble()}';
      dYPoint = '${details.globalPosition.dy.floorToDouble()}';
      velocity = '';
    });
  }

  void _onDragEnd(DragEndDetails details) {
    double result = details.velocity.pixelsPerSecond.dx.abs().floorToDouble();
    setState(() {
      velocity = '$result';
    });
  }
}
