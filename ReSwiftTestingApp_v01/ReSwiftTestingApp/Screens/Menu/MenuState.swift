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
        .init(sectionTitle: "Set color scheme:", items: ColorScheme.allCases.reduce(into:[String]()) {
            $0.append($1.rawValue)
        })]
  }
}
