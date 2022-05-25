- This project showcases the implementation of Deep Learning technique - CNN using the concept of Transfer Learning.
- The aim of the project is to build a neural network model that accurately identifies the breed of a horse image, when given as an input.
- Images of various Horse Breeds were collected separately, & then each of them were pre-processed, re-sized, re-scaled, and all the images were labelled
  accordingly (Data-labelling).
- Data augmentation was performed on few under-sampled classes.
- Xception Architecture (Base Model) trained over imagenet weights, was used here, as it was observed to perform better than other architectures,  
  like Vgg16 or Inception on the imagenet weigts.
- A custom multi-layered CNN (head model) was built on top of our base model, to work with horse breeds images.
- Model was compiled & run in 2-3 cycles.
- Best model weights are loaded & model is evaluated on Test set.
- Results file (Classification Probabilities) are processed & stored.
- Hyperparameter Tuning is performed, to achieve maximum efficiency & accuracy.