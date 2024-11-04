//
//  UserDefaultsManager.swift
//  CardiacticApp
//
//  Created by SAIL on 04/11/24.
//


import Foundation

class UserDefaultsManager {
    
    // MARK: - Keys
    private enum Keys {
        static let isLoggedIn = "isLoggedIn"
        static let username = "username"
        static let loginType = "loginType"
        static let userId = "userId"
    }
    
    // MARK: - Singleton
    static let shared = UserDefaultsManager()
    private init() {}
    
    // MARK: - Save Methods
    func setIsLoggedIn(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: Keys.isLoggedIn)
    }
    
    func setUsername(_ username: String) {
        UserDefaults.standard.set(username, forKey: Keys.username)
    }
    
    func setLoginType(_ type: String) {
        UserDefaults.standard.set(type, forKey: Keys.loginType)
    }
    
    func setUserId(_ id: String) {
        UserDefaults.standard.set(id, forKey: Keys.userId)
    }
    
    // MARK: - Retrieve Methods
    func getIsLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.isLoggedIn)
    }
    
    func getUsername() -> String? {
        return UserDefaults.standard.string(forKey: Keys.username)
    }
    
    func getLoginType() -> String? {
        return UserDefaults.standard.string(forKey: Keys.loginType)
    }
    
    func getUserId() -> String? {
        return UserDefaults.standard.string(forKey: Keys.userId)
    }
    
    // MARK: - Delete Methods
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: Keys.isLoggedIn)
        UserDefaults.standard.removeObject(forKey: Keys.username)
        UserDefaults.standard.removeObject(forKey: Keys.loginType)
        UserDefaults.standard.removeObject(forKey: Keys.userId)
    }
}
