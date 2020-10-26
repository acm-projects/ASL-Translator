# ASL-Translator
Break the language barrier through auto-generated closed captions, derived from hand sign detection using machine learning.

## Key Features

> Translate ASL in real time by providing captions as the user is signing various letters.

### MVP (Minimum Viable Product)
- Decide on a model type (e.g. R-CNN, Fast R-CNN, Faster R-CNN, YOLO, or others)
- Decide on dataset for model training
- Test the accuracy of the model
- Live translate as camera is pointed as person is performing sign language

### Additional Features - Stretch Goals
- App can verbally inform and read out the captions to the user
- Input a video and output text
- App integrates various sign languages

## Dependencies

### Flutter
> Flutter can be used for the basic front end of the project. The majority of the time will be spent on developing the backend and training the existing dataset for accuracy.

Install by following the guidelines [here](https://flutter.dev/docs/get-started/install)

[General documentation](https://flutter.dev/docs)

### AWS Rekognition
> The model should be trained utilizing AWS Rekognition
>
> [AWS Documentation](https://docs.aws.amazon.com/rekognition/latest/dg/what-is.html) and [API Reference](https://docs.aws.amazon.com/rekognition/latest/dg/API_Reference.html)

### Other cloud platforms to train your model
- [IBM Watson](https://www.ibm.com/cloud/machine-learning)
- [Google Cloud](https://cloud.google.com/ai-platform)
- [Azure](https://azure.microsoft.com/en-us/services/machine-learning/)

## Resources
*Below are some resources to help overcome possible roadblocks during the project*

##### Possible data sets
- Training Data set of [images of alphabets](https://www.kaggle.com/grassknoted/asl-alphabet?)
- Large [database of handwritten digits](https://www.kaggle.com/datamunge/sign-language-mnist) used for training various image processing systems
- Another [ASL data set](https://www.kaggle.com/kuzivakwashe/significant-asl-sign-language-alphabet-dataset)
  
### Inspiration
- [Auslan alphabet translator](https://medium.com/@coviu/how-we-used-ai-to-translate-sign-language-in-real-time-782238ed6bf#:~:text=In%20less%20than%2048%20hours,English%20text%20in%20real%20time.)

### Prototyping
- [Adobe XD](https://www.adobe.com/products/xd.html?sdid=12B9F15S&mv=Search&ef_id=CjwKCAjwkdL6BRAREiwA-kiczGlKOD6-DASI9BUGIwQBgdAt33vydE4YxCgvMX5TDh2T5m9Trjq-jBoCFugQAvD_BwE:G:s&s_kwcid=AL!3085!3!315233774139!e!!g!!adobe%20xd!1641846436!65452675151)
- [Figma](https://www.figma.com/)

### Learning Resources
Look through all of these resources at the beginning of the semester!
- [How to be successful in ACM Projects](https://docs.google.com/document/d/18Zi3DrKG5e6g5Bojr8iqxIu6VIGl86YBSFlsnJnlM88/edit?usp=sharing)
-   [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
-	[Choosing between React Native and Flutter](https://hackr.io/blog/react-native-vs-flutter)
-	[Getting started with React](https://facebook.github.io/react-native/docs/getting-started)
-	[Getting started with Flutter](https://flutter.dev/docs/get-started/install)
-	[Comparing top databases](https://dzone.com/articles/firebase-vs-mongodb-which-database-to-use-for-your)
-	[Choosing between Map APIs](https://madappgang.com/blog/mapbox-vs-google-maps-choosing-a-map-for-your-app)
-	[Overview of making API calls](https://snipcart.com/blog/apis-integration-usage-benefits)
