
import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:provider/provider.dart';

class Intro1screens extends StatefulWidget {
  const Intro1screens({super.key});

  @override
  State<Intro1screens> createState() => _Intro1screensState();
}

class _Intro1screensState extends State<Intro1screens> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroScreensProviders>(
      builder: (context,value,child)=>
       Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.green,
           actions: [
             Textbuttonwidgets(callback: (){
               Navigator.pushReplacementNamed(context, RouteNames.signupscreen);
             }, title: 'Skip',),
             SizedBox(width: 10,)
           ],
         ),
        body:IndexedStack(
          index: value.index,
          children: value.screen,
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(opacity: value.opacity,
              child:  Floatingactionwidget(callback: () {value.returenscreen();}, child: Icon(Icons.arrow_back),),),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Customrowcontainer(index: value.index,),
            ),
            Floatingactionwidget(callback: (){value.change_screen(context);}, child: Icon(Icons.arrow_forward),)
          ],
        ),
      ),
    );
  }
}
