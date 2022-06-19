//
//  ViewController.swift
//  LoginApp
//
//  Created by Алиага С on 19.6.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomVC = segue.destination as! WelcomeViewController
        welcomVC.userName = userName
    }

    @IBAction func logInPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(
                title: "Не верные имя пользователя или пароль!",
                massage: "Пожалуйста введите корректный логин или пароль",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ups", massage: "User is \(userName)")
        : showAlert(title: "Ups", massage: "Password is \(password)")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
}


//MARK:  - Alert Controller Settings
extension MainViewController {
    private func showAlert(title: String, massage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - Keybord settings

extension MainViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldReturned(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}



