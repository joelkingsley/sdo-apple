//
//  GoogleSignInAuthenticator.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import SwiftUI
import GoogleSignIn

/// An observable class for authenticating via Google.
final class GoogleSignInAuthenticator: ObservableObject {
  #if os(iOS)
  private let clientID = "339443240109-d0v5vs4eqg7s9okddajsh6qbkfh9h6u8.apps.googleusercontent.com"
  #elseif os(macOS)
  private let clientID = "339443240109-d0v5vs4eqg7s9okddajsh6qbkfh9h6u8.apps.googleusercontent.com"
  #endif

  private lazy var configuration: GIDConfiguration = {
    return GIDConfiguration(clientID: clientID)
  }()

  private var authViewModel: AuthenticationViewModel

  /// Creates an instance of this authenticator.
  /// - parameter authViewModel: The view model this authenticator will set logged in status on.
  init(authViewModel: AuthenticationViewModel) {
    self.authViewModel = authViewModel
  }

  /// Signs in the user based upon the selected account.'
  /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
  func signIn() {
#if os(iOS)
      guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
      print("There is no root view controller!")
      return
    }

    GIDSignIn.sharedInstance.signIn(with: configuration,
                                    presenting: rootViewController) { user, error in
      guard let user = user else {
        print("Error! \(String(describing: error))")
        return
      }
      self.authViewModel.state = .signedIn(user)
    }

#elseif os(macOS)
    guard let presentingWindow = NSApplication.shared.windows.first else {
      print("There is no presenting window!")
      return
    }

    GIDSignIn.sharedInstance.signIn(with: configuration,
                                    presenting: presentingWindow) { user, error in
      guard let user = user else {
        print("Error! \(String(describing: error))")
        return
      }
      self.authViewModel.state = .signedIn(user)
    }
#endif
  }

  /// Signs out the current user.
  func signOut() {
    GIDSignIn.sharedInstance.signOut()
    authViewModel.state = .signedOut
  }

  /// Disconnects the previously granted scope and signs the user out.
  func disconnect() {
    GIDSignIn.sharedInstance.disconnect { error in
      if let error = error {
        print("Encountered error disconnecting scope: \(error).")
      }
      self.signOut()
    }
  }

}
