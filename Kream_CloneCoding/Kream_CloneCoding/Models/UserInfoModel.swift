import Foundation

//model을 class로 작성하는 이유는 데이터 일관성과 효율적인 메모리 관리를 위해
class UserInfoModel {
    private let userDefaults = UserDefaults.standard
    private let emailKey: String = "userEmail"
    private let passwordKey: String = "userPassword"
        
    /// 유저가 입력한 텍스트 값을 UserDefaults에 저장
    /// - Parameter text: 유저가 입력한 텍스트 값
    public func saveEmail(_ email: String) {
        userDefaults.set(email, forKey: emailKey)
    }
    public func savePassword(_ password: String) {
        userDefaults.set(password, forKey: passwordKey)
    }
        
    /// UserDefaults에 저장된 값을 불러옴
    /// - Returns: 저장된 값 String으로 return
    public func loadEmail() -> String? {
        return userDefaults.string(forKey: emailKey)
    }
    public func loadPassword() -> String? {
        return userDefaults.string(forKey: passwordKey)
    }
}
