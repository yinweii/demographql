import 'package:graphqldemo/graphqlconfig/graph_repo.dart';
import 'package:graphqldemo/graphqlconfig/graphql_query.dart';
import 'package:state_notifier/state_notifier.dart';

class CountryStateNotifier extends StateNotifier<CountryState> {
  CountryStateNotifier() : super(CountryState());
  GraphRepo repo = GraphRepo();
  void loadData() async {
    final result = await repo.performQuery(GraphQuery.query);
    //print(result.data);
    final countriesData = result.data['countries'];
    state = CountryState(countries: countriesData);
  }
}

class CountryState {
  List countries;
  CountryState({this.countries = const []});
}
