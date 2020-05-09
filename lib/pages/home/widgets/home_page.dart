import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/main_bloc.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  HomePage();
 
  @override
  Widget build(BuildContext context) {
    
    return  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeStateInitialize) {
          BlocProvider.of<HomeBloc>(context).add(HomeEventInitialize());
        }else if (state is HomeStateIntro) {
          BlocProvider.of<MainBloc>(context).add(NavigateToPage(page: PageRoutes.intro));
        } else if(state is HomeStateHelpSelect){
          BlocProvider.of<MainBloc>(context).add(NavigateToPage(page: PageRoutes.helpSelector));
        }
        return Loading(textToDisplay: "loading...");
      });
  }
}
