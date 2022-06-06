//
//  MyCustomTableViewCell.swift
//  UITableView
//
//  Created by Cuenta Personal on 7/6/22.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

	@IBOutlet weak var myFirstLabel: UILabel!
	@IBOutlet weak var mySecondLabel: UILabel!
	@IBOutlet weak var myImage: UIImageView!
	
	override func awakeFromNib() { // Operación que se va a llmar cuando se instancie por promera vez
        super.awakeFromNib()
        
		// Podemos customizar sus propiedades (tanto celda como elemntos)
		myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
		myFirstLabel.textColor = .blue
		backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		// Indicamos que hacemos si es seleccionada
		print(myFirstLabel.text ?? "")
    }
    
}
