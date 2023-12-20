//
//  ContentView.swift
//  Designcode
//
//  Created by Pedro Oliveira on 2023/12/16.
//

import SwiftUI

struct ContentView: View {
    
@State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, 
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CurrentWeatherView(location: "Fukuoka, JP",
                                   weatherSymbolName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temperature: 3,
                                    isNight: $isNight)

                HStack(spacing: 32){
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   weatherSymbolName: "sun.max.fill",
                                   temperature: 3)
                    WeatherDayView(dayOfWeek: "WED",
                                   weatherSymbolName: "smoke.fill",
                                   temperature: 5)
                    WeatherDayView(dayOfWeek: "THU",
                                   weatherSymbolName: "wind",
                                   temperature: 1)
                    WeatherDayView(dayOfWeek: "FRI",
                                   weatherSymbolName: "snowflake",
                                   temperature: -1)
                    WeatherDayView(dayOfWeek: "SAT",
                                   weatherSymbolName: "sun.max.fill",
                                   temperature: 2)
                } // HSTACK
                Spacer()
                ButtonMidSizeView(callToAction: "Change Time Of Day",
                                  textColor: .blue,
                                  bgColor:.white,
                                  isNight: $isNight
                )
                Spacer()
            } // VSTACK
        } //ZSTACK
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var weatherSymbolName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 16) {
            Text(dayOfWeek)
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: weatherSymbolName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature) °")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CurrentWeatherView: View {
    
    var location: String
    var weatherSymbolName: String
    var temperature: Int
    @Binding var isNight: Bool
    
    var body: some View {
        VStack (spacing:8) {
            Text("Fukuoka, JP")
                .font(.system(size: 32, weight:.medium, design: .default))
                .foregroundStyle(.white)
                .padding()
            Image(systemName: weatherSymbolName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("3°")
                .font(.system(size: 92, weight: .medium))
                .foregroundColor(.white)
            
        } // VSTACK
        .padding(.bottom, 80)
    }
}

struct ButtonMidSizeView: View {
    
    var callToAction: String
    var textColor: Color
    var bgColor: Color
    @Binding var isNight: Bool
 
    var body: some View {
        Button {
            isNight.toggle()
        } label: {
            Text(callToAction)
                .frame(width: 280, height: 52)
                .background(bgColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .cornerRadius(12)
        }
    }
}
