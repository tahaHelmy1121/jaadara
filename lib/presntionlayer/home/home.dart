import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/const/style.dart';
import '../../busnieslogiclayer/home/homecubit.dart';
import '../../busnieslogiclayer/home/homestate.dart';
import '../../customwidget/drewtoplogo.dart';
import '../../helper/massage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var BlocProv = BlocProvider.of<HomeCubit>(context,listen: false);
    var defaultSize = MediaQuery.of(context).size;
    var slider =
        BlocProvider.of<HomeCubit>(context).getSellerSendData(context: context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: HexColor("#EE5B3E"),
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      //    bottomNavigationBar: BottomNavBar(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeStateLoading) {
            Container(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeStateSuccess) {
          } else if (state is HomeStateFailure) {
            MassageApp.snackBar(state.toString(), context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      width: defaultSize.width * 0.1,
                      height: 30,
                      child: Image.asset("assets/image/bars-3-center-left.png"),
                    ),
                    drewTopLogo(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 25),
                          width: 45,
                          height: 40,
                          child: Image.asset(
                            "assets/image/Group 48095690.png",
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Container(
                          color: HexColor("#FFF5F4"),
                          width: defaultSize.width * 0.65,
                          height: 48,
                          child: TextFormField(
                            onChanged: (v){
                         //     BlocProv.search(v);
                            },
                            style: StyleApp.style1,
                            textDirection: TextDirection.rtl,
                            //      controller: context.read<LoginViewModel>().textEditingControllerMobile,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "أدخل رقم الهاتف";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search_off,
                                size: 25,
                                color: Colors.black,
                              ),
                              //  prefixIcon:Icon(Icons.search,size: 4,color: Colors.black,) ,
                              errorStyle:
                                  const TextStyle(fontFamily: "BigVesta"),
                              hintText: "ابحث عن ",
                              hintStyle: StyleApp.style1,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount:3,
                        itemBuilder: (context, position, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(colors: [
                                  HexColor("#FFFFFF"),
                                  HexColor("#FFC3B7"),
                                ])),
                            margin: EdgeInsets.all(5),
                            height: 90,
                            width:MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Image.asset("assets/image/img2 1.png",fit: BoxFit.contain,),
                                Container(

                                    child: Image.asset("assets/image/Group 48095943.png",fit: BoxFit.contain,)),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (value, int) {
                            //     pageIndexNotifier.value = value;
                          },
                          height: 150,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                          Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المزيد",
                        style: StyleApp.style1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "الاكثر مبيعا",
                          style: StyleApp.styleBestSellers,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 12),
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Container(
                              margin: EdgeInsets.only(left: 17),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: HexColor("#FFF5F4"),
                                  boxShadow: [BoxShadow(blurRadius: 0.2)]),
                              height: defaultSize.height * 0.6,
                              width: defaultSize.width * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              BlocProvider.of<HomeCubit>(context).seller!.data![0].photo.toString()),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Text(
                                    BlocProvider.of<HomeCubit>(context)
                                        .seller
                                        .data![0]
                                        .title
                                        .toString(),
                                    style: StyleApp.styleBestSellers,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          BlocProvider.of<HomeCubit>(context)
                                              .seller
                                              .data![0]
                                              .price
                                              .toString(),
                                          style: StyleApp.styleLogo,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          //   alignment: Alignment.centerRight,
                                          // margin: EdgeInsets.symmetric(horizontal: 35),
                                          child: Image.asset(
                                              "assets/image/Group 48095671.png"),
                                          width: 40,
                                          height: 28,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "الاهم مبيعا",
                          style: StyleApp.styleBestSellers,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 12),
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Container(
                              margin: EdgeInsets.only(left: 17),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: HexColor("#FFF5F4"),
                                  boxShadow: [BoxShadow(blurRadius: 0.2)]),
                              height: defaultSize.height * 0.6,
                              width: defaultSize.width * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: ExactAssetImage("assets/image/huawei-freebuds-4i-frandroid-2021 1.png"),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Text(
                                    "ساعة يد رولكس",
                                    style: StyleApp.styleBestSellers,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          BlocProvider.of<HomeCubit>(context)
                                              .seller
                                              .data![0]
                                              .price
                                              .toString(),
                                          style: StyleApp.styleLogo,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          //   alignment: Alignment.centerRight,
                                          // margin: EdgeInsets.symmetric(horizontal: 35),
                                          child: Image.asset(
                                              "assets/image/Group 48095671.png"),
                                          width: 40,
                                          height: 28,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
