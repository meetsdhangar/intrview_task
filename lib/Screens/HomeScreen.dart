import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Homeprovider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Timer _timer;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<Homeprovider>().getconnectioninfo();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      context.read<Homeprovider>().getconnectioninfo(result: result);
    });
    context.read<Homeprovider>().gethomedata();

    
    super.initState();
  }

  Future<bool> checkApiError() async {
    return context.read<Homeprovider>().apierror;
  }

  Future<bool> checkInternetError() async {
    return context.read<Homeprovider>().isInternetError;
  }

  Future<void> checkApiErrorAndDisplaySnackbar() async {
    bool isApiError = await checkApiError();
    bool isServerError = await ServerError();
    bool isInternetError = await checkInternetError();
    if (isApiError) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Api Response error'),
        duration: Duration(seconds: 3),
      ));
    }
    if (isServerError) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Internal Server error'),
        duration: Duration(seconds: 3),
      ));
    }
    if (isInternetError) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Check your internet connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  Future<bool> ServerError() async {
    return context.read<Homeprovider>().apierror;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch data when the widget is first builtconnectivity
    final textcontroller = TextEditingController();
    //final hp = context.read<Homeprovider>();
    // hp.gethomedata();
    // _timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   context.read<Homeprovider>().getconnectioninfo(null);
    //   checkApiErrorAndDisplaySnackbar();
    // });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<Homeprovider>(
          builder: (context, homeprovider, child) {
            print(homeprovider.isDataLoaded);
            if (homeprovider.apierror) {
              return Center(child: Text('API Error'));
            } else if (homeprovider.servererror) {
              return Center(child: Text('Server Error'));
            } else if (homeprovider.isDataLoaded) {
              return Center(child: CircularProgressIndicator());
            } else if (homeprovider.list1.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              return ListView.builder(
                itemCount: homeprovider.list1.length,
                itemBuilder: (context, index) {
                  var country = homeprovider.list1[index];
                  return ListTile(
                    title: Text(country.name.common),
                    // Add other data as needed
                  );
                },
              );
            }

            // return homeprovider.isDataLoaded == true
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : homeprovider.list1.isEmpty
            //         ? Center(child: Text('No data'))
            //         : Padding(
            //             padding: const EdgeInsets.only(left: 10, right: 10),
            //             child: Column(
            //               children: [
            //                 TextFormField(
            //                   controller: textcontroller,
            //                   onChanged: (value) {
            //                     homeprovider.SearchData(value);
            //                   },
            //                   showCursor: true,
            //                   keyboardType: TextInputType.text,
            //                   decoration: InputDecoration(
            //                     suffixIcon: Icon(Icons.search),
            //                     prefixIconColor: Color(0xFF787474),
            //                     contentPadding: EdgeInsets.only(
            //                         top: 15, bottom: 15, left: 20),
            //                     filled: true,
            //                     fillColor: Color(0x30CCCCCC),
            //                     hintText: "Search",
            //                     hintStyle: TextStyle(color: Color(0xFF787474)),
            //                     enabledBorder: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(13),
            //                       borderSide: BorderSide(
            //                           color: Color(0x30CCCCCC), width: 2),
            //                     ),
            //                     focusedBorder: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(13),
            //                       borderSide: BorderSide(
            //                           color: Color(0x30CCCCCC), width: 2),
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Consumer<Homeprovider>(
            //                   builder: (context, value, child) {
            //                     var searchdata = homeprovider.searchlist;
            //                     var homedata = homeprovider.list1;
            //                     print(searchdata);
            //                     return Expanded(
            //                         child: homeprovider.searchlist.isNotEmpty
            //                             ? ListView.builder(
            //                                 itemCount:
            //                                     homeprovider.searchlist.length,
            //                                 shrinkWrap: true,
            //                                 physics:
            //                                     NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return ListTile(
            //                                     title: Text(searchdata[index]
            //                                         .name
            //                                         .common),
            //                                   );
            //                                 },
            //                               )
            //                             : ListView.builder(
            //                                 itemCount: homedata.length,
            //                                 shrinkWrap: true,
            //                                 itemBuilder: (context, index) {
            //                                   var mydata = homedata[index];

            //                                   return ExpansionTile(
            //                                     title: Text(mydata.name.common),
            //                                     children: [
            //                                       ListTile(
            //                                         title:
            //                                             Text(mydata.subregion),
            //                                       ),
            //                                       ListTile(
            //                                         title: Image.network(
            //                                             mydata.flags.png),
            //                                       ),
            //                                       // Add more ListTile widgets or other widgets as needed
            //                                     ],
            //                                   );
            //                                 },
            //                               ));
            //                   },
            //                 )
            //                 // : Expanded(
            //                 //     child: Consumer<Homeprovider>(
            //                 //       builder: (context, homeprovider, child) {
            //                 //         // Access the updated list from the provider
            //                 //         var homedata = homeprovider.list1;

            //                 //         return ListView.builder(
            //                 //           itemCount: homedata.length,
            //                 //           shrinkWrap: true,
            //                 //           itemBuilder: (context, index) {
            //                 //             var mydata = homedata[index];

            //                 //             return ExpansionTile(
            //                 //               title: Text(mydata.name.common),
            //                 //               children: [
            //                 //                 ListTile(
            //                 //                   title: Text(mydata.subregion),
            //                 //                 ),
            //                 //                 ListTile(
            //                 //                   title: Image.network(mydata.flags.png),
            //                 //                 ),
            //                 //                 // Add more ListTile widgets or other widgets as needed
            //                 //               ],
            //                 //             );
            //                 //           },
            //                 //         );
            //                 //       },
            //                 //     ),
            //                 //   )
            //               ],
            //             ),
            //           );
          },
        ),
      ),
    );
  }
}
