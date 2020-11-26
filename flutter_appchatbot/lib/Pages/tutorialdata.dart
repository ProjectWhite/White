class TutorialModel{
  String imagePath;

  TutorialModel({this.imagePath});
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }

  String getImageAssetPath(){
    return imagePath;
  }

}
List<TutorialModel> getSlides(){
  List<TutorialModel> slides = new List<TutorialModel>();
  TutorialModel tuturialModel = new TutorialModel();

  tuturialModel.setImageAssetPath("assets/ezgif.com-gif-maker.gif");
  slides.add(tuturialModel);
  tuturialModel = new TutorialModel();

  tuturialModel.setImageAssetPath("assets/ezgif.com-gif-maker (1).gif");
  slides.add(tuturialModel);
  tuturialModel = new TutorialModel();

  tuturialModel.setImageAssetPath("assets/ezgif.com-gif-maker (2).gif");
  slides.add(tuturialModel);
  tuturialModel = new TutorialModel();

  tuturialModel.setImageAssetPath("assets/ezgif.com-gif-maker (3).gif");
  slides.add(tuturialModel);
  tuturialModel = new TutorialModel();

  return slides;
}