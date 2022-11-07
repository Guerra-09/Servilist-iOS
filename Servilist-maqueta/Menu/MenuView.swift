//
//  MenuView.swift
//  Servilist-maqueta
//
//  Created by José Guerra on 06-11-22.
//

import SwiftUI

struct Category: Hashable {
    
    let id: String = UUID().uuidString
    let title: String
    let photo: String
    let fontSize: CGFloat
}

struct Pyme: Hashable {
    let id: String = UUID().uuidString
    let photo: String
}



struct MenuView: View {
    
    @State var categories: [Category] = [
        Category(title: "Car Wash", photo: "car.fill", fontSize: 30),
        Category(title: "Lavanderia", photo: "washer", fontSize: 27),
        Category(title: "BabySitting", photo: "stroller", fontSize: 27),
        Category(title: "Pick Up", photo: "basket.fill", fontSize: 30),
        Category(title: "Salud", photo: "cross.case", fontSize: 30),
        Category(title: "Personal trainer", photo: "dumbbell", fontSize: 20)
    ]
    
    
    @State var pyme: [Pyme] = [Pyme(photo: "mastermind"), Pyme(photo: "jardineria"), Pyme(photo: "barberia"),Pyme(photo: "lawyerLogo"), Pyme(photo: "cleaning"), Pyme(photo: "taxiDog"),Pyme(photo: "massageLogo")]
    
    

    var body: some View {
        
        ZStack {
            ScrollView {
                VStack(spacing: 40) {
                    
                    VStack(spacing: 10) {
                        HStack {
                            Text("Categorias")
                                .font(.title)
                                .padding(10)
                            Spacer()
                        }
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(categories, id: \.self) { p in
                                    Categories(title: p.title, photo: p.photo, letraSize: p.fontSize)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    
                    
                    
                    
                    VStack(spacing: 5) {
                        HStack {
                            Text("Recomendado")
                                .font(.title)
                                .padding(10)
                            Spacer()
                        }
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(pyme, id: \.self) { pyme in
                                    
                                    Businesses(photo: pyme.photo)
                            
                                }
                            }
                            .frame(height: 170)
                        }
                        .scrollIndicators(.hidden)
                    }

                
                    VStack(spacing: 5) {
                        HStack {
                            Text("Cerca de ti")
                                .font(.title)
                                .padding(10)
                            Spacer()
                        }
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(pyme, id: \.self) { pyme in
                                    
                                    Businesses(photo: pyme.photo)
                            
                                }
                            }
                            .frame(height: 180)
                        }
                        .scrollIndicators(.hidden)
                    }
                    
                   
                    
                    
                    Spacer()
                }
                
                
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.title2)
                                //.foregroundColor(.white)
                                
                                
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .font(.title2)
                               // .foregroundColor(.white)
                                
                        }
                        
                    }
                    
            }
                
            }
            
            VStack {
                Spacer()
                HStack(spacing: 180) {
                    NavigationLink {
                        Text("Map")
                    } label: {
                        Image(systemName: "map")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .background(.gray)
                            .cornerRadius(.infinity)
                    }

                    
                    NavigationLink(destination: Text("Agenda")) {
                        Image(systemName: "calendar")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .background(.gray)
                            .cornerRadius(.infinity)
                    }
                }

            }
            
                        
        }
        
    
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView()
        }
    }
}
