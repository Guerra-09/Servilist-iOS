//
//  PymeView.swift
//  Servilist-maqueta
//
//  Created by José Guerra on 07-11-22.
//
//abrir fácilmente conversación con su público, agendar horas de atención y recibir feedback mediante reviews por parte de los usuarios.

import SwiftUI
import Fakery

struct BarberShop: Hashable {
    let id: String = UUID().uuidString
    let name: String
    let photoName: String
}

struct Empleados: Hashable {
    
    let id: String = UUID().uuidString
    let name: String
    let photoName: String
    let profesion: String
}

struct Review: Hashable {
    let id: String = UUID().uuidString
    let name: String
    let rating: Int
    let description: String
}

struct PymeView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var description: String = "Desde el 2012, Nuestra barberia es una de las más antiguas de la nueva generación de barberías, entregando la mejor asesoría, servicio y calidad. Ven a visitarnos en Santiago-Centro, con nuestra experiencia, lograrás la imagen que estás buscando."
    
    
    @State var services: [BarberShop] = [
        BarberShop(name: "Corte de pelo", photoName: "cortePelo"),
        BarberShop(name: "Barba", photoName: "corteBarba"),
        BarberShop(name: "Pelo y barba", photoName: "cortePeloBarba"),
        BarberShop(name: "Tinte", photoName: "tintePelo"),
        BarberShop(name: "Depilacion", photoName: "depilacion2"),
        BarberShop(name: "Mascarilla", photoName: "mascarillaFacial2"),
        BarberShop(name: "Ceja", photoName: "corteCeja")
    ]
    
    @State var employees: [Empleados] = [
        
        Empleados(name: "Francisco", photoName: "barber3", profesion: "Barbero"),
        Empleados(name: "Mauricio", photoName: "barbero4", profesion: "Barbero"),
        Empleados(name: "Patricio", photoName: "barbero5", profesion: "Barbero"),
        Empleados(name: "José", photoName: "barbero1", profesion: "CTO"),
        Empleados(name: "Joaquin", photoName: "barbero2", profesion: "CEO"),
    ]
    
    @State var review: [Review] = []
    
    var body: some View {
        
        VStack {
            
            ZStack {
                Image("barberiaFondo")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: .infinity, height: 180)
                    .opacity(0.5)
                
                Image("barberia")
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(.infinity)
                    .padding(.bottom, 25)
                
            }
            
            
            ScrollView {
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Description")
                            .font(.title)
                            
                        Spacer()
                    }
                    
                    HStack {
                        Text(description)
                            .font(.caption)
                            .foregroundColor(Color("grayBackground"))
                        Spacer()
                    }
                }
                .padding(.leading, 15)
                
                
                
                
                HStack {
                    Text("Servicios")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    
                    HStack {
                        ForEach(services, id: \.self) { serv in
                            
                            VStack {
                                Image(serv.photoName)
                                    .resizable()
                                    .frame(width: 150, height: 120)
                                    .cornerRadius(10)
                                    .padding(10)
                                
                                Text(serv.name)
                                    .font(.callout)
                            }
                           
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Resenas")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(review, id: \.self) { rev in
                            VStack {
                                Text(rev.name)
                                
                                Text(rev.description)
                                    .font(.body)
                                    .frame(width: 200, height: 100)
                                
                                // Estrellas
                            }
                            
                        }
                    }
                }
                .onAppear {
                    review.append(contentsOf: [Review(name: "Muy buena atencion", rating: 4, description: getReview()), Review(name: "Buena eleccion", rating: 5, description: getReview()), Review(name: "Solo un detalle", rating: 2, description: getReview())])
                }
                
                
                
                
                
                
                
                HStack {
                    Text("Conoce al equipo")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(employees, id: \.self) { employee in
                            
                            VStack {
                                Image(employee.photoName)
                                    .resizable()
                                    .clipped()
                                    .frame(width: 110, height: 110)
                                    .cornerRadius(.infinity)
                                    .padding(10)
                                
                                Text(employee.name)
                                    .font(.title3)
                                Text(employee.profesion)
                                    .font(.caption)
                            }
                                
                                
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                
                
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            
            
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    /// Fix: Make button bigger and don't cut top and bottom shape
                    BackButton()
                        
                }

                    
            }
        }
        
    }
    
    func getReview() -> String {
        let faker = Faker(locale: "nb-NO")
        
        let description = faker.lorem.paragraphs(amount: 1)
     
        return description
    }
}

struct PymeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content:  {
            PymeView()
        })
        
    }
}
