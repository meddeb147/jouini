import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';


import '../constants/color.dart';
import '../controllers/MyController.dart';
import '../model/MyModel.dart';
import '../widgets/CustomIconButton.dart';
import 'detail_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  GetController getController = Get.put(GetController());
  var id = Get.arguments;

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,

        ),
    child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    IntrinsicHeight(
      child: Stack(
        children: [
          Align(
            child: Text(
              '${id[1]}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    ),
   const SizedBox(
    height: 15,
   ),
   Expanded(
    child: ListView.separated(
      itemCount: getController.category!.categories![id[0]].courses!.length   ,
        shrinkWrap:true,
     itemBuilder:(_,index){

      return CourseContainer(
        course: getController.category!.categories![id[0]].courses![index],

      );
     }, 
     separatorBuilder: (context,_) {
      return const SizedBox(
        height: 10,
      );
     },
    )
   )
  ],
),

            
              ),
            )
     
        ),
        );
    
  
}
}
class CourseContainer extends StatefulWidget {
 final  Courses2?  course;

  const CourseContainer({
    Key? key,

    required this.course,
  }) : super(key: key);

  @override
  State<CourseContainer> createState() => _CourseContainerState();
}

class _CourseContainerState extends State<CourseContainer> {
  var id = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> DetailsScreen(), arguments:[ id[0], widget.course!.id] ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "${widget.course?.thumbnail ?? ""}",
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.course?.name ?? ""),
                  Text(
                    "Author ${widget.course?.author }",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: widget.course?.completedPercentage,
                    backgroundColor: Colors.black12,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
