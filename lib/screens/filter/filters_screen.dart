import 'package:blue/blocs/tag_cubit/tag_cubit.dart';
import 'package:blue/screens/search/search_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import '../../models/tag/tag.dart';
import '../../widgets/common/app_bar_with_arrow.dart';

class FiltersScreen extends StatefulWidget {
  final bool inSearchResultsScreen;
  const FiltersScreen({required this.inSearchResultsScreen,Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SfRangeValues _values = SfRangeValues(1.0, 100.0);
  final double _minValue = 1;
  final double _maxValue = 300;
  late List<bool> active;

  @override
  void initState() {
    super.initState();
    active = List.generate(context.read<TagCubit>().state.tags.length, (index) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(
        title: 'Filters',
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text('Price range', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              SfRangeSlider(
                  activeColor: Color(0xFF5D5FEF),
                  numberFormat: NumberFormat.currency(),
                  min: _minValue,
                  stepSize: 1,
                  max: _maxValue,
                  inactiveColor: Colors.grey,
                  showLabels: true,
                  enableTooltip: true,
                  tooltipShape: SfPaddleTooltipShape(),
                  values: _values, onChanged: (values){
                setState((){
                  _values = values;
                });
              }),
              SizedBox(height: 20,),
              Text('Tags', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              ((){
                final localCategories = context.watch<TagCubit>().state.tags;
                return Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    spacing: 20,
                    runSpacing: 5,
                    children: List.generate(localCategories.length, (i) => GestureDetector(
                        onTap: (){
                          setState((){
                            active[i] = !active[i];
                          });
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          color: active[i] ? Color(0xFF5D5FEF) : Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.4))
                          ],
                          borderRadius: BorderRadius.circular(16)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(localCategories[i].name,style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w400),)),
                    ))
                );
              }()),
              Spacer(),
              Center(child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 65,
                child: ElevatedButton(
                    onPressed: (){

                  double? minPrice = _values.start;
                  double? maxPrice = _values.end;
                  List<int> tagsIds = [];
                  for(int i = 0; i < active.length; i++){
                    if(active[i]){
                      tagsIds.add(i + 1);
                    }
                  }

                  context.read<SearchedCouponsCubit>().filterCoupons(minPrice, maxPrice, tagsIds);
                  if(widget.inSearchResultsScreen){
                    Navigator.of(context).pop();
                  }else{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SearchResultsScreen()));
                  }
                }, child: Text('Apply')),
              )),
              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}
