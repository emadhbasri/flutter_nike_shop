import 'package:flutter/material.dart';
import 'package:flutter_nike_shop/classes/functions.dart';

import '../model.dart';

class TheBottomSheet extends StatefulWidget {
  final ProductShoes shoe;
  const TheBottomSheet({Key? key,required this.shoe}) : super(key: key);
  @override
  _TheBottomSheetState createState() => _TheBottomSheetState();
}

class _TheBottomSheetState extends State<TheBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;

  @override
  void initState() {
    _controller = AnimationController(//800
        vsync: this, duration: const Duration(milliseconds: 300), value: 0);
    _controller1 = AnimationController(//700
        vsync: this, duration: const Duration(milliseconds: 300), value: 0);

    animationB = Tween<double>(begin: doubleWidth(45), end: doubleHeight(7.5))
        .animate(CurvedAnimation(curve: const Interval(0, 0.5), parent: _controller));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  List<double> shoeSize = [];
  
  late Animation<double> animationB;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: doubleWidth(100),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: const Alignment(0, -1),
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.83))
                  .animate(_controller1),
              child: ScaleTransition(
                alignment: Alignment.topCenter,
                scale: Tween<double>(begin: 1, end: 0.42 //0.75
                        )
                    .animate(CurvedAnimation(
                        curve: const Interval(0.7, 1), parent: _controller)),
                child: ScaleTransition(
                  alignment: Alignment.topCenter,
                  scale: Tween<double>(begin: 1, end: 0.35).animate(
                      CurvedAnimation(
                          curve: const Interval(0, 0.5), parent: _controller)),
                  child: DecoratedBoxTransition(
                    decoration: DecorationTween(
                            begin: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                            ),
                            end: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(200),
                            ))
                        .animate(CurvedAnimation(
                            curve: const Interval(0, 0.5), parent: _controller)),
                    position: DecorationPosition.background,
                    child: FadeTransition(
                      opacity:Tween<double>(begin: 1,end:0).animate(CurvedAnimation(
                          curve: const Interval(0, 0.3), parent: _controller)),
                      child: SizedBox(
                        height: doubleWidth(100),
                        width: doubleWidth(100),
                        child: Column(
                          children: [
                            SizedBox(
                              height: doubleHeight(20),
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: doubleHeight(20),
                                    width: doubleHeight(20),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: doubleWidth(5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              List ll =
                                                  widget.shoe.name.split(',');
                                              return Text(
                                                '${ll[0]}\n,${ll[1]}',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromRGBO(168, 168, 170, 1),
                                                    fontSize: doubleWidth(4)),
                                              );
                                            },
                                          ),
                                          SizedBox(height: doubleHeight(1.5)),
                                          Text(
                                            '\$${widget.shoe.priceNow} ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: doubleWidth(5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: const Color.fromRGBO(230, 230, 230, 1),
                              endIndent: doubleWidth(5),
                              indent: doubleWidth(5),
                              thickness: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: doubleWidth(10),
                                  height: doubleWidth(10),
                                  child: Image.asset('assets/images/nike.png'),
                                ),
                                SizedBox(width: doubleWidth(1)),
                                Text(
                                  'SELECT SIZE',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(168, 168, 170, 1),
                                      fontSize: doubleWidth(3.7)),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: doubleWidth(2)),
                              child:Wrap(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runAlignment: WrapAlignment.start,
                                spacing: doubleWidth(2),
                                runSpacing: doubleHeight(1),
                                children: widget.shoe.sizes.map((e){
                                  String out = e.toString();
                                  if (e
                                      .toString()
                                      .contains('.0')) {
                                    out = e.round().toString();
                                  }
                                  if(shoeSize.contains(e)){
                                    return ElevatedButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: doubleHeight(2))),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        textStyle: MaterialStateProperty.all(const TextStyle(color:Colors.white)),
                                      ),
                                      child: Text('US $out'),
                                      onPressed: (){
                                        shoeSize.remove(e);
                                        setState(() {
                                        });
                                      },
                                   

                                    );
                                  }else{
                                    return TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: doubleHeight(2)))
                                       ,shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side: const BorderSide(color: Colors.grey,width: 1.5)
                                      )),
                                        backgroundColor: MaterialStateProperty.all(Colors.white),
                                        textStyle: MaterialStateProperty.all(const TextStyle(color:Colors.black)),
                                      ),
                                      
                                      child: Text('US $out'),
                                      onPressed: (){
                                        shoeSize.add(e);
                                        setState(() {

                                        });
                                      },


                                    );
                                  }
                                }).toList(),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.8))
                .animate(_controller1),
            child: AlignTransition(
              alignment: AlignmentTween(
                      begin: const Alignment(-1, -1), end: const Alignment(0, -0.9))
                  .animate(CurvedAnimation(
                      curve: const Interval(0, 0.5), parent: _controller)),
              child: ScaleTransition(
                alignment: Alignment.topCenter,
                scale: Tween<double>(begin: 1, end: 0.45 //0.75
                        )
                    .animate(CurvedAnimation(
                        curve: const Interval(0.7, 1), parent: _controller)),
                child: ScaleTransition(
                  alignment: Alignment.topCenter,
                  scale: Tween<double>(begin: 1, end: 0.6).animate(
                      CurvedAnimation(
                          curve: const Interval(0, 0.5), parent: _controller)),
                  child: SizedBox(
                    height: doubleHeight(20),
                    width: doubleHeight(20),
                    child: Center(
                      child: SizedBox(
                        height: doubleHeight(15),
                        width: doubleHeight(15),
                        child: Image.asset(
                          widget.shoe.images.first,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.95),
            child: GestureDetector(
              onTap: () {
                if (shoeSize.isEmpty) return;
                _controller.forward().then((value) => _controller1.forward().then((value) => Go.pop(context,false)));
                // _controller.animateTo(1,duration: Duration(seconds: 1),curve: Curves.linear);
                debugPrint('click');
              },
              child: AnimatedBuilder(
                key: const Key('AnimatedBuilder'),
                animation: animationB,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: shoeSize.isEmpty ? Colors.black45 : Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                    width: animationB.value,
                    height: doubleHeight(7.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        SizeTransition(
                            axis: Axis.horizontal,
                            axisAlignment: -1,
                            sizeFactor: Tween<double>(begin: 1, end: 0).animate(
                                CurvedAnimation(
                                    parent: _controller,
                                    curve: const Interval(0, 0.5))),
                            child: SizedBox(width: doubleWidth(4)),),
                        DefaultTextStyleTransition(
                          key: const Key('DefaultTextStyleTransition'),
                          style: TextStyleTween(
                                  begin: TextStyle(
                                      color: Colors.white,
                                      fontSize: doubleWidth(3),
                                      fontWeight: FontWeight.bold),
                                  end: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 0,
                                      fontWeight: FontWeight.bold))
                              .animate(CurvedAnimation(
                                  parent: _controller,
                                  curve: const Interval(0, 0.5))),
                          child: const Text(
                            'ADD TO CART',
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
