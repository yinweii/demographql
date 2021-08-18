class GraphQuery {
  static String query = """ 
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
