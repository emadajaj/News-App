import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss/cubit/status_cubit.dart';

import '../CALSSSS/dio.dart';
import '../Layout/busniss screen.dart';
import '../Layout/science screen.dart';
import '../Layout/sports screen.dart';

class AppCubit extends Cubit<CubitState>{
  AppCubit() : super(InitialState());
  int currentIndex = 0;
  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> Screens  = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),];

  List<dynamic> business  = [];
  List<dynamic> science  = [];
  List<dynamic> sports  = [];

  void getSports(){
    if(sports.length>0){
      emit(NewsGetSportsSuccessState());
    }else {
      emit(NewsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sport',
        'apikey': 'b3e25db2a58f4be3ac9553c6ffdacb5a',
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print('hhhhhhhhhhhhhhhhhhhhhhhhhhhh');
        print(error.toString());
        emit(NewsGetSportsErrorState());
      });
    }
  }
  void getScience(){
    if(science.length>0){
      emit(NewsGetScienceSuccessState());
    }else {
      emit(NewsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': 'b3e25db2a58f4be3ac9553c6ffdacb5a',
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print('hhhhhhhhhhhhhhhhhhhhhhhhhhhh');
        print(error.toString());
        emit(NewsGetScienceErrorState());
      });
    }
  }
  void getBusiness(){
    if(business.length>0){
      emit(NewsGetBusinessSuccessState());
    }else {
      emit(NewsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apikey': 'b3e25db2a58f4be3ac9553c6ffdacb5a',
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print('hhhhhhhhhhhhhhhhhhhhhhhhhhhh');
        print(error.toString());
        emit(NewsGetBusinessErrorState());
      });
    }
  }

  List<BottomNavigationBarItem> items =[
    BottomNavigationBarItem(icon: Icon(Icons.business ,) , label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.science ,) , label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports ,) , label: 'Sports'),];

  void changeBottomButton(index){
    currentIndex = index;
    emit(BottonNavgitorChangeState());
  }

  bool isDark=true;
  void changeModeDark(){
{
  print(isDark);
  isDark =!isDark;
  print(isDark);
  emit(ChangeModeState());
}

    }

  }


