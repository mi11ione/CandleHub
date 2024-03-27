import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("About")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])
                    Spacer()
                }
            }
            List {
                Section("Version") {
                    HStack {
                        Image("Icon")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)

                        VStack(alignment: .leading) {
                            Text("CandleHub")
                                .bold()
                                .font(.title2)

                            Text("1.0 release 1")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                }

                Section("Mentor") {
                    Link("Ilya Solovyev", destination: URL(string: "https://t.me/ilyasNN")!)
                }

                Section("Y&&Y") {
                    Link("Roman Zhuzhgov", destination: URL(string: "https://t.me/mi11ione")!)
                    Link("Ilya Matveev", destination: URL(string: "https://t.me/uundercat")!)
                    Link("Kirill Koshkarev", destination: URL(string: "https://t.me/KirillBeluy")!)
                    Link("Roman Tverdokhleb", destination: URL(string: "https://t.me/voity_vit")!)
                }

                Section("Sirius") {
                    Link("Sergey Yakunin", destination: URL(string: "https://t.me/Sergey_Yakuninn")!)
                    Link("Kasymkhan Khubiyev", destination: URL(string: "https://t.me/theGorgeousKing")!)
                    Link("Jacob Trofimov", destination: URL(string: "https://t.me/lessillness")!)
                }
            }
        }
    }
}
