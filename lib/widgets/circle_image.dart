import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;

  CircleImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: imageUrl!=null?imageUrl:'',
        imageBuilder:(context , imageProvider)=> Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider
              ,fit: BoxFit.cover,

            ),

          ),

        ),
        placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),errorWidget: (context,url,error){
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.error_outlined,size: 48,color: Colors.white,),
            Text('Invalid Image.',style: TextStyle(color: Colors.white),),
          ],),
          decoration: BoxDecoration(
            color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),);
      },
      ),
    );
  }
}
