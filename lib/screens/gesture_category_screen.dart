import 'package:flutter/material.dart';
import '../models/gesture_model.dart';
import 'gesture_sub_category_screen.dart';

class GestureCategoryScreen extends StatefulWidget {
  const GestureCategoryScreen({Key? key}) : super(key: key);

  @override
  State<GestureCategoryScreen> createState() => _GestureCategoryScreenState();
}

class _GestureCategoryScreenState extends State<GestureCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ListView.separated(
        separatorBuilder: ((context, index) {
          return const Divider(
            endIndent: 5,
            indent: 5,
          );
        }),
        itemCount: gestureItemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GestureSubCategoryScreen(
                            conditionalString: gestureItemList[index].title!,
                          )));
            },
            title: Text(gestureItemList[index].title!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black)),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "Gesture Detector",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
