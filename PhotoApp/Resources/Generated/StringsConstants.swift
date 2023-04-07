// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// MARK: - Strings

public enum Str {
  /// Arabic
  public static let ar = LocalizedString(table: "Localizable", lookupKey: "ar")
  /// Pull to Refresh
  public static let commonPullToRefresh = LocalizedString(table: "Localizable", lookupKey: "common_PullToRefresh")
  /// Retry
  public static let commonRetry = LocalizedString(table: "Localizable", lookupKey: "common_Retry")
  /// unImplemented
  public static let commonUnImplemented = LocalizedString(table: "Localizable", lookupKey: "common_UnImplemented")
  /// English
  public static let en = LocalizedString(table: "Localizable", lookupKey: "en")
  /// Please try different keyword
  public static let errorNoDataDescription = LocalizedString(table: "Localizable", lookupKey: "error_No_Data_Description")
  /// No items to display
  public static let errorNoDataFound = LocalizedString(table: "Localizable", lookupKey: "error_No_Data_Found")
  /// Not authorized
  public static let errorNotAuthorized = LocalizedString(table: "Localizable", lookupKey: "error_Not_Authorized")
  /// Please check your internet connection
  public static let errorPleaseCheckYourInternetConnections = LocalizedString(table: "Localizable", lookupKey: "error_Please_Check_Your_Internet_Connections")
  /// Please try again later
  public static let errorPleaseTryAgainLater = LocalizedString(table: "Localizable", lookupKey: "error_Please_Try_Again_Later")
  /// Server error
  public static let errorServerError = LocalizedString(table: "Localizable", lookupKey: "error_Server_Error")
  /// Error occurred
  public static let errorUnexpectedError = LocalizedString(table: "Localizable", lookupKey: "error_Unexpected_Error")
  /// You are not authorized to access this page
  public static let errorYouAreNotAuthorized = LocalizedString(table: "Localizable", lookupKey: "error_You_Are_Not_Authorized")
  /// You are offline
  public static let errorYouAreOffline = LocalizedString(table: "Localizable", lookupKey: "error_You_Are_Offline")
  /// Please choose your desired Language
  public static let lsPleaseChooseLanguage = LocalizedString(table: "Localizable", lookupKey: "ls_Please_Choose_Language")
  /// Explore
  public static let tbExplore = LocalizedString(table: "Localizable", lookupKey: "tb_Explore")
  /// Settings
  public static let tbSettings = LocalizedString(table: "Localizable", lookupKey: "tb_Settings")
}

// MARK: - Implementation Details
fileprivate func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let locale = Preferences.shared.locale
    let path = Bundle.main.path(forResource: locale == .en ? "en" : "ar", ofType: "lproj") ?? ""
    let format: String
    if let bundle = Bundle(path: path) {
      format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
    } else {
      format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    }
    return String(format: format, locale: locale, arguments: args)
}

public struct LocalizedString: Hashable {
  let table: String
  fileprivate let lookupKey: String

  init(table: String, lookupKey: String) {
    self.table = table
    self.lookupKey = lookupKey
  }

  var key: LocalizedStringKey {
    LocalizedStringKey(lookupKey)
  }

  var text: String {
    tr(table, lookupKey)
  }

  var textView : Text {
    return Text(LocalizedStringKey(lookupKey))
  }
}


private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
      return Bundle.module
    #else
      return Bundle(for: BundleToken.self)
    #endif
  }()
}
