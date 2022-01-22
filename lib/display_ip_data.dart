import 'package:flutter/material.dart';
import 'package:ip_info_app/api_result_model.dart';

class DisplayIpData extends StatelessWidget {
  final ApiResultModel model;
  const DisplayIpData({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffA7CDBD),
      elevation: 20,
      child: Column(
        children: [
          const SizedBox(height: 16,),
          ListTile(name: 'IP',value: model.ip,),
          ListTile(name: 'Country Code',value: model.countryCode,),
          ListTile(name: 'Country Name',value: model.countryName,),
          ListTile(name: 'Region Code',value: model.regionCode,),
          ListTile(name: 'Region Name',value: model.regionName,),
          ListTile(name: 'City',value: model.city,),
          ListTile(name: 'Zip Code',value: model.zipCode,),
          ListTile(name: 'Time Zone',value: model.timeZone,),
          ListTile(name: 'Latitude',value: model.latitude != null ?model.latitude.toString() : "N/A",),
          ListTile(name: 'Longitude',value: model.longitude != null ? model.longitude.toString() : "N/A",),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  final String name;
  final String? value;
  const ListTile({Key? key,required this.name,this.value = "N/A"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Row(
        children: [
          Text("$name :",
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          const Spacer(),
          Text(value != ""? (value??"N/A") : "N/A",style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 16),)
        ],
      ),
    );
  }
}
