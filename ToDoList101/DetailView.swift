//
//  DetailView.swift
//  ToDoList101
//
//  Created by Macintosh on 6/3/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewmodel : viewModel
    var data : TodoData
    var index : Int
    var body: some View {
            VStack{
                Text(data.title)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                Divider()
                    .foregroundColor(.green)
                VStack(spacing: 30){
                    Text(data.create_by)
                        .foregroundColor(.gray)
                    Text(data.detail)
                }
                
                Spacer()
                
                Button(action: {
                    viewmodel.deleteData(at: IndexSet(integer: index))
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "xmark.bin.fill")
                        Text("Delete")
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.red)
                    .cornerRadius(10)
                })
 
            }
        .padding(50)
        .navigationBarTitle("Detail")
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(data: TodoData(title: "test", create_by: "test", detail: "test"), index: 0)
        }
    }
}
