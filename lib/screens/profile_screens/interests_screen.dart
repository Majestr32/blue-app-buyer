import 'dart:developer';

import 'package:blue/blocs/tag_cubit/tag_cubit.dart';
import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/screens/post_auth/post_category_choose.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  late List<bool> active;

  @override
  void initState() {
    super.initState();
    active = List.generate(context.read<TagCubit>().state.tags.length, (index) => false);
    int tagsCount = context.read<UserCubit>().state.tagsIds.length;
    for(int i = 0; i < tagsCount; i++){
      active[context.read<UserCubit>().state.tagsIds[i] - 1] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          const ArcWithLogo(withArrow: true,),
          Align(alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  color: Theme.of(context).splashColor,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: const Text('Mis Intereses', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),)),
                    const SizedBox(height: 10,),
                    const Text('Por categoría', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
                    const SizedBox(height: 15,),
                    BlocBuilder<TagCubit,TagState>(
                      builder: (context,state) => state.status == FavStateStatus.initial ? Container() : Wrap(
                          spacing: 15,
                          runSpacing: 10,
                          children: List.generate(state.tags.length, (index) => _choice(state.tags[index].name, active[index], () => setState((){active[index] = !active[index];})))
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: (){
                            if(active.where((element) => element == true).length < 3){
                              StandardSnackBar.instance.showInfoSnackBar(context, 'Elige al menos 3 categorías');
                              return;
                            }
                            List<int> tagsIds = [];
                            for(int i = 0; i < active.length; i++){
                              if(active[i]){
                                tagsIds.add(i + 1);
                              }
                            }
                            context.read<UserCubit>().setTags(tagsIds);
                            Navigator.of(context).pop();
                          }, child: const Text('Aplicar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),)),
                    ),
                  ],
                ),
              ),
            ),)
        ],
      ),
    );
  }
  Widget _choice(String title, bool isActive, VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: !isActive ? Theme.of(context).focusColor : context.watch<ThemeCubit>().state.theme == ThemeMode.light ? const Color(0xFF3D5BF6) : Colors.white,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(title, style: TextStyle(fontSize: 16, color: !isActive ? null : context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.white : const Color(0xFF939393), fontFamily: 'Outfit'),)),
      ),
    );
  }
}