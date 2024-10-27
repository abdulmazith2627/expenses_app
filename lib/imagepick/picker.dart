import 'package:file_picker/file_picker.dart';

imagepicker(filetype,withdata)async{
FilePickerResult? filepick=await FilePicker.platform.pickFiles(type:filetype,withData:withdata);
return filepick;
}