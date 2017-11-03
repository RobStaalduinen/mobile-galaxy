class TestData

  def self.test_app
    TestData.apps.first
  end

  def self.test_recommendations
    TestData.apps
  end

  def self.autocomplete
    TestData.apps
  end

  def self.apps
    app_1 = IosStoreListing.new(
      name: "Crossy Road",
      package: "com.hipsterwhale.crossy",
      description: "Over 150,000,000 downloads! Apple Design Award Winner 2015!\nWhy did the Chicken cross the road?\nWhy did the Pigeon leave THAT there?\nWhy did Unihorse eat all that candy?\nCrossy Road® is the #1 viral smash hit you’ll never stop playing.",
      price: "Free",
      rating: 4.5,
      rating_count: 100,
      icon_url: "http://is2.mzstatic.com/image/thumb/Purple128/v4/56/53/b3/5653b3a3-aa66-2e66-aa43-8b06d986c2ba/source/100x100bb.jpg",
    )

    app_2 = IosStoreListing.new(
      name: "Disney Crossy Road",
      package: "com.disney.disneycrossyroad",
      description: "Over 150,000,000 downloads! Apple Design Award Winner 2015!\nWhy did the Chicken cross the road?\nWhy did the Pigeon leave THAT there?\nWhy did Unihorse eat all that candy?\nCrossy Road® is the #1 viral smash hit you’ll never stop playing.",
      price: "Free",
      rating: 4.5,
      rating_count: 100,
      icon_url: "http://is2.mzstatic.com/image/thumb/Purple117/v4/6c/27/b4/6c27b48b-41af-3f0d-f836-3e79ccd2a730/source/100x100bb.jpg",
    )

    app_3 = IosStoreListing.new(
      name: "Word Crossy - A crossword game",
      package: "com.fillword.cross.wordmind.ios.en",
      description: "Connect letters in a level and finish a word. So entertaining and totally for free!\nYou have surely played many word games and been invincible.\nNow there is a completely new word link game waiting for you to take the challenge! Want to prove your skills?\n\nWord Crossy combines word search and crossword style games. By Connecting letters, you get a complete word and fill it into a crossword blank. This is only the first step! If you want to win, you still need to find all the words hidden in the crossword. Challenge yourself and train your brain.\n\nFeature:\n- Easy to play and amusing, Connecting words to build a complete word.\n- More than 300 levels and multiple words to search for.\n- Crossword style to make the game experience even more interesting.\n- The degree of difficulty increasing according to player’s progress.\n- No time limits.\n- Letters redraw and useful hints when needed.\n- Beautiful visual experience.\n\nHow do I play?\n- Connect the letters on the wheel to get a correct word.\n- Find all the words and fill in the crossword blanks.\n\nPlay Word Crossy to train your brain, let your free time be more fun!\n\nNOTES\n• \"Word Crossy\" is free to play, but you can purchase In-app items like coins.",
      price: "Free",
      rating: 4.5,
      rating_count: 100,
      icon_url: "http://is2.mzstatic.com/image/thumb/Purple118/v4/8f/03/fc/8f03fc84-1904-0054-3f2d-d9043bc3eafa/source/100x100bb.jpg",
    )

    [app_1, app_2, app_3]
  end

end
