import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DATA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.cellImage.image = UIImage(named: String(indexPath.row))
        cell.cellText.text = DATA[indexPath.row].quote
        cell.cellLabel.text = DATA[indexPath.row].author
        
        return cell
    }
    
    /*  FIRST EXAMPLE
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in
            print("more button tapped")
        }

        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            print("favorite button tapped")
        }
        favorite.backgroundColor = .orange

        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            print("share button tapped")
        }
        share.backgroundColor = .blue

        return [share, favorite, delete]
    }
    */
    
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let share = UIContextualAction(style: .normal, title:  "Share", handler: { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            success(true)
        })
        share.backgroundColor = .blue
        
        let favorite = UIContextualAction(style: .normal, title:  "Favorite", handler: { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            success(true)
        })
        favorite.backgroundColor = .orange
        
        return UISwipeActionsConfiguration(actions: [share, favorite])
        
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let delete = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            success(true)  
        })  
        delete.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
