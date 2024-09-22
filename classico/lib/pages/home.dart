import 'package:classico/models/category_model.dart';
import 'package:classico/models/diet_model.dart';
import 'package:classico/models/popular_dietmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

List<CategoryModel> categories = [];
List<DietModel> diets = [];
List<PopularDietsModel> popularDiets = [];

// void _getCategories(){
//   categories=CategoryModel.getCategories();
// }
 void _getInitialInfo() {
    categories=CategoryModel.getCategories();
    diets = DietModel.getDiets();
     popularDiets = PopularDietsModel.getPopularDiets();
   
  }



  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          SizedBox(height: 40,),
           _catagoriesSection(),
           SizedBox(height: 40,),
           _dietSection(),
           SizedBox(height: 40,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 15,),
              ListView.separated(
                shrinkWrap: true,
              separatorBuilder:(context,index)=>SizedBox(height: 25,),
              padding: EdgeInsets.only(
                left: 20,
                right: 20
              ),
               itemCount:popularDiets.length,
               itemBuilder:(context,index){
                return Container(
                  
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(popularDiets[index].iconPath,
                      height: 65,
                      width: 65,
                      ),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          Text(
                            popularDiets[index].level+'|'+popularDiets[index].calorie+'|'+popularDiets[index].duration,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 104, 104),
                              fontSize: 14
                            ),
                              
                            
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.arrow_right_circle_fill,
                          )
                        ],
                        
                      )

                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff1D1617).withOpacity(0.07),
                        offset: Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0
                      ),
                    ]
                  ),
                );
              }, 
               
               )
            ],
           ),

           SizedBox(height: 50,)
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Recomandation\nfor Diet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 15,),
           Container(
            // color: Colors.blue,
            height: 240,
            child: ListView.separated(itemBuilder: (context,index){
              return Container(
                width: 185,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Text(
                        diets[index].name,
                        style: const TextStyle(
                           fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Georgia'
                  
                        ),
                      ),
                      Text(
                        diets[index].level+'|'+diets[index].calorie+'|'+diets[index].duration,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                          color: Color.fromARGB(255, 119, 117, 117)
                  
                        ),
                      ),
                      Center(
                        child: Container(
                        
                          height: 45,
                          width: 130,
                          child:const Center(
                            child: Text(
                              'view',
                              style:TextStyle(
                                fontWeight: FontWeight.w500,
                                color:Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                              ) ,
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors:[
                                Color(0xff9DCEFF),
                                Color.fromARGB(255, 55, 82, 216)
                                            
                            ] 
                            
                            ),
                            borderRadius: BorderRadius.circular(50)
                            
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
             separatorBuilder: (context,index)=>SizedBox(width: 25,), 
             itemCount: diets.length,
               scrollDirection:Axis.horizontal,
               padding: const EdgeInsets.only(
                left: 10,
                right: 5
               ),
             ),
           
            
           )
          ],
         );
  }

  Column _catagoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Catagory',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 100,
              color: const Color.fromARGB(255, 255, 255, 255),
             child:ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 35,
                right: 35
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 25,),
              itemBuilder: (context,index){
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Georgia'
                          
                        ),
                      )
                    ],
                  ),
                );
              },
             ),
            )

          ],
        );
  }

  Container _searchField() {
    return Container(
          margin:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
               
              ),
            ],
          ),
          child:TextField(
            decoration: InputDecoration(
                  filled: true,
                 fillColor: Colors.white,
                 contentPadding: EdgeInsets.all(15),
                 hintText: 'WelCome to Up On Heights',
                 hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 180, 178, 178),
                 ),
                 prefixIcon:const Icon(
                  CupertinoIcons.search,
                 ),
                 suffixIcon: const Icon(
                  CupertinoIcons.qrcode,
                 ),
                   border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                 )
                 ),
               
                 
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'UP ON HEIGHTS',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      elevation: 0.0, // used for box shadow
      leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
          )),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Icon(
                CupertinoIcons.ellipsis,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              ),
            ))
      ],
    );
  }
}
