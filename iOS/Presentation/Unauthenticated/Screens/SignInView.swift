//
//  SignInView.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import SwiftUI
import GoogleSignInSwift

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var googleSignInButtonViewModel = GoogleSignInButtonViewModel()
    
    init() {
        googleSignInButtonViewModel.state = .normal
        googleSignInButtonViewModel.scheme = .dark
        googleSignInButtonViewModel.style = .standard
    }
    
    var body: some View {
        VStack {
            GoogleSignInButton(viewModel: googleSignInButtonViewModel) {
                authViewModel.signInWithGoogle()
            }
            .padding()
          Spacer()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
