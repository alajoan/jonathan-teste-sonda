//
//  MoreViewController.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 12/05/21.
//

import UIKit

class MoreViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var versionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            self.versionLabel.text = "Versão do aplicativo: \(version) (Número da build \(buildVersion ?? "1"))"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func popCamera(_ sender: UIButton) {
       
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        self.present(imagePickerController, animated: true, completion: nil)
                
    }
    
    @IBAction func showFeed(_ sender: UIButton) {
        self.present(UIStoryboard.buildMainViewController(), animated: true, completion: nil)
    }
    
    @IBAction func alertQuit(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sair!", message: "Para sair do aplicativo seguramente, pressione o botão home.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
    }
    
    
                

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
