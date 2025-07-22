

import 'package:clean_architecture_weather_new_app/bloc/imagebloc/imagesbloc.dart';
import 'package:clean_architecture_weather_new_app/bloc/signupbloc/signupbloc.dart';
import 'package:clean_architecture_weather_new_app/config/data/authenticationdata/firebaseauthentications.dart';
import 'package:clean_architecture_weather_new_app/providers/introscreensprovider.dart';
import 'package:clean_architecture_weather_new_app/repository/imagereposiory/imagerepository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'allpaths.dart';
import 'firebase_options.dart';
import 'models/hivemodels/profilemodel/profilemodel.dart';

GetIt getIt = GetIt.instance;
void main()async{
    await initializenotification();
  weatherdata();
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    var directry =await getApplicationDocumentsDirectory();
    Hive.init(directry.path);
    Hive.registerAdapter(ProfileModelAdapter());
    Hive.openBox<ProfileModel>("profile");

  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>ThemeCubit()),
      BlocProvider(create: (_)=>WeatherBloc(getIt())),
      BlocProvider(create: (_)=>NewsBloc(getIt())),
      BlocProvider(create: (_)=>MoviesBloc(getIt())),
      BlocProvider(create: (_)=>SignupBloc(getIt())),
      BlocProvider(create: (_)=>ImageBloc(getIt()))
    ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>IntroScreensProviders())
          ],
          child: BlocBuilder<ThemeCubit,ThemeStates>(builder: (context,state){

            return MaterialApp(
              theme: state is LightThemeStates?AppThemes.lightthemedata:AppThemes.darkthemedata,
              title: "Clean Code App",
              initialRoute: RouteNames.splashscreen,
              onGenerateRoute: Routes.generatoroute,

            );
          }),
        ));
  }

}

void weatherdata(){
  getIt.registerLazySingleton<WeatherRepository>(()=>WeatherRepository());
  getIt.registerLazySingleton<MoviesRepository>(()=>MoviesHttprepository());
  getIt.registerLazySingleton<NewsRepository>(()=>NewsRepository());
  getIt.registerLazySingleton<FireBaseAuthentications>(()=>FireBaseAuthentications());
  getIt.registerLazySingleton<ImageRepository>(()=>ImageRepository());
}
