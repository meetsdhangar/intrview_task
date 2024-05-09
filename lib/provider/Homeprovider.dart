import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intrview_task/Model/CountryModel.dart';

class Homeprovider with ChangeNotifier {
  var list1 = [];
  bool isDataLoaded = false;
  List searchlist = [];
  bool apierror = false;
  bool servererror = false;
  bool isInternetError = false;
  int selectedSearch = 1;

  changeSearch(type) {
    searchlist = [];
    selectedSearch = type;
    notifyListeners();
  }

  gethomedata() async {
    isDataLoaded = true; // Set to true when data fetching starts
    // notifyListeners();

    try {
      var url = 'https://restcountries.com/v3.1/all';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body); //print response
        var data = jsonDecode(response.body);

        list1.clear(); // Clear the list before adding new data
        for (var element in data) {
          if (element != null) {
            var countryModel = Countrymodel.fromMap(element);
            list1.add(countryModel);
          } else {
            print("Encountered null or unexpected element in data list.");
          }
        }
        servererror = false;
        apierror = false;
      } else if (response.statusCode == 400) {
        servererror = true;
      } else {
        apierror = true;
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error decoding JSON data: $e");
    } finally {
      isDataLoaded = false; // Set to false after data fetching completes
      notifyListeners();
    }

    print(list1);
  }

  SearchByCountries(text) {
    if (text.isEmpty) {
      searchlist = [];
      notifyListeners();
    } else {
      searchlist.clear();

      searchlist = list1
          .where((element) => element.name.common
              .toString()
              .toLowerCase()
              .startsWith(text.toLowerCase()))
          .toList();
      notifyListeners();
    }

    print(searchlist);
  }

  SearchBySubregion(text) {
    if (text.isEmpty) {
      searchlist = [];
      notifyListeners();
    } else {
      searchlist.clear();

      searchlist = list1
          .where((element) => element.subregion
              .toString()
              .toLowerCase()
              .startsWith(text.toLowerCase()))
          .toList();
      notifyListeners();
    }

    print(searchlist);
  }

  SearchByPopulation(text) {
    if (text.isEmpty) {
      searchlist = [];
      notifyListeners();
    } else {
      searchlist.clear();

      searchlist = list1
          .where((element) => element.population
              .toString()
              .toLowerCase()
              .startsWith(text.toLowerCase()))
          .toList();
      notifyListeners();
    }

    print(searchlist);
  }

  SearchByRegion(text) {
    if (text.isEmpty) {
      searchlist = [];
      notifyListeners();
    } else {
      searchlist.clear();

      searchlist = list1
          .where((element) => element.region
              .toString()
              .toLowerCase()
              .startsWith(text.toLowerCase()))
          .toList();
      notifyListeners();
    }

    print(searchlist);
  }

  getconnectioninfo({ConnectivityResult? result}) async {
    ConnectivityResult? connectivityResult;
    if (result == null) {
      connectivityResult = await (Connectivity().checkConnectivity());
    } else {
      connectivityResult = result;
    }

    //var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isInternetError = false;
      notifyListeners();
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isInternetError = false;
      notifyListeners();
      // I am connected to a wifi network.
    } else {
      isInternetError = true;
      notifyListeners();
    }
  }
}
