import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context,state){},
      builder: (context,state){
        return Container(
          color: Colors.white,
          margin: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(child:  TextFormField(
                style: TextStyle(
                  //backgroundColor: AppCubit.get(context).isDark ? Colors.white : Colors.tealAccent
                ),
              ),),

              IconButton(onPressed: ()=>{}, icon: Icon(Icons.search),color: Colors.redAccent,)
            ],
          ),
        );
      },
    );
  }
}
