//
//  PassDataViewController.swift
//  APICall
//
//  Created by Akash Dandge on 01/07/21.



//How to pass data from the model to controller in iOS
//Three ways of communication from model to the controller
//https://www.warmodroid.xyz/tutorial/ios/pass-data-from-model-to-controller-in-ios/

import UIKit



class PassDataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    let dataModel = DataModel()
    
    @IBOutlet weak var tableView: UITableView!
    var data = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        dataModel.getData{[weak self] (data:String) in
        //            self?.useData(data: data)
        //
        //
        //
        //        }
        tableView.delegate = self
        tableView.dataSource =  self
        dataModel.delagate = self
        dataModel.getData()
        
        fetchJsonData() { [self]   (posts, error) in
            if let err = error {
                print(err)
                return
            }
            
            posts?.forEach() { (post) in
                print(post.title  + "\n" , post.id.description + "\n")
                DispatchQueue.main.async { [self] in
                    self.tableView.reloadData()
                    data.append(post)
                }
                
                
                print(">>>>>>\(data)")
            }
        }
        
        
    }
    
    private func useData(data : String){
        print(data)
    }
    
    func fetchJsonData(completion: @escaping ([Post]?, Error?) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            if let err = error {
                completion(nil, err)
                return
            }
            
            //successfull
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data!)
                completion(posts, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
//        cell.backgroundColor = .red
//        let data = data[indexPath.row]
//        cell.textLabel?.text = data.title
//        cell.bodyLbl
        cell.title.text = data[indexPath.row].title
        cell.body.text = data[indexPath.row].body
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}
extension PassDataViewController : DataModelDelegate{
    func didReceiveDataUpdata(data: String) {
        print(data)
    }
}
