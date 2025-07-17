
import 'package:clean_architecture_weather_new_app/bloc/newsbloc/newsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/components/customcardwidget.dart';
import '../../../config/components/paths.dart';

class Newsdetailes extends StatefulWidget {
  const Newsdetailes({super.key});

  @override
  State<Newsdetailes> createState() => _NewsdetailesState();
}

class _NewsdetailesState extends State<Newsdetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Customtextwidget(text: "News Details",
            fontsize: 25,
        fontfamily: "bold",),
        centerTitle: true,

      ),
      body:
            BlocBuilder<NewsBloc,NewsStates>(builder: (context,state){
              final data = state.newsdetail;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    NetworkimageWidget(url:data!.image.toString(),height: 300,),
                    SizedBox(height: 10,),
                    Customcardwidget(
                      title: data.author,
                      detail: data.title,
                    ),
                    SizedBox(height: 10,),
                    Customcardwidget(
                      title: "About",
                      detail: data.description,
                    )
                  ],
                ),
              );
            })
    );
  }
}
