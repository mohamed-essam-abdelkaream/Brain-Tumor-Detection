import 'package:flutter/material.dart';
class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain Tumor Detection',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.grey,
        leading: Icon(Icons.info,color: Colors.black,),
      ),
      backgroundColor: Colors.red,
      body: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(17.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage('images/66.jpg')),
                SizedBox(height: 20,),
                Text('1. Introduction                                 '
                    'Medical imaging techniques are used to image the inner portions of a human body'
                    ' for medical diagnosis. And medical image classification is one of the most'
                    ' challenging & affluent topics in the field of Image Processing. Medical image'
                    ' classification problems, detection of Cancer is the most prominent one. The'
                    ' statistics about the death rate from brain tumor suggest that it is one of the most'
                    ' alarming and critical cancer types in the Human body.',style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/3.jpeg')),
                SizedBox(height: 20,),
                Text('2.  Problem'
                    'A brain tumor is a mass or growth of abnormal cells in your brain'
                    ' Many different types of brain tumors exist.'
                    ' Some brain tumors are noncancerous and some brain tumors are cancerous.'
                    ' Brain tumors can begin in your brain (primary brain tumors), or cancer can begin in'
                    ' other parts of your body and spread to your brain as secondary brain tumors. The'
                    ' growth rate as well as the location of a brain tumor determines how it will affect the'
                    ' function of your nervous system. Brain tumor treatment options depend on the type'
                    ' of brain tumor you have ',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/4.jpeg')),
                SizedBox(height: 20,),
                Text('3. Objectives'
                    ' We proposed an efficient and effective method that helps'
                    ' in the segmentation and detection of the brain tumor without any human'
                    ' assistance based Convolutional Neural Network'
                    ' there are other many objectives of the project such as faults in medical diagnosis, as'
                    ' well as anyone can use our app to scan the MRI images for a brain tumor to ensure'
                    ' that is the tumor benign or malignant',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/5.jpeg')),
                SizedBox(height: 20,),
                Text('4. The proposed system has mainly five modules. Dataset, Pre-processing, Split the data.'
                    ' Build CNN model train Deep Neural network for epochs, and classification.'
                    '                                                                          '
                    '1. In the dataset, we can take multiple MRI images and take one as the input image.'
                    '                                                                      '
                    '2. In the pre-processing image encoded the label and resize the image.'
                    '                                                                      '
                    '3. In splitting the data we set the image as training data and testing data.'
                    '                                                                      '
                    '4. Then build a CNN model train deep neural network for epochs.'
                    '                                                                      '
                    '5. Finally the image is classified as yes or no if the tumor is positive then it returns yes and the'
                    'tumor is negative it returns no.',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/img_3.png')),
                SizedBox(height: 20,),
                Text('5. Conclusion'
                    'In brain tumor detection we have studied feature-based existing work. In featurebased '
                    'we have study about image processing techniques like image preprocessing, image segmentation,'
                    'features extraction, and classification'
                    ' And also study deep learning techniques CNN. In this system, we have to detect'
                    ' whether the tumor is present or not if the tumor is present then the model returns'
                    ' yes otherwise it returns no. However, not every task is said to be perfect in this'
                    ' development field even more improvement may be possible in this application. We'
                    ' have learned so many things and gained a lot of knowledge about the'
                    ' development field',style: TextStyle(fontSize: 20),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}