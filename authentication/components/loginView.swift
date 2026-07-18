//
//  loginView.swift
//  authentication
//
//  Created by sovanara  on 18/7/26.
//
import SwiftUI

struct loginView : View {
    @State private var isCheck = false
    @State private var isEyeOpen = false
    @State private var isNavigateToHome = false
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("loginBackground 1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.8)
                
                VStack {
                    Text("Welcom Back !")
                        .padding()
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        ZStack(alignment: .leading) {
                            if email.isEmpty {
                                Text("Enter email")
                                    .padding(.horizontal)
                                    .foregroundStyle(.cyan)
                            }
                            TextField("", text: $email)
                                .customInputField()
                        }
                        Text("\(errorMessage)")
                            .font(.footnote)
                            .foregroundStyle(.red)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        ZStack(alignment: .leading) {
                            HStack {
                                if password.isEmpty {
                                    Text("Enter password")
                                        .padding(.horizontal)
                                        .foregroundStyle(.cyan)
                                }
                                Spacer()
                                
                                Button{
                                    isEyeOpen.toggle()
                                } label: {
                                    Image(systemName: isEyeOpen ? "eye" : "eye.slash")
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 8)
                                }
                            }
                            if (isEyeOpen) {
                                TextField("", text: $password)
                                    .padding(.trailing, 24)
                                    .customInputField()
                            } else {
                                SecureField("", text: $password)
                                    .padding(.trailing, 24)
                                    .customInputField()
                            }
                        }
                        Text("\(errorMessage)")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Button {
                            isCheck.toggle()
                        } label: {
                            Image(systemName : isCheck ? "checkmark.square" : "square")
                        }
                        .foregroundStyle(.white)
                        Text("Remember me !")
                            .foregroundStyle(.white)
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: -12) {
                        Button("Login") {
                            login()
                            
                            print("this is \(isNavigateToHome)")
                        }
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .cornerRadius(12)
                        .padding()
                        
                        Text("Or")
                            .foregroundStyle(.white)
                        
                        Button {
                            
                        } label: {
                            Spacer()
                            Image("googleIcon")
                                .padding(2)
                                .background(.white)
                                .cornerRadius(16)
                            Text("Login with google")
                                .padding(.vertical, 8)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white)
                        )
                        .padding()
                        
                    }
                }
                .padding()
            }.navigationDestination(isPresented: $isNavigateToHome) {
                tabView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func login() {
        errorMessage = ""
        
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Fill in Fields"
            return
        }
        guard email.contains("@") else {
            errorMessage = "invalid email format"
            return
        }
        
        isNavigateToHome = true
    }
}
