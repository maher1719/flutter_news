import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/models/database/database.dart';
import 'package:news_flutter/models/database/entities/person.dart';
import 'package:news_flutter/views/googleTab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try{
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final personDao = database.personDao;
  final person = Person("2", 'Frank',"bbbb");
  await personDao.insertPerson(person);

  final result = await personDao.findAllPersons();

  //print(result.first.then((value) => value.email));
  print(result.last.email+" person" );


  }
      catch (e){
    print(e.toString());
      }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Example(),
    );
  }
}
