import 'package:bd_calling_assessment/features/api/presentation/screens/api_home.dart';
import 'package:flutter/material.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/dimensions.dart';
import '../../domain/models/movie.dart';
import '../../domain/models/series.dart';
import '../widgets/category_widget.dart';
import '../widgets/intro_widget.dart';
import '../widgets/movie_card.dart';
import '../widgets/search_filter.dart';
import '../widgets/series_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white, size: 25),
        backgroundColor: Color(0xff2C2C2C),
        centerTitle: true,
        title: Text('UIP TV', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: Dimensions.fontSizeLarge),),
      ),
      backgroundColor: Color(0xff11161F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              IntroWidget(),
              SearchFilter(),
              CategoryWidget(),
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    Container(
                      width: size.width - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Trending Movies', style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700, color: Colors.white),),
                          Text('See More', style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400, color: Colors.white),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: size.height * .22,
                      width: size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemExtent: size.width /3,
                          itemCount: AppConstants.movies.length,
                          itemBuilder: (context, ind){
                            Movie movie = AppConstants.movies[ind];
                            return MovieCard(title: movie.title!, imageUrl: movie.imagUrl!, height: size.height*.2, width: size.width * .29);
                          }
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    Container(
                      width: size.width - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Continue Watching', style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700, color: Colors.white),),
                          Text('See More', style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400, color: Colors.white),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 13,),
                    Container(
                      height: size.height * .2,
                      width: size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemExtent: size.width /2,
                          itemCount: AppConstants.series.length,
                          itemBuilder: (context, ind){
                            Series series = AppConstants.series[ind];
                            return SeriesCard(title: series.title!, episode: series.episode!, imageUrl: series.imagUrl!, height: size.height*.16, width: size.width * .47, progress: ind == 0 ? 70 : 130,);
                          }
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: size.width - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recommended for you', style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700, color: Colors.white),),
                          Text('See More', style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400, color: Colors.white),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: size.height * .25,
                      width: size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemExtent: size.width /3,
                          itemCount: AppConstants.movies.length,
                          itemBuilder: (context, ind){
                            Movie movie = AppConstants.movies[ind];
                            return MovieCard(title: movie.title!, imageUrl: movie.imagUrl!, height: size.height*.22, width: size.width * .29);
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60.0, left: 10, right: 10),
        child: Container(
          height: size.height * .06,
          width: size.width - 40,
          decoration: BoxDecoration(
            color: Color(0xff1C212A),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: List.generate(AppConstants.navItems.length, (indx){
             return GestureDetector(
               onTap: (){
                 setState(() {
                   selected = indx;
                   if(indx == 1){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return ApiHome();
                     }));
                   }
                 });
               },
                 child: Icon(AppConstants.navItems[indx], color: selected == indx ? Colors.orange : Colors.green, size: 30,));
           }),
          )
        ),
      ),
    );
  }
}
