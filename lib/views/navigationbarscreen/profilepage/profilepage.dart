

import '../../../allpaths.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  late ApiBlocs apiBlocs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiBlocs = ApiBlocs(getIt());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => apiBlocs..add(GetApiData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ApiBlocs,ApiStates>(builder: (context,state){
                switch(state.movieslist.status) {

                  case Status.loading:
                    return ListView.builder(itemCount: 10,
                    itemBuilder: (context,index){
                      return Padding(padding: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                        child: Shimmereffectwidget(),);
                    },);

                  case Status.completed:
                    return ListView.builder(itemCount: state.movieslist.data!.tvshow.length,
                    itemBuilder: (context,index){
                      final data = state.movieslist.data;
                      final user = state.movieslist.data!.tvshow[index];
                      if(data == null){
                        return Center(
                          child: Customtextwidget(text: "No Data Found", fontsize: 20,fontfamily: "bold",),
                        );
                      }

                      return Card(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 4,vertical: 3),
                          child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(user.image_thumbnail_path.toString()),
                                ),
                            title: Customtextwidget(text: user.name.toString(), fontsize: 20,fontfamily: "bold",),
                            subtitle: Customtextwidget(text: user.network.toString(), fontsize: 12,fontfamily: "semibold",),
                          ),),
                      );
                    },);
                  case Status.error:
                    if(state.movieslist.message.toString().contains("Internet")){
                      return Internetexceptions(callback: (){apiBlocs.add(GetApiData());});
                    }else{
                      return Center(
                        child: Text(state.movieslist.message.toString()),
                      );
                    }

                  default:
                    return SizedBox();
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
