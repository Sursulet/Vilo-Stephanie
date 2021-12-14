//
//  ContentView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 07/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MainViewModel()
    @GestureState var gestureOffset:CGFloat = 0
    
    var body: some View {
        
        ZStack {
            MapView()
            
            VStack(alignment: .leading) {
                HStack {
                    Button(
                        action: { viewModel.onEvent(.profile)},
                        label: { IconCircle(symbol: "person.fill") })
                    
                    Spacer()
                    
                    Button(
                        action: { viewModel.onEvent(.weather) },
                        label: { IconCircle(symbol: "cloud.sun.rain") })
                }
                
                Spacer()
                
                Button(
                    action: { viewModel.onEvent(.report) },
                    label: { IconSquare(symbol: "eye.trianglebadge.exclamationmark.fill") })
            }
            .padding(.bottom, 80)
            .padding(.horizontal)
            
            GeometryReader { proxy -> AnyView in
                viewModel.height = proxy.frame(in: .global).height
                
                return AnyView(
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                        
                        VStack {
                            Capsule()
                                .fill(Color(.systemGray3))
                                .frame(width: 60, height: 4)
                                .padding(.top)
                            
                            ZStack(alignment: .leading) {
                                Rectangle().foregroundColor(Color(.systemGray6))
                                HStack {
                                    Image(systemName: "magnifyingglass.circle.fill")
                                        .foregroundColor(Color("vilo"))
                                        .font(.system(size: 30))
                                    Text("Search ...")
                                }
                                .foregroundColor(.gray)
                                .padding()
                            }
                            .frame(height:44)
                            .cornerRadius(15)
                            .padding()
                            .onTapGesture { viewModel.onEvent(.search) }
                            
                            //Content
                            //ScrollView(.vertical, showsIndicators: false, content: {
                            BottomContent(active: viewModel.activeContent)
                            //})
                        }
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                    .offset(y: viewModel.height - 100)
                    .offset(y: viewModel.getOffset())
                    .gesture(DragGesture()
                        .updating($gestureOffset, body: { value, out, _ in
                            out = value.translation.height
                            viewModel.onChange(gestureOffset)
                        })
                        .onEnded({ value in
                            viewModel.onEnd()
                        }))
//                        .overlay(
//                            Text("essai")
//                                .padding()
//                                .background(Color.black)
//                                .padding(.vertical, 130)
//                                .offset(y: viewModel.test())
//                            , alignment: .bottom
//                        )
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomContent: View {
    
    var active: ActiveContent
    
    var body: some View {
        Text("HUI")
        
        switch active {
            case .profile:
                ProfileView()
            case .weather:
                WeatherView()
            case .report:
                ReportView()
            case .search:
                SearchView()
            case .favorites:
                RideDetailView()
            case .filter:
                FilterView()
        }
    }
}
