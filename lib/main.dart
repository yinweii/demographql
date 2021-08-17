import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/graphqlconfig/graph_repo.dart';
import 'package:graphqldemo/screen/home.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  GraphRepo graphlqlClass = GraphRepo();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphlqlClass.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
