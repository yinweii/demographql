class GraphQuery {
  String getCountry = """ 
  query country{
    countries{
      code
      name
      currency
      phone
      native
    }
  }
  """;
}
