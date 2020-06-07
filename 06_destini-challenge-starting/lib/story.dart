class Story {
  String _storyTitle;
  String _choice1;
  String _choice2;

  Story({String storyTitle, String choice1, String choice2}) {
    this._storyTitle = storyTitle;
    this._choice1 = choice1;
    this._choice2 = choice2;
  }

  String getChoice2() => this._choice2;

  setChoice2(String value) => _choice2 = value;

  String getChoice1() => this._choice1;

  setChoice1(String value) => _choice1 = value;

  String getStoryTitle() => this._storyTitle;

  setStoryTitle(String value) => _storyTitle = value;
}
