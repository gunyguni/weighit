import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math' as math;
import 'package:weighit/models/status_chart.dart';
import 'package:weighit/widgets/chart_maker.dart';

enum Time { Daily, Weekly, Monthly }

class DetailedStatus extends StatefulWidget {
  List<dynamic> record;

  DetailedStatus({Key key, this.record}) : super(key: key);

  @override
  _DetailedStatusState createState() => _DetailedStatusState();
}

class _DetailedStatusState extends State<DetailedStatus>
    with SingleTickerProviderStateMixin {
  Time time = Time.Daily;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xffF8F6F6),
          leading: IconButton(
            icon: Icon(
              Icons.backspace,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          pinned: false,
          expandedHeight: size.height * 0.08,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              widget.record[0],
              style:
                  TextStyle(color: Colors.black, fontSize: size.height * 0.021),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            maxHeight: size.height * 0.1,
            minHeight: size.height * 0.05,
            child: Container(
              color: Color(0xffF8F6F6),
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 이제 여기서 각 컨테이너를 누를 때마다 적절하게 time을 바꿔줘서 새롭게 만들어야 한다.
                  Container(
                    height: size.height * 0.049,
                    child: Center(
                      child: Text(
                        'Daily',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.049,
                    child: Center(
                      child: Text(
                        'Weekly',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.049,
                    child: Center(
                      child: Text(
                        'Monthly',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              // 어떤 time을 골랐는지에 따라 적절한 graph를 return하는 function이다.
              _chooseGraph(time, widget.record),
              Container(
                color: Theme.of(context).primaryColor,
                height: 500.0,
                child: Text(
                  '다른 정보들',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _chooseGraph(Time time, List<dynamic> record) {
  switch (time) {
    case Time.Daily:
      return Container(
        color: Colors.white,
        height: 300.0,
        child: Hero(
          tag: record[0],
          child: ChartMaker().buildChartThreeDays(record),
        ),
      );
      break;
    default:
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
