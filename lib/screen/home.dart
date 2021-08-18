import 'package:flutter/material.dart';
import 'package:graphqldemo/state/countrydata.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //CountryStateNotifier countryStateNotifier = CountryStateNotifier();
  @override
  void initState() {
    super.initState();
    //countryStateNotifier.loadData();
    context.read<CountryStateNotifier>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    //print('LENGTH: ${context.watch<CountryState>().countries.length}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo GraphQl'),
        ),
        body: ListView.builder(
          itemCount: context.watch<CountryState>().countries.length,
          itemBuilder: (context, index) {
            final countriesList = context.watch<CountryState>().countries;
            return Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      richText('CODE: ', countriesList[index]['code']),
                      richText('NAME: ', countriesList[index]['name']),
                      richText(
                          'Currency: ', countriesList[index]['currency'] ?? ''),
                      richText('NATIVE: ', countriesList[index]['native']),
                      richText('PHONE: ', countriesList[index]['phone']),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
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
