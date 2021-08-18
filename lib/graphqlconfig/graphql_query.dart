class GraphQuery {
  static String query = r""" 
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
