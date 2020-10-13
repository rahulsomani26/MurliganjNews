import 'package:MurliganjNews/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  //1
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80';
  category.add(categoryModel);

//2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1490818387583-1baba5e638af?ixlib=rb-1.2.1&auto=format&fit=crop&w=931&q=80';
  category.add(categoryModel);

//3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1552667466-07770ae110d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60';
  category.add(categoryModel);

//4

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Weather";
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1530908295418-a12e326966ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60';
  category.add(categoryModel);

  return category;
}
