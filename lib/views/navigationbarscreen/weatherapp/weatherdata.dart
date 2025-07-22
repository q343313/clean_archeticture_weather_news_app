
import 'package:clean_architecture_weather_new_app/views/navigationbarscreen/newspage/drawerwidgetscreens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../allpaths.dart';

class Weatherdata extends StatefulWidget {
  const Weatherdata({super.key});

  @override
  State<Weatherdata> createState() => _WeatherdataState();
}

class _WeatherdataState extends State<Weatherdata>with TickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
    context.read<WeatherBloc>().add(GetWeatherData());
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
        title: Text("Weather Data"),
        centerTitle: true,
      ),
      body:  Center(
          child: Column(
              children: [
                SizedBox(height: 20,),
                Textfieldwidget(
                  hinttext: 'Search',
                  controller: searchcontroller,
                  preffixicon: Icon(Icons.search),
                  textInputType: TextInputType.text,
                  suffixicon: IconButton(onPressed: (){
                    context.read<WeatherBloc>().add(GetWeatherData());
                    searchcontroller.clear();
                  }, icon: Icon(CupertinoIcons.search)),
                  func: (value){
                    context.read<WeatherBloc>().add(SearchCityWeather(search: value));
                  },
                ),
                SizedBox(height: 20,),
            
                Expanded(
                  child: BlocBuilder<WeatherBloc,WeatherStates>(builder: (context,state){
                    switch(state.apiStatus){
                      case ApiStatus.initial:
                      case ApiStatus.loading:
                        return Center(
                          child: SpinKitFadingCircle(
                            controller: _controller,
                            color:Theme.of(context).brightness == Brightness.dark
                                ? AppColors.scaffoldlightmode
                                : AppColors.scaffolddarkmode,
                          )
                        );
                      case ApiStatus.failure:
                      if(state.message.toString().contains("Internet")){
                        return Internetexceptions(callback: (){
                          context.read<WeatherBloc>().add(GetWeatherData());
                        });
                      }else{
                        return Center(
                          child: Customtextwidget(text: state.message.toString(),
                              fontsize: 20),
                        );
                      }
                      case ApiStatus.success:
                        final url = "https:${state.weatherdata!.current.condition.icon}";
                        final locationdata = state.weatherdata!.location;
                        final currentdata = state.weatherdata!.current;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                NetworkCirlceImage(imageurl: url,),
                                SizedBox(height: 20,),

                                Card(
                                  color:Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textfielddarkmode
                                  : AppColors.textfieldlightmode,
                                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                  child: Column(
                                    children: [
                                      Reusablerowformat(head: "City", title: locationdata.name),
                                      Reusablerowformat(head: "Region", title: locationdata.region),
                                      Reusablerowformat(head: "Country", title: locationdata.country),
                                      Reusablerowformat(head: "tzId", title: locationdata.tzId),
                                      Reusablerowformat(head: "condition", title: currentdata.condition.text.toString()),
                                      Reusablerowformat(head: "localtimeEpoch", title: locationdata.localtimeEpoch.toString()),
                                      Reusablerowformat(head: "lat", title: locationdata.lat.toString()),
                                      Reusablerowformat(head: "lon", title: locationdata.lon.toString()),
                                      Reusablerowformat(head: "cloud", title: currentdata.cloud.toString()),

                                      Reusablerowformat(head: "feelslikeF", title: currentdata.feelslikeF.toString()),
                                      Reusablerowformat(head: "feelslikeC", title: currentdata.feelslikeC.toString()),
                                      Reusablerowformat(head: "windchillC", title: currentdata.windchillC.toString()),
                                      Reusablerowformat(head: "humidity", title: currentdata.humidity.toString()),
                                      Reusablerowformat(head: "pressureMb", title: currentdata.pressureMb.toString()),
                                      Reusablerowformat(head: "precipIn", title: currentdata.precipIn.toString()),
                                      Reusablerowformat(head: "precipMm", title: currentdata.precipMm.toString()),



                                    ],
                                  ),),
                                )
                              ],
                            ),
                          ),
                        );

                    }
                  }),
                )
              ],
            ),
          ),
    );
  }
}
