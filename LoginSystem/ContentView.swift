//
//  ContentView.swift
//  LoginSystem
//
//  Created by Ethan Liu on 20/09/21.
//

import SwiftUI

struct ContentView: View {
    @State var account: String = ""
    @State var password: String = ""
    @State var showPwd = false
    var isCanLogin: Bool {
        account.count > 0 &&
        password.count > 0
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 15) {
                    Image(systemName: "person").foregroundColor(.gray).padding()
                    TextField("user name 3-10", text: $account).keyboardType(.emailAddress)
                }
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                .foregroundColor(.gray)
                .padding(.horizontal, 15)
                
                
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray).padding()
                    SecureField("password 6-12", text: $password).keyboardType(.namePhonePad)
                }.overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal,15)
                    .foregroundColor(.gray)
                    .padding(.top, 25)
                
                Spacer()
                
                NavigationLink(destination: LoginView(), label: {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                })
                    .background(
                        Color.blue
                    )
                    .cornerRadius(8)
                    .offset(y: -40)
                    .padding(.bottom, -40)
                    .shadow(radius: 15)
                
                Spacer()
                
            }
            .padding(.top, 100)
            .padding(.leading)
            .padding(.trailing)
            .navigationBarTitle("loginDemo")
            
            Spacer()
        }
    }
    
    func validateUserName(name: String) -> Bool {
        let userNameRegex = "^[A-Za-z0-9]{6,20}+$"
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegex)
        let peopleName = userNamePredicate.evaluate(with: name)
        return peopleName
    }
    
    func validatePassword(passWord: String) -> Bool {
        let passWordRegex = "^[a-zA-Z0-9]{6,20}+$"
        let passWordPredicate = NSPredicate(format: "SELF MATCHES%@", passWordRegex)
        return passWordPredicate.evaluate(with: passWord)
        
    }
    
    
    func loginAction() {
        if validateUserName(name: self.account) && validatePassword(passWord: self.password) {
            UserDefaults.standard.set(self.account, forKey: "Auth")
            UserDefaults.standard.set(self.password, forKey: "TOKEN")
            
            print("login action")
        }
    }
}

struct LoginAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct XXX {
    var x = 0
    
    mutating func update() {
        x=1
    }
}
