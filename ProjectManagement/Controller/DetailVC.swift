import UIKit
import Alamofire
class DetailVC: UIViewController {
    var make : String = ""
    var name : String = ""
    var fuel : String = ""
    var mile : String = ""
    var Model : String = ""
    var arrDetail = [Vehicle]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbfuelType: UILabel!
    @IBOutlet weak var lbmileage: UILabel!
    @IBOutlet weak var lbModel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()
        setupData()
        setupTableView()
    }
    
    func setupData(){
        lbName.text = make
        lbmileage.text = mile
        lbModel.text = Model
        lbfuelType.text = fuel
    }

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "DetailVCTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tbVCell")
    }
    func getDataFromAPI(){
        guard let url = URL(string: "https://freetestapi.com/api/v1/cars") else{
            self.view.makeToast("k co data tra ve")
            return
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
            if let data = response.value as? [NSDictionary]{
                let result = data.map({ Vehicle.deserialize(from: $0)!})
                self.arrDetail = result
                self.tableView.reloadData()
            }
        }
    }

}

extension DetailVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbVCell") as! DetailVCTableViewCell
        let data = arrDetail[indexPath.row]
        cell.lbcolor.text = data.color
        cell.lbid.text = "\(data.id)"
        cell.lbmodel.text = data.model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
