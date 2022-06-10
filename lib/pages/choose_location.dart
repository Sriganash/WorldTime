import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations = [
    WorldTime(location: 'London', flag: 'London.png', url:'Europe/London' ),
  WorldTime(location: 'Berlin', flag: 'Germany.png', url:'Europe/Berlin' ),
  WorldTime(location: 'Paris', flag: 'France.png', url:'Europe/Paris' ),
  WorldTime(location: 'Chicago', flag: 'America.png', url:'America/Chicago' ),
  WorldTime(location: 'Jakarta', flag: 'Indonesia.png', url:'Asia/Jakarta' ),

  ];

  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build state function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text("Choose a location"),
        centerTitle: true,
      ),
      body:ListView.builder(itemCount:locations.length,
        itemBuilder: (context,length){
        return Card(
          child: ListTile(
            onTap: (){
              updateTime(length);
            },
            title: Text(locations[length].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/day.png'),
            )
          ),
        );
        }
      ),

    );
  }
}
