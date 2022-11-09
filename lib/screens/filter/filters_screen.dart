import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
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
  late SfRangeValues _values = SfRangeValues(context.read<CouponCubit>().state.minPrice ?? 1.0, context.read<CouponCubit>().state.maxPrice ?? 100.0);
  late final double _minValue = 1.0;
  late final double _maxValue = 300.0;
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
        title: 'Filtros',
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text('Rango de precio', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
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
              Spacer(),
              Center(child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                child: ElevatedButton(
                    onPressed: (){

                  double? minPrice = _values.start;
                  double? maxPrice = _values.end;

                  context.read<SearchedCouponsCubit>().setPriceRange(minPrice!, maxPrice!);
                  context.read<CouponCubit>().setPriceRange(minPrice, maxPrice);
                  if(widget.inSearchResultsScreen){
                    Navigator.of(context).pop();
                  }else{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SearchResultsScreen()));
                  }
                }, child: Text('Aplicar')),
              )),
              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}
