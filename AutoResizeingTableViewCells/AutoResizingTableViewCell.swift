//
//  AutoResizingTableViewCell.swift
//  AutoResizeingTableViewCells
//
//  Created by Антон Макаренков on 23.08.2018.
//  Copyright © 2018 Tony Macaren. All rights reserved.
//

import UIKit

protocol CellDelegate: class {
    func contentDidChange(cell: AutoResizingTableViewCell)
}

enum CellState {
    case Expanded
    case Collapsed
}

extension CellState {
    static prefix func !(value: CellState) -> CellState {
        switch value {
        case .Collapsed:
            return .Expanded
        case .Expanded:
            return .Collapsed
        }
    }
}


final class AutoResizingTableViewCell: UITableViewCell {
    let shortText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    let longText = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    private var cellState: CellState! {
        didSet{
            switch cellState {
            case .Collapsed:
                self.textView.text = shortText
            case .Expanded:
                self.textView.text = longText
            case .none:
                break
            case .some(_):
                break
            }
        }
    }
    
    weak var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellState = .Collapsed
        self.textView.isScrollEnabled = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.cellState = !self.cellState
        delegate?.contentDidChange(cell: self)
    }
    
}
