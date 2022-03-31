import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double padding = size.height * 0.075;
    return Padding(
      padding: EdgeInsets.only(top: padding, bottom: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.075,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent.withOpacity(0.3),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.clear_all_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            Container(
                height: size.height * 0.075,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent.withOpacity(0.3),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                )),
            Container(
              height: size.height * 0.075,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent.withOpacity(0.3),
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
