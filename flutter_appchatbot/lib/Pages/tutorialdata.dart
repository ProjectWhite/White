class TutorialModel{
  String imagePath;
  String word;

  TutorialModel({this.imagePath,this.word});
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }
  void setWord(String GetWord){
    word = GetWord;
  }
  String getWordString(){
    return word;
  }
  String getImageAssetPath(){
    return imagePath;
  }

}
List<TutorialModel> getSlides(){
  List<TutorialModel> slides = new List<TutorialModel>();
  TutorialModel tutorialModel = new TutorialModel();

  tutorialModel.setImageAssetPath("assets/ezgif.com-gif-maker.gif");
  tutorialModel.setWord("You can add your diary just command to white like \"write diary\"");
  slides.add(tutorialModel);
  tutorialModel = new TutorialModel();

  tutorialModel.setImageAssetPath("assets/ezgif.com-gif-maker (1).gif");
  tutorialModel.setWord("After you finish your diary and sent. White will asking you about your feeling that moment");
  slides.add(tutorialModel);
  tutorialModel = new TutorialModel();

  tutorialModel.setImageAssetPath("assets/ezgif.com-gif-maker (2).gif");
  tutorialModel.setWord("So you can freely access to your milestone and diary anyplace anytime!");
  slides.add(tutorialModel);
  tutorialModel = new TutorialModel();

  tutorialModel.setImageAssetPath("assets/ezgif.com-gif-maker (3).gif");
  tutorialModel.setWord("Finally you can read or delete diary if you want!\nEasy right?");
  slides.add(tutorialModel);
  tutorialModel = new TutorialModel();

  return slides;
}