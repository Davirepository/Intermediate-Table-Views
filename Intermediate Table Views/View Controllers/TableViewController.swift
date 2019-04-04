//
//  TableViewController.swift
//  Intermediate Table Views
//
//  Created by Давид on 04/04/2019.
//  Copyright © 2019 Давид. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var emojis = [Emoji]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojis = Emoji.load()
        
        // создает кнопку Edit слева и когда мы ее нажимаем то переходим в режим правки
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiList", for: indexPath) as! TableViewCell
        
        let row = indexPath.row
        let emoji = emojis[row]
        
        cell.emojiLabel.text = emoji.emoji
        cell.nameLabel.text = emoji.name
        cell.descLabel.text = emoji.desc
        
        return cell
    }
    
    //override var isEditing: Bool // показывает находится ли таблица в режиме редактирования или нет
    
    
    // MARK: - UITableViewDelegate
    
    // добавляет возможность выбрать стил правки для таблицы (удалять и тд)
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    // Override to support editing the table view.
    // этот метод вызывается когда мы нажимаем кнопко править и delete или что-то в зависимости от того что мы выбрали в методе editingStyleForRowAt
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        guard segue.identifier == "EmojiDetailSegue" else { return }
        guard let controller = segue.destination as? DetailTableViewController else { return }
        guard let path = tableView.indexPathForSelectedRow else { return }
        
        let row = path.row
        let emoji = emojis[row]
        
        controller.emoji = emoji
        controller.navigationItem.title = "Edit"
        
    }
    
    @IBAction func reset(seg: UIStoryboardSegue) {
        // при возвращении с сохранением данных мы попадаем в этот метод и получаем ресурсы/данные из предыдущего контроллера (то, что мы изменили и хотим сохранить). Поэтому контролерру присваиваем не destination а source(возвращаемы ресурсы)
        guard seg.identifier == "saveSegue" else { return }
        guard let controller = seg.source as? DetailTableViewController else { return }
        
        let emoji = controller.emoji
        
        if let path = tableView.indexPathForSelectedRow {
            // replace row
            emojis[path.row] = emoji
            tableView.deselectRow(at: path, animated: false)
        } else {
            // add row
            emojis.append(emoji)
        }

        tableView.reloadData()
    }

}
