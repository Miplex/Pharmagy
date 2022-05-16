import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff3D8BFF).withAlpha(50),),],
      ),
      child: TextField(
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        decoration:  InputDecoration(
            suffixIcon:  IconButton(
              splashColor: Colors.transparent,
              onPressed: (){},
              icon: SvgPicture.asset(
                  'assets/images/icons/Search_icon.svg',
                  width: 15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.transparent,

              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.transparent,

              ),
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(color: Color(0xffC2DDFF),fontSize: 15.0,fontFamily: 'NeutrifPro'),
            contentPadding: const EdgeInsets.only(left: 25.0)
        ),
        style: const TextStyle(color: Colors.white),

      ),
    );
  }
}