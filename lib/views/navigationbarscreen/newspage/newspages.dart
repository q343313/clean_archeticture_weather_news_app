

import 'package:clean_architecture_weather_new_app/bloc/newsbloc/newsbloc.dart';
import 'package:clean_architecture_weather_new_app/bloc/themebloc/themecubits.dart';
import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:clean_architecture_weather_new_app/models/datasavemodel/datasavemodel.dart';
import 'package:clean_architecture_weather_new_app/utility/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/components/paths.dart';

class Newspages extends StatefulWidget {
  const Newspages({super.key});

  @override
  State<Newspages> createState() => _NewspagesState();
}

class _NewspagesState extends State<Newspages> with TickerProviderStateMixin{
  late AnimationController _controller;
  TextEditingController searchcontroller= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
    context.read<NewsBloc>().add(GetNewsUpdates());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsPages"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){BlocProvider.of<ThemeCubit>(context).toggletheme();}, icon: Icon(Theme.of(context).brightness == Brightness.dark?Icons.light_mode:Icons.dark_mode))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            children: [
              Textfieldwidget(
                  hinttext: "Search",
                  controller: searchcontroller,
                  preffixicon: Icon(Icons.search),
                  suffixicon: IconButton(onPressed: (){
                    context.read<NewsBloc>().add(GetNewsUpdates());
                    searchcontroller.clear();
                  }, icon: Icon(CupertinoIcons.search)),
                  func: (value){
                    context.read<NewsBloc>().add(SearchNewsType(newstype: value));
                  },
                  textInputType: TextInputType.text),

              SizedBox(height: 20,),
              Expanded(
                child: BlocBuilder<NewsBloc,NewsStates>(builder: (context,state){
                  switch(state.apiStatus){
                    case ApiStatus.failure:
                      return Center(child: Text(state.message.toString(),));
                    case ApiStatus.initial:
                    case ApiStatus.loading:
                      return ListView.builder(itemCount: 12,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                          child: Shimmereffectwidget(),
                        );
                      },);
                    case ApiStatus.success:
                      return ListView.builder(itemCount: state.newsApiResponse!.articles.length,
                     itemBuilder: (context,index){
                        String urls = state.newsApiResponse!.articles[index].urlToImage.toString();
                        final data = state.newsApiResponse!.articles[index];
                        return GestureDetector(
                          onTap: (){
                             DataSaveModel newsdata = DataSaveModel(
                                 author: data.author.toString(),
                                 title: data.title,
                                 description: data.description.toString(),
                                 image: urls);

                             context.read<NewsBloc>().add(SaveNewsDate(dataSaveModel: newsdata));
                             Navigator.pushNamed(context, RouteNames.newsdetails);
                          },

                          child: Card(
                            color:Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textfielddarkmode
                                : AppColors.textfieldlightmode,
                            child: Column(
                              children: [
                                NetworkimageWidget(url: urls,),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Customtextwidget(text: data.title,fontsize: 20,fontfamily: "semibold",),
                                )
                              ],
                            ),
                          ),
                        );
                     }, );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
