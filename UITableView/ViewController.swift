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
		
		
		// Indicamos que alguna de nuestras celdas podría ser del tipo MyCustomTableViewCell:
		tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
	}


}

extension ViewController: UITableViewDataSource {
	
	// Contenido del HEADER
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
		return "Celdas sencillas"
		}
		return "Celdas custom"
	}
	
	// Altura del HEADER
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 100
	}
	
	// Podemos crear una cabecera más compleja retornando una vista:
	// func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
	// }
	
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		if section == 0 {
		return "Footer sencillo"
		}
		return "Footer custom"
	}
	
	
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
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2 // Indicamos que tenemos 2 secciones
	}
	
	// Por defecto las celdas tienen una altura fija. Para que la altura de la celda cambie según la sección y veamos toda la info:
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0 {
			return 50
		}
		return UITableView.automaticDimension // Le decimos que se ajuste al contenido (tendremos que tener cuidado en fijar bien las constrains)
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.section == 0 {
			// Si estamos en la section 1 pintamos las celdas iniciales:
			var cell = tableView.dequeueReusableCell(withIdentifier: "myCell") // Identificamos la tabla como reusable
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
		} // Si estamos en la sección 2:
		let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyCustomTableViewCell
			// Podemos acceder a las propiedades custom que le hemos dado (2x Label y una imagen)
		cell?.myFirstLabel.text = String(indexPath.row + 1) // Nos muestra el nº de celda en el Label 1
		cell!.mySecondLabel.text = myCountries[indexPath.row] // Nos muestra el nombre del país en Label 2
				
		if indexPath.row == 2 {
			cell!.mySecondLabel.text = "alñsjdñalsd añsld ñalskdáosdì `wfi íouxcljsid`cç xck´XJCID ÁSZ´SLCVÑL"
			
		}
		
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
