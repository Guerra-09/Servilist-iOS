//
//  PymeComponents.swift
//  Servilist-maqueta
//
//  Created by José Guerra on 08-11-22.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        
        Image(systemName: "chevron.backward")
            .resizable()
            .frame(width: 10, height: 16)
            .foregroundColor(.white)
            .bold()
            .frame(width: 40, height: 40)
            .background(.black)
            .cornerRadius(.infinity)
            .padding(.vertical)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
