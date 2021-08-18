import 'package:graphql/client.dart';

class GraphRepo {
  GraphQLClient _client;
  //constructor
  GraphRepo() {
    HttpLink httpLink = HttpLink('https://countries.trevorblades.com');
    _client = GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore()));
  }
  //performing query
  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);

    final result = await _client.query(options);

    return result;
  }
}
