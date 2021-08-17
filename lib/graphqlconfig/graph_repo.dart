import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphRepo {
  static HttpLink httpLink = HttpLink('https://countries.trevorblades.com');
  static Link link = httpLink;
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    ),
  );
}
