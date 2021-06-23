//
//  UpdateList.swift
//  UI设计
//
//  Created by 之后. on 2021/6/2.
//


import SwiftUI

struct UpdateList: View {
   
    var  updates = updateData
    @ObservedObject var store = Updatestore(updates: updateData)
    
    
    
    func addItem() {
        store.updates.append(Update(image : "Illustration1",title : "newTitle",text:"newText",date : "JUL 1"))
    }
    
    func move(from source : IndexSet, to destination : Int) {
        store.updates.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
    
        NavigationView{
            VStack{
                
        
                    Button(action: addItem) {
                        Text("Add Item")
                    }
                    .padding(8)
                    .background(Color("background3"))
                    .cornerRadius(8)
                    List  {
                        ForEach(store.updates) { item in
                            NavigationLink(
                                                destination: Update_Detatil(title : item.title, text: item.text, image:item.image))
                                            {
                                                    HStack(spacing: 20) {
                                                        Image(item.image)
                                                            .resizable()
                                                            .aspectRatio(contentMode : .fit)
                                                            .frame(width : 80 , height : 80 )
                                                            .background(Color("background"))
                                                            .cornerRadius(20)
                                                        
                                                        VStack(alignment: .leading) {
                                                                Text(item.title)
                                                                    .font(.headline)
                                                                Text(item.text)
                                                                    
                                                                    .lineLimit(2)
                                                                    .lineSpacing(4)
                                                                    .font(.subheadline)
                                                                Text(item.date)
                                                                    .font(.caption)
                                                                    .fontWeight(.bold)
                                                                    .foregroundColor(Color.gray)
                                                        }
                                                    }
                               
                                            }
                            .padding(.vertical,8)
                        }
                        
                        .onDelete { index  in
                            self.store.updates.remove(at: index.first!)
                        }
                        .onMove(perform:  move)
                        
                    }
                        .navigationBarTitle(Text("Updates"))
                         .navigationBarItems(trailing:
                      EditButton())
                    
                }
            }
        }
              
}
    
        



            
        
    


struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}





struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "1 ", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "2", date: "JUN 26"),
    Update(image: "Illustration3", title: "CSS Layout", text: "3", date: "JUN 26"),
    Update(image: "Illustration4", title: "React Native Part 2", text: "4", date: "JUN 26"),
    Update(image: "Certificate1", title: "Unity", text: "5", date: "JUN 26"),
    Update(image: "Certificate2", title: "React Native for Designer ", text: "6", date: "JUN 26"),
    Update(image: "Certificate3", title: "Vue.js", text: "7", date: "JUN 26"),
]
