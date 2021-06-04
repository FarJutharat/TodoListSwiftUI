import Combine
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewmodel : viewModel
    @State var isCreateSheet = false
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(0 ..< viewmodel.data.count ,id: \.self){ index in
                        NavigationLink(destination: DetailView(data:  viewmodel.data[index] , index: index)){
                            Text(viewmodel.data[index].title)
                        }
                    }
                }
            }.navigationTitle("TodoList101")
            .navigationBarItems(trailing: Button(action: {isCreateSheet = true}, label: {
                Image(systemName: "plus")
            }))
            .fullScreenCover(isPresented: $isCreateSheet){
                Sheet()
            }
        }
    }
}
struct Sheet : View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewmodel : viewModel
    @State var title : String = ""
    @State var create_by : String = ""
    @State var detail : String = ""
    var body: some View {
        NavigationView{
        VStack {
            List{
                TextField("Title", text: $title)
                TextField("create by", text: $create_by)
                TextField("detail", text: $detail)
            }.listStyle(InsetGroupedListStyle())
            Button(action: {
                viewmodel.addData(todo: TodoData(title: title, create_by: create_by, detail: detail))
                presentationMode.wrappedValue.dismiss()
            }, label: {
                    Text("Add")
                .foregroundColor(.white)
                .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.green)
                .cornerRadius(10)
            })
        }
        .navigationBarTitle(Text("Fill information"))
        .navigationBarItems(trailing: Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
            Text("back")
        }))
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Sheet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
