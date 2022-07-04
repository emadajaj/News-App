import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../componentes/componentes.dart';
import '../cubit/cubit.dart';
import '../cubit/status_cubit.dart';
class   BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
        listener: (context,state){},
        builder: (context,state){
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => AppCubit.get(context).business.length > 0,
            widgetBuilder: (BuildContext context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context,index) => singleNew(AppCubit.get(context).business[index]) ,
              separatorBuilder: (context,index) =>  Divider(),
            ),
            fallbackBuilder: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),

          );
        }

    );
  }
}
