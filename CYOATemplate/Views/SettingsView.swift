//
//  SettingsView.swift
//  CYOATemplate
//
//  Created by Judy YU on 2023-06-03.
//

import SwiftUI

// Adapted from: https://johncodeos.com/how-to-create-a-popup-window-with-swiftui/
struct SettingsView: View {
    
    // MARK: Stored Properties
    
    @Binding var show: Bool
    
    @Binding var currentNodeId: Int
    
    // Values
    @Binding var energy: Int
    
    @Binding var mentality: Int
    
    @Binding var food: Int
    
    var body: some View {
        
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.4 : 0)
                    .edgesIgnoringSafeArea(.all)
                
                // PopUp Window
                VStack(alignment: .center, spacing: 15) {
                    
                    VStack {
                        
                        ZStack {
                            
                            Text("- SETTINGS -")
                                .padding(.top)
                            
                            HStack {
                                
                                Spacer()
                                
                                // Close button
                                Button(action: {
                                    
                                    // Dismiss the pop up
                                    withAnimation(.linear(duration: 0.2)) {
                                        show = false
                                    }
                                    
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(Color.white)
                                        .font(.title)
                                        .frame(width: 30, height: 30)
                                        .padding(5)
                                        .border(.white)
                                        .cornerRadius(6)
                                    
                                })
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        
                        // Map
                        Image("Coast")
                            .resizable()
                            .frame(maxHeight: 300)
                            .padding(.horizontal)
                        
                        // Divider
                        Divider()
                            .frame(width: 200, height: 1.5)
                            .overlay(.gray)
                        
                        HStack(spacing: 20) {
                            
                            // Restart button
                            Button(action: {
                                
                                // Go back to node 1
                                currentNodeId = 1
                                // Dismiss the pop up
                                withAnimation(.linear(duration: 0.2)) {
                                    show = false
                                }
                                // Reset values
                                energy = 8
                                mentality = 8
                                food = 4
                                
                            }, label: {
                                HStack {
                                    Image(systemName: "arrow.counterclockwise")
                                    Text("Restart")
                                }
                            })
                            .buttonStyle(CustomButton())
                            
                            // Home button
                            Button(action: {
                                // Reset values
                                energy = 8
                                mentality = 8
                                food = 4
                            }, label: {
                                HStack {
                                    Image(systemName: "house")
                                    Text("Home")
                                }
                            })
                            .buttonStyle(CustomButton())
                        }
                        .padding(.bottom, 20)
                    }
                    
                }
                .frame(maxWidth: 320)
                .border(Color.white, width: 1)
                .background(Color.black)
            }
        }
        .foregroundColor(.white)
    }
    
    // MARK: Initializer
//    init(energy: Binding<Int>, mentality: Binding<Int>, food: Binding<Int>) {
//
//        // Set the initial values
//        _energy = energy
//        _mentality = mentality
//        _food = food
//
//    }
}

// Preview provider
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(show: .constant(true), currentNodeId: .constant(1), energy: .constant(8), mentality: .constant(6), food: .constant(6))
    }
}
