import 'package:news_flutter/models/CategoryModels.dart';

List<CategoryModels> getCategory() {
  List<CategoryModels> category = new List<CategoryModels>();
  CategoryModels categoryModels = new CategoryModels();

///1
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'Business';
  categoryModels.urlImageCategory =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8YnVzaW5lc3N8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60';
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);

///2
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'Entertainment';
  categoryModels.urlImageCategory =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);


///3
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'General';
  categoryModels.urlImageCategory =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);


  ///4
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'Health';
  categoryModels.urlImageCategory =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);


  ///5
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'Science';
  categoryModels.urlImageCategory =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);


  ///6
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'Sports';
  categoryModels.urlImageCategory =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);


  ///7
  categoryModels = new CategoryModels();
  categoryModels.categoryName = 'Technology';
  categoryModels.urlImageCategory =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModels.urlAPI =
      'http://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
  category.add(categoryModels);

  return category;
}
