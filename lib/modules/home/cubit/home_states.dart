abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeGetCategoriesLoadingState extends HomeStates{}
class HomeGetCategoriesErrorState extends HomeStates
{
  String? error;
  HomeGetCategoriesErrorState({required this.error});
}
class HomeGetCategoriesSuccessState extends HomeStates{}

class HomeChangeState extends HomeStates{}

