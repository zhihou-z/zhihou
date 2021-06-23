//
//  HomeList.swift
//  UI设计
//
//  Created by 之后. on 2021/5/30.
//

import SwiftUI

struct HomeList: View {
    @State var showCourseContent = false
    @State var showModel = false
    
    
    
    var courses = courseData
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                Text("Courses")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .offset(x : -50,y : -40)
                Text("之梦")
                    .accentColor(.gray)
                    .font(.headline)
                    .offset(x:-45 ,y : -41)
            }
            .padding(.bottom,150)
            .padding(.top,60)
            
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack ( spacing: 30){
                    ForEach(courses) { item in
                        Button(action:{
                            self.showModel.toggle()
                                            }){
                            CourseView(title: item.title, image: item.image, color: item.color, shadowcolor: item.shadowColor)
                                
                                            }
                        .sheet(isPresented: self.$showModel)
                                            {
                            ContentView()
                        }
                    }
                }
                .padding( .leading, 30)
            }
            .offset( y:-175)
        }
    }
    































struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}


struct CourseView: View {
    
    var title = "Build an app With Swift UI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowcolor = Color( "backgroundShadow3")
    
    
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .colorInvert()
                .padding(20)
                .lineLimit(4)
                .frame(width: 150)
                .padding(.trailing,50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 120)
                .padding(.bottom,30)
        }
        
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color:shadowcolor, radius: 2, x: 0, y: 0)
    }
}
}

struct Course : Identifiable {
    var id  = UUID()
    var title : String
    var image : String
    var color : Color
    var shadowColor : Color
}
let courseData = [
    Course( title: "Bulid an app With Swift",
            image: "Illustration1",
            color:Color( "background3"),
            shadowColor: Color("backgroundShadow3")),
                
    
    Course( title: "Design Course",
            image: "Illustration2",
            color:Color( "background4"),
            shadowColor: Color("backgroundShadow4")),
]

