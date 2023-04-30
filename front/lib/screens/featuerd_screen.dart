import 'package:get/get.dart';
import 'package:lms_app/constants/color.dart';
import 'package:lms_app/controllers/MyController.dart';
import '../constants/size.dart';

import '../widgets/category_card.dart';
import '../widgets/search_testfield.dart';
import '../widgets/CircleButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
    child:Scaffold(
      body: Column(
        children: const [
          AppBar(),
          Body(),
    ] ,
    ),
    ),
    );


  }
}
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GetController getController = Get.put(GetController());
  @override
  Widget build(BuildContext context) {
    return   Obx(
      ()=> Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 10,left: 30,right: 20),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Explore Categorie',
            style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(onPressed: (){}, child: Text(
              'See All',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kPrimaryColor,
              ),
              ),
              )
          ]),
           ),
          getController.isDataLoading.value ? CircularProgressIndicator() : GridView.builder(
            shrinkWrap: true,

            itemCount: getController.category?.categories?.length ?? 0  ,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisExtent: 200,
            ),
            itemBuilder: (context,index){
              return CategoryCard(
                category:getController.category!.categories![index],
                catIndex : index

              );
            },
            )
        ],

      ),
    );
  }
}


   class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
          Color(0xff886ff2),
           Color(0xff6849ef),

        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      ),
    ),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'hello,\nGood Morning',
            style: Theme.of(context).textTheme.titleLarge,
            ),
            CircleButton(icon: Icons.notifications, onPressed: () {},)
        ],
      ),
      const SizedBox(
        height: 20,

      ),
      const SearchTextField(),
      
    ],
    ),
    );
  }
}  