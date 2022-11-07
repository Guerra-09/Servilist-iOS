//
//  MenuComponents.swift
//  Servilist-maqueta
//
//  Created by José Guerra on 06-11-22.
//

import SwiftUI


struct Categories: View {
    
    @State var title: String
    @State var photo: String
    @State var letraSize: CGFloat
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("backgroundCategory"))
                .frame(width: 150, height: 150)
                .padding(.horizontal, 10)
                
            VStack {
                
                Image(systemName: photo)
                    .font(.system(size: 60))
                    .padding(.bottom, 5)
                
                Text(title)
                    .font(.system(size: letraSize))
            }
            
        }
        
        
    }
}

struct Businesses: View {
    
    @State var photo: String 
    
    var body: some View {
        
        ZStack {
            
            Image(photo)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                
            
        }
        
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Businesses(photo: "taxiDog")
            
            Categories(title: "Car wash", photo: "car.fill", letraSize: 30)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
