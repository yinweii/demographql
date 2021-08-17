import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/graphqlconfig/graph_repo.dart';
import 'package:graphqldemo/graphqlconfig/graphql_query.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GraphRepo graphRepo = GraphRepo();
  GraphQuery graphQuery = GraphQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo GraphQl'),
      ),
      body: Query(
        options: QueryOptions(document: gql(graphQuery.getCountry)),
        builder: (QueryResult result, {refetch, fetchMore}) {
          if (result.hasException)
            return Center(
              child: Text(result.hasException.toString()),
            );
          if (result.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          final countriesList = result.data?['countries'];
          //print(countriesList);
          return ListView.builder(
            itemCount: countriesList.length,
            itemBuilder: (_, index) {
              return Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        richText('CODE: ', countriesList[index]['code']),
                        richText('NAME: ', countriesList[index]['name']),
                        richText('Currency: ',
                            countriesList[index]['currency'] ?? ''),
                        richText('NATIVE: ', countriesList[index]['native']),
                        richText('PHONE: ', countriesList[index]['phone']),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // custom richtext
  richText(String txtF, String txtL) {
    return RichText(
      text: TextSpan(
        text: txtF,
        style: TextStyle(color: Colors.green),
        children: [
          TextSpan(
            text: txtL,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
