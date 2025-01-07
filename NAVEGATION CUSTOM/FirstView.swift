//
//  FirstView.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import SwiftUI

struct FirstView: View {
    
    @State private var isPresented = false

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
               Text("Vista 1")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .background(RoundedRectangle(cornerRadius: 24).frame(width: 200))
                    .foregroundStyle(.black)
                
                Spacer()
                Button {
                    withAnimation {
                        isPresented = true
                    }
                } label: {
                    Text("ShowModal")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .background(RoundedRectangle(cornerRadius: 24).frame(width: 300))
                        .foregroundStyle(.black)
                    
                }

            }
           
            if isPresented {
                ModalView()
                    .modifier(SlideInEffect(offset: isPresented ? 0 : UIScreen.main.bounds.width))
                    .onTapGesture {
                        withAnimation {
                            isPresented.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    FirstView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}



