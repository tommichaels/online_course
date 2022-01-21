import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/details_screen.dart';
import 'package:online_course/model/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Course',
      theme: ThemeData(),
      // ignore: prefer_const_constructors
      home: HomeScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SvgPicture.asset("assets/icons/menu.svg"),
              Image.asset("assets/images/User.png"),
               ],
              ),
              const SizedBox(height: 30,),
              const Text("Hey Michaels,", style: kHeadingextStyle, ),
              const Text("Find a course you want to learn", style: kSubheadingextStyle),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [SvgPicture.asset("assets/icons/search.svg"),
                    const SizedBox(width: 16), 
                    const Text(
                      "Search for courses", 
                      style: TextStyle(fontSize: 18, 
                      color: Color(0xFFA0A580),

                          ),
                         )
                      ],
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text("Category", style: kTitleTextStyle,),
                  Text("See All", 
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                  )
                ],
                ),
                SizedBox(height: 30),
                Expanded(child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2, 
                  itemCount: categories.length,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index){
                    return Container(
                      padding: const EdgeInsets.all(20),
                      height: index.isOdd ? 200: 240,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.fill,
                        ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(categories[index].name, style: kTitleTextStyle,),
                                Text("${categories[index].numOfCourses} Courses", 
                                style: TextStyle(color: kTextColor.withOpacity(.5),
                                
                                ),)
                      ],
                      ),
                  );
                  }, 
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  ),
                  ),
           ],
         ),
        
      ),
    );
  }
}