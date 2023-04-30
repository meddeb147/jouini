import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/MyController.dart';

import '../widgets/CustomVideoPlayer.dart';

class DetailsScreen extends StatefulWidget {

  const DetailsScreen({Key? key}):super(key:key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  GetController getController = Get.put(GetController());
  var data = Get.arguments ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: getController.category?.categories![data[0]].courses![data[1]-1].lessons!.length  , // Number of pages
        itemBuilder: (context, pageIndex)
    {
      return
        SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Stack(children: [
                      Align(
                        child: Text('${getController.category?.categories![data[0]]
                            .courses![data[1]-1].lessons![pageIndex].name}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .displayMedium,
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
                    ]
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomVideoPlayer(
                      videoLink: "${getController.category?.categories![data[0]]
                          .courses![data[1]-1].lessons![pageIndex].pathVideo}"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Futter Novice to Ninja",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
        );
    }
    )
    );



  }
}