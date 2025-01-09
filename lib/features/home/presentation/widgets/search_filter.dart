
import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *.08,
      width: size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height *.06,
              width: size.width * .78,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 5,
                textAlign: TextAlign.start,
                autofocus: true,
                initialValue: '',
                decoration: InputDecoration(
                  suffix: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Icon(Icons.search, size: 30, color: Colors.white54,),
                  ),
                  hintText: 'Search',
                  counterText: "",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: size.height *.05,
              width: size.height *.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.orange
              ),
              child: Center(
                child: Icon(Icons.filter_list_off, size: 20,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
