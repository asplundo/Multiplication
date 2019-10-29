import SwiftUI

struct ContentView: View {
    
    @State private var settings = Settings()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors:
                        [Color.init(red: 203/255, green: 45/255, blue: 62/255),
                         Color.init(red: 239/255, green: 71/255, blue: 58/255)
                    ]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                if !settings.settingsDone {
                    SettingsView(settings: $settings)
                } else {
                    VStack {
                        Spacer()
                        GameView(settings: $settings)
                        Spacer()
                    }
                    
                }
            }
            .navigationBarTitle(Text("Vi räknar"), displayMode: .inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ContentView()
        return view
    }
}
