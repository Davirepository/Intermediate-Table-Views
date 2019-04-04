//
//  DetailTableViewController.swift
//  Intermediate Table Views
//
//  Created by Давид on 04/04/2019.
//  Copyright © 2019 Давид. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var button: UIBarButtonItem!
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    var emoji = Emoji(emoji: "", name: "", desc: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiTextField.delegate = self
        
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descTextField.text = emoji.desc
        
        textFieldChanged()

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    // после тыка по кнопке сейв выплняется этот метод и мы переходим в тейблвью в метод резет
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveSegue" else { return }
        
        // записываем данные с текстфилдов в похожий массив эмоджи этого класса
        emoji = Emoji(
            emoji: emojiTextField.text ?? "",
            name: nameTextField.text ?? "",
            desc: descTextField.text ?? ""
        )
        
    }
    
    @IBAction func textFieldChanged() {
        button.isEnabled = !(emojiTextField.text ?? "").isEmpty
    }

}

extension DetailTableViewController: UITextFieldDelegate {
    
}
