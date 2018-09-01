//
//  ViewController.swift
//  AutoResizeingTableViewCells
//
//  Created by Антон Макаренков on 23.08.2018.
//  Copyright © 2018 Tony Macaren. All rights reserved.
//

import UIKit

extension DetailedViewController: CellDelegate {
    func contentDidChange(cell: AutoResizingTableViewCell) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

final class DetailedViewController: UIViewController, UITableViewDataSource {    
    @IBOutlet weak var tableView: UITableView!
    let idCell = "IdCell"    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table view configuration
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        let cellNib = UINib.init(nibName: "AutoResizingTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: idCell)
        
        //Creating table view header
        tableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.width , height: 50)))
        tableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
    }

    //MARK: Tableview data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! AutoResizingTableViewCell
        cell.delegate = self        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}

