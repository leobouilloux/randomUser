//
//  RxTableViewCell.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxSwift
import UIKit

class RxTableViewCell: UITableViewCell {
    var bag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        bag = DisposeBag()
    }
}
