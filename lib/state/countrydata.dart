import 'package:graphqldemo/graphqlconfig/graph_repo.dart';
import 'package:graphqldemo/graphqlconfig/graphql_query.dart';
import 'package:graphqldemo/model/countrymodel.dart';
import 'package:state_notifier/state_notifier.dart';

class CountryStateNotifier extends StateNotifier<CountryState> {
  CountryStateNotifier() : super(CountryState());
  GraphRepo repo = GraphRepo();
  void loadData() async {
    final result = await repo.performQuery(GraphQuery.query);
    //print(result.data);
    List<Countries> countriesData = (result.data['countries'] as List<dynamic>)
        .map((e) => Countries.fromJson(e))
        .toList();

    state = CountryState(countries: countriesData);
  }
}

class CountryState {
  List<Countries> countries;
  CountryState({this.countries = const []});
}
