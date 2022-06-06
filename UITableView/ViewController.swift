//
//  ViewController.swift
//  UITableView
//
//  Created by Rick Larios on 4/6/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	private let myCountries = ["Spain", "France", "UK", "USA", "Japan"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Protocolo delegado de las Table
		tableView.dataSource = self
	}


}

extension ViewController: UITableViewDataSource {
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myCountries.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell = tableView.dequeueReusableCell(withIdentifier: "myCell") // Identificamos la tabla reusable
		if cell == nil {
			// Creamos las celdas y todas sus propiedades iniciales
			cell = UITableViewCell(style: .default, reuseIdentifier: "myCell") // Usamos reuseIdentifier para identificar la celda a reusar
			cell?.backgroundColor = .gray
			cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
		}
		
		cell!.textLabel?.text = myCountries[indexPath.row]
		return cell!
	}
	
	
	
}
