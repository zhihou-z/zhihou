//
//  ContentView.swift
//  UI设计
//
//  Created by 之后. on 2021/5/29.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            BlurView(style: .light)
            
            TitleView()
                .blur(radius: show ? 30 : 0)
            
            CardBottomView()
                .blur(radius: show ? 25 : 0)
                .animation(.default)
            
            
            
            
            
            CardView2()
            
            .background(show ? Color.red : Color("background9"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: show ? -300 : -15)
            .scaleEffect(0.85)
            .rotationEffect(Angle(degrees: show ? 15 : 0))
            .rotation3DEffect(Angle(degrees: show ? 4: 0),axis: (x: 10.0, y: 10.0, z: 10.0))
            .blendMode(.hardLight)
            .animation(.interpolatingSpring(mass: 1.1, stiffness: 30, damping: 60, initialVelocity: 5.75))
            .offset(x: viewState.width, y: viewState.height)
                .offset( y: 30)
              
            
                
            
            
            
            
            CardView()
            
            .background(show ? Color("background5") : Color("background8") )
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y:show ? -150 :  15)
            .scaleEffect(0.9)
            .rotationEffect(Angle(degrees: show ? 10: 0))
            .rotation3DEffect(Angle(degrees: show ? 10 : 0),axis: (x: 10.0, y: 10.0, z: 10.0))
            .blendMode(.multiply)
                .animation(.interpolatingSpring(mass: 1, stiffness: 30, damping: 50, initialVelocity: 6.45))
            .offset(x: viewState.width, y: viewState.height)
                .offset( y: 30)
            
            
            
            
            
            
            
            
            
            Ceritificate()
            .offset(x: viewState.width, y: viewState.height)
            .offset( y: 30)
            .scaleEffect(0.95)
            .rotationEffect(Angle(degrees: show ? 5 : 0))
            .rotation3DEffect(Angle(degrees: show ? 20 : 0),axis: (x: 10, y: 10, z: 10))
                .animation(.interpolatingSpring(mass: 0.8, stiffness: 50, damping: 40, initialVelocity: 8))
               
            .onTapGesture {self.show.toggle()}
        }
            .gesture(
              DragGesture()
                .onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }
                .onEnded{ value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
        )
       
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView2: View {
    var body: some View {
        VStack {
            Text("Third")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color("accent"))
        }
        .frame(width: 340, height: 220)
        
        .offset(x: 0, y: -20)
        
        .offset(x: -0, y: -50)
    }
}




struct CardView: View {
    var body: some View {
        VStack {
            Text("Secend")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
        }
        .frame(width: 340, height: 220)
        
        .offset(x: 0, y: -20)
        
        .offset(x: -0, y: -50)
    }
}

struct Ceritificate: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    VStack(alignment: .leading){
                        Text("UI设计APP初次")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0,height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image("Background")
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
        .offset(x: 0, y: 40)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Certificate")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                }
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding(.all, 50)
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 100, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 580)
    }
}
