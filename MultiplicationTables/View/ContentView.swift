import SwiftUI

struct ContentView: View {
    
    @State private var settings = Settings()
    
    var body: some View {
        NavigationView {
            Group {
                if !settings.settingsDone {
                    SettingsView(settings: $settings)
                } else {
                    GameView(settings: $settings)
                }
            }.navigationBarTitle(Text("Multiplikation"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
