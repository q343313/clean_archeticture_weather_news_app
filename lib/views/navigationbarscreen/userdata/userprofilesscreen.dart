import 'package:clean_architecture_weather_new_app/allpaths.dart';

import '../../../bloc/signupbloc/signupbloc.dart';
import '../newspage/drawerwidgetscreens.dart';

class Userprofilesscreen extends StatefulWidget {
  const Userprofilesscreen({super.key});

  @override
  State<Userprofilesscreen> createState() => _UserprofilesscreenState();
}

class _UserprofilesscreenState extends State<Userprofilesscreen> {

  late UpdatedUserBloc updatedUserBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updatedUserBloc = UpdatedUserBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => updatedUserBloc,
      child: Scaffold(
        drawer: Drawerwidgetscreens(),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
            Boxes.getprofiledata().clear();
          }, icon: Icon(Icons.logout))],
          title: Customtextwidget(text: "Profile Screen",
              fontsize: 20),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<UpdatedUserBloc, UpdatedProfileStates>(
                builder: (context, state) {
                  return Expanded(child: ValueListenableBuilder(
                  valueListenable: Boxes.getprofiledata().listenable(),
                  builder: (context, Box box, _) {
                    final data = box.values.toList().cast<ProfileModel>();
                    if(data.isEmpty){
                      return Center(
                        child: Customtextwidget(text: "No Account Found", fontsize: 20),
                      );
                    }else{
                      final user = data.last;
                      Future.microtask(() {
                        context.read<UpdatedUserBloc>().add(GetProfileUser(profileModel: user));
                      });

                      final profile = state.profileModel;
                      return Column(
                        children: [
                            SizedBox(height:80),
                          BlocBuilder<ImageBloc, ImageStates>(
                            builder: (context, states) {
                              final image = states.imagefile;
                              final storedImage = context.watch<UpdatedUserBloc>().state.image;
                              if (image != null &&
                                  image.path.isNotEmpty &&
                                  image.path != storedImage) {
                                Future.microtask(() {
                                  context.read<UpdatedUserBloc>().add(
                                    UpdatedProfileImage(image: image.path),
                                  );
                                });
                              }
                              return InkWell(
                                onTap: ()=>showimagedialog(context),
                                child: (profile?.image?.isEmpty ?? true)
                                  ? CustomContImage()
                                  : Customiamgeavatar(image: profile!.image),
                              );
                            },
                          ),
                          SizedBox(height: 14,),
                          Customtextwidget(text: profile!.username, fontsize: 20,fontfamily: "semibold",),
                          Customtextwidget(text: profile!.email.toString(), fontsize:14),
                          SizedBox(height: 30,),
                          CustomAccountButton(),
                          SizedBox(height: 20,),
                          AboutUserCard(title: 'About User', detail: profile.userbio,)
                        ],
                      );
                    }

                      },
                    )
                  );
  },
)
            ],
          ),
        ),
      ),
    );
  }
}


class CustomAccountButton extends StatelessWidget {
  const CustomAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomContButton(icon: Icon(Icons.logout), butonname: "Logout", callback: (){
          reusabledialog(context,
              "Logout Account",
              "Are you sure ti logout your account if you logout user you can create new account",
              "logout",
                  (){
                context.read<ImageBloc>().add(DeleteImage());
                context.read<SignupBloc>().add(LogoutUserAccount());
              });
        }),
        CustomContButton(icon: Icon(Icons.account_circle_rounded), butonname: "Create", callback: (){
          reusabledialog(context,
              "Create Account",
              "Are you sure ti logout your account if you logout user you can create new account",
              "Create",
                  (){
                context.read<ImageBloc>().add(DeleteImage());
                context.read<SignupBloc>().add(LogoutUserAccount());
                Navigator.pushReplacementNamed(context, RouteNames.loginscreen);
              });

        }),
        CustomContButton(icon: Icon(Icons.delete,color: Colors.red,), butonname: "Delete", callback: (){
          reusabledialog(context,
              "Delete Account",
              "Are you sure ti Delete your account if you Delete user you can create new account",
              "Delete",
                  (){
                context.read<ImageBloc>().add(DeleteImage());
                context.read<SignupBloc>().add(LogoutUserAccount());
              });
        }),
      ],
    );
  }
}

class CustomContButton extends StatelessWidget {
  const CustomContButton({super.key,required this.icon,required this.butonname,required this.callback});

  final Icon icon;
  final String butonname;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color:
          Theme.of(context).brightness== Brightness.dark?AppColors.scaffoldlightmode:AppColors.scaffolddarkmode)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Customtextwidget(text: butonname, fontsize: 12)
            ],
          ),
        ),
      ),
    );
  }
}


class AboutUserCard extends StatelessWidget {
  const AboutUserCard({super.key,required this.title,required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness== Brightness.dark?AppColors.textfielddarkmode:AppColors.textfieldlightmode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Customtextwidget(text: title, fontsize: 20,fontfamily: "semibold",),
            Wrap(
              children: [
                Customtextwidget(text: detail, fontsize: 14)
              ],
            )
          ],
        ),
      ),
    );
  }
}

