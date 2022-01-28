//
//  ViewController.swift
//  APICall
//
//  Created by Akash Dandge on 30/06/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        makeGetCall()
//        getApiCall ()
//        makePostCall()
//        getAPIPost()
//        getApiWithAlamofire()
        
        fetchData()
    }
    
    func makeGetCall() {
      // Set up the URL request
      let todoEndpoint: String = "https://newsapi.org/v2/everything?q=keyword&apiKey=e8eab6aa3bac4af893dc54211434f81b"
      guard let url = URL(string: todoEndpoint) else {
        print("Error: cannot create URL")
        return
      }
      let urlRequest = URLRequest(url: url)

      // set up the session
      let config = URLSessionConfiguration.default
        let session = URLSession.shared
      // make the request
      let task = session.dataTask(with: urlRequest) {
        (data, response, error) in
        // check for any errors
        guard error == nil else {
          print("error calling GET on /todos/1")
          print(error!)
          return
        }
        // make sure we got data
        guard let responseData = data else {
          print("Error: did not receive data")
          return
        }
        // parse the result as JSON, since that's what the API provides
        do {
          guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
            as? [String: Any] else {
              print("error trying to convert data to JSON")
              return
          }
          // now we have the todo
          // let's just print it to prove we can access it
          print("The todo is: " + todo.description)

          // the todo object is a dictionary
          // so we just access the title using the "title" key
          // so check for a title and print it if we have one
          guard let todoTitle = todo["title"] as? String else {
            print("Could not get todo title from JSON")
            return
          }
          print("The title is: " + todoTitle)
        } catch  {
          print("error trying to convert data to JSON")
          return
        }
      }
      task.resume()
    }
    
    func makePostCall() {
      let todosEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
      guard let todosURL = URL(string: todosEndpoint) else {
        print("Error: cannot create URL")
        return
      }
      var todosUrlRequest = URLRequest(url: todosURL)
      todosUrlRequest.httpMethod = "POST"
      let newTodo: [String: Any] = ["title": "My First todo", "completed": false, "userId": 1]
      let jsonTodo: Data
      do {
        jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
        todosUrlRequest.httpBody = jsonTodo
      } catch {
        print("Error: cannot create JSON from todo")
        return
      }

      let session = URLSession.shared

      let task = session.dataTask(with: todosUrlRequest) {
        (data, response, error) in
        guard error == nil else {
          print("error calling POST on /todos/1")
          print(error!)
          return
        }
        guard let responseData = data else {
          print("Error: did not receive data")
          return
        }

        // parse the result as JSON, since that's what the API provides
        do {
          guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
            options: []) as? [String: Any] else {
              print("Could not get JSON from responseData as dictionary")
              return
          }
          print("The todo is: " + receivedTodo.description)

          guard let todoID = receivedTodo["id"] as? Int else {
            print("Could not get todoID as int from JSON")
            return
          }
          print("The ID is: \(todoID)")
        } catch  {
          print("error parsing response from POST on /todos")
          return
        }
      }
      task.resume()
    }
    
    func getApiCall(){
        let urlString = "https://newsapi.org/v2/everything?q=keyword&apiKey=e8eab6aa3bac4af893dc54211434f81b"
        let urlReq = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared
        let task = session.dataTask(with: urlReq){
            (data, response,error) in
            if error == nil {
                print("data is not loaded")
            }
            print("data==\(data)")
            print("response == \(response)")
            print("error==\(error)")
            
            guard let responseData = data else {
                print("loaded data")
                return
            }
            do {
             guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any] else{
                    print("error trying to convert data to JSON")
                    return
                }
                print("The todo is: " + todo.description)
                
            }catch{
                print("display error messge")
                return
                
            }
           
            
        }
        task.resume()
    }
    
  func getAPIPost(){
    var urlReq = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos")!)
    urlReq.httpMethod = "POST"
    let newData:[String: Any] = ["title": "My First todo", "completed": false, "userId": 1]
    let JsonData: Data
    do{
        JsonData = try JSONSerialization.data(withJSONObject: newData, options: [])
        urlReq.httpBody = JsonData
        

    }
    catch{
        print("Error: cannot create JSON from todo")
        return
    }
    let session = URLSession.shared
    let task = session.dataTask(with: urlReq) {
      (data, response, error) in
      guard error == nil else {
        print("error calling POST on /todos/1")
        print(error!)
        return
      }
      guard let responseData = data else {
        print("Error: did not receive data")
        return
      }

      // parse the result as JSON, since that's what the API provides
      do {
        guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
          options: []) as? [String: Any] else {
            print("Could not get JSON from responseData as dictionary")
            return
        }
        print("The todo is: " + receivedTodo.description)

        guard let todoID = receivedTodo["id"] as? Int else {
          print("Could not get todoID as int from JSON")
          return
        }
        print("The ID is: \(todoID)")
      } catch  {
        print("error parsing response from POST on /todos")
        return
      }
    }
    task.resume()
  }
    
    func getApiWithAlamofire(){
        let req  = AF.request("https://swapi.dev/api/films")
        req.responseDecodable(of: Films.self) { (response) in
          guard let films = response.value else { return }
          print(films.all[0].title)
        }

    }
    
    
    func fetchData(){
        let urlRequest = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest){
            (data,response,error) in
            do {
                let todoDetils = try JSONDecoder().decode(Todo.self, from: data!)
                print("todoDetails\(todoDetils)")
            }
            catch{
            
            }
        }
        task.resume()
        
    }
    
    
    
    
}






