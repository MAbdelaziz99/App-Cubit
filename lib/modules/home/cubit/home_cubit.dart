
import 'package:app_cubit/categories_model.dart';
import 'package:app_cubit/dio.dart';
import 'package:app_cubit/modules/home/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit(): super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  CategoriesModel? categoriesModel;

  getCategories()
  {
    emit(HomeGetCategoriesLoadingState());

    DioHelper.getCategories().then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(HomeGetCategoriesSuccessState());
    })
    .catchError((error)
    {
      print('error :: $error');
      emit(HomeGetCategoriesErrorState(error: error));
    });
  }

  bool isSelected = false;

  changeCheckBox()
  {
    isSelected = !isSelected;
    emit(HomeChangeState());
  }
}