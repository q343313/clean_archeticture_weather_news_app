
import '../../../allpaths.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MoviesBloc>().add(GetMoviesData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child:
            BlocBuilder<MoviesBloc,MoviesStates>(builder: (context,state){
              switch(state.apiStatus){

                case ApiStatus.failure:
                  if(state.message.toString().contains("Internet")){
                    return Internetexceptions(callback: (){
                      context.read<MoviesBloc>().add(GetMoviesData());
                    });
                  }else{
                    return Center(
                      child: Customtextwidget(text: state.message.toString(),
                          fontsize: 20),
                    );
                  }

                case ApiStatus.initial:
                case ApiStatus.loading:
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                    child: Shimmereffectwidget(),
                  );
                case ApiStatus.success:
                  return ListView.builder(itemCount: state.moviesModel!.tvshow.length,
                 itemBuilder: (context,index){
                    String url = state.moviesModel!.tvshow[index].image_thumbnail_path.toString();
                    return Card(
                      elevation: 10,
                      color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.textfielddarkmode
                      : AppColors.textfieldlightmode,
                      child: Column(
                        children: [
                          NetworkimageWidget(url:url )
                        ],
                      ),
                    );
                 }, );
              }
            }))
          ],
        ),
      ),
    );
  }
}
