import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di.dart';
import '../../../../bloc/splash/splash_bloc.dart';
import '../../../../bloc/splash/splash_event.dart';
import '../../../../bloc/splash/splash_state.dart';
import '../../../../resource/assets_manager.dart';
import '../../../../resource/colors_manager.dart';
import '../../../../resource/routes_manager.dart';
import '../../../common_component/common_image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController _controller;
  final SplashBloc _bloc = instance<SplashBloc>();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 100.0, end: 200.0).animate(_controller);
    _controller.forward();
    _controller.addListener(() {});
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (mounted) {
        // initDynamicLinks(context: context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorWhite,
      body: BlocProvider(
        create: (context) => _bloc..add(SplashStart()),
        child: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Navigator.of(context).pushNamed(Routes.navigateRoute);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: ScaleTransition(
                      scale: _controller,
                      child: const Hero(
                        tag: "Login-image",
                        child: CommonImageAsset(
                          image: ImageManager.icLogo,
                          height: 170,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
