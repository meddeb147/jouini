import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/MyController.dart';

import '../constants/size.dart';
import '../model/MyModel.dart';

import '../screens/course_screen.dart';


class CategoryCard extends StatefulWidget {
  final Categories category;
  final int  catIndex ;
  const CategoryCard({
    Key? key,

    required this.category, required this.catIndex,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  GetController getController = Get.put(GetController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(()=>const CourseScreen(), arguments: [widget.catIndex, widget.category.name, ]),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "${widget.category.thumbnail}",
                height: kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("${widget.category.name}"),
            Text(
              "${widget.category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}