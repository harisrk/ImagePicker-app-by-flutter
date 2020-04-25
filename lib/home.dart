import 'dart:io';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class HomePage extends StatefulWidget{
 


   @override
  _HomePageState createState() => _HomePageState();

  
    
  
  }
  class  _HomePageState extends State<HomePage>{

    File _image;
  
  
   _openGallary(BuildContext context) async{
      var imag= await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=imag;
      }); 
      Navigator.of(context).pop(); }
  
    _openCamera(BuildContext context) async{
      var imag= await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image=imag;
      });  
          
          Navigator.of(context).pop(); }
  
    // Brightness _brightness;
  
  
    Future<void>  _showdialogbox(BuildContext context){
      return showDialog(context: context,builder: (BuildContext context){
        return AlertDialog(
          title: Text('Make a Choice'),
          content: SingleChildScrollView(
            child:ListBody(
              children: <Widget>[
                GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallary(context);
                },
                ),
                Padding(padding: EdgeInsets.all(11.0)),
                GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
                ),
              ],
            )
          ),
        );
      });
    }
    
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Home'
          ),
        ),
        drawer: Drawer(
          child:ListView(
            children: <Widget>[
              ListTile(
                title: Text('Theme'),
                trailing: Switch(
                  value: false, 
                  onChanged: (changedTheme){ }),
              )
            ],
          )
        ),
        body:Container(
          child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _image == null
              ? Text('No image selected.')
              : Image.file(_image,width: 400,height: 400,),
                RaisedButton(onPressed: (){
                  _showdialogbox(context);
                },child: Text("Image picker"
                ),
                )
              ],
            ),
          ),
        ),
       
      );
    }
    
  }


    


  