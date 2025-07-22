
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clean_architecture_weather_new_app/views/navigationbarscreen/newspage/drawerwidgetscreens.dart';
import 'package:flutter/cupertino.dart';

import '../../../allpaths.dart';


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
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidgetscreens(),
      appBar: AppBar(
        title: Text("NewsPages"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){BlocProvider.of<ThemeCubit>(context).toggletheme();}, icon: Icon(Theme.of(context).brightness == Brightness.dark?Icons.light_mode:Icons.dark_mode)),
          IconButton(onPressed: ()async{
            await showNotification(title: 'Talha Afridi', body: 'This notification is come from my app',notificationlayout: NotificationLayout.BigPicture,bigpicture: "https://canto-wp-media.s3.amazonaws.com/app/uploads/2019/08/19194138/image-url-3.jpg");
          }, icon: Icon(Icons.notification_add))
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
                      if(state.message.toString().contains("Internet")){
                        return Internetexceptions(callback: (){
                          context.read<NewsBloc>().add(GetNewsUpdates());
                        });
                      }else{
                        return Center(
                          child: Customtextwidget(text: state.message.toString(),
                              fontsize: 20),
                        );
                      }
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
                        if(state.newsApiResponse == null ){
                          return Center(
                            child: Customtextwidget(text: "No Data Found",
                                fontsize: 20),
                          );
                        }
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
