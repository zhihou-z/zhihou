//
//  Home.swift
//  UI设计
//
//  Created by 之后. on 2021/5/30.
//

import SwiftUI

struct Home: View {
    
    @State var show = false
    @State var showProfile = false
    
    
    
    
    
    var body: some View {
        ZStack {
            
           
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.75 : 1)
                .animation(.spring())
                
            
            ContentView()
            .cornerRadius(30)
            .shadow(radius: 20)
            .animation(.spring(response: 0.7, dampingFraction: 1, blendDuration:1))
            .offset(y:showProfile ? 0 : UIScreen.main.bounds.height)
            .offset(y:50)
            
            
            MenuButton(show : $show)
                .offset(x: -30, y:showProfile ? 0 :  80)
                .animation(.spring(response: 0.75, dampingFraction: 1, blendDuration:1))
                
            
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 80)
                .animation(.spring(response: 1, dampingFraction: 0.95, blendDuration: 0.5))
                .offset(y:10)
            
            
            MenuView(show: $show)
        }
}
}
















struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "MY Account"
    
    
    var body: some View {
        return   HStack {
            
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
                
        }
    }
}


struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icons  : String
}
let menuData = [
   Menu( title: "My Account", icons: "person.fill.checkmark"),
   Menu(title: "Billing", icons: "creditcard"),
   Menu(title: "Team", icons: "rectangle.stack.person.crop"),
   Menu(title: "Sign Out", icons: "arrowshape.turn.up.backward")
]


struct MenuView: View {
    var menuItems = ["My Accoount","Billing","Team","Sign Out"]
    var menu = menuData
    @Binding var show :Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            ForEach(menu){  item in
                MenuRow(image: item.icons, text: item.title)
            }
            Spacer()
        }
        .padding(.top,20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing,60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees:show ? 0:60), axis: (x: 0, y: 10.0, z :0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width )
        .onTapGesture {
            self.show.toggle()
        }
        Spacer()
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show  : Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {self.show.toggle()}) {
                HStack {
                    Spacer()
                    Image(systemName: "list.bullet.below.rectangle")
                        .foregroundColor(.black)
                }
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
                .padding(.all,190)
        }
    }
}

struct MenuRight: View {
    @Binding var show : Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: {self.show.toggle()}) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: {self.show.toggle()}) {
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
                .padding(.all,190)

        }
    }
}
