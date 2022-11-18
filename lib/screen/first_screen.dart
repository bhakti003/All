import 'package:demo/api_model/model_demo.dart';
import 'package:demo/get_Controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  List<SubCategory>? sublist;
  FirstScreen({Key? key,this.sublist}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final homePageController = Get.put(HomePageController());
  @override
  void initState() {
      homePageController.getApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Api Demo"),
          ),
      body: ListView.separated(itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 120,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,blurRadius: 16,spreadRadius: 8
                        )
                      ],
                      color: Colors.yellow,
                    ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         // margin: EdgeInsets.only(left: 10.0),
                         height: 100,
                         width: 100,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           image: DecorationImage(image: NetworkImage(widget.sublist![index].icon!),fit: BoxFit.cover),

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           height: 100,
                           width: 155,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(widget.sublist![index].name!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                               Text(widget.sublist![index].installedRange!),
                              RatingBar.builder(
                                initialRating: double.parse(widget.sublist![index].star!.toString()),
                                  itemBuilder: (context, index) => Icon(Icons.star,),
                                  onRatingUpdate:(double value) { },itemSize: 30,),
                               Text(widget.sublist![index].installedRange!)
                             ],
                           ),

                         ),
                       ),
                        Container(
                          height: 38,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff277816),
                          ),
                          child: Center(child: Text("Download",style: TextStyle(fontSize: 15,color: Colors.white,
                              fontWeight: FontWeight.bold,),),),
                        )
                     ],
                   ),
                  ),
                ],
              ),
            ],
          ),
        );
      }, separatorBuilder: (context,index){
        return SizedBox(height: 14,);
      }, itemCount: 10),
    );
  }
}
