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
		tableView.delegate = self
		tableView.tableFooterView = UIView() // Así eliminamos el resto de celdas vacías que nos genera por defecto
	}


}

extension ViewController: UITableViewDataSource {
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// if section == 0 {
		//	return myCountries.count
		//}
		// return 2 // Así le estamos diciendo que si la sección 0 tenga todos los elementos y el resto 2 (serán los dos primeros del array)
		return myCountries.count
	}
	
	// func numberOfSections(in tableView: UITableView) -> Int {
	//	return 3 // Le decimos cuantas secciones tiene la tabla
	// }
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell = tableView.dequeueReusableCell(withIdentifier: "myCell") // Identificamos la tabla reusable
		if cell == nil {
			// Creamos las celdas y todas sus propiedades iniciales
			cell = UITableViewCell(style: .default, reuseIdentifier: "myCell") // Usamos reuseIdentifier para identificar la celda a reusar
			cell?.backgroundColor = .gray
			cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
			// cell?.accessoryType = .checkmark
			cell?.accessoryType = .disclosureIndicator // Añade a la dcha una flecha para dar funcionalidad
		}
		
		cell!.textLabel?.text = myCountries[indexPath.row]
		return cell!
	}

}

extension ViewController: UITableViewDelegate {
	
	// didSelectRowAt nos indica el indexPath en el que se ha hecho click
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath.row) // Me indica el índice del elemento clickado
		print(myCountries[indexPath.row]) // Me muestra el elemento clicklado con ese índice
	}
}
