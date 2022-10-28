import 'dart:async';

import 'package:blue/blocs/auth_bloc/auth_bloc.dart';
import 'package:blue/blocs/bloc_observer.dart';
import 'package:blue/blocs/branches_cubit/branches_cubit.dart';
import 'package:blue/blocs/commerce_cubit/commerce_cubit.dart';
import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/coupon_reviews_cubit/coupon_reviews_cubit.dart';
import 'package:blue/blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import 'package:blue/blocs/tag_cubit/tag_cubit.dart';
import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/api.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/data/data_sources/sqflite_datasource.dart';
import 'package:blue/data/factories/db_factory.dart';
import 'package:blue/repositories/auth/auth_repository.dart';
import 'package:blue/repositories/branch/branch_repository.dart';
import 'package:blue/repositories/commerce/commerce_repository.dart';
import 'package:blue/repositories/coupon/coupon_repository.dart';
import 'package:blue/repositories/payment/payment_repository.dart';
import 'package:blue/repositories/tag/tag_repository.dart';
import 'package:blue/repositories/user/user_repository.dart';
import 'package:blue/screens/auth/signing.dart';
import 'package:blue/screens/home.dart';
import 'package:blue/screens/post_auth/banners_preview.dart';
import 'package:blue/screens/splash/splash_screen.dart';
import 'package:blue/services/branch/branch_service.dart';
import 'package:blue/services/commerce/commerce_service.dart';
import 'package:blue/services/coupon/coupon_service.dart';
import 'package:blue/services/payment/payment_service.dart';
import 'package:blue/services/tag/tag_service.dart';
import 'package:blue/services/user/user_service.dart';
import 'package:blue/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'blocs/selected_map_marker_cubit/selected_map_marker_cubit.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  //Bloc.transformer = droppable();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => TagRepository(tagService: TagService(dio: Dio()))),
      RepositoryProvider(create: (context) => AuthRepository(firebaseAuth: FirebaseAuth.instance, userService: UserService(dio: Dio()), googleSignIn: GoogleSignIn())),
      RepositoryProvider(create: (context) => UserRepository(userService: UserService(dio: Dio()))),
      RepositoryProvider(create: (context) => CouponRepository(couponService: CouponService(dio: Dio()))),
      RepositoryProvider(create: (context) => CommerceRepository(commerceService: CommerceService(dio: Dio()))),
      RepositoryProvider(create: (context) => PaymentRepository(paymentService: PaymentService(dio: Dio(BaseOptions(headers: stripeHeaders))))),
      RepositoryProvider(create: (context) => BranchRepository(branchService: BranchService(dio: Dio())))
    ],
    child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(create: (context) => UserCubit(userRepository: context.read<UserRepository>(), paymentRepository: context.read<PaymentRepository>())),
          BlocProvider(create: (context) => TagCubit(tagRepository: context.read<TagRepository>())),
          BlocProvider(create: (context) => CouponCubit(couponRepository: context.read<CouponRepository>())),
          BlocProvider(create: (context) => SearchedCouponsCubit(couponRepository: context.read<CouponRepository>())),
          BlocProvider(create: (context) => ThemeCubit(),),
          BlocProvider(create: (context) => CommerceCubit(commerceRepository: context.read<CommerceRepository>())),
          BlocProvider(create: (context) => BranchesCubit(branchRepository: context.read<BranchRepository>())),
          BlocProvider(create: (context) => SelectedMapMarkerCubit(branchRepository: context.read<BranchRepository>())),
          BlocProvider(create: (context) => CouponReviewsCubit(couponRepository: context.read<CouponRepository>()))],
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blue App',
        theme: ThemeData(
          backgroundColor: Colors.white,
          splashColor: const Color(0xFFF3F4F7),
          focusColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: const Color(0xFFF3F4F7),
                hintStyle: const TextStyle(color: Color(0xFF97999B), fontFamily: 'Outfit', fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(24)
                )
            ),
          checkboxTheme: const CheckboxThemeData(
            side: BorderSide(
                width: 1,
                color: Color(0xFFCBCCCD)
            ),
          ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF3D5BF6),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  shadowColor: Colors.white.withOpacity(0),
                  elevation: 0,
                  textStyle: const TextStyle(color: Colors.white, fontFamily: 'Outfit', fontWeight: FontWeight.w600)
              )
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                primary: const Color(0xFF3D5BF6),
                onSurface: const Color(0xFF3D5BF6),
                surfaceTintColor: const Color(0xFF3D5BF6),
                side: const BorderSide(color: Color(0xFF3D5BF6), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Color(0xFF3D5BF6), width: 1)
                )
              )
            ),
            highlightColor: Colors.black,
        ),
        themeMode: context.watch<ThemeCubit>().state.theme,
        darkTheme: ThemeData(
          backgroundColor: const Color(0xFF121725),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xFF363A46),
              hintStyle: const TextStyle(color: Color(0xFF97999B), fontFamily: 'Outfit', fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24)
              )
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  primary: const Color(0xFF3D5BF6),
                  onSurface: const Color(0xFF3D5BF6),
                  surfaceTintColor: const Color(0xFF3D5BF6),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF3D5BF6), width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Color(0xFF3D5BF6), width: 1)
                  )
              )
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.white,
                  onSurface: Colors.white,
              )
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            checkColor: MaterialStateColor.resolveWith((states) => Colors.black),
            side: const BorderSide(
                width: 1,
                color: Colors.white
            ),
          ),
          splashColor: const Color(0xFF363A46),
            focusColor: const Color(0xFF303440),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF3D5BF6),
                    onPrimary: Colors.white,
                    shadowColor: Colors.white.withOpacity(0.5),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    textStyle: const TextStyle(color: Colors.white, fontFamily: 'Outfit', fontWeight: FontWeight.w600)
                )
            ),
          colorScheme: const ColorScheme.dark(),
          highlightColor: Colors.white,
        ),
        home: const Main(),
      );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  double _height = 30;
  double _opacity = 0;
  ProgressDialog? _loadingDialog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TagCubit>().loadFavs();
    _loadingDialog = ProgressDialog(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState((){
        _height = 0;
        _opacity = 1;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(
      listener: (context,state) async{
        if(state is AuthLoadingState){
          _loadingDialog!.show(max: 2, hideValue: true, msg: 'Cargando ...');
        }
        if(state is AuthAuthenticatedState){
          final db = await LocalDatabaseFactory().createDatabase(state.user.uid);
          final data = SqfliteDataSource(db);
          if(!mounted){
            return;
          }
          context.read<CouponCubit>().initLocalDb(data);
          context.read<UserCubit>().init(state);
        }else if(state is AuthNotAuthenticatedState){
          context.read<UserCubit>().setNotAuthenticated();
        }
        if(state is! AuthLoadingState && _loadingDialog!.isOpen()){
          _loadingDialog?.close();
        }
        if(state is AuthErrorState){
          showErrorSnackBar(context, state.error.error);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/degradado-back.png').image
                )
              ),
            ) : Container(),
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo_images/BlueBwhite-02.png', scale: 1.2,),
                AnimatedContainer(duration: const Duration(seconds: 2),height: _height,),
                Image.asset('assets/logo_images/Bluwhitesolo-02.png', scale: 1.2,),
                AnimatedContainer(duration: const Duration(seconds: 2),height: _height,),
                Image.asset('assets/logo_images/Supercuponessolo-02.png', scale: 1.2,),
                const SizedBox(height: 20,),
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 2),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SlideAction(
                      sliderButtonYOffset: -8,
                      sliderButtonIcon: SvgPicture.asset(KIcons.arrowRight, color: Colors.white,),
                      borderRadius: 24,
                      sliderButtonIconPadding: 23,
                      height: 60,
                      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Outfit', color: Colors.black),
                      text: 'COMENZAR',
                      innerColor: const Color(0xFF3D5BF6),
                      outerColor: const Color(0xFFDEDEDE),
                      onSubmit: () async{
                        do{
                          await Future.delayed(Duration(milliseconds: 400));
                        }while(context.read<AuthBloc>().state is AuthInitialState);
                        bool authenticated = context.read<AuthBloc>().state is AuthAuthenticatedState;
                        if(authenticated){
                          do{
                            await Future.delayed(Duration(milliseconds: 200));
                          }while(context.read<UserCubit>().state.status == UserStateStatus.initial);
                          bool tutorialEnded = context.read<UserCubit>().state.user.endedTutorial!;
                          if(tutorialEnded){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SplashScreen()));
                          }else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BannersPreview()));
                          }
                        } else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signing()));
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(seconds: 3),
                    child: TextButton(
                        onPressed: (){
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        child: const Text('Cambiar a Modo Oscuro', style: TextStyle(fontFamily: 'Outfit', color: Color(0xFFFFC24B), fontWeight: FontWeight.w500),)))
              ],
            )),
          ],
        )
      ),
    );
  }
}
