import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss/cubit/cubit.dart';
import 'package:newss/cubit/status_cubit.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness()..getScience()..getSports(),
      child: BlocConsumer<AppCubit , CubitState>(
        listener: (context , state){},
        builder: (context , state){
          var cubit = AppCubit.get(context);
          return
            Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () =>{

                  } , icon: Icon(Icons.search),iconSize: 30,),
                ],
                title: Text('News'
                  ,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                //backgroundColor: Colors.black87,
              ),

              body:cubit.Screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeBottomButton(index);
                },
                type: BottomNavigationBarType.fixed,
                items: cubit.items,
              ),
            );},
      ),
    );
  }
}
