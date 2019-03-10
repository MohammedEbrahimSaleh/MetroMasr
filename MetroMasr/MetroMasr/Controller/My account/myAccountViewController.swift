
import UIKit

class myAccountViewController: UIViewController {


    // constants
    
   
    
    //outlets
    
    
    // actions
    
    @IBAction func travelLogBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "travelLogViewController")as! travelLogViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func updateProfileBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "updateMyProfileViewController")as! updateMyProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func barcodeIssuesBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "barcodeIssuesViewController")as! barcodeIssuesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func settingBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "settingViewController")as! settingViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func deleteMyAccountBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "deleteMyAccountViewController")as! deleteMyAccountViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        
        
        let myAlert = UIAlertController(title: "log out", message: "Do you want to log out ?", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: .default){ action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
            self.present(vc, animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel){ action in }
        myAlert.addAction(cancelAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    
     // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
