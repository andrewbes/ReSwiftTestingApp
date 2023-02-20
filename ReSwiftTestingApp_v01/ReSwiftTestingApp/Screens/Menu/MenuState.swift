import ReSwift

struct MenuState {
    struct Section {
        var sectionTitle: String
        var items: [String]
    }
    
  var sections: [Section]
  
  init() {
      sections = [
        .init(sectionTitle: "Navigation:", items: ["Settings", "Rule", "Game"]),
        .init(sectionTitle: "Set colors:", items: ["Red", "Green", "Yellow"])]
  }
}
