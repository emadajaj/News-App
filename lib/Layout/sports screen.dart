import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:newss/componentes/componentes.dart';
import 'package:newss/cubit/cubit.dart';
import 'package:newss/cubit/status_cubit.dart';
class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
        listener: (context,state){},
        builder: (context,state){
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => AppCubit.get(context).sports.length > 0,
            widgetBuilder: (BuildContext context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context,index) => singleNew(AppCubit.get(context).sports[index]) ,
              separatorBuilder: (context,index) =>  Divider(),
            ),
            fallbackBuilder: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),

          );
        }

    );
  }
}
