import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailsScreen extends StatelessWidget {
  final contrylist;
  const CountryDetailsScreen({super.key, required this.contrylist});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          contrylist.name.common,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.network(
                  contrylist.flags.png,
                  fit: BoxFit.cover,
                ),
                height: 200.h,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 15.h,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Official :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text(contrylist.name.official),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Independent :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text(contrylist.independent.toString()),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Status :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text(contrylist.status.toString()),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Member :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text(contrylist.unMember.toString()),
              ),
              Text("Currencies",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Name :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text(contrylist.name.toString()),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Capital :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text('${contrylist.capital.toString()}'),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Region :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text('${contrylist.region.toString()}'),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("Subregion :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text('${contrylist.subregion.toString()}'),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text("languages :-",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                title: Text('${contrylist.languages.ron.toString()}'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
