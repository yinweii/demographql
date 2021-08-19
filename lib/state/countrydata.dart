import 'package:graphqldemo/graphqlconfig/graph_repo.dart';
import 'package:graphqldemo/graphqlconfig/graphql_query.dart';
import 'package:graphqldemo/model/country.dart';
import 'package:state_notifier/state_notifier.dart';

class CountryStateNotifier extends StateNotifier<CountryState> {
  CountryStateNotifier() : super(CountryState());
  GraphRepo repo = GraphRepo();
  void loadData() async {
    final result = await repo.performQuery(GraphQuery.query);
    //print(result.data);
    List<Country> countriesData = (result.data['countries'] as List<dynamic>)
        .map((e) => Country.fromJson(e))
        .toList();

    state = CountryState(countries: countriesData);
  }
}

class CountryState {
  List<Country> countries;
  CountryState({this.countries = const []});
}
