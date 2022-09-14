import 'package:app_cubit/modules/home/cubit/home_cubit.dart';
import 'package:app_cubit/modules/home/cubit/home_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is !HomeGetCategoriesLoadingState,
            builder: (context) => Column(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      cubit.categoriesModel?.categoryStr?? '',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                Checkbox(value: cubit.isSelected, onChanged: (value)
                {
                  cubit.changeCheckBox();
                }
                ),
              ],
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          )
        );
      },
    );
  }
}
