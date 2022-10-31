//
//  SignInView.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import SwiftUI
import GoogleSignInSwift
import AuthenticationServices

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            GoogleSignInButton(scheme: .light, style: .wide, state: .normal) {
                authViewModel.signInWithGoogle()
            }
            .padding()
            
            SignInWithAppleButton(.signIn) { aSAuthorizationAppleIdRequest in
               authViewModel.configure(appleSignInAuthorizationRequest: aSAuthorizationAppleIdRequest)
            } onCompletion: { result in
                authViewModel.signInWithApple(requestAuthorizationResult: result)
            }
            .frame(height: 45)
            .padding(.horizontal)

          Spacer()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
