import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intrview_task/Screens/CountryDetailsScreen.dart';
import 'package:provider/provider.dart';

import '../provider/Homeprovider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Timer _timer;
int selectedSearch = 1;

class _HomeScreenState extends State<HomeScreen> {
  Connectivity connectivity = Connectivity();
  @override
  void initState() {
    context.read<Homeprovider>().gethomedata();

    super.initState();
  }

  Future<bool> ServerError() async {
    return context.read<Homeprovider>().apierror;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

// function to refresh data
  Future<void> _refreshData() async {
    await context.read<Homeprovider>().gethomedata();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch data when the widget is first builtconnectivity
    final textcontroller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "Explore The World",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        body: StreamBuilder<ConnectivityResult>(
            stream: connectivity.onConnectivityChanged,
            builder: (context, snapshot) {
              return CheckInternetConnectionWidget(
                  snapshot: snapshot,
                  widget: Consumer<Homeprovider>(
                    builder: (context, homeprovider, child) {
                      var searchdata = homeprovider.searchlist;
                      var homedata = homeprovider.list1;
                      print(homeprovider.isDataLoaded);
                      if (homeprovider.apierror) {
                        return const Center(child: Text('API Error'));
                      } else if (homeprovider.servererror) {
                        return const Center(child: Text('Server Error'));
                      } else if (homeprovider.isDataLoaded) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (homeprovider.list1.isEmpty) {
                        return const Center(child: Text('No data available'));
                      } else {
                        return RefreshIndicator(
                          onRefresh: _refreshData,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: textcontroller,
                                  onChanged: (value) {
                                    if (homeprovider.selectedSearch == 1) {
                                      homeprovider.SearchByCountries(value);
                                    } else if (homeprovider.selectedSearch ==
                                        2) {
                                      homeprovider.SearchBySubregion(value);
                                    } else if (homeprovider.selectedSearch ==
                                        3) {
                                      homeprovider.SearchByPopulation(value);
                                    } else if (homeprovider.selectedSearch ==
                                        4) {
                                      homeprovider.SearchByRegion(value);
                                    }
                                  },
                                  showCursor: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    prefixIconColor: const Color(0xFF787474),
                                    contentPadding: const EdgeInsets.only(
                                        top: 15, bottom: 15, left: 20),
                                    filled: true,
                                    fillColor: const Color(0x30CCCCCC),
                                    hintText: homeprovider.selectedSearch == 1
                                        ? "Search Country"
                                        : homeprovider.selectedSearch == 2
                                            ? "Search SubRegion"
                                            : homeprovider.selectedSearch == 3
                                                ? "Search Population"
                                                : "Search Region",
                                    hintStyle:
                                        TextStyle(color: Color(0xFF787474)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: const BorderSide(
                                          color: Color(0x30CCCCCC), width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: const BorderSide(
                                          color: Color(0x30CCCCCC), width: 2),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          textcontroller.text = '';
                                          homeprovider.changeSearch(1);
                                        },
                                        child: Container(
                                          height: 30.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                              color:
                                                  homeprovider.selectedSearch ==
                                                          1
                                                      ? Colors.green
                                                      : Color.fromARGB(
                                                          255, 238, 238, 238),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: Text(" Search Countries",
                                                style: TextStyle(
                                                    fontWeight: homeprovider
                                                                .selectedSearch ==
                                                            1
                                                        ? FontWeight.w500
                                                        : FontWeight.normal,
                                                    fontSize: 15,
                                                    color: homeprovider
                                                                .selectedSearch ==
                                                            1
                                                        ? Colors.white
                                                        : Colors.black)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          textcontroller.text = '';
                                          homeprovider.changeSearch(2);
                                        },
                                        child: Container(
                                          height: 30.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                              color:
                                                  homeprovider.selectedSearch ==
                                                          2
                                                      ? Colors.green
                                                      : Color.fromARGB(
                                                          255, 238, 238, 238),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: Text("Search Subregion",
                                                style: TextStyle(
                                                    fontWeight: homeprovider
                                                                .selectedSearch ==
                                                            2
                                                        ? FontWeight.w500
                                                        : FontWeight.normal,
                                                    fontSize: 15,
                                                    color: homeprovider
                                                                .selectedSearch ==
                                                            2
                                                        ? Colors.white
                                                        : Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        textcontroller.text = '';
                                        homeprovider.changeSearch(3);
                                      },
                                      child: Container(
                                        height: 30.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                            color:
                                                homeprovider.selectedSearch == 3
                                                    ? Colors.green
                                                    : Color.fromARGB(
                                                        255, 238, 238, 238),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text("Search Population",
                                              style: TextStyle(
                                                  fontWeight: homeprovider
                                                              .selectedSearch ==
                                                          3
                                                      ? FontWeight.w500
                                                      : FontWeight.normal,
                                                  fontSize: 15.sp,
                                                  color: homeprovider
                                                              .selectedSearch ==
                                                          3
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        textcontroller.text = '';
                                        homeprovider.changeSearch(4);
                                      },
                                      child: Container(
                                        height: 30.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                            color:
                                                homeprovider.selectedSearch == 4
                                                    ? Colors.green
                                                    : Color.fromARGB(
                                                        255, 238, 238, 238),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text("Search Region",
                                              style: TextStyle(
                                                  fontWeight: homeprovider
                                                              .selectedSearch ==
                                                          4
                                                      ? FontWeight.w500
                                                      : FontWeight.normal,
                                                  fontSize: 15.sp,
                                                  color: homeprovider
                                                              .selectedSearch ==
                                                          4
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Expanded(
                                  child: homeprovider.searchlist.isNotEmpty
                                      ? ListView.builder(
                                          itemCount:
                                              homeprovider.searchlist.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: Container(
                                                height: 50.h,
                                                width: 50.w,
                                                child: Image.network(
                                                    searchdata[index]
                                                        .flags
                                                        .png),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(homeprovider
                                                              .selectedSearch ==
                                                          1
                                                      ? ''
                                                      : homeprovider
                                                                  .selectedSearch ==
                                                              2
                                                          ? '${searchdata[index].subregion}'
                                                          : homeprovider
                                                                      .selectedSearch ==
                                                                  3
                                                              ? '${searchdata[index].population}'
                                                              : '${searchdata[index].region}'),
                                                ],
                                              ),
                                              trailing: TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          CountryDetailsScreen(
                                                              contrylist:
                                                                  searchdata[
                                                                      index]),
                                                    ));
                                                  },
                                                  child: Text(
                                                    "Country Details",
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  )),
                                              title: Text(searchdata[index]
                                                  .name
                                                  .common),
                                            );
                                          },
                                        )
                                      : ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          itemCount: homedata.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            var mydata = homedata[index];

                                            return ExpansionTile(
                                              childrenPadding:
                                                  const EdgeInsets.all(0),
                                              leading: Container(
                                                height: 50.h,
                                                width: 50.w,
                                                child: Image.network(
                                                    mydata.flags.png),
                                              ),
                                              title: Text(
                                                mydata.name.common,
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                  mydata.capital.toString()),
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color.fromARGB(146,
                                                                220, 232, 234),
                                                            Color.fromARGB(199,
                                                                126, 243, 163)
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: 170.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width
                                                            .w,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Name :-",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    "${mydata.name.common}",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Capital :-",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    "${mydata.capital}",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Population :-",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    "${mydata.population}",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Region :-",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                "${mydata.region}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Subregion :-",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                "${mydata.subregion}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                      MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CountryDetailsScreen(
                                                                  contrylist:
                                                                      mydata,
                                                                ),
                                                              ));
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.5.r),
                                                              ),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          3),
                                                                  child: Text(
                                                                    "Country Detils",
                                                                    style: TextStyle(
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ));
            }),
      ),
    );
  }
}

class CheckInternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  const CheckInternetConnectionWidget(
      {Key? key, required this.snapshot, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100.h,
                      width: 150.w,
                      child: Image.asset(
                        "Assets/images/s1.png",
                        fit: BoxFit.cover,
                      )),
                  const Text(
                    'No Internet Connection',
                    style: TextStyle(fontSize: 17),
                    //
                  ),
                ],
              ),
            );
          default:
            return widget;
        }

      default:
        return const Text('eror');
    }
  }
}
